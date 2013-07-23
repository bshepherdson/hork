module Hork.String where

import Hork.Core


strZ :: Addr a => a -> Hork String
strZ a = undefined
  -- read and decode a Z-char
  --rw 

printZ :: Addr a => a -> Hork ()
printZ = liftIO . putStr <=< strZ
