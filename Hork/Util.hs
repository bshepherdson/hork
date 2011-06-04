
module Hork.Util where

import Hork.Types
import Data.Bits
import Data.Word
import Data.List


-- returns just the specified bits, shifted so the least significant unmasked bit is bit 0
-- Example: 0b0111_0000 [3,4,5] -> 0b0000_0110
bits :: Bits a => a -> [Int] -> a
bits _ [] = 0
bits x bs = shiftR (x .&. mask) (minimum bs)
  where mask = foldl' (\m n -> m .|. shiftL 1 n) 0 bs


