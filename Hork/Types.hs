{-# LANGUAGE TypeSynonymInstances, GeneralizedNewtypeDeriving, ExistentialQuantification #-}

module Hork.Types where

import Data.List
import Data.Array
import Data.Array.IO

import Data.Word
import Data.Bits

import qualified Data.Map as M

import Control.Monad
import Control.Monad.State

import Numeric (showHex)

import System.IO.Unsafe


-- addresses
newtype ByteAddr = BA Word16 deriving (Eq, Ord, Num, Integral, Real, Enum, Show, Bits)
newtype WordAddr = WA Word16 deriving (Eq, Ord, Num, Integral, Real, Enum, Show, Bits)
--newtype PackedAddr = PA Word16 deriving (Eq, Ord, Num, Integral, Real, Enum, Show, Bits)
newtype RawAddr = RA Word deriving (Eq, Ord, Num, Integral, Real, Enum, Show, Bits)

-- given the version and a packed address, returns a RawAddr pointing to the same location.
pa :: Word8 -> Word16 -> RawAddr
pa v a | v <= 3 = RA $ 2 * fi a
       | v <= 5 = RA $ 4 * fi a
       | otherwise = error $ "Unsupported version: " ++ show v

class (Num a, Bits a) => Addr a where
  ix :: a -> Word

instance Addr ByteAddr where
  ix (BA a) = fi a

instance Addr WordAddr where
  ix (WA a) = 2 * fi a

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

instance Show CallState where
  show (CallState st ls (RA pc) ret) = "  stack: [" ++ intercalate ", " (map (flip showHex []) st) ++ "]\n"
                                    ++ "  locals: [" ++ intercalate ", " (map (flip showHex []) (unsafePerformIO $ getElems ls)) ++ "]\n"
                                    ++ "  pc: " ++ showHex pc [] ++ "\n"
                                    ++ "  return: " ++ show (fmap (flip showHex []) ret)


data HorkState = HorkState {
    memory :: Memory,
    stack :: [Word16],
    locals :: Locals,
    returnStack :: [CallState],
    pc :: RawAddr,
    dictionary :: Maybe Dictionary
}


newtype H a = H (StateT HorkState IO a)
  deriving (Monad, MonadIO, MonadState HorkState, Functor)

runH (H a) s = runStateT a s


-- opcode data
data OperandCount = VAR | OP2 | OP1 | OP0 | EXT
  deriving (Eq, Ord, Show)
data OperandType = TLarge | TSmall | TVar | TNone
  deriving (Eq)
data Operand = Large Word16 | Small Word8
  deriving (Show)


type Dictionary = M.Map [Word16] ByteAddr

-- and some helper functions
fi :: forall a b . (Integral a, Num b) => a -> b
fi = fromIntegral

