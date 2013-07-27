module Hork.Ops (
  zinterp0OP, zinterp1OP, zinterp2OP, zinterpVAR
) where

import qualified Data.Map as M
import Hork.Core
import Hork.String
import Hork.Objects

import Data.Char (chr)

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
  let num = opcode .&. 31
  arg1 <- getArg typ1
  arg2 <- getArg typ2
  case M.lookup num ops2OP of
    Nothing -> die $ "No such 2OP opcode: " ++ show num
    Just op -> op arg1 arg2

zinterpVAR :: Word8 -> [Word8] -> Hork ()
zinterpVAR opcode types = do
  let num = opcode .&. 31
  args <- mapM getArg types
  case M.lookup num opsVAR of
    Nothing -> die $ "No such VAR opcode: " ++ show num
    Just op -> op args



-----------------------------------------------------------
-- common helpers
-----------------------------------------------------------

zreturn :: Word16 -> Hork ()
zreturn value = do
  rts <- head <$> use routines
  stack .= rts ^. oldStack
  pc .= rts ^. oldPC
  zstore value

zstore :: Word16 -> Hork ()
zstore value = do
  b <- pcGet
  setVar b value


zbranch :: Bool -> Hork ()
zbranch val = do
  b1 <- pcGet
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
  case delta of
    0 -> zreturn 0
    1 -> zreturn 1
    _ -> pcBumpBy (delta-2)


toInt :: Word16 -> Int16
toInt = fromIntegral


notImplemented :: String -> Hork ()
notImplemented func = die $ "Unimplemented opcode: " ++ func

illegalArgument :: String -> Hork ()
illegalArgument msg = die $ "Illegal arguments to a VAR op: " ++ msg

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
    (9, op_0OP_pop),
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


op_0OP_pop :: Op0OP
op_0OP_pop = pop >> return ()


op_0OP_quit :: Op0OP
op_0OP_quit = throwError Exit


op_0OP_new_line :: Op0OP
op_0OP_new_line = liftIO $ putStrLn ""


op_0OP_show_status :: Op0OP
op_0OP_show_status = notImplemented "show_status"


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
  --(8, op_1OP_call_1s
  (9, op_1OP_remove_obj),
  (10, op_1OP_print_obj),
  (11, op_1OP_ret),
  (12, op_1OP_jump),
  (13, op_1OP_print_paddr),
  (14, op_1OP_load),
  (15, op_1OP_not)
  ]


op_1OP_jz :: Op1OP
op_1OP_jz arg = zbranch (arg == 0)

op_1OP_get_sibling :: Op1OP
op_1OP_get_sibling = objSibling >=> rb >=> return . fromIntegral >=> zstore

op_1OP_get_child :: Op1OP
op_1OP_get_child = objChild >=> rb >=> return . fromIntegral >=> zstore

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

op_1OP_print_paddr :: Op1OP
op_1OP_print_paddr = printZ . PA



op_1OP_remove_obj :: Op1OP
op_1OP_remove_obj = objRemove


op_1OP_print_obj :: Op1OP
op_1OP_print_obj = objPrintShortName


op_1OP_ret :: Op1OP
op_1OP_ret = zreturn

op_1OP_jump :: Op1OP
op_1OP_jump uArg = pcBumpBy (fromIntegral uArg)


op_1OP_load :: Op1OP
op_1OP_load arg = getVar (fromIntegral arg) >>= zstore


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
  (24, op_2OP_mod)
  ]



op_2OP_je :: Op2OP
op_2OP_je x y = zbranch (x == y)

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
op_2OP_get_prop_addr obj prop = objPropAddr obj prop >>= return . fromIntegral >>= zstore

op_2OP_get_next_prop :: Op2OP
op_2OP_get_next_prop obj prop = objNextProp obj prop >>= zstore


math :: (Int16 -> Int16 -> Int16) -> Op2OP
math f ux uy = zstore (fromIntegral $ f (toInt ux) (toInt uy))

op_2OP_add, op_2OP_sub, op_2OP_mul, op_2OP_div, op_2OP_mod :: Op2OP
op_2OP_add = math (+)
op_2OP_sub = math (flip subtract)
op_2OP_mul = math (*)
op_2OP_div = math div
op_2OP_mod = math mod



type OpVAR = [Word16] -> Hork ()

opsVAR :: M.Map Word8 OpVAR
opsVAR = M.fromList [
  (0, op_VAR_call),
  (1, op_VAR_storew),
  (2, op_VAR_storeb),
  (3, op_VAR_put_prop),
  (4, op_VAR_read),
  (5, op_VAR_print_char),
  (6, op_VAR_print_num),
  (7, op_VAR_random),
  (8, op_VAR_push),
  (9, op_VAR_pull),
  (10, op_VAR_split_window),
  (11, op_VAR_set_window),
  (19, op_VAR_output_stream)
  ]



op_VAR_call :: OpVAR
op_VAR_call [] = illegalArgument "call with no routine"
op_VAR_call (0:_) = zstore 0 -- automatically return false when the call is to 0.
op_VAR_call (routine:args) = do
  pc_ <- use pc
  stack_ <- use stack

  let addr = ra (PA routine)
  localCount <- rb addr
  initialValues <- mapM (\i -> rw (addr + 1 + 2 * fromIntegral i)) [1..localCount]
  let finalLocals = genericTake localCount $ zipWith combine (map Just args ++ repeat Nothing) (map Just initialValues ++ repeat Nothing)
      routState = RoutineState finalLocals pc_ stack_
  stack .= []
  routines %= (routState:)
  pc .= addr + 1 + 2 * fromIntegral localCount
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


op_VAR_read :: OpVAR
op_VAR_read [text, parse] = strRead text parse
op_VAR_read _ = illegalArgument "read without 2 args"


op_VAR_print_char :: OpVAR
op_VAR_print_char [c] = liftIO $ putChar (chr (fromIntegral c))
op_VAR_print_char _ = illegalArgument "print_char without 1 arg"


op_VAR_print_num :: OpVAR
op_VAR_print_num [n] = liftIO $ print (toInt n)
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
op_VAR_output_stream :: OpVAR
op_VAR_output_stream _ = notImplemented "output_stream"

