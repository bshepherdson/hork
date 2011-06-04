
module Hork.Objects where

import Hork.Types
import Hork.Memory
import Hork.Config

import Control.Monad
import Control.Monad.State
import Control.Applicative

import Data.Bits
import Data.Word

version :: H Word8
version = configByte "version"

getObj :: Word16 -> H RawAddr
getObj n = do
  t <- RA . fi <$> configWord "objects" -- byte address
  v <- version
  let table = if v <= 3 then t + 62 else t + 126
      size  = if v <= 3 then 9 else 14
  return $ table + fi ((n-1)*size)


-- assumes the attr number is sane
objClearAttr :: Word16 -> Word16 -> H ()
objClearAttr n attr = do
  obj <- getObj n
  let byte = RA . fi $ attr `div` 8
      bit_ = 7 - fi (attr `mod` 8) -- they're numbered the other way around
  b <- rb $ obj+byte
  wb (obj+byte) $ b .&. (complement $ bit bit_)

-- assumes the attr number is sane
objSetAttr :: Word16 -> Word16 -> H ()
objSetAttr n attr = do
  obj <- getObj n
  let byte = RA . fi $ attr `div` 8
      bit_ = 7 - fi (attr `mod` 8) -- they're numbered the other way around
  b <- rb $ obj+byte
  wb (obj+byte) $ b .|. bit bit_

objTestAttr :: Word16 -> Word16 -> H Bool
objTestAttr n attr = do
  obj <- getObj n
  let byte = RA . fi $ attr `div` 8
      mask = bit $ 7 - fi (attr `mod` 8)
  b <- rb $ obj+byte
  return $ (b .&. mask) /= 0

