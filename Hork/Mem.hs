module Hork.Mem where

import Data.Word
import Data.Bits

import Data.Array.IO

-- Address types
class Addr a where
  ra :: a -> RA

newtype BA = BA Word16
newtype WA = WA Word16
newtype PA = PA Word16

type RA = Word32

instance Addr BA where ra (BA a) = fromIntegral a
instance Addr WA where ra (WA a) = 2 * fromIntegral a
instance Addr PA where ra (PA a) = 2 * fromIntegral a -- v3-specific


type Mem = IOUArray RA Word8

-- The Z-machine is a 16-bit big-endian machine.
-- Make sure all reads and writes are done in big-endian order.
rb_ :: Mem -> RA -> IO Word8
rb_ = readArray

wb_ :: Mem -> RA -> Word8 -> IO ()
wb_ = writeArray

rw_ :: Mem -> RA -> IO Word16
rw_ m a = do
  hi <- fmap fromIntegral $ rb_ m a
  lo <- fmap fromIntegral $ rb_ m (a+1)
  return $ hi `shiftL` 8 .|. lo

ww_ :: Mem -> RA -> Word16 -> IO ()
ww_ m a v = do
  wb_ m a     (fromIntegral $ shiftR v 8 .&. 255)
  wb_ m (a+1) (fromIntegral $        v   .&. 255)

