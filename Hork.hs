{-# LANGUAGE GeneralizedNewtypeDeriving, NoMonomorphismRestriction, BangPatterns, TemplateHaskell, OverloadedStrings #-}
module Main where

import Hork.Core
import Hork.String

import System.IO
import System.Environment (getArgs)

import Data.Binary.Strict.Get
import qualified Data.ByteString as B



-- startup flow:
-- 1) main reads the command line arguments and calls launch (IO)
-- 2) launch sets up the interpreter state, and calls restart (Hork)
-- 3) restart calls loadFile, then forever zinterp

zinterp :: Hork ()
zinterp = undefined


restart :: FilePath -> IO ()
restart file = do
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

  m <- newListArray (0, fromIntegral size - 1) bytes

  pc0 <- ra . BA <$> rw_ m hdrPC0

  let st = HorkState m [] pc0 [] file
  result <- runHork st $ forever zinterp
  case result of
    Left Restart   -> restart file
    Left (Die msg) -> putStrLn $ "Fatal error: " ++ msg
    _ -> return ()



main = do
  hSetBuffering stdout NoBuffering
  [file] <- getArgs
  restart file

