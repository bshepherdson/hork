module Tests where

import Test.HUnit

import Hork
import Hork.Core hiding (children)
import Hork.Objects
import Hork.String
import Hork.Mem

import Data.Char (ord, chr)


ztest :: Hork a -> Test
ztest f = TestCase $ do
  m <- loadFile "Zork1.z3"
  pc0 <- ra . BA <$> rw_ m hdrPC0
  let st = HorkState m [] pc0 [] "Zork1.z3" 3

  _ <- runHork st f
  return ()


allTests = TestList [
  TestLabel "objects" objectTests,
  TestLabel "strings" stringTests
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
  ,

  TestLabel "structure of the property table" $ ztest $ do
    table <- objPropTableAddr 88
    liftIO $ assertEqual "obj 88's property table address" 0x1371 table

    name <- objShortName 88
    liftIO $ assertEqual "obj 88's short name" (map (fromIntegral.ord) "Up a Tree") name

    firstProp <- objFirstProp 88
    liftIO $ assertEqual "obj 88's first property's address" 0x137a firstProp
  ,

  TestLabel "objPropAddr" $ ztest $ do
    let check p a = do
          prop <- objPropAddr 88 p
          liftIO $ assertEqual ("obj 88's prop " ++ show p ++ " address") a prop
    mapM_ (uncurry check) [(23, 0x137a), (22, 0x137d), (17, 0x137f), (5, 0x1382), (0, 0)]
  ,

  TestLabel "propSeek" $ ztest $ do
    let check (p1,p2,ex) = do
          prop <- objPropAddr 87 p1
          seek <- propSeek prop p2
          liftIO $ assertEqual ("obj 87's prop " ++ show p1 ++ " next-data") ex seek
    mapM_ check [(18, 17, (0x135d, 17, 2, 1)), (17, 16, (0x1360, 16, 3, 1)), (16, 12, (0x136a, 12, 2, 1))]

    -- And check what it does for the last property
    prop <- objPropAddr 87 10
    seek <- propSeek prop 4
    case seek of
      (a, n, _, _) -> do
        liftIO $ assertEqual "obj 87's last prop next-data address" 0 a
        liftIO $ assertEqual "obj 87's last prop next-data number" 0 a
  ,

  TestLabel "propInfo" $ ztest $ do
    let check (p,ex) = do
          info <- propInfo p
          liftIO $ assertEqual ("obj 87's prop " ++ show p ++ " info") ex info
    mapM_ check [(0x135d, (17, 2, 1)), (0x1360, (16, 3, 1)), (0x136a, (12, 2, 1))]

    (n, _, _) <- propInfo 0x1370 -- should be the 0 after 87's prop list
    liftIO $ assertEqual ("property number at 0x1370") 0 n
  ,

  TestLabel "objNextProp" $ ztest $ do
    let check (p, ex) = do
          next <- objNextProp 87 p
          liftIO $ assertEqual ("next prop after " ++ show p ++ " on obj 87") ex next
    mapM_ check [(18, 17), (17, 16), (16, 14), (14, 13), (13, 12), (12, 10), (10, 0), (0, 18)]
  ,

  TestLabel "objPropValue" $ ztest $ do
    let check (p, ex) = do
          val <- objPropValue 81 p
          liftIO $ assertEqual ("prop value for " ++ show p ++ " on obj 81") ex val
    mapM_ check [(30, 0x4f), (29, 0xb4), (28, 0x8ea7), (15, 5)]
    -- 15 isn't defined on obj 81, 5 is the default value for that property.
  ,

  TestLabel "objPropLenFromAddr" $ ztest $ do
    let check (a, ex) = do
          n <- objPropLenFromAddr a
          liftIO $ assertEqual ("property length at " ++ showHex a) ex n
    mapM_ check [(0x129d, 1), (0x12ae, 3)]
  ,

  TestLabel "objPutProp 1-byte" $ ztest $ do
    pre <- objPropValue 81 29
    liftIO $ assertEqual "obj 81 p29 before edit" 0xb4 pre

    objPutProp 81 29 30

    post <- objPropValue 81 29
    liftIO $ assertEqual "obj 81 p29 after edit" 30 post
  ,

  TestLabel "objPutProp 2-byte" $ ztest $ do
    pre <- objPropValue 81 11
    liftIO $ assertEqual "obj 81 p11 before edit" 0x8e82 pre

    objPutProp 81 11 0xbeef

    post <- objPropValue 81 11
    liftIO $ assertEqual "obj 81 p11 after edit" 0xbeef post
  ,

  TestLabel "objRemove" $ ztest $ do
    childrenOf82 <- children 82
    liftIO $ assertBool "Children of 82 contains 88" $ 88 `elem` childrenOf82

    childrenOf88 <- children 88

    objRemove 88

    p <- objParent 88 >>= relativeRead
    liftIO $ assertEqual "parent of 88" 0 p
    s <- objSibling 88 >>= relativeRead
    liftIO $ assertEqual "sibling of 88" 0 s

    childrenOf88' <- children 88
    liftIO $ assertEqual "children of 88" childrenOf88 childrenOf88'

    childrenOf82' <- children 82
    liftIO $ assertEqual "children of 82 no longer contains 88" (filter (/=88) childrenOf82) childrenOf82'
  ,

  TestLabel "objInsert" $ ztest $ do
    -- inserting object 89 (bird's nest) into object 94 (Studio)
    childrenOf94 <- children 94
    childrenOf89 <- children 89
    childrenOf88 <- children 88

    liftIO $ assertBool "before insert, 89 is a child of 88" $ 89 `elem` childrenOf88

    objInsert 89 94

    c <- objChild 94 >>= relativeRead
    liftIO $ assertEqual "post-insert child of 94" 89 c
    sibs <- siblings 89
    liftIO $ assertEqual "post-insert siblings of new child matching old children" childrenOf94 sibs

    p <- objParent 89 >>= relativeRead
    liftIO $ assertEqual "post-insert parent of 89" 94 p

    childrenOf89' <- children 89
    liftIO $ assertEqual "post-insert children of 89" childrenOf89 childrenOf89'

    childrenOf88' <- children 88
    liftIO $ assertEqual "post-insert, 89 is gone from the children of 88" (filter (/=89) childrenOf88) childrenOf88'
  ,


  -- attributes
  TestLabel "testing attributes" $ ztest $ do
    let check (o, a, ex) = do
          b <- testAttr o a
          liftIO $ assertEqual ("attr " ++ show a ++ " of obj " ++ show o) ex b
    mapM_ check [(104, 31, True), (104, 28, False), (104, 20, True), (104, 22, False), (104, 13, False), (104, 3, False), (104, 0, False), (105, 6, True), (105, 5, False), (105, 7, False), (247, 0, True), (247, 1, True), (247, 2, True), (247, 4, False)]
  ,

  TestLabel "setting attributes" $ ztest $ do
    let check :: (Word16, Word16, Bool, Bool) -> Hork ()
        check (o, a, ex1, ex2) = do
          b1 <- testAttr o a
          setAttr o a
          b2 <- testAttr o a
          liftIO $ assertEqual ("before setting attr " ++ show a ++ " of obj " ++ show o) ex1 b1
          liftIO $ assertEqual ("after setting attr " ++ show a ++ " of obj " ++ show o) ex2 b2
    mapM_ check [(104, 31, True, True), (104, 28, False, True), (104, 20, True, True), (104, 22, False, True), (104, 13, False, True), (104, 3, False, True), (104, 0, False, True), (105, 6, True, True), (105, 5, False, True), (105, 7, False, True), (247, 0, True, True), (247, 1, True, True), (247, 2, True, True), (247, 4, False, True)]
  ,

  TestLabel "clearing attributes" $ ztest $ do
    let check :: (Word16, Word16, Bool, Bool) -> Hork ()
        check (o, a, ex1, ex2) = do
          b1 <- testAttr o a
          clearAttr o a
          b2 <- testAttr o a
          liftIO $ assertEqual ("before clearing attr " ++ show a ++ " of obj " ++ show o) ex1 b1
          liftIO $ assertEqual ("after clearing attr " ++ show a ++ " of obj " ++ show o) ex2 b2
    mapM_ check [(104, 31, True, False), (104, 28, False, False), (104, 20, True, False), (104, 22, False, False), (104, 13, False, False), (104, 3, False, False), (104, 0, False, False), (105, 6, True, False), (105, 5, False, False), (105, 7, False, False), (247, 0, True, False), (247, 1, True, False), (247, 2, True, False), (247, 4, False, False)]
  ]

-- helpers for Objects
children obj = do
  c <- objChild obj >>= relativeRead
  fmap (if c > 0 then (c:) else id) $ siblings c

siblings obj = do
  s <- objSibling obj >>= relativeRead
  case s of
    0 -> return []
    _ -> fmap (s :) $ siblings s


stringTests = TestList [
  TestLabel "Reading strings" $ ztest $ do
    let check :: (RA, Int, String) -> Hork ()
        check (a,exLen,exStr) = do
          (s, len) <- strLenZ a
          liftIO $ assertEqual ("string length (0x" ++ showHex a ++ ")") exLen len
          liftIO $ assertEqual ("string content (0x" ++ showHex a ++ ")") exStr (map (chr.fromIntegral) s)
    mapM_ check [(0x14890, 22, "A quick thrust pinks your left arm, and blood starts to trickle down."),
                 (0x134fc, 14, "Very good. Now you can go to the second grade."),
                 (0x13076, 11, "Nice view, lousy place to jump.")
                ]
  ,

  TestLabel "encoding words" $ TestCase $ do
    let x = encode 6 (map (fromIntegral.ord) "kiss")
    assertEqual "encoding 'kiss'" [0x41d8, 0xe0a5] x

    let y = encode 9 (map (fromIntegral.ord) "facestabbing")
    assertEqual "encoding 'facestabbing'" [0x2cc8, 0x2b19, 0x98e7] y
  ,

  TestLabel "dictionary lookup" $ ztest $ do
    -- look up the word "kiss" in the dictionary, 0x41d8 e0a5, at 0x4416
    loc <- dictSearch [0x41d8, 0xe0a5]
    liftIO $ assertEqual "data address of 'kiss'" 0x4416 loc
  ,

  TestLabel "parsing" $ ztest $ do
    (pos, word, addr) <- parse (0, map (fromIntegral.ord) "kiss")
    liftIO $ assertEqual "parse position" 0 pos
    liftIO $ assertEqual "parse address" 0x4416 addr

  {-
  ,

  TestLabel "Reading dictionary" $ ztest $ do
    let textbuf = 0x2271 :: RA
        parsebuf = 0x2300 :: RA
    wb textbuf 9
    zipWithM_ wb [0x2272 :: RA ..] $ map (fromIntegral.ord) "kiss"
    wb (0x2276::RA) 0
    wb parsebuf 8

    strRead (fromIntegral textbuf) (fromIntegral parsebuf)
    -- parse buffer: number of words in byte 1.
    -- parse record (byte 2): ba of word in dictionary, length, position
    numWords <- rb (parsebuf+1)
    liftIO $ assertEqual "Parse buffer word count" 1 numWords
    addr <- rw (parsebuf+2)
    liftIO $ assertEqual "Parsed word address" 0x4419 addr
    len <- rb (parsebuf+4)
    liftIO $ assertEqual "Parsed word length" 4 len
    pos <- rb (parsebuf+5)
    liftIO $ assertEqual "Parsed word position" 0 pos
  -}
  ]


