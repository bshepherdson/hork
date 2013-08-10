module Hork.Ops (
  zinterp0OP, zinterp1OP, zinterp2OP, zinterpVAR, div', mod'
) where

import qualified Data.Map as M
import Hork.Core
import Hork.String
import Hork.Objects

import Data.Char (chr, ord)

import System.Random


zinterp0OP :: Word8 -> Hork ()
zinterp0OP opcode = do
  let num = opcode .&. 15
  case M.lookup num ops0OP of
    Nothing -> die $ "No such 0OP opcode: " ++ show num
    Just op -> op

zinterp1OP :: Word8 -> Word8 -> Hork ()
zinterp1OP opcode typ = do
  let num = opcode .&. 15
  arg <- getArg typ
  case M.lookup num ops1OP of
    Nothing -> die $ "No such 1OP opcode: " ++ show num
    Just op -> op arg

zinterp2OP :: Word8 -> Word8 -> Word8 -> Hork ()
zinterp2OP opcode typ1 typ2 = do
  tell ["real 2OP"]
  let num = opcode .&. 31
  arg1 <- getArg typ1
  arg2 <- getArg typ2
  case M.lookup num ops2OP of
    Nothing -> die $ "No such 2OP opcode: " ++ show num
    Just op -> op arg1 arg2

zinterpVAR :: Word16 -> [Word8] -> Hork ()
zinterpVAR opcode types = do
  tell ["real var"]
  args <- mapM getArg types
  case (opcode, M.lookup opcode opsVAR) of
    (0xc1, _)    -> op_VAR_je args
    (_, Nothing) -> die $ "No such VAR opcode: " ++ show opcode
    (_, Just op) -> op args



-----------------------------------------------------------
-- common helpers
-----------------------------------------------------------

zreturn :: Word16 -> Hork ()
zreturn value = do
  tell ["returning " ++ showHex value]
  rts <- head <$> use routines
  stack .= rts ^. oldStack
  pc .= rts ^. oldPC
  routines %= tail
  when (rts ^. doStore) $ zstore value

zstore :: Word16 -> Hork ()
zstore value = do
  b <- pcGet
  tell ["storing " ++ showHex value ++ " -> " ++ show b]
  setVar b value


zbranch :: Bool -> Hork ()
zbranch val = do
  b1 <- pcGet
  tell ["branch byte 1 = " ++ showHex b1 ++ ", " ++ show val]
  let doBranch = val == (b1 ^. bitAt 7)
      isShort  = b1 ^. bitAt 6
  delta <- case isShort of
    True  -> return (fromIntegral b1 .&. 63)
    False -> do
      b2 <- pcGet
      -- combine into 14-bit number
      let w = fromIntegral (b1 .&. 63) `shiftL` 8 + fromIntegral b2 :: Int16
      -- sign-extend from 14 bits to 16
      return $ if w ^. bitAt 13 then w .|. (3 `shiftL` 14) else fromIntegral w :: Int16
  case doBranch of
    False -> tell ["skipping branch"]
    True  -> case delta of
        0 -> tell ["branch: return false"] >> zreturn 0
        1 -> tell ["branch: return true"]  >> zreturn 1
        _ -> tell ["branch by " ++ show (delta-2)] >> pcBumpBy (delta-2)


toInt :: Word16 -> Int16
toInt = fromIntegral


notImplemented :: String -> Hork ()
notImplemented func = die $ "Unimplemented opcode: " ++ func

illegalArgument :: String -> Hork ()
illegalArgument msg = die $ "Illegal arguments to a VAR op: " ++ msg


introducedIn :: String -> Word8 -> Hork ()
introducedIn op minVersion = do
  actualVersion <- use version
  if actualVersion >= minVersion
    then return ()
    else die $ "Op " ++ op ++ " was introduced in version " ++ show minVersion ++ ", running " ++ show actualVersion

-----------------------------------------------------------
-- 0OP instructions
-----------------------------------------------------------

type Op0OP = Hork ()

