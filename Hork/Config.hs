
module Hork.Config where

import Hork.Types
import Hork.Memory

import Data.Word
import qualified Data.Map as M


version :: H Word8
version = configByte "version"

configByte :: String -> H Word8
configByte = getField rb

configWord :: String -> H Word16
configWord = getField rw

getField :: (ByteAddr -> a) -> String -> a
getField f s = 
  case M.lookup s configMap of
    Nothing -> error $ "Unknown header field: " ++ s
    Just x  -> f x


configMap :: M.Map String ByteAddr
configMap = M.fromList [
   ("version", BA 0x00)
  ,("flags1",  BA 0x01)
  ,("himem",   BA 0x04)
  ,("initialPC", BA 0x06)
  ,("dictionary", BA 0x08)
  ,("objects", BA 0x0a)
  ,("globals", BA 0x0c)
  ,("static", BA 0x0e)
  ,("flags2", BA 0x10)
  ,("abbreviations", BA 0x18)
  ,("length", BA 0x1a)
  ,("checksum", BA 0x1c)
  ,("height", BA 0x20)
  ,("width", BA 0x21)
  ,("height_units", BA 0x22)
  ,("width_units", BA 0x24)
  ,("font_width", BA 0x26)
  ,("font_height", BA 0x27)
  ,("default_background", BA 0x2c)
  ,("default_foreground", BA 0x2d)
  ,("terminator_table", BA 0x2e)
  ,("standard_revision", BA 0x32)
  ,("alphabet_tables", BA 0x34)
  ,("header_extension", BA 0x36)
  ]

