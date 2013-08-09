module Hork.Objects where

import Hork.Core
import Hork.String


-- Structure of the object table:
-- property defaults table (31 words <= v3, 63 >= v4)
-- object tree, consecutively from 1 upwards. No object 0.
--   - entries are 9 bytes <= v3, 14 bytes >= v4
--
-- Entries:
-- - 4 bytes for 32 attribute flags
-- - 3 bytes: parent, sibling, child
-- - properties table pointer
--
-- Properties section:
-- - text-length byte - number of WORDS of text
-- - property blocks:
--   - size byte
--   - property data - 1-8 bytes
-- The properties are stored in descending order, terminated by a size byte of 0.


-- Address of the defaults table.
propDefaults :: Hork RA
propDefaults = ra . BA <$> rw hdrOBJTABLE

-- Address of the main table. Defaults table is 31 words <= v3, 63 words > v3
objTable :: Hork RA
objTable = do
  v <- byVersion (+62) (+126)
  v . ra . BA <$> rw hdrOBJTABLE

objEntrySize :: Hork Word32
objEntrySize = byVersion 9 14

-- Address of an entry, given the number.
objEntry :: Word16 -> Hork RA
objEntry num = do
  t <- objTable
  s <- objEntrySize
  return $ (fromIntegral num - 1) * s + t


-- Return the ADDRESS of the relation cell
objParent, objSibling, objChild :: Word16 -> Hork RA
objParent  = doVersion (entryOffset 4) (entryOffset 6)
objSibling = doVersion (entryOffset 5) (entryOffset 8)
objChild   = doVersion (entryOffset 6) (entryOffset 10)

-- Reads the number of a relative, converting if necessary.
relativeRead :: RA -> Hork Word16
relativeRead = doVersion (fmap fromIntegral . rb) rw

-- Writes the number of a relative, converting if necessary.
relativeWrite :: RA -> Word16 -> Hork ()
relativeWrite a v = byVersion (\a v -> wb a (fromIntegral v)) ww >>= \f -> f a v


entryOffset :: Word32 -> Word16 -> Hork RA
entryOffset offset num = do
  obj <- objEntry num
  return (obj + offset)

-- Address of the length byte for the object's short name, at the beginning of its property table.
objPropTableAddr :: Word16 -> Hork RA
objPropTableAddr num = do
  obj <- objEntry num
  offset <- byVersion 7 12
  ra . BA <$> rw (obj + offset)

-- Address of the size byte of the given object's first property.
objFirstProp :: Word16 -> Hork RA
objFirstProp num = do
  table <- objPropTableAddr num
  nameLen <- ra . BA . fromIntegral <$> rb table
  return $ table + 2*nameLen + 1

-- object number to Z-string
objShortNameAddr :: Word16 -> Hork RA
objShortNameAddr num = (+1) <$> objPropTableAddr num

objShortName :: Word16 -> Hork [Word8]
objShortName num = objShortNameAddr num >>= strZ

objPrintShortName :: Word16 -> Hork ()
objPrintShortName num = objShortNameAddr num >>= printZ


-- Address of the given property entry's size byte, and the size of the property.
objPropAddr :: Word16 -> Word16 -> Hork RA
objPropAddr num prop = do
  table <- objFirstProp num
  -- iteratively search for the property
  (a, _, _, _) <- propSeek table prop
  return a


-- Given a property's (first) size byte's address, returns the address, number, length and sizelength of the next property.
-- Returns (0, 0, undefined, undefined) if the object has no more properties.
propSeek :: RA -> Word16 -> Hork (RA, Word16, Word8, Word8)
propSeek a prop = do
  (propnum, propsize, sizelen) <- propInfo a
  case () of () | propnum < fromIntegral prop  -> return (0, 0, undefined, undefined)
                | propnum == fromIntegral prop -> return (a, fromIntegral propnum, propsize, sizelen)
                | otherwise -> propSeek (a + fromIntegral propsize + fromIntegral sizelen) prop

-- Given a property's (first) size byte's address, returns the address, number, length and sizelength of this property.
-- Returns (0, 0, undefined, undefined) if the object has no more properties.
propInfo :: RA -> Hork (Word16, Word8, Word8)
propInfo a = do
  sizebyte <- rb a
  v <- byVersion 3 5
  case v of
    3 -> return (fromIntegral $ sizebyte .&. 31, (sizebyte `shiftR` 5) + 1, 1)
    5 -> do
      case sizebyte ^. bitAt 7 of
        True -> do -- bit set, two size-and-number bytes
          let propnum = sizebyte .&. 63 -- bits 0 to 5
          byte2 <- rb (a+1)
          let propsize_ = byte2 .&. 63 -- bits 0 to 5
              propsize = if propsize_ > 0 then propsize_ else 64
          return (fromIntegral propnum, propsize, 2)
        False -> do -- bit clear, one size-and-number byte
          let propnum = sizebyte .&. 63
              propsize = if sizebyte ^. bitAt 6 then 2 else 1
          return (fromIntegral propnum, propsize, 1)

