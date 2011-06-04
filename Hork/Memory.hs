
import Hork.Types
import Data.Array.IO

import Control.Monad
import Control.Monad.State

import Data.Bits

-- reading and writing bytes
rb :: Addr a => a -> H Word8
rb a = do
  arr <- gets memory
  return $ readArray arr (ix a)

wb :: Addr a => a -> Word8 -> H ()
wb a x = do
  arr <- gets memory
  writeArray arr (ix a) x


-- and words
rw :: Addr a => a -> H Word16
rw a = do
  hi <- rb a
  lo <- rb (a+1)
  return $ shiftL (fi hi) 8 + lo

ww :: Addr a => a -> Word16 -> H ()
ww a x = do
  let hi = shiftR 8 x .&. 0xff
      lo = x .&. 0xff
  arr <- gets memory
  liftIO $ do
    writeArray arr a     (fi hi)
    writeArray arr (a+1) (fi lo)