ops0OP :: M.Map Word8 Op0OP
ops0OP = M.fromList [
    (0, op_0OP_rtrue),
    (1, op_0OP_rfalse),
    (2, op_0OP_print),
    (3, op_0OP_print_ret),
    (4, op_0OP_nop),
    (5, op_0OP_save),
    (6, op_0OP_restore),
    (7, op_0OP_restart),
    (8, op_0OP_ret_popped),
    (9, op_0OP_pop_OR_catch),
    (10, op_0OP_quit),
    (11, op_0OP_new_line),
    (12, op_0OP_show_status),
    (13, op_0OP_verify),
    (15, op_0OP_piracy)
    ]

op_0OP_rtrue :: Op0OP
op_0OP_rtrue = zreturn 1

op_0OP_rfalse :: Op0OP
op_0OP_rfalse = zreturn 0

op_0OP_print :: Op0OP
op_0OP_print = do
  (s, len) <- use pc >>= strLenZ
  liftIO . putStr $ map (chr . fromIntegral) s
  pcBumpBy (2 * fromIntegral len)

op_0OP_print_ret :: Op0OP
op_0OP_print_ret = do
  op_0OP_print_ret
  zreturn 1

op_0OP_nop :: Op0OP
op_0OP_nop = return ()


op_0OP_save :: Op0OP
op_0OP_save = notImplemented "save"

op_0OP_restore :: Op0OP
op_0OP_restore = notImplemented "restore"


op_0OP_restart :: Op0OP
op_0OP_restart = throwError Restart


op_0OP_ret_popped :: Op0OP
op_0OP_ret_popped = pop >>= zreturn

op_0OP_pop_OR_catch :: Op0OP
op_0OP_pop_OR_catch = do
  v <- use version
  if v >= 5 then op_0OP_catch else op_0OP_pop


op_0OP_pop :: Op0OP
op_0OP_pop = pop >> return ()


-- catch captures the current stack frame as a Z-machine value.
-- A subsequent throw X returns X as though from the routine that catch was called in.
-- Continuations! Something the weaksauce JVM will never be able to handle, more than 5 years before Oak.
-- Quetzal specifies what form this magic cookie should take: the number of stack frames from the bottom.
op_0OP_catch :: Op0OP
op_0OP_catch = do
  introducedIn "catch" 5
  len <- genericLength <$> use routines
  zstore len


op_0OP_quit :: Op0OP
op_0OP_quit = throwError Exit


op_0OP_new_line :: Op0OP
op_0OP_new_line = liftIO $ putStrLn ""


op_0OP_show_status :: Op0OP
op_0OP_show_status = notImplemented "show_status"
-- Note: illegal in v4+


op_0OP_verify :: Op0OP
op_0OP_verify = zbranch True


op_0OP_piracy :: Op0OP
op_0OP_piracy = zbranch True


type Op1OP = Word16 -> Hork ()

ops1OP :: M.Map Word8 Op1OP
ops1OP = M.fromList [
  (0, op_1OP_jz),
  (1, op_1OP_get_sibling),
  (2, op_1OP_get_child),
  (3, op_1OP_get_parent),
  (4, op_1OP_get_prop_len),
  (5, op_1OP_inc),
  (6, op_1OP_dec),
  (7, op_1OP_print_addr),
  (8, op_1OP_call_1s),
  (9, op_1OP_remove_obj),
  (10, op_1OP_print_obj),
  (11, op_1OP_ret),
  (12, op_1OP_jump),
  (13, op_1OP_print_paddr),
  (14, op_1OP_load),
  (15, op_1OP_not_OR_call_1n)
  ]


op_1OP_jz :: Op1OP
op_1OP_jz arg = zbranch (arg == 0)

op_1OP_get_sibling :: Op1OP
op_1OP_get_sibling obj = do
  a <- objSibling obj
  sib <- fromIntegral <$> rb a
  zstore sib
  zbranch (sib > 0)


op_1OP_get_child :: Op1OP
op_1OP_get_child obj = do
  a <- objChild obj
  c <- fromIntegral <$> rb a
  zstore c
  zbranch (c > 0)

op_1OP_get_parent :: Op1OP
op_1OP_get_parent = objParent >=> rb >=> return . fromIntegral >=> zstore

