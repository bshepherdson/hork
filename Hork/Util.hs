
module Hork.Util where

import Hork.Config
import Hork.Types
import Hork.Memory

import Data.Bits
import Data.Word
import Data.Int
import Data.List
import Data.Array.IO

import Control.Monad
import Control.Monad.State
import Control.Applicative


-- returns just the specified bits, shifted so the least significant unmasked bit is bit 0
-- Example: 0b0111_0000 [3,4,5] -> 0b0000_0110
bits :: Bits a => a -> [Int] -> a
bits _ [] = 0
bits x bs = shiftR (x .&. mask) (minimum bs)
  where mask = foldl' (\m n -> m .|. shiftL 1 n) 0 bs


-- read a global by number
rg :: Word8 -> H Word16
rg n = do
  table <- configWord "globals"
  rw (BA $ table + (fi n * 2))

-- write a global by number
wg :: Word8 -> Word16 -> H ()
wg n x = do
  table <- configWord "globals"
  ww (BA $ table + (fi n * 2)) x

-- locals
rl :: Word8 -> H Word16
rl n = do
  ls <- gets locals
  liftIO $ readArray ls n

wl :: Word8 -> Word16 -> H ()
wl n x = do
  ls <- gets locals
  liftIO $ writeArray ls n x


-- stack helpers
pop :: H Word16
pop = do
  s <- gets stack
  case s of
    [] -> error "Attempt to pop empty stack"
    (top:rest) -> do
      modify $ \st -> st { stack = rest }
      return top

push :: Word16 -> H ()
push x = modify $ \st -> st { stack = x : stack st }

peek :: H Word16
peek = head <$> gets stack


store :: Addr a => a -> Word16 -> H ()
store a x = do
  var <- rb a
  case () of
    () | var == 0    -> push x
       | var <= 0x0f -> wl (var-1) x
       | otherwise   -> wg (var-0x10) x


-- PC management
setPC :: RawAddr -> H ()
setPC a = modify $ \st -> st { pc = a }

branch :: RawAddr -> Bool -> H ()
branch a cond = do
  b <- rb a
  let onTrue = testBit b 7
      short  = testBit b 6
  rawoffset <- do
    if short
      then return . fi $ b .&. 0x3f
      else do
        w <- (.&. 0x3fff) <$> rw a
        return $ if testBit w 13 then w .|. 0xc000 else w
  let offset = fi (fi (rawoffset :: Word16) :: Int16) :: Int
      a' = a + if short then 1 else 2

  if onTrue == cond
    then case offset of
           0 -> return_ 0
           1 -> return_ 1
           _ -> setPC . RA . fi $ fi a' + offset - 2
    else setPC a'


return_ :: Word16 -> H ()
return_ ret = do
  rs <- gets returnStack
  let cs = case rs of
             [] -> error "Return with empty call stack"
             (x:_) -> x
  modify $ \st -> st { stack = csStack cs, locals = csLocals cs, pc = cspc cs, returnStack = tail rs }
  case csReturn cs of
    Nothing -> return ()
    Just v | v == 0x00 -> push ret
           | v <= 0x10 -> wl (v-1) ret
           | otherwise -> wg (v-0x10) ret


