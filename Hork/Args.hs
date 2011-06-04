
module Hork.Args where

import Hork.Types
import Hork.Memory
import Hork.Config
import Hork.Util

import Control.Monad
import Control.Applicative

import Data.List
import Data.Word
import Data.Int


getArg :: Addr a => a -> OperandType -> H Operand
getArg a TNone = error "Can't happen: getArg called for TNone"
getArg a TSmall = Small <$> rb a
getArg a TLarge = Large <$> rw a
getArg a TVar = do
  number <- rb a
  case () of
    () | number == 0x00 -> Large <$> pop
       | number <= 0x0f -> Large <$> rl (number-1)
       | otherwise      -> Large <$> rg (number-0x10)


getArgSize :: OperandType -> Word
getArgSize TNone  = 0
getArgSize TVar   = 1
getArgSize TSmall = 1
getArgSize TLarge = 2


argToWord :: Operand -> Word16
argToWord (Large x) = x
argToWord (Small x) = fi x

argToInt :: Operand -> Int16
argToInt (Large x) = fi x
argToInt (Small x) = fi (fi x :: Word16)


getArgList :: Addr a => a -> [OperandType] -> H (RawAddr, [Operand])
getArgList a ts = return . (,) a' =<< sequence actions
  where (a', actions) = mapAccumL (\a t -> (a + (RA $ getArgSize t), getArg a t)) (RA $ ix a) ts

