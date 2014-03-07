module Hork.Ops (
  zinterp0OP, zinterp1OP, zinterp2OP, zinterpVAR, div', mod'
) where

import qualified Data.Map as M
import Hork.Core
import Hork.String
import Hork.Objects

import Hork.JavaScript.Console
import Hork.JavaScript.Save

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
  debug ["real 2OP"]
  let num = opcode .&. 31
  arg1 <- getArg typ1
  arg2 <- getArg typ2
  case M.lookup num ops2OP of
    Nothing -> die $ "No such 2OP opcode: " ++ show num
    Just op -> op arg1 arg2

zinterpVAR :: Word16 -> [Word8] -> Hork ()
zinterpVAR opcode types = do
  debug ["real var"]
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
  debug ["returning " ++ showHex value]
  rts <- head <$> use routines
  stack .= rts ^. oldStack
  pc .= rts ^. oldPC
  routines %= tail
  when (rts ^. doStore) $ zstore value

zstore :: Word16 -> Hork ()
zstore value = do
  b <- pcGet
  debug ["storing " ++ showHex value ++ " -> " ++ show b]
  setVar b value


zbranch :: Bool -> Hork ()
zbranch val = do
  b1 <- pcGet
  debug ["branch byte 1 = " ++ showHex b1 ++ ", " ++ show val]
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
    False -> debug ["skipping branch"]
    True  -> case delta of
        0 -> debug ["branch: return false"] >> zreturn 0
        1 -> debug ["branch: return true"]  >> zreturn 1
        _ -> debug ["branch by " ++ show (delta-2)] >> pcBumpBy (delta-2)


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
  liftIO . cPutStr $ map (chr . fromIntegral) s
  pcBumpBy (2 * fromIntegral len)

op_0OP_print_ret :: Op0OP
op_0OP_print_ret = do
  op_0OP_print
  zreturn 1

op_0OP_nop :: Op0OP
op_0OP_nop = return ()


-- In version <= 3, I branch if I saved successfully.
-- In version 4, I store the result code.
-- In version >= 5, I am illegal.
op_0OP_save :: Op0OP
op_0OP_save = do
  v <- use version
  case v of
    5 -> die "Illegal use of 0OP @save in version 5"
    4 -> saveGame "TODO" >>= zstore
    _ -> do
      res <- saveGame "TODO"
      if res == 1 then zbranch True else return () -- branch on successful save.


-- In version <= 3, I "branch" on success, but never actually make the jump
-- In version 4, I return 0 on failure. On success, I have resumed elsewhere.
-- In version 5, I am illegal.
op_0OP_restore :: Op0OP
op_0OP_restore = do
  v <- use version
  case v of
    5 -> die "Illegal use of 0OP @restore in version 5"
    4 -> do
      res <- restoreGame "TODO"
      -- PC is now in the middle of the save call, on success.
      -- So on success, I got a 2 from restoreGame, and should store it (in the save op).
      -- On failure, I got a 0, and should store it (in the restore op).
      zstore res
    _ -> do
      res <- restoreGame "TODO"
      -- On success, PC is now in the middle of the save op.
      -- On failure, I should not branch.
      -- The Standard says the branch never happens, but that's not true because of negated
      -- branching, I believe.
      zbranch (res == 2)


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
op_0OP_new_line = liftIO $ cPutStrLn ""


-- Note: Illegal in versions other than 3.
op_0OP_show_status :: Op0OP
op_0OP_show_status = do
  v <- use version
  when (v == 3) show_status


show_status :: Hork ()
show_status = do
  (r, c) <- terminalDimensions
  liftIO $ cPutStr ['\x1b','7'] -- save cursor
  liftIO $ cPutStr "\x1b[1;1H" -- move to top-left
  liftIO $ cPutStr "\x1b[7m"   -- reverse video
  liftIO $ cPutStr "\x1b[2K"   -- erase whole line
  -- Retrieve the current room. Its number is the first global variable, which is #16
  obj <- getGlobal 16
  maxObj <- byVersion 255 65535

  objName <- if obj <= maxObj then fmap (map (chr.fromIntegral)) $ objShortName obj else return ""
  -- TODO: Timed games.
  let pad n = reverse . take n . (++ repeat ' ') . reverse
  score <- getGlobal 17
  turn  <- getGlobal 18
  let score' = pad 3 $ show score
      turn'  = pad 4 $ show turn
      rhs    = "  Score: " ++ score' ++ "  Turn: " ++ turn' ++ " "
      nameSpace = c - length rhs
      nameLen = length objName
      extraSpace = c - nameLen - length rhs
      nameToPrint = if extraSpace >= 0
                      then objName
                      else take (nameLen + extraSpace - 3) objName ++ "..."
      line = nameToPrint ++ (if extraSpace > 0 then replicate extraSpace ' ' else "") ++ rhs
  liftIO $ cPutStr line
  -- And finally, restore the cursor and other modes.
  liftIO $ cPutStr ['\x1b', '8'] -- restore cursor


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
  sib <- relativeRead a
  zstore sib
  zbranch (sib > 0)


