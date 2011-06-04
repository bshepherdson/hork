
import Hork.Types
import Hork.Memory
import Hork.Strings
import Hork.Util

import Control.Monad
import Control.Monad.IO
import System.IO

import Data.List
import Data.Bits
import Data.Word



-- main interpreter function
interp :: H ()
interp = do
  v <- configByte "version"
  i <- gets pc
  b <- rb i
  let f | b == 0xBE && v >= 5 = interpExtended
        | otherwise = case shiftR 6 b of
                        3 -> interpVariable
                        2 -> interpShort
                        _ -> interpLong
  f i


interpShort :: Addr a => a -> Word8 -> H ()
interpShort i b = do
  let typ = opType $ bits b [4,5]
      count = case typ of None -> 0OP; _ -> 1OP
      opcode = bits b [0..3]
  perform count opcode [typ] (i+1)


interpLong :: Addr a => a -> Word8 -> H ()
interpLong i b = do
  let types = [if testBit b 6 then Var else Small, if testBit b 5 then Var else Small]
      opcode = bits b [0..4]
  perform 2OP opcode types (i+1)


interpVariable :: Addr a => a -> Word8 -> H ()
interpVariable i b = do
  let count = if testBit b 5 then VAR else 2OP
      opcode = bits b [0..4]
  (types, i') <- if opcode == 250 || opcode == 236 -- call_vs2 and call_vn2
                   then do
                     t1 <- typeByte (i+1)
                     t2 <- typeByte (i+2)
                     return (t1 ++ t2, i+3)
                   else do
                     t <- typeByte (i+1)
                     return (t, i+2)
  perform VAR opcode (filter (/= None) types) i'


interpExtended :: Addr a => a -> Word8 -> H ()
interpExtended i b = do
  opcode <- rb (i+1)
  t <- typeByte (i+2)
  perform EXT opcode (filter (/= None) types) (i+3)


-- takes just the two bits
opType :: Word8 -> OperandType
opType 0 = Large
opType 1 = Small
opType 2 = Var 
opType 3 = None


typeByte :: Addr a => a -> H [OperandType]
typeByte a = do
  b <- rb a
  return $ map (opType . bits b) [[7,6], [5,4], [3,2], [1,0]]



