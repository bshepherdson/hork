
module Hork.Ops where

import Hork.Args
import Hork.Config
import Hork.Dict
import Hork.Memory
import Hork.Objects
import Hork.Strings
import Hork.Types
import Hork.Util

import qualified Data.Map as M
import Data.Word
import Data.Int
import Data.Bits
import Data.Array.IO
import Data.Char
import Data.List


import Control.Monad
import Control.Monad.State
import Control.Applicative

import System.Random
import System.Exit
import System.IO

import Numeric (showHex)

-- op helpers
ophWWS :: (Word16 -> Word16 -> Word16) -> Op
ophWWS f a as = do
  let [x,y] = map argToWord as
  store a $ f x y
  setPC $ a+1

ophIIS :: (Int16 -> Int16 -> Int16) -> Op
ophIIS f a as = do
  let [x,y] = map argToInt as
  store a $ fi $ f x y
  setPC $ a+1

ophCallS :: Op
ophCallS a as = do
  s <- rb a
  ophCall (Just s) (a+1) as

ophCallN :: Op
ophCallN = ophCall Nothing

ophCall :: Maybe Word8 -> Op
ophCall ms callA (routine:args) = do
  -- build the return stack entry
  v <- version
  let a = RA . ix . pa v . argToWord $ routine
  debug $ "Calling routine at " ++ showHex a []
  st <- get
  let cs = CallState (stack st) (locals st) callA ms
  nLocals <- rb a
  debug $ "Routine has " ++ show nLocals ++ " locals."
  newLocals <- case nLocals of
                 0 -> liftIO $ newArray (0,0) 0
                 _ -> liftIO $ newArray (0,nLocals-1) 0
  when (v < 5 && nLocals > 0) $ do
    mapM_ (\i -> do
      x <- rw $ a + 1 + 2* RA (fi i)
      liftIO $ writeArray newLocals i x
      debug $ "Storing local " ++ show i ++ " as " ++ showHex x []
      ) [0..nLocals-1]

  -- write the arguments over the locals until one or the other runs out
  let writeArgs = zip [0..nLocals-1] args
  when (nLocals > 0) $ mapM_ (\(i,x) -> liftIO $ writeArray newLocals i (argToWord x)) writeArgs
  debug $ "Storing arguments on top of locals."

  let newPC = if v < 5 then a + 1 + 2 * fi nLocals else a+1
  debug $ "Beginning execution at " ++ showHex newPC []
  put $ st { stack = [], locals = newLocals, pc = newPC, returnStack = cs : returnStack st }
  -- now we return from this operation and it'll start the routine

-- check version
ophV :: (Word8 -> Bool) -> Op -> Op
ophV p op a as = do
  ver <- configByte "version"
  if p ver then op a as else illegalInstruction


ophVarInPlaceI :: (Int16 -> Int16) -> Word8 -> H ()
ophVarInPlaceI f v 
  | v == 0x00 = push . fi . f . fi =<< pop
  | v <= 0x10 = do
    ls <- gets locals
    x <- liftIO $ readArray ls (v-1)
    liftIO $ writeArray ls (v-1) (fi . f . fi $ x)
  | otherwise = wg (v-0x10) . fi . f . fi =<< rg (v-0x10)

-- used by the prop handlers. expects storage, no branch.
ophProp :: (RawAddr -> H Word16) -> Op
ophProp f a [n_, p_] = do
  let n = argToWord n_
      p = argToByte p_
  prop <- objPropAddr n p
  res <- f prop
  store a res
  setPC $ a+1


ophBinJump :: (Int16 -> Int16 -> H Bool) -> Op
ophBinJump p a as = do
  let [x,y] = map argToInt as
  cond <- p x y
  branch a cond


-- implementations

op_add = ophIIS (+)
op_and = ophWWS (.&.)

-- TODO: Implement
op_aread = notImplemented "op_aread"
op_art_shift = notImplemented "op_art_shift"
op_buffer_mode = doNothing 

