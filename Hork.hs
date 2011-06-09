
module Main where 

import Hork.Types
import Hork.Config
import Hork.Memory
import Hork.Util
import Hork.Ops

import Control.Monad
import Control.Monad.State

import System.IO
import System.Environment

import Data.List
import Data.Bits
import Data.Word
import Data.Array.IO

import qualified Data.ByteString as B


cmdLineArgs :: IO String
cmdLineArgs = do
  args <- getArgs
  case args of
    [x] -> return x
    _   -> error "Usage: hork <story file>"

-- getting started
main :: IO ()
main = do
  storyFile <- cmdLineArgs
  story <- load storyFile
  state <- initialize story
  _ <- runH interpLoop state
  return ()

  

-- returns the whole file contents
load :: String -> IO B.ByteString
load = B.readFile

-- takes the contents of the story file, builds a HorkState
initialize :: B.ByteString -> IO HorkState
initialize story = do
  let v = B.head story
  mem <- newListArray (0, fi (B.length story) - 1) (B.unpack story)
  ls <- newArray (0,15) 0
  pc1 <- readArray mem 6
  pc2 <- readArray mem 7
  let initPC = shiftL (fi pc1 :: Word16) 8 .|. (fi pc2 :: Word16) 
  return HorkState { memory = mem, stack = [], locals = ls, returnStack = [], pc = RA (fi initPC), dictionary = Nothing }


-- interpreter internals

interpLoop :: H ()
interpLoop = forever interp


-- main interpreter function
interp :: H ()
interp = do
  v <- configByte "version"
  i <- gets pc
  b <- rb i
  let f | b == 0xBE && v >= 5 = interpExtended
        | otherwise = case shiftR b 6 of
                        3 -> interpVariable
                        2 -> interpShort
                        _ -> interpLong
  f i b


interpShort :: Addr a => a -> Word8 -> H ()
interpShort i b = do
  let typ = opType $ bits b [4,5]
      count = case typ of TNone -> OP0; _ -> OP1
      opcode = bits b [0..3]
  perform i count opcode [typ] (i+1)


interpLong :: Addr a => a -> Word8 -> H ()
interpLong i b = do
  let types = [if testBit b 6 then TVar else TSmall, if testBit b 5 then TVar else TSmall]
      opcode = bits b [0..4]
  perform i OP2 opcode types (i+1)


interpVariable :: Addr a => a -> Word8 -> H ()
interpVariable i b = do
  let count = if testBit b 5 then VAR else OP2
      opcode = bits b [0..4]
  (types, i') <- if opcode == 250 || opcode == 236 -- call_vs2 and call_vn2
                   then do
                     t1 <- typeByte (i+1)
                     t2 <- typeByte (i+2)
                     return (t1 ++ t2, i+3)
                   else do
                     t <- typeByte (i+1)
                     return (t, i+2)
  perform i VAR opcode (filter (/= TNone) types) i'


interpExtended :: Addr a => a -> Word8 -> H ()
interpExtended i b = do
  opcode <- rb (i+1)
  t <- typeByte (i+2)
  perform i EXT opcode (filter (/= TNone) t) (i+3)


-- takes just the two bits
opType :: Word8 -> OperandType
opType 0 = TLarge
opType 1 = TSmall
opType 2 = TVar 
opType 3 = TNone


typeByte :: Addr a => a -> H [OperandType]
typeByte a = do
  b <- rb a
  return $ map (opType . bits b) [[7,6], [5,4], [3,2], [1,0]]



