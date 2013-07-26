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

-- Address of the main table
objTable :: Hork RA
objTable = (+62) . ra . BA <$> rw hdrOBJTABLE

objEntrySize :: Word32
objEntrySize = 9 -- v3-specific

-- Address of an entry, given the number.
objEntry :: Word16 -> Hork RA
objEntry num = do
  t <- objTable
  return $ (fromIntegral num - 1) * objEntrySize + t


-- v3-specific
objParent, objSibling, objChild :: Word16 -> Hork RA
objParent = entryOffset 4
objSibling = entryOffset 5
objChild = entryOffset 6


entryOffset :: Word32 -> Word16 -> Hork RA
entryOffset offset num = do
  obj <- objEntry num
  fromIntegral <$> rb (obj + offset)

-- Address of the
objPropTableAddr :: Word16 -> Hork RA
objPropTableAddr num = do
  obj <- objEntry num
  ra . BA <$> rw (obj + 7)


-- object number to Z-string
objShortNameAddr :: Word16 -> Hork RA
objShortNameAddr num = (+1) <$> objPropTableAddr num

objShortName :: Word16 -> Hork [Word8]
objShortName num = objShortNameAddr num >>= strZ

objPrintShortName :: Word16 -> Hork ()
objPrintShortName num = objShortNameAddr num >>= printZ


-- Address of the given property entry's size byte.
objPropAddr :: Word16 -> Word16 -> Hork RA
objPropAddr num prop = do
  table <- objPropTableAddr num
  -- iteratively search for the property
  propSeek table
 where propSeek a = do
          sizebyte <- rb a
          let propnum = sizebyte .&. 31
              propsize = (sizebyte `shiftR` 5) + 1
          case () of () | propnum < fromIntegral prop  -> return 0
                        | propnum == fromIntegral prop -> return a
                        | otherwise -> propSeek (a + fromIntegral propsize + 1)


-- Returns the value of a property, or the default value.
objPropValue :: Word16 -> Word16 -> Hork Word16
objPropValue num prop = do
  a <- objPropAddr num prop
  case a of
    0 -> do
      def <- propDefaults
      rw $ ra . BA $ fromIntegral def + 2 * (prop-1)
    _ -> do
      sizebyte <- rb a
      let size = (sizebyte `shiftR` 5) + 1
      case size of
        1 -> fromIntegral <$> rb (a+1)
        2 -> rw (a+1)
        _ -> return 0

objPropLen :: Word16 -> Word16 -> Hork Word16
objPropLen num prop = objPropAddr num prop >>= objPropLenFromAddr

objPropLenFromAddr :: RA -> Hork Word16
objPropLenFromAddr a = do
  when (a==0) $ die "Illegal operation: Tried to get_prop_len of a property an object does not have"
  byte <- rb a
  return . fromIntegral $ (byte `shiftR` 5) + 1



-- Removes an object from the tree, so it has parent 0. It keeps its children.
-- v3-specific: using bytes, not words, for the relative pointers
objRemove :: Word16 -> Hork ()
objRemove me = do
  parentAddr <- objParent me
  parent <- fromIntegral <$> rb parentAddr
  wb parentAddr 0
  -- go through the sibling chain
  child <- fromIntegral <$> (rb =<< objChild parent)
  if child == me
    then do
      a <- objChild parent
      mySiblingAddr <- objSibling me
      s <- rb mySiblingAddr
      wb mySiblingAddr 0
      wb a s -- write the number of my sibling into my parent's child
    else do
      sibling <- findMe child
      a <- objSibling sibling
      mySiblingAddr <- objSibling me
      nextSibling <- rb mySiblingAddr
      wb a nextSibling
      wb mySiblingAddr 0

 where findMe o = do
          s <- fromIntegral <$> (rb =<< objSibling o)
          if s == me
            then return o
            else findMe s

