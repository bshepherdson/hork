module Hork.String where

import Hork.Core

import Data.Char (ord, chr, toLower)


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

mungeStrZ (4 : c : rest) = charMunge (+59) c rest
mungeStrZ (5 : c : rest) = charMunge a2 c rest
mungeStrZ (4 : []) = return []
mungeStrZ (5 : []) = return []

mungeStrZ (c : rest) = charMunge (+91) c rest
mungeStrZ [] = return []


-- table function, character, rest
charMunge :: (Word16 -> Word16) -> Word16 -> [Word16] -> Hork [Word8]
charMunge f c rest | c >= 6 = (fromIntegral (f c) :) <$> mungeStrZ rest
                   | otherwise = mungeStrZ (c:rest)

-- Maps characters for A2.
a2 :: Word16 -> Word16
a2 n = head $ genericDrop (n-7) (map (fromIntegral . ord) a2Chars)

a2Chars :: [Char]
a2Chars = "\n0123456789.,!?_#'\"/\\-:()"

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
  return (str', length str `div` 3)

strZ :: Addr a => a -> Hork [Word8]
strZ = fmap fst . strLenZ

printZ :: Addr a => a -> Hork ()
printZ = liftIO . putStr . map (chr . fromIntegral) <=< strZ



-- reading

-- Takes the text buffer and parse buffer.
-- First reads from the keyboard into textbuf, until a carriage return
-- Then it splits into words, populating parsebuf.
-- Finally it tries to look the words up in the dictionary,
-- populating that info in parsebuf as well.
strRead :: Word16 -> Word16 -> Hork ()
strRead textbuf_ parsebuf_ = do
  -- TODO: Redisplay the status line here.
  let [textbuf, parsebuf] = map (ra.BA) [textbuf_, parsebuf_]
  liftIO $ putStrLn $ "Buffers: " ++ showHex textbuf ++ ", " ++ showHex parsebuf

  -- read from the keyboard until a CR
  maxlen <- rb textbuf
  liftIO $ putStrLn $ "Maxlen: " ++ show maxlen
  line <- genericTake maxlen <$> liftIO getLine
  -- write that text to textbuf
  let line' = map (fromIntegral . ord . toLower) line ++ [0] -- 0 terminator

  liftIO $ putStrLn $ line ++ " -> " ++ show line'
  mapM_ (uncurry wb) (zip [textbuf+1..] line')

  liftIO $ putStrLn "" -- newline

  -- now for lexical analysis
  -- HACK: assuming the parse-buffer is long enough
  -- first, retrieve the dictionary word separators (comma, etc.)
  -- these are in a header of the dictionary
  dict <- ra . BA <$> rw hdrDICTIONARY
  sepCount <- rb dict
  seps <- mapM (rb . (dict+)) [1..fromIntegral sepCount]
  liftIO $ putStrLn $ "sepCount " ++ show sepCount ++ ", seps = " ++ show seps

  -- next, split the text into words, including these separators
  -- this needs to be done manually D: because we need the position of the first letters
  let split i (32:rest) [] = split (i+1) rest []
      split i (32:rest) sofar = (i+1, reverse sofar) : split (i + 1 + length sofar) rest []
      split _ [] [] = []
      split i [] sofar = [(i+1, reverse sofar)]
      split i (c:cs) sofar | c `elem` seps = (if null sofar then id else ((i+1, reverse sofar) :)) ((i + 1 + length sofar, c:[]) : split (i + 2 + length sofar) cs [])
                           | otherwise = split i cs (c:sofar)

      wds = split 0 (init line') [] -- ignore the 0 terminator

  liftIO $ print wds
  parsed <- mapM parse wds
  liftIO $ print parsed
  -- we've got the parse data now, so write it into the parse buffer
  -- first we write the number of words
  wb (parsebuf + 1) (genericLength parsed)
  mapM_ (\(target, (pos, word, addr)) -> do
      ww target (fromIntegral addr)
      wb (target+2) (genericLength word)
      wb (target+3) (fromIntegral pos)
    ) (zip [parsebuf + 2, parsebuf + 6 ..] parsed)



parse :: (Int, [Word8]) -> Hork (Int, [Word8], RA)
parse (pos, word) = do
  let encoded = encode word
  -- now search in the dictionary for the same word.
  addr <- dictSearch encoded
  return (pos, word, addr)


dictSearch :: [Word16] -> Hork RA
dictSearch [a,b] = do
  dict <- ra . BA <$> rw hdrDICTIONARY
  sepCount <- fromIntegral <$> rb dict
  entrySize <- rb (dict + sepCount + 1)
  entryCount <- rw (dict + sepCount + 2)
  let top = dict + sepCount + 4

  match <- take 1 . concat <$> (forM [top, top + fromIntegral entrySize .. top + fromIntegral entrySize * fromIntegral (entryCount-1)] $ \e -> do
    ea <- rw e
    case ea == a of
      False -> return []
      True  -> do
        eb <- rw (e+2)
        case eb == b of
          False -> return []
          True  -> return [e]
    )

  case match of
    []  -> return 0
    [m] -> return (m+4)


-- encodes a word into dictionary format: 6 Z-characters (2 words) and pads out with 5s.
encode :: [Word8] -> [Word16]
encode cs = collect (take 3 chars) : (collect (drop 3 chars) + bit 15) : []
  where chars :: [Word8]
        chars = take 6 . (++ repeat 5) . concatMap encodeChar $ cs
        collect :: [Word8] -> Word16
        collect [a,b,c] = (0 :: Word16) .|. fromIntegral c .|. (fromIntegral b `shiftL` 5) .|. (fromIntegral a `shiftL` 10)
        encodeChar 32 = [0]
        encodeChar c | 97 <= c && c <= 122 = [c - 91]
                     | otherwise = case elemIndex (chr (fromIntegral c)) a2Chars of
                                     Just i  -> [5, 7 + fromIntegral i]
                                     Nothing -> let (a,b) = (c `shiftR` 5, c .&. 31)
                                                in  [5, 6, a, b]