op_1OP_get_child :: Op1OP
op_1OP_get_child obj = do
  a <- objChild obj
  c <- relativeRead a
  zstore c
  zbranch (c > 0)

op_1OP_get_parent :: Op1OP
op_1OP_get_parent = objParent >=> relativeRead >=> return . fromIntegral >=> zstore

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
  p <- objParent child >>= relativeRead
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
                  | otherwise    = -(b - mod a b)


op_2OP_call :: Bool -> Op2OP
op_2OP_call store routine arg = do
  let (op, minVersion) = if store then ("call_2s", 4) else ("call_2n", 5)
  introducedIn op minVersion
  zcall store [routine, arg]


op_2OP_set_colour :: Op2OP
op_2OP_set_colour fg bg = do
  introducedIn "set_colour" 5
  fgColor .= fromIntegral fg
  bgColor .= fromIntegral bg
  writeTermStyle


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
  debug $ ["addr = " ++ showHex addr ++ ", localCount = " ++ show localCount ++ ", locals = " ++ show finalLocals ++ ", hasDefaultLocals = " ++ show hasDefaultLocals]
  stack .= []
  routines %= (routState:)
  let newPC = addr + 1 + if hasDefaultLocals then 2 * fromIntegral localCount else 0
  pc .= newPC
  debug $ ["new PC = " ++ showHex newPC]
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
  v <- use version
  when (v <= 3) op_0OP_show_status -- Redisplay the status line, on v3 and earlier.
  strRead text parse
  when (v >= 5) $ zstore 10 -- store the character code for the newline, 10.
op_VAR_read _ = illegalArgument "read without 2 or 4 args"


op_VAR_print_char :: OpVAR
op_VAR_print_char [c] = liftIO $ cPutChar (chr (fromIntegral c))
op_VAR_print_char _ = illegalArgument "print_char without 1 arg"


op_VAR_print_num :: OpVAR
op_VAR_print_num [n] = liftIO $ cPutStr $ show (toInt n)
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
op_VAR_pull [0] = do
  val <- pop
  _ <- pop -- Special case. a stack of ... 43 44 45 becomes ... 43 45, because the value is
           -- retrieved, and then written back directly in place, rather than pushed.
           -- Put another way, this is Forth's NIP = SWAP DROP
  setVar 0 val
op_VAR_pull [var] = do
  val <- pop
  setVar (fromIntegral var) val
op_VAR_pull _ = illegalArgument "pull without 1 arg"


op_VAR_split_window :: OpVAR
op_VAR_split_window [n] = do
  -- v3 has split window support, but it's only used in Seastalker
  -- and has somewhat different rules, so it's omitted here.
  introducedIn "split_window" 4
  liftIO $ putStrLn $ "split_window " ++ show n
  liftIO $ cPutStr $ "\x1b[" ++ show (n+1) ++ ";999r"
  (y, x) <- getCursorPos
  current <- use currentWindow
  case n of
    0 -> do
      -- Unsplit! No erasing or cursor movement.
      splitWindow .= Nothing
      currentWindow .= 1

    _ -> do
      -- Current split.
      -- Get the stored cursor positions of both windows, and fix them.
      splitWindow .= Just n

      -- Check and adjust upper window.
      (yU, xU) <- use $ cursorPos . _1 -- Position in upper window.
      when (yU > n) $ do -- Cursor is outside the new upper window, so revert to upper left.
        cursorPos . _1 .= (1,1)

      -- And check the lower window.
      (yL, xL) <- use $ cursorPos . _2 -- Position in lower window.
      when (yL <= n) $ do
        cursorPos . _2 .= (n+1, 1)

      -- Now move the real cursor to its stored location for the current window.
      -- This value may have changed, but there's no harm in moving the cursor to its
      -- current location.
      pos <- if current == 0
               then use $ cursorPos . _1
               else use $ cursorPos . _2
      moveCursor pos


op_VAR_set_window :: OpVAR
op_VAR_set_window [n] = do
  introducedIn "set_window" 4 -- Really v3, but only one game uses it.
  liftIO $ putStrLn $ "set_window " ++ show n
  current <- use currentWindow
  when (n /= current) $ do
    (y, x) <- getCursorPos -- Retrieve the real cursor position.
    case n of
      0 -> do
        -- The position in the upper window is always set to (1,1).
        cursorPos . _2 .= (y, x) -- Store the current position for window 1.
        moveCursor (1, 1)
      1 -> do
        newPos <- use $ cursorPos . _2 -- Retrieve the new cursor position.
        cursorPos . _1 .= (y, x) -- Store the current position for window 0.
        moveCursor newPos
      _ -> return () -- Ignore bad set_window calls.
