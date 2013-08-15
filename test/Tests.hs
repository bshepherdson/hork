module Tests where

import Test.HUnit

import Hork
import Hork.Core
import Hork.Objects

ztest :: Hork a -> Test
ztest f = TestCase $ do
  m <- loadFile "Zork1.z3"
  pc0 <- ra . BA <$> rw_ m hdrPC0
  let st = HorkState m [] pc0 [] "Zork1.z3" 3

  _ <- runHork st f
  return ()


allTests = TestList [
  TestLabel "objects" objectTests
  ]



objectTests = TestList [
  TestLabel "defaults vs. real table" $ ztest $ do
    defs <- propDefaults
    liftIO $ assertEqual "propdefaults location" 0x2b0 defs
    table <- objTable
    liftIO $ assertEqual "main obj table location" 0x2ee table
    obj1 <- objEntry 1
    liftIO $ assertEqual "obj 1 address and start of table" table obj1
  ,

  TestLabel "reading relatives" $ ztest $ do
    parent  <- objParent  88 >>= relativeRead
    sibling <- objSibling 88 >>= relativeRead
    child   <- objChild   88 >>= relativeRead
    liftIO $ do
      assertEqual "obj 88's parent"  82 parent
      assertEqual "obj 88's sibling" 75 sibling
      assertEqual "obj 88's child"   89 child
  ]


