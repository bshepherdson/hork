module Hork.Header where

import Hork.Mem

-- Constants for the locations of things in the header.

hdrVERSION, hdrFLAGS1, hdrHIMEM, hdrPC0, hdrDICTIONARY, hdrOBJTABLE, hdrGLOBALS, hdrSTATIC, hdrFLAGS2, hdrABBREVIATIONS, hdrFILESIZE, hdrCHECKSUM, hdrINTNUMBER, hdrINTVERSION, hdrSTANDARD :: RA
hdrVERSION = 0
hdrFLAGS1 = 1
hdrHIMEM = 4
hdrPC0 = 6
hdrDICTIONARY = 8
hdrOBJTABLE = 0xA
hdrGLOBALS = 0xC
hdrSTATIC = 0xE
hdrFLAGS2 = 0x10
hdrABBREVIATIONS = 0x18
hdrFILESIZE = 0x1A
hdrCHECKSUM = 0x1C
hdrINTNUMBER = 0x1E
hdrINTVERSION = 0x1F
hdrSTANDARD = 0x32