op_VAR_set_window _ = illegalArgument "set_window with bad arguments"


op_VAR_erase_window :: OpVAR
op_VAR_erase_window xs = do
  liftIO $ putStrLn $ "erase_window " ++ show xs
  op_VAR_erase_window_ xs
op_VAR_erase_window_ [-2] = liftIO $ cPutStr "\x1b[2J" -- Clear without unsplitting.
op_VAR_erase_window_ [-1] = do
  liftIO $ cPutStr "\x1b[2J" -- Clear without unsplitting.
  op_VAR_split_window [0] -- Unsplit the windows.

op_VAR_erase_window_ [0] = do
  -- Clear the upper window.
  msplit <- use splitWindow
  case msplit of
    Nothing -> return () -- No upper window, so do nothing.
    Just n -> do
      moveCursor (n, 500) -- Move to right edge at end of upper window.
      liftIO $ cPutStr "\x1b[1J" -- Erase from beginning to cursor, inclusive.
      moveCursor (1,1)

op_VAR_erase_window_ [1] = do
  split <- maybe 1 id <$> use splitWindow
  moveCursor (split+1, 1) -- Move to beginning of lower window.
  liftIO $ cPutStr "\x1b[J"

op_VAR_erase_window_ _ = return () -- Ignore illegal erase_widnows.


op_VAR_erase_line :: OpVAR
op_VAR_erase_line [1] = liftIO $ cPutStr "\x1b[L" -- Erase from cursor to EOL.
op_VAR_erase_line _ = return () -- Do nothing.


op_VAR_set_cursor :: OpVAR
op_VAR_set_cursor [r,c] = do
  -- This is only meaningful if the upper window is selected.
  liftIO $ putStrLn $ "set_cursor " ++ show r ++ ", " ++ show c
  current <- use currentWindow
  msplit <- use splitWindow
  case (current, msplit) of
    (0, Just n) | r <= n -> do
                  moveCursor (r,c)
                  cursorPos . _1 .= (r,c)
                | otherwise -> do
                  moveCursor (r,c)
                  currentWindow .= 1 -- We've moved to the lower window.
                  cursorPos . _2 .= (r,c)
    _ -> return ()
op_VAR_set_cursor _ = return ()


op_VAR_get_cursor :: OpVAR
op_VAR_get_cursor [arr] = do
  (y, x) <- getCursorPos
  ww (BA arr) y
  ww (BA (arr+2)) x


op_VAR_set_text_style :: OpVAR
op_VAR_set_text_style [style] = do
  v <- use version
  if v <= 3
    then return ()
    else setTextStyle style
op_VAR_set_text_style _ = illegalArgument "set_text_style without 1 argument"

setTextStyle :: Word16 -> Hork ()
setTextStyle nu = do
  old <- use zTextStyle
  when (nu /= old) $ do
    zTextStyle .= nu
    let term = case () of
                 () | nu ^. bitAt 0 -> "7" -- reverse is highest priority
                    | nu ^. bitAt 1 -> "1" -- then bold
                    | nu ^. bitAt 2 -> "4" -- then italic/underline
                    | otherwise -> "0"
    termTextStyle .= term
    writeTermStyle

-- Boolean is True for foreground, False for background.
zColourToTermColour :: Bool -> Word8 -> Hork Word8
zColourToTermColour True  0 = use fgColor
zColourToTermColour False 0 = use bgColor
zColourToTermColour True  1 = return defaultForegroundColour
zColourToTermColour False 1 = return defaultBackgroundColour
zColourToTermColour True  n = return $ 28 + n
zColourToTermColour False n = return $ 38 + n
-- 28+n relates the Z-machine colours, eg. 2 for black,
-- to the ANSI colours, eg. 30 for black, foreground (40 for background).

