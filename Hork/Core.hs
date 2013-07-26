{-# LANGUAGE GeneralizedNewtypeDeriving, BangPatterns, TemplateHaskell #-}
module Hork.Core (
  RoutineState(..),
  HorkState(..),
  Quit(..),
  Hork(..),
  runHork,
  debug, die,
  rb, wb, rw, ww,
  pcBump,
  pcBumpBy,
  pcGet, pcGetWord,
  push, pop,
  getLocal, setLocal,
  getGlobal, setGlobal,
  getVar, setVar,
  getArg,

  locals, oldPC, oldStack,
  mem, stack, pc, routines, storyFile,

  module Hork.Mem,
  module Hork.Header,
  module Control.Monad,
  module Control.Monad.State.Strict,
  module Control.Monad.Writer.Strict,
  module Control.Monad.Error,
  module Control.Applicative,

  module Data.Bits,
  module Data.Word,
  module Data.Int,
  module Data.List,
  module Data.Array.IO,
  module Data.Array.MArray,

  module Control.Lens,
  module Data.Bits.Lens,
  module Data.List.Lens
) where


import Hork.Mem
import Hork.Header

import Control.Monad
import Control.Monad.State.Strict
import Control.Monad.Writer.Strict
import Control.Monad.Error
import Control.Applicative

import Data.Bits
import Data.Word
import Data.Int
import Data.List
import Data.Array.IO hiding (index)
import Data.Array.MArray hiding (index)

import Control.Lens
import Data.Bits.Lens
import Data.List.Lens

-- A stack of these is maintained in the main state, it holds the information necessary to
-- return from a routine call.
data RoutineState = RoutineState {
  _locals    :: ![Word16],
  _oldPC     :: !RA,
  _oldStack  :: ![Word16]
}
makeLenses ''RoutineState

-- Main state monad
data HorkState = HorkState {
  _mem       :: !Mem,
  _stack     :: ![Word16],
  _pc        :: !RA,
  _routines  :: ![RoutineState],
  _storyFile :: !FilePath
}
makeLenses ''HorkState


data Quit = Restart | Exit | Die String
  deriving (Show)

instance Error Quit where
  noMsg = Exit
  strMsg = Die

die :: String -> Hork a
die = throwError . Die

newtype Hork a = Hork (ErrorT Quit (StateT HorkState (WriterT [String] IO)) a)
  deriving (Functor, Applicative, Monad, MonadState HorkState, MonadWriter [String], MonadIO, MonadError Quit)


runHork :: HorkState -> Hork a -> IO (Either Quit a)
runHork st (Hork f) = do
  let mError = runErrorT f
      mState = runStateT mError st
      mWriter = runWriterT mState
  fst . fst <$> mWriter


-- Helper functions
debug :: String -> String -> Hork ()
debug loc msg = tell $ [loc ++ ":\t" ++ msg]


-- Specialized memory handlers
rb :: Addr a => a -> Hork Word8
rb a = do
  m <- use mem
  liftIO $ rb_ m (ra a)

wb :: Addr a => a -> Word8 -> Hork ()
wb a v = do
  m <- use mem
  liftIO $ wb_ m (ra a) v

rw :: Addr a => a -> Hork Word16
rw a = do
  m <- use mem
  liftIO $ rw_ m (ra a)

ww :: Addr a => a -> Word16 -> Hork ()
ww a v = do
  m <- use mem
  liftIO $ ww_ m (ra a) v


-- other helpers
pcBumpBy :: Int16 -> Hork ()
pcBumpBy delta | delta < 0 = pc -= ra (BA (fromIntegral (abs delta)))
               | otherwise = pc += ra (BA (fromIntegral delta))

pcBump :: Hork ()
pcBump = pcBumpBy 1

pcGet :: Hork Word8
pcGet = do
  a <- use pc
  b <- rb a
  pcBump
  return b

pcGetWord :: Hork Word16
pcGetWord = do
  a <- use pc
  w <- rw a
  pcBumpBy 2
  return w


-- variables

-- use cases for variables:
-- * store instructions
-- * arguments (by value)
-- * "by name" tweaks like inc and dec
-- locals and the stack can be handled with lenses, globals can't.

getLocal :: Word8 -> Hork Word16
getLocal var = use $ singular $ routines . _head . locals . element (fromIntegral (var-1))

setLocal :: Word8 -> Word16 -> Hork ()
setLocal var val = routines . _head . locals . element (fromIntegral (var-1)) .= val

push :: Word16 -> Hork ()
push val = stack %= (val:)

pop :: Hork Word16
pop = stack %%= (\(x:xs) -> (x, xs))


getGlobal :: Word8 -> Hork Word16
getGlobal var = do
  let var' = fromIntegral var - 16
  table <- ra . BA <$> rw hdrGLOBALS
  rw $ table + 2*var'

setGlobal :: Word8 -> Word16 -> Hork ()
setGlobal var val = do
  let var' = fromIntegral var - 16
  table <- ra . BA <$> rw hdrGLOBALS
  ww (table + 2*var') val


getVar :: Word8 -> Hork Word16
getVar 0 = pop
getVar n | n < 16    = getLocal n
         | otherwise = getGlobal n

setVar :: Word8 -> Word16 -> Hork ()
setVar 0 val = push val
setVar n val | n < 16    = setLocal n val
             | otherwise = setGlobal n val


getArg :: Word8 -> Hork Word16
getArg 0 = pcGetWord
getArg 1 = fromIntegral <$> pcGet
getArg 2 = pcGet >>= getVar