op_1OP_get_prop_len :: Op1OP
op_1OP_get_prop_len arg = objPropLenFromAddr (ra (BA arg)) >>= zstore


op_1OP_inc :: Op1OP
op_1OP_inc v = incdec (+1) v >> return ()
op_1OP_dec :: Op1OP
op_1OP_dec v = incdec (subtract 1) v >> return ()

incdec :: (Word16 -> Word16) -> Word16 -> Hork Word16
incdec f var = do
  let var' = fromIntegral var
  val <- getVar var'
  let val' = f val
  setVar var' val'
  return val'


op_1OP_print_addr :: Op1OP
op_1OP_print_addr = printZ . BA


op_1OP_call_1s :: Op1OP
op_1OP_call_1s routine = introducedIn "call_1s" 4 >> zcall True [routine]


op_1OP_print_paddr :: Op1OP
op_1OP_print_paddr = printZ <=< pa



op_1OP_remove_obj :: Op1OP
op_1OP_remove_obj = objRemove


op_1OP_print_obj :: Op1OP
op_1OP_print_obj = objPrintShortName


op_1OP_ret :: Op1OP
op_1OP_ret = zreturn

op_1OP_jump :: Op1OP
op_1OP_jump uArg = pcBumpBy (toInt uArg - 2) -- Have to adjust by -2 like for branches.


op_1OP_load :: Op1OP
op_1OP_load 0 = use stack >>= return . head >>= zstore
op_1OP_load arg = getVar (fromIntegral arg) >>= zstore


op_1OP_not_OR_call_1n :: Op1OP
op_1OP_not_OR_call_1n x = do
  v <- use version
  if v >= 5 then zcall False [x] else op_1OP_not x

op_1OP_not :: Op1OP
op_1OP_not arg = zstore (complement arg)


type Op2OP = Word16 -> Word16 -> Hork ()

ops2OP :: M.Map Word8 Op2OP
ops2OP = M.fromList [
  (1, op_2OP_je),
  (2, op_2OP_jl),
  (3, op_2OP_jg),
  (4, op_2OP_dec_chk),
  (5, op_2OP_inc_chk),
  (6, op_2OP_jin),
  (7, op_2OP_test),
  (8, op_2OP_or),
  (9, op_2OP_and),
  (10, op_2OP_test_attr),
  (11, op_2OP_set_attr),
  (12, op_2OP_clear_attr),
  (13, op_2OP_store),
  (14, op_2OP_insert_obj),
  (15, op_2OP_loadw),
  (16, op_2OP_loadb),
  (17, op_2OP_get_prop),
  (18, op_2OP_get_prop_addr),
  (19, op_2OP_get_next_prop),
  (20, op_2OP_add),
  (21, op_2OP_sub),
  (22, op_2OP_mul),
  (23, op_2OP_div),
  (24, op_2OP_mod),
  (25, op_2OP_call True),
  (26, op_2OP_call False),
  (27, op_2OP_set_colour),
  (28, op_2OP_throw)
  ]



op_2OP_je :: Op2OP
op_2OP_je x y = op_VAR_je [x,y]

op_2OP_jg :: Op2OP
op_2OP_jg ux uy = zbranch (toInt ux > toInt uy)

op_2OP_jl :: Op2OP
op_2OP_jl ux uy = zbranch (toInt ux < toInt uy)


op_2OP_inc_chk :: Op2OP
op_2OP_inc_chk var val = do
  new <- incdec (+1) var
  zbranch (toInt new > toInt val)

op_2OP_dec_chk :: Op2OP
op_2OP_dec_chk var val = do
  new <- incdec (subtract 1) var
  zbranch (toInt new < toInt val)


op_2OP_jin :: Op2OP
op_2OP_jin child parent = do
  p <- fromIntegral <$> (rb =<< objParent child) -- v3-specific
  zbranch (p == parent)


op_2OP_test :: Op2OP
op_2OP_test a b = zbranch (a .&. b == b)


op_2OP_or :: Op2OP
op_2OP_or a b = zstore (a .|. b)

op_2OP_and :: Op2OP
op_2OP_and a b = zstore (a .&. b)


op_2OP_test_attr :: Op2OP
op_2OP_test_attr obj attr = testAttr obj attr >>= zbranch