-- Outputs the terminal escape sequence to set the colours and text style.
writeTermStyle :: Hork ()
writeTermStyle = do
  style <- use termTextStyle
  fg <- zColourToTermColour True  =<< use fgColor
  bg <- zColourToTermColour False =<< use bgColor
  -- Esc[Style;FG;BGm
  liftIO $ cPutStr $ "\x1b[" ++ style ++ ";" ++ show fg ++ ";" ++ show bg ++ "m"


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
  c <- fromIntegral . ord <$> cGetChar
  zstore c


op_VAR_scan_table :: OpVAR
op_VAR_scan_table [x, t, l] = op_VAR_scan_table [x, t, l, 0x82] -- Defaults to wordwise, word entries.
op_VAR_scan_table [target, table, len, form] = do
  let checkWords = form ^. bitAt 7
      entrySize = form .|. 127 -- Ignoring top bit.
      top = table + (len * entrySize)
      check a = do
        v <- (if checkWords then rw else fmap fromIntegral . rb) (BA a)
        if v == target
          then zstore a >> zbranch True
          else do
            let a' = a + entrySize
            if a' < top then check a' else zstore 0 >> zbranch False
  check table



op_VAR_not :: OpVAR
op_VAR_not [v] = zstore (complement v)


-- TODO: Handle the third and fourth arguments
op_VAR_tokenise :: OpVAR
op_VAR_tokenise [text] = op_VAR_tokenise [text, 0]
op_VAR_tokenise [text,parse] = strRead text parse
op_VAR_tokenise _ = illegalArgument "tokenise without 1 or 2 arguments"


op_VAR_encode_text :: OpVAR
op_VAR_encode_text [src, len, from, dst] = do
  -- Read len bytes from from in src.
  word <- mapM (rb.BA) [src+from..src+from+len-1]
  let text = encode 9 word
  zipWithM_ ww (map BA [dst,dst+2,dst+4]) text


op_VAR_copy_table :: OpVAR
op_VAR_copy_table [src, dst, len] = do
  -- If dst is 0, then 0 out len bytes of src
  case (dst, len) of
    (0, _) -> mapM_ (\a -> wb (BA a) 0) [src .. src+(abs len)-1]
    _ -> do
      -- Copy forward or backward as necessary to avoid corruption.
      -- Forward suffices in all cases, except where src < dst && dst < src+len.
      -- Forward is also mandated when len < 0.
      let f = case () of
                () | len > 0 && src < dst && dst < src+(abs len) -> reverse -- backwards case
                   | otherwise                                   -> id      -- forwards case
      zipWithM_ (\s d -> rb (BA s) >>= wb (BA d)) (f [src .. src+(abs len)-1]) (f [dst..])


op_VAR_print_table :: OpVAR
op_VAR_print_table _ = notImplemented "print_table"


op_VAR_check_arg_count :: OpVAR
op_VAR_check_arg_count [n] = do
  rs <- head <$> use routines
  let c = rs ^. argCount
  zbranch (n <= c)


-- TODO: Optional extended arguments for save and restore in v5.
op_EXT_save :: OpVAR
op_EXT_save _ = do
  res <- saveGame "TODO"
  zstore res


op_EXT_restore :: OpVAR
op_EXT_restore _ = do
  res <- restoreGame "TODO"
  -- If successful, PC is now elsewhere, where it was during saveGame.
  -- That was in the middle of the save op, with its store location.
  -- So I store here, whether successful or not, and I write the result code into either
  -- the @save (on success) or @restore (on failure), which is the right thing.
  zstore res


-- Data.Bits.shift* are logical on unsigned types like Word16.
op_EXT_log_shift :: OpVAR
op_EXT_log_shift [num, by] = zstore (num `shift` fromIntegral (toInt by))
op_EXT_log_shift _ = illegalArgument "log_shift without 2 arguments"


-- Data.Bits.shift* are arithmetical on signed types like the Int16 I'm passing it.
op_EXT_art_shift :: OpVAR
op_EXT_art_shift [num, by] = zstore (fromIntegral (toInt num `shift` fromIntegral (toInt by)))


op_EXT_set_font :: OpVAR
op_EXT_set_font [font] = do
  case font of
    1 -> zstore 1 -- "successfully" switching to the normal font.
    4 -> zstore 4 -- "successfully" switching to fixed-width font.
    _ -> zstore 0 -- unsuccessfully switching to any other font.


op_EXT_save_undo :: OpVAR
op_EXT_save_undo _ = do
  -- Duplicate the entire HorkState. This includes copying the memory.
  st <- get
  oldMem <- use mem
  cp <- liftIO $ mapArray id oldMem
  let st' = st { _mem = cp }
  ref <- use undoState
  liftIO $ writeIORef ref (Just st')
  zstore 1 -- Successfully saved, so return 1.


op_EXT_restore_undo :: OpVAR
op_EXT_restore_undo _ = do
  -- Read the state from the IORef
  ref <- use undoState
  oldState <- liftIO $ readIORef ref
  case oldState of
    Nothing -> zstore 0xffff -- No previous saved state. Return -1 for a failed load.
    Just (st) -> do
      put st -- PC is now pointing at the middle of the save_undo op.
      setHeaderBits
      ref' <- use undoState
      liftIO $ writeIORef ref' Nothing -- Clear the old state.
      zstore 2 -- Successful return from a restore.


op_EXT_print_unicode :: OpVAR
op_EXT_print_unicode _ = notImplemented "print_unicode"


op_EXT_check_unicode :: OpVAR
op_EXT_check_unicode _ = notImplemented "check_unicode"




op_VAR_je :: OpVAR
op_VAR_je [a] = zbranch False
op_VAR_je (a:rest) = zbranch (any (== a) rest)
op_VAR_je _ = illegalArgument "je with no arguments"

