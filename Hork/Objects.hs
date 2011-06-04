
module Hork.Objects where

import Hork.Config
import Hork.Memory
import Hork.Types
import Hork.Util

import Control.Monad
import Control.Monad.State
import Control.Applicative

import Data.Bits
import Data.Word

type ObjNum = Word16

version :: H Word8
version = configByte "version"

getObj :: ObjNum -> H RawAddr
getObj n = do
  t <- RA . fi <$> configWord "objects" -- byte address
  v <- version
  let table = if v <= 3 then t + 62 else t + 126
      size  = if v <= 3 then 9 else 14
  return $ table + fi ((n-1)*size)


-- assumes the attr number is sane
objClearAttr :: ObjNum -> Word16 -> H ()
objClearAttr n attr = do
  obj <- getObj n
  let byte = RA . fi $ attr `div` 8
      bit_ = 7 - fi (attr `mod` 8) -- they're numbered the other way around
  b <- rb $ obj+byte
  wb (obj+byte) $ b .&. (complement $ bit bit_)

-- assumes the attr number is sane
objSetAttr :: ObjNum -> Word16 -> H ()
objSetAttr n attr = do
  obj <- getObj n
  let byte = RA . fi $ attr `div` 8
      bit_ = 7 - fi (attr `mod` 8) -- they're numbered the other way around
  b <- rb $ obj+byte
  wb (obj+byte) $ b .|. bit bit_

objTestAttr :: ObjNum -> Word16 -> H Bool
objTestAttr n attr = do
  obj <- getObj n
  let byte = RA . fi $ attr `div` 8
      mask = bit $ 7 - fi (attr `mod` 8)
  b <- rb $ obj+byte
  return $ (b .&. mask) /= 0


-- object tree functions

-- takes the offsets of the neighbour field in v1-3 and v4+, and the object number
-- returns the number of the neighbouring object (0 for none)
objGetNeighbour :: (RawAddr, RawAddr) -> ObjNum -> H ObjNum
objGetNeighbour (old,new) n = do
  obj <- getObj n
  v <- version
  if v <= 3
    then fi <$> rb (obj + old)
    else rw $ obj + new

objGetChild, objGetParent, objGetSibling :: ObjNum -> H ObjNum
objGetParent  = objGetNeighbour (4, 6)
objGetSibling = objGetNeighbour (5, 8)
objGetChild   = objGetNeighbour (6,10)



-- properties

objPropTable :: ObjNum -> H RawAddr
objPropTable n = do
  obj <- getObj n
  v <- version
  let offset = if v <= 3 then 7 else 12
  aShortName <- BA <$> rw (obj + offset)
  lenShortName <- rb aShortName
  return . RA . fi $ aShortName + 1 + (2 * fi lenShortName)


-- returns the address of the (first) size byte of the given property, or 0 if the 
-- property doesn't exist for the object
objPropAddr :: ObjNum -> Word8 -> H RawAddr
objPropAddr n prop = do
  table <- objPropTable n
  prop_ table prop
 where prop_ :: RawAddr -> Word8 -> H RawAddr
       prop_ a n = do
         n2 <- propNumber a
         case compare n n2 of
           EQ -> return a
           GT -> return 0 -- not found
           LT -> do
             a' <- propNext a
             if a' == 0
               then return 0
               else prop_ a' n


-- takes the address of a property entry, returns its number
propNumber :: RawAddr -> H Word8
propNumber p = do
  v <- version
  if v <= 3
    then (.&. 0x1f) <$> rb p -- lower 5 bytes is the number
    else (.&. 0x3f) <$> rb p -- lower 6 bytes hold the number

-- takes the address of a property entry, retuns its size in bytes
propSize :: RawAddr -> H Word8
propSize p = do
  v <- version
  if v <= 3
    then (+1) . flip bits [5,6,7] <$> rb p
    else do
      b <- rb p
      if testBit b 7
        then do
          s <- (.&. 0x3f) <$> rb (p+1)
          return $ if s == 0 then 64 else s
        else return $ if testBit b 6 then 2 else 1

-- returns the address of the next property after the given one
propNext :: RawAddr -> H RawAddr
propNext prop = do
  n <- propNumber prop
  if n == 0
    then return 0
    else do
      s <- propSize prop
      return $ prop + fi s

