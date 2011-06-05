{-# LANGUAGE BangPatterns #-}

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
import Data.List
import Data.List.Split

import Control.Monad
import Control.Applicative
import Control.Monad.Trans

import System.IO


-- helper function for actually outputting things
-- may be replaced later, so it's already factored out
output :: String -> H ()
output = liftIO . putStr


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

a2z :: Char -> Word8
a2z '\n' = 13
a2z x = fi . ord $ x


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

-- returns the length of the string in bytes
strLenBytes :: Addr a => a -> H Word16
strLenBytes a = strLenBytes' a 0
  where strLenBytes' a !len = do
          w <- rw a
          if testBit w 15
            then return $ len+2
            else strLenBytes' (a+2) (len+2)


-- version, ZSCII characters (should be lowercased)
encodeForDict :: Word8 -> [Word8] -> [Word16]
encodeForDict v cs = ws'
  where cs' = concatMap encode cs
        truncated = take (if v <= 3 then 6 else 9) $ cs' ++ repeat 5
        pack [x,y,z] = (0::Word16) .|. shiftL (fi x) 10 .|. shiftL (fi y) 5 .|. fi z
        chunks = chunk 3 truncated
        ws = map pack chunks
        ws' = reverse . (\(x:xs) -> (bit 15 .|. x) : xs) . reverse $ ws -- add the end bit



-- turns a ZSCII value into a list of Z-encoded values representing it
encode :: Word8 -> [Word8]
encode c = case M.lookup c encodeTable of
             Just x  -> x
             Nothing -> [5, 6, shiftR c 5, 0x1f .&. c] -- not present, use a literal

encodeTable :: M.Map Word8 [Word8]
encodeTable = M.fromList $ zip [0x61..0x7a] (map (:[]) [6..31]) -- lowercase
                        ++ zip [0x41..0x5a] (map (\x -> [4,x]) [6..31]) -- uppercase
                        ++ zip [0x30..0x39] (map (\x -> [5,x]) [8..]) -- digits
                        ++ [(0x10, [5,0x7])  -- newline
                           ,(0x20, [0])      -- space
                           ,(0x2e, [5,0x12]) -- period
                           ,(0x2c, [5,0x13]) -- comma
                           ,(0x21, [5,0x14]) -- exclamation point
                           ,(0x3f, [5,0x15]) -- question mark
                           ,(0x5f, [5,0x16]) -- underscore
                           ,(0x23, [5,0x17]) -- hash mark
                           ,(0x27, [5,0x18]) -- single quote
                           ,(0x22, [5,0x19]) -- double quote
                           ,(0x2f, [5,0x1a]) -- forward slash
                           ,(0x5c, [5,0x1b]) -- backslash
                           ,(0x2d, [5,0x1c]) -- dash
                           ,(0x3a, [5,0x1d]) -- colon
                           ,(0x28, [5,0x1e]) -- left paren
                           ,(0x29, [5,0x1f]) -- right paren
                           ]


