
module Hork.Util where

import Hork.Config
import Hork.Types
import Hork.Memory

import Data.Bits
import Data.Word
import Data.List
import Data.Array.IO

import Control.Monad
import Control.Monad.State


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


store :: Addr a => a -> Word16 -> H ()
store a x = do
  var <- rb a
  case () of
    () | var == 0    -> push x
       | var <= 0x0f -> wl (var-1) x
       | otherwise   -> wg (var-0x10) x


