
module Hork.Memory where

import Hork.Types
import Data.Array.IO

import Control.Monad
import Control.Monad.State

import Data.Bits
import Data.Word

-- reading and writing bytes
rb :: Addr a => a -> H Word8
rb a = do
  arr <- gets memory
  liftIO $ readArray arr (ix a)

wb :: Addr a => a -> Word8 -> H ()
wb a x = do
  arr <- gets memory
  liftIO $ writeArray arr (ix a) x


-- and words
rw :: Addr a => a -> H Word16
rw a = do
  hi <- rb a
  lo <- rb (a+1)
  return $ shiftL (fi hi) 8 + fi lo

ww :: Addr a => a -> Word16 -> H ()
ww a x = do
  let hi = shiftR x 8 .&. 0xff
      lo = x .&. 0xff
  arr <- gets memory
  liftIO $ do
    writeArray arr (ix a)   (fi hi)
    writeArray arr (ix a+1) (fi lo)


