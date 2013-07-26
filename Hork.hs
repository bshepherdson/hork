{-# LANGUAGE GeneralizedNewtypeDeriving, NoMonomorphismRestriction, BangPatterns, TemplateHaskell, OverloadedStrings #-}
module Main where

import Hork.Core
import Hork.String
import Hork.Ops

import System.IO
import System.Environment (getArgs)

import Data.Binary.Strict.Get
import qualified Data.ByteString as B



-- startup flow:
-- 1) main reads the command line arguments and calls launch (IO)
-- 2) launch sets up the interpreter state, and calls restart (Hork)
-- 3) restart calls loadFile, then forever zinterp


-- zinterp flow:
-- * Read the first byte of the opcode at PC.
-- * Determine the form of the opcode.
-- * Determine the types of the arguments.
-- * Read the arguments - in the right order!
-- * Execute the opcode handler (includes storing and branching if applicable)
-- * PC now points at the next opcode, wherever that is.
-- * DO NOT recurse; zinterp is called with `forever`.

zinterp :: Hork ()
zinterp = do
  -- determine the form
  opcode <- pcGet
  case opcode `shiftR` 6 of
    3 -> zinterpVariable opcode
    2 -> zinterpShort opcode
    _ -> zinterpLong opcode


zinterpShort :: Word8 -> Hork ()
zinterpShort opcode = do
  let argtype = opcode `shiftR` 4 .&. 3
  case argtype of
    3 -> zinterp0OP opcode
    a -> zinterp1OP opcode a


zinterpLong :: Word8 -> Hork ()
zinterpLong opcode = do
  let arg1 = 1 + (opcode `shiftR` 6 .&. 1)
      arg2 = 1 + (opcode `shiftR` 5 .&. 1)
  zinterp2OP opcode arg1 arg2


zinterpVariable :: Word8 -> Hork ()
zinterpVariable opcode = do
  typebyte <- pcGet
  let args = takeWhile (< 3) $ map (\n -> typebyte `shiftR` n .&. 3) [6, 4, 2, 0]
  -- TODO: Special handling for je VAR form
  case opcode ^. bitAt 5 of
    False -> zinterp2OP opcode (head args) (head $ tail args)
    True  -> zinterpVAR opcode args



loadFile :: FilePath -> IO (IOUArray RA Word8)
loadFile file = do
  -- read the file into a [Word8]
  h <- openFile file ReadMode
  size <- hFileSize h
  input <- B.hGetContents h
  let fileReader = do
        done <- isEmpty
        case done of
          True  -> return []
          False -> (:) <$> getWord8 <*> fileReader

  let bytes = case runGet fileReader input of
        (Left err, _) -> error $ "File loading error: " ++ err
        (Right bs, _) -> bs

  newListArray (0, fromIntegral size - 1) bytes


restart :: FilePath -> IO ()
restart file = do
  m <- loadFile file
  pc0 <- ra . BA <$> rw_ m hdrPC0

  let st = HorkState m [] pc0 [] file
  result <- runHork st $ forever zinterp
  case result of
    Left Restart   -> restart file
    Left (Die msg) -> putStrLn $ "Fatal error: " ++ msg
    _ -> return ()


test :: Show a => Hork a -> IO ()
test f = do
  m <- loadFile "Zork1.z3"
  pc0 <- ra . BA <$> rw_ m hdrPC0
  let st = HorkState m [] pc0 [] "Zork1.z3"

  result <- runHork st f
  print result

main = do
  hSetBuffering stdout NoBuffering
  [file] <- getArgs
  restart file

