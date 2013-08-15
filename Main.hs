module Main where

import Hork
import System.IO
import System.Environment (getArgs)

main = do
  hSetBuffering stdout NoBuffering
  [file] <- getArgs
  restart file