op_call = ophCallS
op_call_1n = ophCallN
op_call_1s = ophCallS
op_call_2n = ophCallN
op_call_2s = ophCallS
op_call_vn = ophCallN
op_call_vn2 = ophCallN
op_call_vs2 = ophCallS

op_check_arg_count = notImplemented "op_check_arg_count"

op_clear_attr a as = do
  let [obj,attr] = map argToWord as
  objClearAttr obj attr
  setPC a


op_copy_table a [f,s,z] = do
  let first   = argToWord f
      second  = argToWord s
      rawsize = argToInt  z
      size    = fi $ abs rawsize
      lockFwd = rawsize < 0
      backward = not lockFwd && second > first && first+size < second -- whether overlapping
      indexes = (if backward then reverse else id) [0..size-1]
  if second == 0
    then mapM_ (\i -> wb (BA $ first+i) 0) indexes
    else mapM_ (\i -> rb (BA $ first+i) >>= wb (BA $ first+i)) indexes
  setPC a


op_dec a [Small v] = do
  ophVarInPlaceI (subtract 1) v
  setPC a

op_dec_chk a [Small v, x_] = do
  ophVarInPlaceI (subtract 1) v
  let x = argToInt x_
  v' <- case () of
          () | v == 0x00 -> peek
             | v <= 0x10 -> rl (v-1)
             | otherwise -> rg (v-0x10)
  branch a $ fi v' < x

op_div = ophIIS div

op_encode_text = notImplemented "op_encode_text"
op_erase_line = notImplemented "op_erase_line"
op_erase_window = notImplemented "op_erase_window"

op_get_child a [n_] = do
  let n = argToWord n_
  c <- objGetChild n
  store a c
  branch (a+1) $ c /= 0


op_get_cursor = notImplemented "op_get_cursor"


op_get_next_prop a [n_, Small prop] = do
  let n = argToWord n_
  num <- if prop == 0
           then objPropTable n >>= propNumber
           else objPropAddr n prop >>= propNext >>= propNumber
  store a $ fi num


op_get_parent a [n_] = do
  let n = argToWord n_
  c <- objGetParent n
  store a c
  setPC $ a+1


op_get_prop = ophProp $ \prop -> do
  size <- propSize prop
  d <- propData prop
  case size of
    1 -> fi <$> rb d
    2 -> rw d
    _ -> error "get_prop called on property with length neither 1 nor 2."

op_get_prop_addr = ophProp (\p -> propData p >>= return . fi)

op_get_prop_len = ophProp (\p -> propSize p >>= return . fi)

op_get_sibling a [n_] = do
  let n = argToWord n_
  c <- objGetParent n
  store a c
  branch (a+1) $ c /= 0

op_inc a [Small v] = do
  ophVarInPlaceI (+1) v
  setPC a

op_inc_chk a [Small v, x_] = do
  ophVarInPlaceI (+1) v
  let x = argToInt x_
  v' <- case () of
          () | v == 0x00 -> peek
             | v <= 0x10 -> rl (v-1)
             | otherwise -> rg (v-0x10)
  branch a $ fi v' > x


op_input_stream = notImplemented "op_input_stream"


op_insert_obj a as = do
  let [obj,dest] = map argToWord as
  objRemoveFromParent obj
  objAddChild dest obj
  setPC a


op_je = ophBinJump $ \a b -> return (a == b)
op_jg = ophBinJump $ \a b -> return (a >  b)
op_jin = ophBinJump $ \a b -> do
  p <- objGetParent (fi a)
  return (p == fi b)
op_jl = ophBinJump $ \a b -> return (a < b)


op_jump a [offset_] = do
  let offset = argToInt offset_
  let wordOffset = RA $ fi (abs offset)
  let newPC = if offset < 0 -- minus 2 bytes for the jump instruction itself.
                then a - wordOffset - 2
                else a + wordOffset - 2
  setPC newPC

op_jz a [x_] = do
  let x = argToWord x_
  branch a $ x == 0


