{-# LANGUAGE TypeSynonymInstances, GeneralizedNewtypeDeriving, ExistentialQuantification #-}

module Hork.Types where

import Data.List
import Data.Array.IO

import Data.Word

import Control.Monad
import Control.Monad.State


-- addresses 
newtype ByteAddr = BA Word16
newtype WordAddr = WA Word16
newtype PackedAddr = PA Word16

class Addr a where
  ix :: a -> Int

instance Addr ByteAddr where
  ix (BA a) = fi a

instance Addr WordAddr where
  ix (WA a) = 2 * fi a

instance Addr PackedAddr where
  ix (PA a) = 4 * fi a

type Memory = IOUArray Word Word8
type Locals = IOUArray Word Word16

-- monads

data CallState = CallState {
    csStack :: [Word16],
    csLocals :: Locals,
    cspc :: Word
}


data HorkState = HorkState {
    memory :: Memory,
    stack :: [Word16],
    locals :: Locals,
    returnStack :: [CallState],
    pc :: Word
}


newtype H a = H (StateT HorkState IO a)
  deriving (Monad, MonadIO, MonadState HorkState, Functor)


-- and some helper functions
fi :: forall a b . (Integral a, Num b) => a -> b
fi = fromIntegral

