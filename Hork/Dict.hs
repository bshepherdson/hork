
module Hork.Dict where

import Hork.Config
import Hork.Memory
import Hork.Strings
import Hork.Types
import Hork.Util

import Data.Word
import Data.List
import Data.List.Split

import qualified Data.Map as M

import Control.Monad
import Control.Applicative
import Control.Monad.State
import Control.Arrow ((&&&), (***))


data ParseWord = ParseWord {
    pwAddr :: ByteAddr,
    pwLen  :: Word8,
    pwPos  :: Word8
}

parse :: [Word8] -> H [ParseWord]
parse input = do
  seps <- wordSeparators
  --let chunks = parse seps input
  let chunks = filter (/= [32]) $ filter (not . null) $ split (oneOf (32:seps)) input
      indices = mapIndices input chunks
  v <- version
  let encoded = map (encodeForDict v) chunks
  dict <- getDict
  let dictAddrs = map (\x -> maybe 0 id (M.lookup x dict)) encoded
      parseWords = zipWith3 ParseWord dictAddrs (map genericLength chunks) indices
  return parseWords


-- takes the chunks and returns the list of their indices
mapIndices :: [Word8] -> [[Word8]] -> [Word8]
mapIndices input chunks = reverse . snd $ foldl' (
  \(i,is) c -> let i' = indexOf c input i in (i'+genericLength c, i':is)) (0,[]) chunks


-- finds the index of the first string in the second, starting at the index
-- error if not found
indexOf :: [Word8] -> [Word8] -> Word8 -> Word8
indexOf target source from = indexOf' target (genericDrop from source) from
  where indexOf' _ [] _ = error "can't happen: indexOf failed to find target"
        indexOf' t s index | t `isPrefixOf` s = index
                           | otherwise        = indexOf' t (tail s) (index+1)


dictHeader :: H RawAddr
dictHeader = RA . fi <$> configWord "dictionary"

dictTable :: H RawAddr
dictTable = do
  header <- dictHeader
  n <- rb header
  return $ header + 1 + fi n + 3

dictEntrySize :: H Word8
dictEntrySize = do
  header <- dictHeader
  n <- rb header
  rb $ header + 1 + fi n

dictEntryCount :: H Word16
dictEntryCount = do
  header <- dictHeader
  n <- rb header
  rw $ header + 2 + fi n

wordSeparators :: H [Word8]
wordSeparators = do
  header <- dictHeader
  n <- rb header
  mapM (\i -> rb (header+fi i)) [1..n]



-- the dictionary is explicitly static, so load it on first use and store it in the state
getDict :: H Dictionary
getDict = do
  mdict <- gets dictionary
  case mdict of
    Just d  -> return d
    Nothing -> do
      entrySize  <- RA . fi <$> dictEntrySize
      entryCount <- RA . fi <$> dictEntryCount
      table <- dictTable
      v <- version
      let ws = if v <= 3 then [0,2] else [0,2,4]
      entries <- mapM (\addr -> do
        str <- mapM rw (map (addr+) ws)
        return (str, fi addr)
        ) (map ((table+) . (entrySize*)) [0..entryCount-1])
      let dict = M.fromList entries
      modify $ \st -> st { dictionary = Just dict }
      return dict


