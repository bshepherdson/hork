{-# LANGUAGE ForeignFunctionInterface, JavaScriptFFI, CPP #-}

module Hork.JavaScript.Console (
  prepareTerminal,
  cPutChar,
  cPutStr,
  cPutStrLn,
  cGetChar,
  cGetLine,
  terminalDimensions
) where

import GHCJS.Types
import GHCJS.Foreign
import GHCJS.Marshal

import Data.Char (ord)

import Hork.Header
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
  -- Output VT100 control codes to exclude the top line from scrolling.
  --cPutStr "\x1b[B" -- cursor down 1
  --cPutStr "\x
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
     window._termIO.onTerminalResize = function(cols, rows) {\
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
cPutStr s = js_putStr (toJSString $ injectReturns s)

cPutStrLn :: String -> IO ()
cPutStrLn s = js_putStrLn (toJSString $ injectReturns s)

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
  case fromJSString c_ of
    [c] -> return c
    _   -> cGetChar -- Probably an escape or control character.

cGetLine :: Hork String
cGetLine = fmap reverse $ cGetLine' []
  where cGetLine' ['\x7f'] = do
          -- Don't send anything to the terminal when we're back to the beginning.
          cGetLine' []
        cGetLine' ('\x7f':x:rest) = do
          liftIO $ cPutStr "\x08 \x08" -- Backspace, space to clear, backspace again.
          cGetLine' rest
        cGetLine' ('\r':rest) = liftIO (cPutStrLn "") >> return rest
        cGetLine' ('\n':rest) = cGetLine' . (:rest) =<< cGetChar
        cGetLine' rest = do
          c <- cGetChar
          liftIO $ cPutStr [c]
          cGetLine' (c:rest)


-- Read from the resize MVar until it's empty, then return the currently-cached size.
terminalDimensions :: Hork (Int, Int)
terminalDimensions = do
  drainResizeEvents
  use dimensions


drainResizeEvents :: Hork ()
drainResizeEvents = do
  rMV <- use resizeMV
  md <- liftIO $ tryTakeMVar rMV
  case md of
    Nothing -> return ()
    Just obj -> do
      mrows <- liftIO $ fromJSRef =<< getProp "rows" obj
      mcols <- liftIO $ fromJSRef =<< getProp "cols" obj
      case (mrows, mcols) of
        (Just r, Just c) -> do
          dimensions .= (r, c)
          -- Now update the size in the header, and update the scrolling area.
          liftIO $ cPutStr "\x1b[?4l" -- Reset scroll mode = jump scrolling
          liftIO $ cPutStr $ "\x1b[?6l" -- Reset origin mode = absolute numbers.
          liftIO $ cPutStr $ "\x1b[2;" ++ show r ++ "r" -- set scrolling region: all but first line
          liftIO $ cPutStr $ "\x1b[999B" -- Move the cursor down to the bottom of the screen.
          -- And update the header values.
          wb hdrSCREEN_HEIGHT_UNITS (fromIntegral r)
          wb hdrSCREEN_WIDTH_UNITS  (fromIntegral c)
          wb hdrSCREEN_HEIGHT_CHARS (fromIntegral r)
          wb hdrSCREEN_WIDTH_CHARS  (fromIntegral c)
          wb hdrFONT_WIDTH_UNITS  1
          wb hdrFONT_HEIGHT_UNITS 1
        _ -> return ()
      drainResizeEvents