op_load a [v_] = do
  let v = argToByte v_
  val <- case () of
           () | v == 0x00 -> pop
              | v <= 0x10 -> rl (v-1)
              | otherwise -> rg (v-0x10)
  store a val
  setPC $ a+1
  
op_loadb a as = do
  let [arr, index] = map argToWord as
  b <- rb . BA $ arr+index
  store a (fi b)
  setPC $ a+1
  
op_loadw a as = do
  let [arr, index] = map argToWord as
  w <- rw . BA $ arr + 2*index
  store a w
  setPC $ a+1


op_log_shift = notImplemented "op_log_shift"


op_mod = ophIIS mod
op_mul = ophIIS (*)

op_new_line a [] = output "\n" >> setPC a

op_nop a _ = setPC a

op_not a [x_] = do
  let x = argToWord x_
  store a $ complement x
  setPC $ a+1

op_or = ophWWS (.|.)

op_output_stream = notImplemented "op_output_stream"

-- unconditionally branch, gullibly assuming genuine games
op_piracy a _ = branch a True

op_pop a _ = pop >> setPC a

op_print a [] = do
  str <- fromZSCII a
  len <- strLenBytes a
  output str
  setPC $ a + fi len

op_print_addr a [addr_] = do
  let addr = BA $ argToWord addr_
  str <- fromZSCII addr
  output str
  setPC a


op_print_char a [c_] = do
  let c = argToByte c_
  let char = z2a c
  output [char]
  setPC a

op_print_num a [v_] = do
  let v = argToInt v_
  output (show v)
  setPC a

op_print_obj a [n_] = do
  let n = argToWord n_
  when (n == 0) $ error "Attempt to print object 0"
  addr <- objShortName n
  str <- fromZSCII addr
  output str
  setPC a

op_print_paddr a [pa_] = do
  v <- version
  let addr = pa v $ argToWord pa_
  str <- fromZSCII addr
  output str
  setPC a

op_print_ret a [] = do
  str <- fromZSCII a
  output $ str ++ "\n"
  return_ 1

op_print_table = notImplemented "op_print_table"


op_pull a [v_] = do
  let v = argToByte v_
  x <- pop
  case () of
    () | v == 0x00 -> push x
       | v <= 0x10 -> wl (v-1) x
       | otherwise -> wg (v-0x10) x
  setPC a

op_push a [x_] = do
  let x = argToWord x_
  push x
  setPC a

op_put_prop a [n_,p_,x_] = do
  let [n,x] = map argToWord [n_,x_]
      p     = argToByte p_
  prop <- objPropAddr n p
  size <- propSize prop
  d <- propData prop
  case size of
    1 -> wb d (fi x :: Word8)
    2 -> ww d x
    _ -> error $ "put_prop called for property of length " ++ show size
  setPC a


op_quit a [] = liftIO exitSuccess

op_random a [r_] = do
  let r = argToInt r_
  v <- case () of
    () | r == 0 -> liftIO $ do -- reseed to be arbitrary again. uses the next random value.
         n <- randomIO
         setStdGen $ mkStdGen n
         return 0
       | r < 0 -> liftIO $ do -- reseed to the given value, leaving it negative
         setStdGen $ mkStdGen (fi r)
         return 0
       | otherwise -> liftIO $ fmap fi $ randomRIO (1,fi r::Int)
  store a $ fi v
  setPC $ a+1


