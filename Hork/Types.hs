{-# LANGUAGE TypeSynonymInstances, GeneralizedNewtypeDeriving, ExistentialQuantification #-}

module Hork.Types where

import Data.List
import Data.Array.IO

import Data.Word

import Control.Monad
import Control.Monad.State


-- addresses 
newtype ByteAddr = BA Word16 deriving (Eq, Ord, Num, Integral, Real, Enum, Show)
newtype WordAddr = WA Word16 deriving (Eq, Ord, Num, Integral, Real, Enum, Show)
newtype PackedAddr = PA Word16 deriving (Eq, Ord, Num, Integral, Real, Enum, Show)
newtype RawAddr = RA Word deriving (Eq, Ord, Num, Integral, Real, Enum, Show)

class Num a => Addr a where
  ix :: a -> Word

instance Addr ByteAddr where
  ix (BA a) = fi a

instance Addr WordAddr where
  ix (WA a) = 2 * fi a

instance Addr PackedAddr where
  ix (PA a) = 4 * fi a

instance Addr RawAddr where
  ix (RA a) = a

type Memory = IOUArray Word  Word8
type Locals = IOUArray Word8 Word16

-- monads

data CallState = CallState {
    csStack :: [Word16],
    csLocals :: Locals,
    cspc :: RawAddr,
    csReturn :: Maybe Word8
}


data HorkState = HorkState {
    memory :: Memory,
    stack :: [Word16],
    locals :: Locals,
    returnStack :: [CallState],
    pc :: RawAddr
}


newtype H a = H (StateT HorkState IO a)
  deriving (Monad, MonadIO, MonadState HorkState, Functor)


-- opcode data
data OperandCount = VAR | OP2 | OP1 | OP0 | EXT
  deriving (Eq, Ord, Show)
data OperandType = TLarge | TSmall | TVar | TNone
  deriving (Eq)
data Operand = Large Word16 | Small Word8



-- and some helper functions
fi :: forall a b . (Integral a, Num b) => a -> b
fi = fromIntegral

