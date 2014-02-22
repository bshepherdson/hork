{-# LANGUAGE GeneralizedNewtypeDeriving, NoMonomorphismRestriction, BangPatterns, TemplateHaskell, OverloadedStrings #-}
module Hork where

import Hork.Core
import Hork.String
import Hork.Ops
import Hork.JavaScript.Console

import System.IO
import Control.Concurrent.MVar

import GHCJS.Types


debugging = False

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
  addr <- use pc
  opcode <- pcGet
  tell ["Op (0x" ++ showHex addr ++ "): " ++ showHex opcode]
  v <- use version
  case (opcode, opcode `shiftR` 6) of
    (190, _) | v >= 5 -> zinterpExtended
    (_, 3) -> zinterpVariable opcode
    (_, 2) -> zinterpShort opcode
    _ -> zinterpLong opcode


zinterpShort :: Word8 -> Hork ()
zinterpShort opcode = do
  let argtype = opcode `shiftR` 4 .&. 3
  tell ["short form", "arg type: " ++ show argtype]
  case argtype of
    3 -> zinterp0OP opcode
    a -> zinterp1OP opcode a


zinterpLong :: Word8 -> Hork ()
zinterpLong opcode = do
  let arg1 = 1 + (opcode `shiftR` 6 .&. 1)
      arg2 = 1 + (opcode `shiftR` 5 .&. 1)
  tell ["long form", show arg1, show arg2]
  zinterp2OP opcode arg1 arg2


zinterpVariable :: Word8 -> Hork ()
zinterpVariable opcode = do
  args <- varArgs opcode
  tell $ "variable form" : map show args
  case (opcode, opcode ^. bitAt 5) of
    (0xc1, _)  -> zinterpVAR (fromIntegral opcode) args -- VAR format je, special case
    (_, False) -> zinterp2OP opcode (head args) (head $ tail args)
    (_, True)  -> zinterpVAR (fromIntegral opcode) args

-- TODO: call_vs2 and call_vn2

-- Retrieves the args for variable- and extended-form instructions.
varArgs :: Word8 -> Hork [Word8]
varArgs opcode = do
  v <- use version
  let shortArgs b = takeWhile (< 3) $ map (\n -> b `shiftR` n .&. 3) [6, 4, 2, 0]
      longArgs    = do
        b1 <- pcGet
        b2 <- pcGet
        return $ shortArgs b1 ++ shortArgs b2
  case (v >= 4, v >= 5, opcode) of
    (True, _, 236) -> longArgs
    (_, True, 250) -> longArgs
    _ -> shortArgs <$> pcGet -- retrieve the type byte

zinterpExtended :: Hork ()
zinterpExtended = do
  opcode <- pcGet
  args <- varArgs 0 -- 0 here, not the real opcode, to avoid collision with the special cases
  zinterpVAR (0xbe00 + fromIntegral opcode) args


restart :: MVar JSString -> MVar (JSObject JSNumber) -> Mem -> IO ()
restart iMV rMV story = do
  putStrLn "Top of restart"
  m <- mapArray id story -- Copy the virgin story file to the live memory.
  pc0 <- ra . BA <$> rw_ m hdrPC0
  v <- rb_ m hdrVERSION
  putStrLn $ "Loaded version " ++ show v ++ " file, starting at " ++ showHex pc0
  let st = HorkState m [] pc0 [] m v iMV rMV (0,0)
  result <- runHork st $ do
    _ <- terminalDimensions -- force a resize before launching the app
    forever $ do
      (_, w) <- listen zinterp
      when debugging $ liftIO $ putStrLn $ show w
  case result of
    Left Restart   -> restart iMV rMV story
    Left (Die msg) -> cPutStrLn $ "Fatal error: " ++ msg
    _ -> return ()


{-
test :: Show a => Hork a -> IO ()
test f = do
  m <- loadFile "Zork1.z3"
  pc0 <- ra . BA <$> rw_ m hdrPC0
  let st = HorkState m [] pc0 [] "Zork1.z3" 3

  result <- runHork st f
  print result
-}

