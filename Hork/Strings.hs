
module Hork.Strings where

import Hork.Config
import Hork.Memory
import Hork.Util
import Hork.Types

import qualified Data.Map as M
import Data.Word
import Data.Maybe
import Data.Bits
import Data.Char

import Control.Monad
import Control.Applicative


-- turns a Z-encoded string into a [Word8]
-- note that the returned values are NOT ZSCII values, but are the literal values from the encoded string
unpack :: Addr a => a -> H [Word8]
unpack a = do
  c <- rw a
  rest <- if testBit a 15
            then return []
            else unpack $ a+2 -- recurse
  let x = bits c [10..14]
      y = bits c [5..9]
      z = bits c [0..4]
  return $ fi x : fi y : fi z : rest


-- converts the raw, unpacked string into a list of ZSCII values
-- includes abbreviation expansion
unpackedToZSCII :: [Word8] -> H [Word8]
unpackedToZSCII cs = go cs 0 Nothing -- chars, alphabet, Maybe abbreviation set to use
  where go :: [Word8] -> Word16 -> Maybe Word8 -> H [Word8]
        go [] _ _ = return []
        go (0:cs) a Nothing = (32:) <$> go cs 0 Nothing
        go (4:cs) _ Nothing = go cs 1 Nothing
        go (5:cs) _ Nothing = go cs 2 Nothing
        go (6:cs) 2 Nothing = case cs of
                                (x:y:cs') -> ((shiftL x 5 .|. y) :) <$> go cs' 0 Nothing
                                _ -> return []
        go (c:cs) a Nothing | c <= 3 = go cs 0 (Just c) -- abbreviation, 1, 2, or 3
                            | otherwise = do
                              let c' = fromJust (M.lookup (a*100 + fi c) alphaTable)
                              (c':) <$> go cs 0 Nothing
        go (c:cs) _ (Just a) = do
          table <- BA <$> configWord "abbreviations"
          let index = 32*(a-1) + c
          strAddr <- WA <$> rw (table + 2 * fi index)
          unpacked <- unpack strAddr
          zscii <- unpackedToZSCII unpacked
          rest <- go cs 0 Nothing
          return $ zscii ++ rest



z2a :: Word8 -> Char
z2a 13 = '\n'
z2a x = chr . fi $ x


fromZSCII :: Addr a => a -> H String
fromZSCII a = do
  unpacked <- unpack a
  zscii <- unpackedToZSCII unpacked
  return $ map z2a zscii


alphaTable :: M.Map Word16 Word8
alphaTable = M.fromList $ zip [6..31]    (map (fi . ord) ['a'..'z'])
                       ++ zip [106..131] (map (fi . ord) ['A'..'Z'])
                       ++ zip [207..231] (map (fi . ord) (['\n'] ++ ['0'..'9'] 
                                       ++ ['.',',','!','?','_','#','\'','"','/']
                                       ++ ['\\','-',':','(',')']))