op_2OP_set_attr :: Op2OP
op_2OP_set_attr = setAttr

op_2OP_clear_attr :: Op2OP
op_2OP_clear_attr = clearAttr


op_2OP_store :: Op2OP
op_2OP_store 0 val = pop >> push val
op_2OP_store var val = setVar (fromIntegral var) val


op_2OP_insert_obj :: Op2OP
op_2OP_insert_obj = objInsert



op_2OP_loadw :: Op2OP
op_2OP_loadw arr index = rw (ra . BA $ arr + 2 * index) >>= zstore


op_2OP_loadb :: Op2OP
op_2OP_loadb arr index = rb (ra . BA $ arr + index) >>= return . fromIntegral >>= zstore


op_2OP_get_prop :: Op2OP
op_2OP_get_prop obj prop = objPropValue obj prop >>= zstore

op_2OP_get_prop_addr :: Op2OP
op_2OP_get_prop_addr obj prop = objPropAddrData obj prop >>= return . fromIntegral >>= zstore

op_2OP_get_next_prop :: Op2OP
op_2OP_get_next_prop obj prop = objNextProp obj prop >>= zstore


math :: (Int16 -> Int16 -> Int16) -> Op2OP
math f ux uy = zstore (fromIntegral $ f (toInt ux) (toInt uy))

op_2OP_add, op_2OP_sub, op_2OP_mul, op_2OP_div, op_2OP_mod :: Op2OP
op_2OP_add = math (+)
op_2OP_sub = math (flip subtract)
op_2OP_mul = math (*)
op_2OP_div = math div'
op_2OP_mod = math mod'

-- Signed division is busted relative to what the Z-machine expects.
-- These functions fix things.
div' :: Int16 -> Int16 -> Int16
div' _ 0 = error "Division by 0"
div' a b = div'' a b
  where aPos = a >= 0
        bPos = b > 0
        div'' a b | aPos == bPos = div a b
                  | otherwise = truncate (fromIntegral a / fromIntegral b)

mod' :: Int16 -> Int16 -> Int16
mod' _ 0 = error "Division by 0"
mod' a b = mod'' a b
  where aPos = a >= 0
        bPos = b > 0
        mod'' a b | aPos == bPos = mod a b
                  | otherwise = let dbl = fromIntegral a / fromIntegral b
                                    int = truncate dbl
                                in  truncate $ fromIntegral b * (dbl - fromIntegral int)


op_2OP_call :: Bool -> Op2OP
op_2OP_call store routine arg = do
  let (op, minVersion) = if store then ("call_2s", 4) else ("call_2n", 5)
  introducedIn op minVersion
  zcall store [routine, arg]


op_2OP_set_colour :: Op2OP
op_2OP_set_colour _ _ = notImplemented "set_colour"


-- Throw returns from a continuation token previously saved with catch.
-- This is undefined if the continuation has already been returned from.
-- This token is specified by Quetzal as being the depth of routine stack at the time of the catch call.
-- Therefore to return from that routine, we truncate the stack to that depth, then return.
op_2OP_throw :: Op2OP
op_2OP_throw val token = do
  routines %= reverse . genericTake token . reverse
  zreturn val


type OpVAR = [Word16] -> Hork ()

opsVAR :: M.Map Word16 OpVAR
opsVAR = M.fromList [
  (224, zcall True),
  (225, op_VAR_storew),
  (226, op_VAR_storeb),
  (227, op_VAR_put_prop),
  (228, op_VAR_read),
  (229, op_VAR_print_char),
  (230, op_VAR_print_num),
  (231, op_VAR_random),
  (232, op_VAR_push),
  (233, op_VAR_pull),
  (234, op_VAR_split_window),
  (235, op_VAR_set_window),
  (236, zcall True),
  (237, op_VAR_erase_window),
  (238, op_VAR_erase_line),
  (239, op_VAR_set_cursor),
  (240, op_VAR_get_cursor),
  (241, op_VAR_set_text_style),
  (242, op_VAR_buffer_mode),
  (243, op_VAR_output_stream),
  (244, op_VAR_input_stream),
  (245, op_VAR_sound_effect),
  (246, op_VAR_read_char),
  (247, op_VAR_scan_table),
  (248, op_VAR_not),
  (249, zcall False),
  (250, zcall False),
  (251, op_VAR_tokenise),
  (252, op_VAR_encode_text),
  (253, op_VAR_copy_table),
  (254, op_VAR_print_table),
  (255, op_VAR_check_arg_count),
  (0xbe00, op_EXT_save),
  (0xbe01, op_EXT_restore),
  (0xbe02, op_EXT_log_shift),
  (0xbe03, op_EXT_art_shift),
  (0xbe04, op_EXT_set_font),
  (0xbe09, op_EXT_save_undo),
  (0xbe0a, op_EXT_restore_undo),
  (0xbe0b, op_EXT_print_unicode),
  (0xbe0c, op_EXT_check_unicode)
  ]



