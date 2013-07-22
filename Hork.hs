{-# LANGUAGE GeneralizedNewtypeDeriving, NoMonomorphismRestriction, BangPatterns, TemplateHaskell, OverloadedStrings #-}
module Main where

import Hork.Mem

import Control.Monad
import Control.Monad.State.Strict
import Control.Monad.Writer.Strict

import Data.Bits
import Data.Word
import Data.Int

import Control.Lens
import Data.Bits.Lens



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
  _routines  :: ![RoutineState]
}
makeLenses ''HorkState


newtype Hork a = Hork (StateT HorkState (WriterT [String] IO) a)
  deriving (Functor, Monad, MonadState HorkState, MonadWriter [String], MonadIO)

-- Helper functions
log :: String -> String -> Hork ()
log loc msg = tell $ [loc ++ ":\t" ++ msg]


-- Specialized memory handlers
rb :: RA -> Hork Word8
rb a = do
  m <- use mem
  liftIO $ rb_ m a

wb :: RA -> Word8 -> Hork ()
wb a v = do
  m <- use mem
  liftIO $ wb_ m a v

rw :: RA -> Hork Word16
rw a = do
  m <- use mem
  liftIO $ rw_ m a

ww :: RA -> Word16 -> Hork ()
ww a v = do
  m <- use mem
  liftIO $ ww_ m a v



main = undefined

