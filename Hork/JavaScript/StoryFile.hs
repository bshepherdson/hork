{-# LANGUAGE ForeignFunctionInterface, JavaScriptFFI, CPP, MagicHash, UnliftedFFITypes #-}
-- NB: CPP is required so that \ in strings will work properly.
module Hork.JavaScript.StoryFile (
  openStoryFile
) where

import GHCJS.Types
import GHCJS.Foreign

import Data.Array
import Data.Array.IO
import Data.Word

import GHC.Prim (ByteArray#)
import Data.Primitive.ByteArray
import Unsafe.Coerce

import Hork.Mem

-- Uses chrome.fileSystem.chooseEntry to have the user select a file, read it
-- into an ArrayBuffer, and converts it into a Mem.
-- Need to use h$wrapBuffer in the JS. That produces a ByteArray#, which needs unsafeCoercing
-- into the Mem.

openStoryFile :: IO Mem
openStoryFile = do
  ref <- js_openStoryFile
  let arr = unsafeCoerce ref
      len = sizeofByteArray arr
  mem <- newArray_ (0, fromIntegral (len-1)) -- Danger: uninitialized.
  mapM_ (\i -> writeArray mem (fromIntegral i) (indexByteArray arr i)) [0..len-1]
  return mem



foreign import javascript interruptible
  "chrome.fileSystem.chooseEntry({ type: 'openFile', acceptsMultiple: false },\
   function(entries) {\
     entries[0].file(function(file) {\
       var reader = new FileReader();\
       reader.onloadend = function(e) {\
         $c(h$wrapBuffer(e.target.result), true);\
       };\
       reader.readAsArrayBuffer(file);\
     });\
   });"
  js_openStoryFile :: IO (JSRef ())

