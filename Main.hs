module Main where

import Hork
import Hork.JavaScript.Console
import Hork.JavaScript.StoryFile

import System.IO
import System.Environment (getArgs)

main = do
  (iMV, rMV) <- prepareTerminal
  putStrLn "Preparing story file"
  story <- openStoryFile
  putStrLn "Launching"
  restart iMV rMV story

