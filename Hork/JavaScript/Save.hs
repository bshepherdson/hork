{-# LANGUAGE ForeignFunctionInterface, JavaScriptFFI, CPP, EmptyDataDecls #-}

module Hork.JavaScript.Save (
  saveGame,
  restoreGame,
  toBase64,
  fromBase64
) where

import GHCJS.Types
import GHCJS.Foreign

import Hork.Mem
import Hork.Core

import Control.Applicative
import Control.Monad

import Data.Array
import Data.Array.IO
import Data.Bits
import Data.List
import qualified Data.Map as M
import Data.Word

-- Given a Mem and a key name, convert it to a Base64 string and write it to
-- chrome.storage.local.
-- TODO: Once GHCJS can serialize UArrays, serialize the array directly and call
-- atob() and btoa() in the browser.


-- Plan for saving: we turn the game state into a serializable JS object, then put it into
-- chrome.storage.local.
-- The keys of the object correspond to the fields in HorkState.
-- Things which are not saved, and should be copied from the live state on restore:
-- - Both MVars
-- - dimensions
-- - storyFile
saveGame :: String -> Hork Word16
saveGame saveName = do
  -- Create a JS object and start assigning things to it.
  obj <- liftIO newObj
  let store k v = liftIO $ setProp k (toJSString v) obj
  -- Store the memory.
  store "mem" =<< liftIO . toBase64 =<< use mem
  store "stack" =<< fmap show (use stack)
  store "pc" =<< fmap show (use pc)
  store "routines" =<< fmap show (use routines)
  store "version" =<< fmap show (use version)
  liftIO $ js_localSet (toJSString saveName) obj
  return 1 -- successful save


-- TODO: Handle missing savegame.
-- Restores all the saved values. Does not change the saved values in the storage, and does
-- not update the non-saved values noted above.
restoreGame :: String -> Hork Word16
restoreGame saveName = do
  obj <- liftIO $ js_localGet (toJSString saveName)
  let fetch k = fmap fromJSString . liftIO $ getProp k obj
  mem <~ (liftIO . fromBase64 =<< fetch "mem")
  stack <~ fmap read (fetch "stack")
  pc <~ fmap read (fetch "pc")
  routines <~ fmap read (fetch "routines")
  version <~ fmap read (fetch "version")
  return 2 -- returning from save



toB64 :: Array Word32 Char
toB64 = listArray (0,63) "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

fromB64 :: M.Map Char Word32
fromB64 = M.fromList $
  zip ['A'..'Z'] [0..] ++
  zip ['a'..'z'] [26..] ++
  zip ['0'..'9'] [52..] ++
  [('+', 62), ('/', 63)]

readArrayDefault :: Mem -> Word32 -> Word8 -> Word32 -> IO Word8
readArrayDefault arr len def i | i <= len   = readArray arr i
                               | otherwise = return def

toBase64 :: Mem -> IO String
toBase64 arr = do
  -- Move through the array in threes.
  len <- snd <$> getBounds arr
  fmap concat $ forM [0,3..len] $ \i -> do
    [a,b,c] <- mapM (readArrayDefault arr len 0) [i..i+2]
    let w = (fromIntegral a `shiftL` 16) .|. (fromIntegral b `shiftL` 8) .|. fromIntegral c
    let codes = map ((.&. 63) . shiftR w) [18,12,6,0]
    let chars = map (toB64 !) codes
    let truncated = genericTake (len-i+2) chars -- Drop trailing values if we ran out of bytes.
    return truncated

fromBase64 :: String -> IO Mem
fromBase64 s = do
  let len = genericLength s
      chunks = chunksOf 4 s
      bytes = concatMap doChunk chunks
  newListArray (0, genericLength bytes - 1) bytes
 where doChunk s = take (length s - 1)               -- Skip extra trailing 0s.
                 $ (\x -> map (fromIntegral . (.&. 255) . shiftR x) [16,8,0])
                                                     -- Break down into bytes.
                 $ foldl' (.|.) 0                    -- Combine them into one Word32.
                 $ zipWith (flip shiftL) [18,12,6,0] -- Shift them
                 $ map (fromB64 M.!) s               -- Look up their number equivalents.


chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = let (pre,post) = splitAt n xs in pre : chunksOf n post


foreign import javascript interruptible "var saveObj = {}; saveObj[$1] = $2; chrome.storage.local.set(saveObj, $c);"
  js_localSet :: JSString -> JSObject JSString -> IO ()

foreign import javascript interruptible "chrome.storage.local.get($1, function(obj) { $c(obj[$1]); });"
  js_localGet :: JSString -> IO (JSObject JSString)