zcall :: Bool -> OpVAR
zcall _ [] = illegalArgument "call with no routine"
zcall True (0:_) = zstore 0 -- automatically return false when the call is to 0.
zcall False (0:_) = return () -- automatically return false when the call is to 0, but do nothing since we're not storing.
zcall store (routine:args) = do
  pc_ <- use pc
  stack_ <- use stack

  addr <- pa routine
  localCount <- rb addr
  hasDefaultLocals <- (< 5) <$> use version
  initialValues <- case hasDefaultLocals of
    False -> return $ genericTake localCount $ repeat 0
    True  -> mapM (\i -> rw (addr + 1 + 2 * fromIntegral i)) [0..localCount-1]
  let finalLocals = genericTake localCount $ zipWith combine (map Just args ++ repeat Nothing) (map Just initialValues ++ repeat Nothing)
      routState = RoutineState (genericLength args) finalLocals pc_ stack_ store
  tell $ ["addr = " ++ showHex addr ++ ", localCount = " ++ show localCount ++ ", locals = " ++ show finalLocals ++ ", hasDefaultLocals = " ++ show hasDefaultLocals]
  stack .= []
  routines %= (routState:)
  let newPC = addr + 1 + if hasDefaultLocals then 2 * fromIntegral localCount else 0
  pc .= newPC
  tell $ ["new PC = " ++ showHex newPC]
 where combine Nothing Nothing  = undefined -- can't happen
       combine Nothing (Just y) = y
       combine (Just x) _       = x


op_VAR_storew :: OpVAR
op_VAR_storew [arr, index, val] = ww (ra . BA $ arr + 2 * index) val
op_VAR_storew _ = illegalArgument "storew without 3 args"


op_VAR_storeb :: OpVAR
op_VAR_storeb [arr, index, val] = wb (ra . BA $ arr + index) (fromIntegral val)
op_VAR_storeb _ = illegalArgument "storeb without 3 args"


op_VAR_put_prop :: OpVAR
op_VAR_put_prop [obj, prop, val] = objPutProp obj prop val
op_VAR_put_prop _ = illegalArgument "put_prop without 3 args"


-- TODO: Implement the timeouts.
op_VAR_read :: OpVAR
op_VAR_read [text] = op_VAR_read [text, 0]
op_VAR_read (text:parse:_) = do
  strRead text parse
  v <- use version
  when (v >= 5) $ zstore 10 -- store the character code for the newline, 10.
op_VAR_read _ = illegalArgument "read without 2 or 4 args"


op_VAR_print_char :: OpVAR
op_VAR_print_char [c] = liftIO $ putChar (chr (fromIntegral c))
op_VAR_print_char _ = illegalArgument "print_char without 1 arg"


op_VAR_print_num :: OpVAR
op_VAR_print_num [n] = liftIO $ putStr $ show (toInt n)
op_VAR_print_num _ = illegalArgument "print_num without 1 arg"


op_VAR_random :: OpVAR
op_VAR_random [range_] = do
  let range = toInt range_
  case range < 0 of
    True  -> do
      -- Setting the seed.
      let g = mkStdGen (- fromIntegral range)
      liftIO $ setStdGen g
      zstore 0
    False -> do
      r <- liftIO $ randomRIO (1, range)
      zstore (fromIntegral r)