op_read a (textbuf_:parsebuf_:_) = do
  let [textbuf,parsebuf] = map (BA . argToWord) [textbuf_,parsebuf_]

  -- TODO: versions 1-3 require status line to be re-output here.
  -- TODO: handle v5 special stuff. terminators, storing the terminator, nonempty buffer

  -- steps: read to \n. copy into textbuf. split into words. search dictionary. write into parsebuf
  -- reading input
  rawInput <- liftIO getLine
  maxlen <- rb textbuf
  let input = (++[0]) . map (a2z . toLower) $ genericTake maxlen rawInput
  -- writing into the buffer
  forM_ (zip ([0..]::[RawAddr]) input) (uncurry wb)
  -- splitting and searching
  rawParsed <- parse input
  -- and finally write into parsebuf
  parseBufLen <- rb parsebuf
  let parsed = genericTake parseBufLen rawParsed -- truncate any extra words
  -- write the number of parsed words
  wb (parsebuf+1) $ genericLength parsed
  forM_ (zip parsed [2,6..]) $ \(w,i) -> do
    ww (parsebuf+i) $ fi (pwAddr w)
    wb (parsebuf+i+2) (pwLen w)
    wb (parsebuf+i+3) (pwPos w)
  
  v <- version
  when (v >= 5) $ store a 10
  setPC $ if v >= 5 then a+1 else a


op_read_char a as = do
  c <- liftIO getChar
  store a . fi $ a2z c
  setPC $ a+1


op_remove_obj a [n_] = do
  let n = argToWord n_
  objRemoveFromParent n
  setPC a

op_restart = op_quit -- TODO: Implement properly once the real flow of the thing is stable
op_restore = notImplemented "op_restore"
op_restore_undo = notImplemented "op_restore_undo"

op_ret a [v_] = return_ $ argToWord v_
op_ret_popped _ _ = pop >>= return_
op_rfalse     _ _ = return_ 0
op_rtrue      _ _ = return_ 1

op_save = notImplemented "op_save"
op_save_undo = notImplemented "op_save_undo"


-- TODO: Handle the form argument for version 5
op_scan_table a as = do
  let [x, table_, len] = map argToWord $ take 3 as
  let table = BA table_

  vals <- mapM rw $ map ((table+) . (2*)) [0..fi len-1]
  let index = map fst . take 1 . filter ((==x).snd) . zip [0..] $ vals
  case index of
    []  -> store a 0 >> branch (a+1) False
    [i] -> store a i >> branch (a+1) True
  

op_set_attr a as = do
  let [n, attr] = map argToWord as
  objSetAttr n attr
  setPC a
  
op_set_colour = notImplemented "op_set_colour"
op_set_cursor = notImplemented "op_set_cursor"
op_set_font = notImplemented "op_set_font"
op_set_text_style = notImplemented "op_set_text_style"
op_set_window = notImplemented "op_set_window"

op_show_status = notImplemented "op_show_status"
op_sound_effect = notImplemented "op_sound_effect"
op_split_window = notImplemented "op_split_window"

op_sread = op_read

op_store a [var_,val_] = do
  let var = argToByte var_
      val = argToWord val_
  case () of
    () | var == 0x00 -> push val
       | var <= 0x10 -> wl (var-1) val
       | otherwise   -> wg (var-0x10) val
  setPC a

op_storeb a [array_, index_, val_] = do
  let [array, index] = map (BA . argToWord) [array_,index_]
  let val = argToByte val_
  wb (array+index) val
  setPC a

op_storew a as = do
  let [array, index, val] = map (BA . argToWord) as
  ww (array+index) (fi val)
  setPC a

op_sub = ophIIS (flip subtract)

op_test a as = do
  let [mask, flags] = map argToWord as
  branch a $ mask .&. flags == flags

op_test_attr a as = do
  let [n, attr] = map argToWord as
  r <- objTestAttr n attr
  branch a r

op_throw = notImplemented "op_throw"
op_tokenise = notImplemented "op_tokenise"

-- TODO: implement properly. For now it unconditionally branches.
op_verify a _ = branch a True


notImplemented s = error $ "Not implemented: " ++ s
doNothing _ _ = return ()
illegalInstruction = error "Illegal instruction"

perform :: Addr a => a -> OperandCount -> Word8 -> [OperandType] -> a -> H ()
perform i count opcode types addr =
  case M.lookup (Opcode count opcode) opcodeMap of
    Nothing -> error $ "Illegal instruction: " ++ show (Opcode count opcode)
    Just (name, op) -> do
      args <- case filter (/=TNone) types of
                [] -> return (RA $ ix addr, []) -- gracefully handle 0OP and var-with-none-provided args
                _  -> getArgList addr types
      liftIO $ hPutStrLn stderr $ showHex (ix i) [] ++ ": " ++ name ++ " " ++ showArgs args
      uncurry op args