objNextProp :: Word16 -> Word16 -> Hork Word16
objNextProp obj prop = do
  a <- objPropAddr obj prop
  (_, size, sizelen) <- propInfo a
  (num, _, _) <- propInfo $ a + fromIntegral size + fromIntegral sizelen
  return num


-- Returns the value of a property, or the default value.
objPropValue :: Word16 -> Word16 -> Hork Word16
objPropValue num prop = do
  a <- objPropAddr num prop
  case a of
    0 -> do
      def <- propDefaults
      rw $ ra . BA $ fromIntegral def + 2 * (prop-1)
    _ -> do
      (_, size, sizelen) <- propInfo a
      case size of
        1 -> fromIntegral <$> rb (a + fromIntegral sizelen)
        2 -> rw (a + fromIntegral sizelen)
        _ -> return 0

objPropLen :: Word16 -> Word16 -> Hork Word16
objPropLen num prop = objPropAddr num prop >>= objPropLenFromAddr

objPropLenFromAddr :: RA -> Hork Word16
objPropLenFromAddr a = do
  when (a==0) $ die "Illegal operation: Tried to get_prop_len of a property an object does not have"
  (_, size, _) <- propInfo a
  return (fromIntegral size)



-- op_VAR_put_prop [obj, prop, val] = objPutProp obj prop val
objPutProp :: Word16 -> Word16 -> Word16 -> Hork ()
objPutProp obj prop val = do
  a <- objPropAddr obj prop
  e <- objEntry obj
  (_, size, sizelen) <- propInfo a
  case size of
    1 -> wb (a + fromIntegral sizelen) (fromIntegral val)
    2 -> ww (a + fromIntegral sizelen) val
    _ -> die "Illegal operation: Tried to put_prop for a property whose length is more than 2"


-- Removes an object from the tree, so it has parent 0. It keeps its children.
-- v3-specific: using bytes, not words, for the relative pointers
objRemove :: Word16 -> Hork ()
objRemove me = do
  parentAddr <- objParent me
  parent <- relativeRead parentAddr
  relativeWrite parentAddr 0
  -- go through the sibling chain
  child <- relativeRead =<< objChild parent
  if child == me
    then do
      a <- objChild parent
      mySiblingAddr <- objSibling me
      s <- relativeRead mySiblingAddr
      relativeWrite mySiblingAddr 0
      relativeWrite a s -- write the number of my sibling into my parent's child
    else do
      sibling <- findMe child
      a <- objSibling sibling
      mySiblingAddr <- objSibling me
      nextSibling <- relativeRead mySiblingAddr
      relativeWrite a nextSibling
      relativeWrite mySiblingAddr 0

 where findMe o = do
          s <- relativeRead =<< objSibling o
          if s == me
            then return o
            else findMe s


-- v3-specific, bytes for relatives
objInsert :: Word16 -> Word16 -> Hork ()
objInsert obj dest = do
  parentAddr <- objParent obj
  p <- relativeRead parentAddr
  when (p /= 0) $ objRemove obj

  -- Get the child of dest, and write obj into that slot.
  childAddr <- objChild dest
  c <- relativeRead childAddr
  relativeWrite childAddr obj

  -- finally, write dest's original child into obj's sibling slot
  siblingAddr <- objSibling obj
  relativeWrite siblingAddr c


-- attrs

-- Given: modifier function, object number, attr number, returns the new value
handleAttr :: (Bool -> Bool) -> Word16 -> Word16 -> Hork Bool
handleAttr f obj attr = do
  a <- entryOffset (fromIntegral attr `shiftR` 8) obj
  b <- rb a
  let bit = fromIntegral $ 7 - (attr .&. 7)
      val = b ^. bitAt bit
      val' = f val
      b' = b & bitAt bit .~ val'
  wb a b'
  return val'

testAttr :: Word16 -> Word16 -> Hork Bool
testAttr = handleAttr id

setAttr :: Word16 -> Word16 -> Hork ()
setAttr obj attr = handleAttr (const True) obj attr >> return ()

clearAttr :: Word16 -> Word16 -> Hork ()
clearAttr obj attr = handleAttr (const False) obj attr >> return ()