op_VAR_random _ = illegalArgument "random without 1 arg"


op_VAR_push :: OpVAR
op_VAR_push [val] = push val
op_VAR_push _ = illegalArgument "push without 1 arg"

op_VAR_pull :: OpVAR
op_VAR_pull [var] = do
  val <- pop
  setVar (fromIntegral var) val
op_VAR_pull _ = illegalArgument "pull without 1 arg"


op_VAR_split_window :: OpVAR
op_VAR_split_window _ = notImplemented "split_window"
op_VAR_set_window :: OpVAR
op_VAR_set_window _ = notImplemented "set_window"


op_VAR_erase_window :: OpVAR
op_VAR_erase_window _ = notImplemented "erase_window"

op_VAR_erase_line :: OpVAR
op_VAR_erase_line _ = notImplemented "erase_line"

op_VAR_set_cursor :: OpVAR
op_VAR_set_cursor _ = notImplemented "set_cursor"


op_VAR_get_cursor :: OpVAR
op_VAR_get_cursor _ = notImplemented "get_cursor"


op_VAR_set_text_style :: OpVAR
op_VAR_set_text_style _ = liftIO . putStrLn $ "[Unimplemented instruction: set_text_style]"


op_VAR_buffer_mode :: OpVAR
op_VAR_buffer_mode _ = notImplemented "buffer_mode"


op_VAR_output_stream :: OpVAR
op_VAR_output_stream _ = notImplemented "output_stream"


op_VAR_input_stream :: OpVAR
op_VAR_input_stream _ = notImplemented "input_stream"


op_VAR_sound_effect :: OpVAR
op_VAR_sound_effect _ = notImplemented "sound_effect"


-- TODO: Handle the timeouts.
op_VAR_read_char :: OpVAR
op_VAR_read_char _ = do
  c <- fromIntegral . ord <$> liftIO getChar
  zstore c


op_VAR_scan_table :: OpVAR
op_VAR_scan_table _ = notImplemented "scan_table"


op_VAR_not :: OpVAR
op_VAR_not _ = notImplemented "not"


-- TODO: Handle the third and fourth arguments
op_VAR_tokenise :: OpVAR
op_VAR_tokenise [text] = op_VAR_tokenise [text, 0]
op_VAR_tokenise [text,parse] = strRead text parse
op_VAR_tokenise _ = illegalArgument "tokenise without 1 or 2 arguments"


op_VAR_encode_text :: OpVAR
op_VAR_encode_text _ = notImplemented "encode_text"


op_VAR_copy_table :: OpVAR
op_VAR_copy_table _ = notImplemented "copy_table"


op_VAR_print_table :: OpVAR
op_VAR_print_table _ = notImplemented "print_table"


op_VAR_check_arg_count :: OpVAR
op_VAR_check_arg_count [n] = do
  rs <- head <$> use routines
  let c = rs ^. argCount
  zbranch (n <= c)


op_EXT_save :: OpVAR
op_EXT_save _ = notImplemented "save"


op_EXT_restore :: OpVAR
op_EXT_restore _ = notImplemented "restore"


op_EXT_log_shift :: OpVAR
op_EXT_log_shift _ = notImplemented "log_shift"


op_EXT_art_shift :: OpVAR
op_EXT_art_shift _ = notImplemented "art_shift"


op_EXT_set_font :: OpVAR
op_EXT_set_font _ = notImplemented "set_font"


op_EXT_save_undo :: OpVAR
op_EXT_save_undo _ = do
  liftIO . putStrLn $ "[Unimplemented opcode: save_undo]"
  zstore 0xffff


op_EXT_restore_undo :: OpVAR
op_EXT_restore_undo _ = notImplemented "restore_undo"


op_EXT_print_unicode :: OpVAR
op_EXT_print_unicode _ = notImplemented "print_unicode"


op_EXT_check_unicode :: OpVAR
op_EXT_check_unicode _ = notImplemented "check_unicode"




op_VAR_je :: OpVAR
op_VAR_je [a] = zbranch False
op_VAR_je (a:rest) = zbranch (any (== a) rest)
op_VAR_je _ = illegalArgument "je with no arguments"