-- types
data Opcode = Opcode OperandCount Word8
  deriving (Eq, Ord, Show)

type Op = RawAddr -> [Operand] -> H ()

opcodeMap :: M.Map Opcode (String, Op)
opcodeMap = M.fromList [
   (Opcode OP2 1,  ("op_je", op_je))
  ,(Opcode OP2 2,  ("op_jl", op_jl))
  ,(Opcode OP2 3,  ("op_jg", op_jg))
  ,(Opcode OP2 4,  ("op_dec_chk", op_dec_chk))
  ,(Opcode OP2 5,  ("op_inc_chk", op_inc_chk))
  ,(Opcode OP2 6,  ("op_jin", op_jin))
  ,(Opcode OP2 7,  ("op_test", op_test))
  ,(Opcode OP2 8,  ("op_or", op_or))
  ,(Opcode OP2 9,  ("op_and", op_and))
  ,(Opcode OP2 10, ("op_test_attr", op_test_attr))
  ,(Opcode OP2 11, ("op_set_attr", op_set_attr))
  ,(Opcode OP2 12, ("op_clear_attr", op_clear_attr))
  ,(Opcode OP2 13, ("op_store", op_store))
  ,(Opcode OP2 14, ("op_insert_obj", op_insert_obj))
  ,(Opcode OP2 15, ("op_loadw", op_loadw))
  ,(Opcode OP2 16, ("op_loadb", op_loadb))
  ,(Opcode OP2 17, ("op_get_prop", op_get_prop))
  ,(Opcode OP2 18, ("op_get_prop_addr", op_get_prop_addr))
  ,(Opcode OP2 19, ("op_get_next_prop", op_get_next_prop))
  ,(Opcode OP2 20, ("op_add", op_add))
  ,(Opcode OP2 21, ("op_sub", op_sub))
  ,(Opcode OP2 22, ("op_mul", op_mul))
  ,(Opcode OP2 23, ("op_div", op_div))
  ,(Opcode OP2 24, ("op_mod", op_mod))
  ,(Opcode OP2 25, ("op_call_2s", op_call_2s))
  ,(Opcode OP2 26, ("op_call_2n", op_call_2n))
  ,(Opcode OP2 27, ("op_set_colour", op_set_colour))
  ,(Opcode OP2 28, ("op_throw", op_throw))

  ,(Opcode OP1 0,  ("op_jz", op_jz))
  ,(Opcode OP1 1,  ("op_get_sibling", op_get_sibling))
  ,(Opcode OP1 2,  ("op_get_child", op_get_child))
  ,(Opcode OP1 3,  ("op_get_parent", op_get_parent))
  ,(Opcode OP1 4,  ("op_get_prop_len", op_get_prop_len))
  ,(Opcode OP1 5,  ("op_inc", op_inc))
  ,(Opcode OP1 6,  ("op_dec", op_dec))
  ,(Opcode OP1 7,  ("op_print_addr", op_print_addr))
  ,(Opcode OP1 8,  ("op_call_1s", op_call_1s))
  ,(Opcode OP1 9,  ("op_remove_obj", op_remove_obj))
  ,(Opcode OP1 10, ("op_print_obj", op_print_obj))
  ,(Opcode OP1 11, ("op_ret", op_ret))
  ,(Opcode OP1 12, ("op_jump", op_jump))
  ,(Opcode OP1 13, ("op_print_paddr", op_print_paddr))
  ,(Opcode OP1 14, ("op_load", op_load))
  ,(Opcode OP1 15, ("op_not", op_not))

  ,(Opcode OP0 0,  ("op_rtrue", op_rtrue))
  ,(Opcode OP0 1,  ("op_rfalse", op_rfalse))
  ,(Opcode OP0 2,  ("op_print", op_print))
  ,(Opcode OP0 3,  ("op_print_ret", op_print_ret))
  ,(Opcode OP0 4,  ("op_nop", op_nop))
  ,(Opcode OP0 5,  ("op_save", op_save))
  ,(Opcode OP0 6,  ("op_restore", op_restore))
  ,(Opcode OP0 7,  ("op_restart", op_restart))
  ,(Opcode OP0 8,  ("op_ret_popped", op_ret_popped))
  ,(Opcode OP0 9,  ("op_pop", op_pop))
  ,(Opcode OP0 10, ("op_quit", op_quit))
  ,(Opcode OP0 11, ("op_new_line", op_new_line))
  ,(Opcode OP0 12, ("op_show_status", op_show_status))
  ,(Opcode OP0 13, ("op_verify", op_verify))
  ,(Opcode OP0 15, ("op_piracy", op_piracy))

  ,(Opcode VAR 0,  ("op_call", op_call))
  ,(Opcode VAR 1,  ("op_storew", op_storew))
  ,(Opcode VAR 2,  ("op_storeb", op_storeb))
  ,(Opcode VAR 3,  ("op_put_prop", op_put_prop))
  ,(Opcode VAR 4,  ("op_sread", op_sread))
  ,(Opcode VAR 5,  ("op_print_char", op_print_char))
  ,(Opcode VAR 6,  ("op_print_num", op_print_num))
  ,(Opcode VAR 7,  ("op_random", op_random))
  ,(Opcode VAR 8,  ("op_push", op_push))
  ,(Opcode VAR 9,  ("op_pull", op_pull))
  ,(Opcode VAR 10, ("op_split_window", op_split_window))
  ,(Opcode VAR 11, ("op_set_window", op_set_window))
  ,(Opcode VAR 12, ("op_call_vs2", op_call_vs2))
  ,(Opcode VAR 13, ("op_erase_window", op_erase_window))
  ,(Opcode VAR 14, ("op_erase_line", op_erase_line))
  ,(Opcode VAR 15, ("op_set_cursor", op_set_cursor))
  ,(Opcode VAR 16, ("op_get_cursor", op_get_cursor))
  ,(Opcode VAR 17, ("op_set_text_style", op_set_text_style))
  ,(Opcode VAR 18, ("op_buffer_mode", op_buffer_mode))
  ,(Opcode VAR 19, ("op_output_stream", op_output_stream))
  ,(Opcode VAR 20, ("op_input_stream", op_input_stream))
  ,(Opcode VAR 21, ("op_sound_effect", op_sound_effect))
  ,(Opcode VAR 22, ("op_read_char", op_read_char))
  ,(Opcode VAR 23, ("op_scan_table", op_scan_table))
  ,(Opcode VAR 24, ("op_not", op_not))
  ,(Opcode VAR 25, ("op_call_vn", op_call_vn))
  ,(Opcode VAR 26, ("op_call_vn2", op_call_vn2))
  ,(Opcode VAR 27, ("op_tokenise", op_tokenise))
  ,(Opcode VAR 28, ("op_encode_text", op_encode_text))
  ,(Opcode VAR 29, ("op_copy_table", op_copy_table))
  ,(Opcode VAR 30, ("op_print_table", op_print_table))
  ,(Opcode VAR 31, ("op_check_arg_count", op_check_arg_count))

  ,(Opcode EXT 0,  ("op_save", op_save))
  ,(Opcode EXT 1,  ("op_restore", op_restore))
  ,(Opcode EXT 2,  ("op_log_shift", op_log_shift))
  ,(Opcode EXT 3,  ("op_art_shift", op_art_shift))
  ,(Opcode EXT 4,  ("op_set_font", op_set_font))
  ,(Opcode EXT 9,  ("op_save_undo", op_save_undo))
  ,(Opcode EXT 10, ("op_restore_undo", op_restore_undo))
  ]



