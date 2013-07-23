module Hork.String where

import Hork.Core

import Data.Char (ord,chr)


-- Approach: pull the string of characters out of memory, then munge it.

rawStrZ :: Addr a => a -> Hork [Word16]
rawStrZ a = do
  word <- rw a
  let done = word ^. bitAt 15
      top    = (word `shiftR` 10) .&. 31
      middle = (word `shiftR`  5) .&. 31
      bottom = word .&. 31
  rest <- case done of
    True  -> return []
    False -> rawStrZ (ra a + 2)
  return $ [top, middle, bottom] ++ rest


-- Extracts the various structures from the strings.
mungeStrZ :: [Word16] -> Hork [Word8]
-- 0 is a space
mungeStrZ (0 : rest) = (32 :) <$> mungeStrZ rest
-- literal character: A2 6
mungeStrZ (5 : 6 : hi : lo : rest) = (fromIntegral ((hi `shiftL` 5) .|. lo) :) <$> mungeStrZ rest

-- A couple empty cases for incomplete multi-character constructions
mungeStrZ (5 : 6 : hi : []) = return []
mungeStrZ (5 : 6 : []) = return []
mungeStrZ (1 : []) = return []
mungeStrZ (2 : []) = return []
mungeStrZ (3 : []) = return []

mungeStrZ (1 : c : rest) = (++) <$> abbreviation 0 c <*> mungeStrZ rest
mungeStrZ (2 : c : rest) = (++) <$> abbreviation 1 c <*> mungeStrZ rest
mungeStrZ (3 : c : rest) = (++) <$> abbreviation 2 c <*> mungeStrZ rest

mungeStrZ (4 : c : rest) = charMunge (+91) c rest
mungeStrZ (5 : c : rest) = charMunge a2 c rest
mungeStrZ (4 : []) = return []
mungeStrZ (5 : []) = return []

mungeStrZ (c : rest) = charMunge (+59) c rest
mungeStrZ [] = return []


-- table function, character, rest
charMunge :: (Word16 -> Word16) -> Word16 -> [Word16] -> Hork [Word8]
charMunge f c rest | c >= 6 = (fromIntegral (f c) :) <$> mungeStrZ rest
                   | otherwise = mungeStrZ (c:rest)

-- Maps characters for A2.
a2 :: Word16 -> Word16
a2 n = head $ genericDrop (n-6) (map (fromIntegral . ord) "\n0123456789.,!?_#'\"/\\-:()")


-- Returns the [Word8] from strZ for the given abbreviation: table (0-2) and number.
abbreviation :: Word16 -> Word16 -> Hork [Word8]
abbreviation table number = do
  abbrevs <- ra . BA <$> rw hdrABBREVIATIONS
  let entry = abbrevs + 2 * (32 * ra (BA table) + ra (BA number))
  aStr <- WA <$> rw entry
  strZ aStr

-- Returns the decoded string, as well as the number of WORDS long the string is.
strLenZ :: Addr a => a -> Hork ([Word8], Int)
strLenZ a = do
  str <- rawStrZ a
  str' <- mungeStrZ str
  return (str', length str)

strZ :: Addr a => a -> Hork [Word8]
strZ = fmap fst . strLenZ

printZ :: Addr a => a -> Hork ()
printZ = liftIO . putStr . map (chr . fromIntegral) <=< strZ

-- START HERE: This is untested. This may be Haskell, but there's a lot of complex
-- business logic here; it bears testing. Load Zork and print some strings from it.
