{-# LANGUAGE ForeignFunctionInterface, JavaScriptFFI, CPP #-}

module Hork.JavaScript.Console where

import GHCJS.Types
import GHCJS.Foreign

import Data.Char (ord)

import Hork.Core

import Control.Concurrent.MVar

-- Looking through the whole app, there are several kinds of I/O:
-- - Error messages using `die`.
-- - putStr
-- - putChar
-- - read a whole line (with echo?)
-- - read a single character
--
-- Extras:
-- - Set color
-- - Split screen
-- - Clear window
-- - Clear line
-- - Get cursor position
-- - Set cursor position
-- - Set text styles
-- - Set buffer mode (what modes are there? does this only apply to alternative outputs?)

-- This implementation relies on hterm, and sends it ordinary VT100 escapes.

-- I need to be called exactly once at the start of every app.
prepareTerminal :: IO (MVar JSString, MVar (JSObject JSNumber))
prepareTerminal = do
  inputMV <- newEmptyMVar
  resizeMV <- newEmptyMVar
  js_prepareTerminal (mvarRef inputMV) (mvarRef resizeMV)
  return (inputMV, resizeMV)

foreign import javascript interruptible
  "window.hterm.defaultStorage = new lib.Storage.Chrome(chrome.storage.local);\
   window._term = new window.hterm.Terminal();\
   window._term.onTerminalReady = function() {\
     window._term.setCursorPosition(0,0);\
     window._term.setCursorVisible(true);\
     window._termIO = window._term.io.push();\
     var inputListener = function(event) {\
       h$writeMVarJs1($1, event);\
     };\
     window._termIO.onVTKeystroke = inputListener;\
     window._termIO.sendString = inputListener;\
     var resizeListener = h$makeMVarListener($2, false, false, false);\
     window._termIO.onTerminalResize = function(rows, cols) {\
       resizeListener({ rows: rows, cols: cols });\
     };\
     $c();\
     };\
     window._term.decorate(document.querySelector('#terminal'));\
     window._term.installKeyboard();"
  js_prepareTerminal :: JSObject (MVar JSString) -> JSObject (MVar (JSObject JSNumber)) -> IO ()


cPutChar :: Char -> IO ()
cPutChar '\n' = js_putStrLn (toJSString "") -- Special handling for this.
cPutChar c = cPutStr [c]

cPutStr :: String -> IO ()
cPutStr s = putStrLn s >> js_putStr (toJSString $ injectReturns s)

cPutStrLn :: String -> IO ()
cPutStrLn s = putStrLn s >> js_putStrLn (toJSString $ injectReturns s)

injectReturns :: String -> String
injectReturns s = case break (=='\n') s of
                    (pre, _:post) -> pre ++ "\r\n" ++ injectReturns post
                    (pre, []) -> pre

foreign import javascript interruptible "window._termIO.print($1); $c();" js_putStr :: JSString -> IO ()
foreign import javascript interruptible "window._termIO.println($1); $c();" js_putStrLn :: JSString -> IO ()


-- Reading, one character at a time, and one line at a time.
cGetChar :: Hork Char
cGetChar = do
  mv <- use inputMV
  c_ <- liftIO $ takeMVar mv
  let [c] = fromJSString c_
  liftIO $ putStrLn $ "Read: " ++ (c:[]) ++ " (" ++ show (ord c) ++ ")"
  return c

cGetLine :: Hork String
cGetLine = fmap reverse . cGetLine' . (:[]) =<< cGetChar
  where cGetLine' ['\x7f'] = cGetLine' . (:[]) =<< cGetChar
        cGetLine' ('\x7f':x:rest) = cGetLine' . (:rest) =<< cGetChar
        cGetLine' ('\r':rest) = return rest
        cGetLine' ('\n':rest) = cGetLine' . (:rest) =<< cGetChar
        cGetLine' rest = cGetLine' . (:rest) =<< cGetChar

