Resident data ends at 4e37, program starts at 4f04, file ends at 14b8c

Starting analysis pass at address 4e37

End of analysis pass, low address = 4e38, high address = 10b04

[Start of code at 4e38]

Routine 4e38, 1 local (0000)

 4e3b:  b2 ...                  print           "a "
 4e3e:  aa 01                   print_obj       local0
 4e40:  b0                      rtrue           

Routine 4e42, 1 local (0000)

 4e45:  a0 4c cb                jz              g3c 4e51
 4e48:  e7 7f 64 00             random          #64 -> sp
 4e4c:  63 01 00 c1             jg              local0 sp rtrue
 4e50:  b1                      rfalse          
 4e51:  e7 3f 01 2c 00          random          #012c -> sp
 4e56:  63 01 00 c1             jg              local0 sp rtrue
 4e5a:  b1                      rfalse          

Routine 4e5c, 1 local (0000)

 4e5f:  4f 01 00 00             loadw           local0 #00 -> sp
 4e63:  e7 bf 00 00             random          sp -> sp
 4e67:  6f 01 00 00             loadw           local0 sp -> sp
 4e6b:  b8                      ret_popped      

Routine 4e6c, 6 locals (0000, 0000, 0000, 0000, 0000, 0000)

 4e79:  4f 01 00 02             loadw           local0 #00 -> local1
 4e7d:  4f 01 01 03             loadw           local0 #01 -> local2
 4e81:  96 02                   dec             local1
 4e83:  54 01 02 01             add             local0 #02 -> local0
 4e87:  56 03 02 00             mul             local2 #02 -> sp
 4e8b:  74 01 00 06             add             local0 sp -> local5
 4e8f:  75 02 03 00             sub             local1 local2 -> sp
 4e93:  e7 bf 00 04             random          sp -> local3
 4e97:  6f 06 04 05             loadw           local5 local3 -> local4
 4e9b:  4f 06 01 00             loadw           local5 #01 -> sp
 4e9f:  e1 ab 06 04 00          storew          local5 local3 sp
 4ea4:  e1 9b 06 01 05          storew          local5 #01 local4
 4ea9:  95 03                   inc             local2
 4eab:  61 03 02 45             je              local2 local1 ~4eb2
 4eaf:  0d 03 00                store           local2 #00
 4eb2:  e1 9b 01 00 03          storew          local0 #00 local2
 4eb7:  ab 05                   ret             local4

Routine 4eba, 0 locals ()

 4ebb:  41 88 2b 40             je              g78 #2b ~rfalse
 4ebf:  e0 1f 48 5d a3 00       call            90ba #a3 -> sp
 4ec5:  b1                      rfalse          

Routine 4ec6, 0 locals ()

 4ec7:  a0 3e d9                jz              g2e 4ee1
 4eca:  0a ae 0b 44             test_attr       "grating" #0b ~4ed0
 4ece:  9b 39                   ret             #39
 4ed0:  b2 ...                  print           "The grating is closed!"
 4ed9:  bb                      new_line        
 4eda:  e0 1f 4a 98 ae 00       call            9530 #ae -> sp
 4ee0:  b1                      rfalse          
 4ee1:  b2 ...                  print           "You can't go that way."
 4eec:  bb                      new_line        
 4eed:  b1                      rfalse          

Routine 4eee, 1 local (0000)

 4ef1:  41 01 01 40             je              local0 #01 ~rfalse
 4ef5:  41 88 45 40             je              g78 #45 ~rfalse
 4ef9:  a0 86 40                jz              g76 ~rfalse
 4efc:  e0 0f 83 33 98 3b 00    call            10666 s148 -> sp
 4f03:  b0                      rtrue           

Main routine 4f04, 0 locals ()

 4f05:  e0 03 2a 39 80 10 ff ff 00 
                               call            5472 #8010 #ffff -> sp
 4f0e:  e1 97 00 00 01          storew          sp #00 #01
 4f13:  e0 03 2a 39 80 7c ff ff 00 
                               call            5472 #807c #ffff -> sp
 4f1c:  e0 03 2a 39 80 f0 ff ff 00 
                               call            5472 #80f0 #ffff -> sp
 4f25:  e1 97 00 00 01          storew          sp #00 #01
 4f2a:  e0 07 2a 39 6f 6a 28 00 call            5472 #6f6a #28 -> sp
 4f32:  e0 07 2a 39 6f 55 c8 00 call            5472 #6f55 #c8 -> sp
 4f3a:  e3 57 9c 06 04          put_prop        "magic boat" #06 #04
 4f3f:  54 20 02 00             add             g10 #02 -> sp
 4f43:  e1 9b 1a 01 00          storew          g0a #01 sp
 4f48:  54 20 04 00             add             g10 #04 -> sp
 4f4c:  e1 9b 1a 02 00          storew          g0a #02 sp
 4f51:  54 1e 02 00             add             g0e #02 -> sp
 4f55:  e1 9b 19 02 00          storew          g09 #02 sp
 4f5a:  54 1e 04 00             add             g0e #04 -> sp
 4f5e:  e1 9b 19 03 00          storew          g09 #03 sp
 4f63:  54 1d 02 00             add             g0d #02 -> sp
 4f67:  e1 9b 18 01 00          storew          g08 #01 sp
 4f6c:  54 1c 02 00             add             g0c #02 -> sp
 4f70:  e1 9b 18 03 00          storew          g08 #03 sp
 4f75:  0d 10 b4                store           g00 #b4
 4f78:  e0 1f 4a 98 a0 00       call            9530 #a0 -> sp
 4f7e:  4a 10 03 c8             test_attr       g00 #03 4f88
 4f82:  e0 3f 37 70 00          call            6ee0 -> sp
 4f87:  bb                      new_line        
 4f88:  0d 52 01                store           g42 #01
 4f8b:  0d 7f 04                store           g6f #04
 4f8e:  2d 90 7f                store           g80 g6f
 4f91:  6e 7f 10                insert_obj      g6f g00
 4f94:  e0 3f 3f 02 00          call            7e04 -> sp
 4f99:  e0 3f 2a 95 00          call            552a -> sp
 4f9e:  8c ff 66                jump            4f05

Routine 4fa2, 3 locals (0000, 0001, 0000)

 4fa9:  41 86 0b 59             je              g76 #0b ~4fc4
 4fad:  41 87 0b 55             je              g77 #0b ~4fc4
 4fb1:  b3 ...                  print_ret       "Those things aren't here!"
 4fc4:  41 86 0b 48             je              g76 #0b ~4fce
 4fc8:  2d 01 66                store           local0 g56
 4fcb:  8c 00 08                jump            4fd4
 4fce:  2d 01 65                store           local0 g55
 4fd1:  0d 02 00                store           local1 #00
 4fd4:  0d 7c 00                store           g6c #00
 4fd7:  0d 70 00                store           g60 #00
 4fda:  61 7f 90 56             je              g6f g80 ~4ff2
 4fde:  b2 ...                  print           "You can't see any"
 4fe7:  e0 2f 28 49 02 00       call            5092 local1 -> sp
 4fed:  b3 ...                  print_ret       " here!"
 4ff2:  b2 ...                  print           "The "
 4ff5:  aa 7f                   print_obj       g6f
 4ff7:  b2 ...                  print           " seems confused. ~I don't see any"
 500a:  e0 2f 28 49 02 00       call            5092 local1 -> sp
 5010:  b3 ...                  print_ret       " here!~"

Routine 5018, 4 locals (0000, 0000, 0000, 0000)

 5021:  e0 2f 34 3e 01 03       call            687c local0 -> local2
 5027:  43 03 01 53             jg              local2 #01 ~503c
 502b:  4f 01 01 00             loadw           local0 #01 -> sp
 502f:  51 00 05 04             get_prop        sp #05 -> local3
 5033:  a0 04 c8                jz              local3 503c
 5036:  0d 03 01                store           local2 #01
 5039:  2d 5c 04                store           g4c local3
 503c:  21 01 03 4d             je              #01 local2 ~504b
 5040:  a0 02 c6                jz              local1 5047
 5043:  2d 86 5c                store           g76 g4c
 5046:  b1                      rfalse          
 5047:  2d 87 5c                store           g77 g4c
 504a:  b1                      rfalse          
 504b:  a0 02 5c                jz              local1 ~5068
 504e:  b2 ...                  print           "You wouldn't find any"
 505d:  e0 2f 28 49 02 00       call            5092 local1 -> sp
 5063:  b3 ...                  print_ret       " there."
 5068:  9b 0b                   ret             #0b

Routine 506a, 1 local (0000)

 506d:  0d 7c 00                store           g6c #00
 5070:  0d 70 00                store           g60 #00
 5073:  b2 ...                  print           "You can't see any"
 507c:  61 01 86 4a             je              local0 g76 ~5088
 5080:  e0 3f 36 66 00          call            6ccc -> sp
 5085:  8c 00 07                jump            508d
 5088:  e0 3f 36 7a 00          call            6cf4 -> sp
 508d:  b3 ...                  print_ret       " here."

Routine 5092, 2 locals (0000, 0000)

 5097:  a0 79 d3                jz              g69 50ab
 509a:  a0 5a c7                jz              g4a 50a2
 509d:  b2 ...                  print           " "
 50a0:  a7 59                   print_addr      g49
 50a2:  a0 5b c0                jz              g4b rfalse
 50a5:  b2 ...                  print           " "
 50a8:  a7 5b                   print_addr      g4b
 50aa:  b0                      rtrue           
 50ab:  a0 01 d3                jz              local0 50bf
 50ae:  4f 74 06 02             loadw           g64 #06 -> local1
 50b2:  4f 74 07 00             loadw           g64 #07 -> sp
 50b6:  e0 29 31 77 02 00 00 00 call            62ee local1 sp #00 -> sp
 50be:  b8                      ret_popped      
 50bf:  4f 74 08 02             loadw           g64 #08 -> local1
 50c3:  4f 74 09 00             loadw           g64 #09 -> sp
 50c7:  e0 29 31 77 02 00 00 00 call            62ee local1 sp #00 -> sp
 50cf:  b8                      ret_popped      

Routine 50d0, 2 locals (0000, 0000)

 50d5:  b1                      rfalse          

Routine 50d6, 0 locals ()

 50d7:  41 88 22 40             je              g78 #22 ~rfalse
 50db:  b3 ...                  print_ret       "You should say whether you want to go up or down."

Routine 50fa, 0 locals ()

 50fb:  41 88 42 40             je              g78 #42 ~rfalse
 50ff:  95 55                   inc             g45
 5101:  e0 3f 28 68 00          call            50d0 -> sp
 5106:  58 55 14 00             mod             g45 #14 -> sp
 510a:  a0 00 59                jz              sp ~5124
 510d:  b3 ...                  print_ret       "You seem to be repeating yourself."
 5124:  58 55 0a 00             mod             g45 #0a -> sp
 5128:  a0 00 5d                jz              sp ~5146
 512b:  b3 ...                  print_ret       "I think that phrase is getting a bit worn out."
 5146:  b3 ...                  print_ret       "Nothing happens here."

Routine 5156, 0 locals ()

 5157:  c1 97 88 32 12 4e       je              g78 #32 #12 ~5169
 515d:  41 87 08 4a             je              g77 #08 ~5169
 5161:  e0 1b 2b be 31 86 00    call            577c #31 g76 -> sp
 5168:  b0                      rtrue           
 5169:  41 10 7e 48             je              g00 #7e ~5173
 516d:  e0 3f 76 e3 00          call            edc6 -> sp
 5172:  b8                      ret_popped      
 5173:  41 88 2c 40             je              g78 #2c ~rfalse
 5177:  b3 ...                  print_ret       "The ground is too hard for digging here."

Routine 518a, 0 locals ()

 518b:  41 88 38 00 ab          je              g78 #38 ~5239
 5190:  b3 ...                  print_ret       "The grue is a sinister, lurking presence in the dark places of the earth. Its favorite diet is adventurers, but its insatiable appetite is tempered by its fear of light. No grue has ever been seen by the light of day, and few have survived its fearsome jaws to tell the tale."
 5239:  41 88 3c 00 51          je              g78 #3c ~528d
 523e:  b3 ...                  print_ret       "There is no grue here, but I'm sure there is at least one lurking in the darkness nearby. I wouldn't let my light go out if I were you!"
 528d:  41 88 4d 40             je              g78 #4d ~rfalse
 5291:  b3 ...                  print_ret       "It makes no sound but is always lurking in the darkness nearby."

Routine 52b8, 1 local (0000)

 52bb:  41 88 6f 77             je              g78 #6f ~52f4
 52bf:  0d 7c 00                store           g6c #00
 52c2:  0d 70 00                store           g60 #00
 52c5:  b3 ...                  print_ret       "Talking to yourself is said to be a sign of impending mental collapse."
 52f4:  41 88 3f 4e             je              g78 #3f ~5304
 52f8:  41 87 05 4a             je              g77 #05 ~5304
 52fc:  e0 1b 2b be 5d 86 00    call            577c #5d g76 -> sp
 5303:  b0                      rtrue           
 5304:  41 88 56 4f             je              g78 #56 ~5315
 5308:  b3 ...                  print_ret       "Only you can do that."
 5315:  41 88 2d 57             je              g78 #2d ~532e
 5319:  b3 ...                  print_ret       "You'll have to do that on your own."
 532e:  41 88 33 59             je              g78 #33 ~5349
 5332:  b3 ...                  print_ret       "Auto-cannibalism is not the answer."
 5349:  c1 97 88 2a 13 62       je              g78 #2a #13 ~536f
 534f:  a0 87 ce                jz              g77 535e
 5352:  4a 87 1d 4a             test_attr       g77 #1d ~535e
 5356:  e0 0f 83 33 9a 39 00    call            10666 s164 -> sp
 535d:  b8                      ret_popped      
 535e:  b3 ...                  print_ret       "Suicide is not the answer."
 536f:  41 88 5d 4d             je              g78 #5d ~537e
 5373:  b3 ...                  print_ret       "How romantic!"
 537e:  41 88 38 40             je              g78 #38 ~rfalse
 5382:  93 97 01                get_parent      "mirror" -> local0
 5385:  93 99 00                get_parent      "mirror" -> sp
 5388:  c1 ab 10 01 00 59       je              g00 local0 sp ~53a5
 538e:  b3 ...                  print_ret       "Your image in the mirror looks tired."
 53a5:  b3 ...                  print_ret       "That's difficult unless your eyes are prehensile."

Routine 53c6, 0 locals ()

 53c7:  c1 97 88 3d 5d 59       je              g78 #3d #5d ~53e4
 53cd:  b3 ...                  print_ret       "You must specify a direction to go."
 53e4:  41 88 3c 53             je              g78 #3c ~53f9
 53e8:  b3 ...                  print_ret       "I can't help you there...."
 53f9:  41 88 2c 40             je              g78 #2c ~rfalse
 53fd:  b3 ...                  print_ret       "Not a chance."

Routine 5408, 0 locals ()

 5409:  41 88 38 69             je              g78 #38 ~5434
 540d:  b3 ...                  print_ret       "The zorkmid is the unit of currency of the Great Underground Empire."
 5434:  41 88 3c 40             je              g78 #3c ~rfalse
 5438:  b3 ...                  print_ret       "The best way to find zorkmids is to go out and look for them."

Routine 545c, 3 locals (0000, 0000, 0000)

 5463:  e0 27 2a 43 01 01 03    call            5486 local0 #01 -> local2
 546a:  e1 9b 03 01 02          storew          local2 #01 local1
 546f:  ab 03                   ret             local2

Routine 5472, 3 locals (0000, 0000, 0000)

 5479:  e0 2f 2a 43 01 03       call            5486 local0 -> local2
 547f:  e1 9b 03 01 02          storew          local2 #01 local1
 5484:  ab 03                   ret             local2

Routine 5486, 5 locals (0000, 0000, 0000, 0000, 0000)

 5491:  54 94 b4 03             add             g84 #b4 -> local2
 5495:  74 94 92 04             add             g84 g82 -> local3
 5499:  61 04 03 58             je              local3 local2 ~54b3
 549d:  55 92 06 92             sub             g82 #06 -> g82
 54a1:  a0 02 c6                jz              local1 54a8
 54a4:  55 93 06 93             sub             g83 #06 -> g83
 54a8:  74 94 92 05             add             g84 g82 -> local4
 54ac:  e1 9b 05 02 01          storew          local4 #02 local0
 54b1:  ab 05                   ret             local4
 54b3:  4f 04 02 00             loadw           local3 #02 -> sp
 54b7:  61 00 01 44             je              sp local0 ~54bd
 54bb:  ab 04                   ret             local3
 54bd:  54 04 06 04             add             local3 #06 -> local3
 54c1:  8c ff d7                jump            5499

Routine 54c4, 4 locals (0000, 0000, 0000, 0000)

 54cd:  a0 91 c6                jz              g81 54d4
 54d0:  0d 91 00                store           g81 #00
 54d3:  b1                      rfalse          
 54d4:  a0 8f c8                jz              g7f 54dd
 54d7:  e8 bf 92                push            g82
 54da:  8c 00 05                jump            54e0
 54dd:  e8 bf 93                push            g83
 54e0:  74 94 00 01             add             g84 sp -> local0
 54e4:  54 94 b4 02             add             g84 #b4 -> local1
 54e8:  61 01 02 4d             je              local0 local1 ~54f7
 54ec:  c5 4f 12 03 e7 45       inc_chk         g02 #03e7 ~54f5
 54f2:  0d 12 00                store           g02 #00
 54f5:  ab 04                   ret             local3
 54f7:  4f 01 00 00             loadw           local0 #00 -> sp
 54fb:  a0 00 e7                jz              sp 5523
 54fe:  4f 01 01 03             loadw           local0 #01 -> local2
 5502:  a0 03 45                jz              local2 ~5508
 5505:  8c 00 1d                jump            5523
 5508:  55 03 01 00             sub             local2 #01 -> sp
 550c:  e1 9b 01 01 00          storew          local0 #01 sp
 5511:  43 03 01 d0             jg              local2 #01 5523
 5515:  4f 01 02 00             loadw           local0 #02 -> sp
 5519:  e0 bf 00 00             call            sp -> sp
 551d:  a0 00 c5                jz              sp 5523
 5520:  0d 04 01                store           local3 #01
 5523:  54 01 06 01             add             local0 #06 -> local0
 5527:  8c ff c0                jump            54e8

Routine 552a, 10 locals (0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000)

 553f:  0d 04 00                store           local3 #00
 5542:  0d 05 00                store           local4 #00
 5545:  0d 08 01                store           local7 #01
 5548:  e0 3f 2c 40 8f          call            5880 -> g7f
 554d:  a0 8f 81 fc             jz              g7f 574b
 5551:  6f 65 61 01             loadw           g55 g51 -> local0
 5555:  6f 66 61 02             loadw           g56 g51 -> local1
 5559:  a0 02 48                jz              local1 ~5562
 555c:  e8 bf 02                push            local1
 555f:  8c 00 33                jump            5593
 5562:  43 02 01 58             jg              local1 #01 ~557c
 5566:  2d 06 66                store           local5 g56
 5569:  a0 01 48                jz              local0 ~5572
 556c:  0d 05 00                store           local4 #00
 556f:  8c 00 06                jump            5576
 5572:  4f 65 01 05             loadw           g55 #01 -> local4
 5576:  e8 bf 02                push            local1
 5579:  8c 00 19                jump            5593
 557c:  43 01 01 52             jg              local0 #01 ~5590
 5580:  0d 08 00                store           local7 #00
 5583:  2d 06 65                store           local5 g55
 5586:  4f 66 01 05             loadw           g56 #01 -> local4
 558a:  e8 bf 01                push            local0
 558d:  8c 00 05                jump            5593
 5590:  e8 7f 01                push            #01
 5593:  2d 03 00                store           local2 sp
 5596:  a0 05 4a                jz              local4 ~55a1
 5599:  41 01 01 46             je              local0 #01 ~55a1
 559d:  4f 65 01 05             loadw           g55 #01 -> local4
 55a1:  41 88 89 4c             je              g78 #89 ~55af
 55a5:  e0 2b 2b be 88 86 07    call            577c g78 g76 -> local6
 55ac:  8c 01 6a                jump            5717
 55af:  a0 03 00 4f             jz              local2 ~5600
 55b3:  50 83 00 00             loadb           g73 #00 -> sp
 55b7:  49 00 03 00             and             sp #03 -> sp
 55bb:  a0 00 4e                jz              sp ~55ca
 55be:  e0 2f 2b be 88 07       call            577c g78 -> local6
 55c4:  0d 86 00                store           g76 #00
 55c7:  8c 01 4f                jump            5717
 55ca:  a0 52 53                jz              g42 ~55de
 55cd:  b2 ...                  print           "It's too dark to see."
 55da:  bb                      new_line        
 55db:  8c 01 3b                jump            5717
 55de:  b2 ...                  print           "It's not clear what you're referring to."
 55f9:  bb                      new_line        
 55fa:  0d 07 00                store           local6 #00
 55fd:  8c 01 19                jump            5717
 5600:  0d 8a 00                store           g7a #00
 5603:  0d 8b 00                store           g7b #00
 5606:  43 03 01 45             jg              local2 #01 ~560d
 560a:  0d 8b 01                store           g7b #01
 560d:  0d 0a 00                store           local9 #00
 5610:  25 04 03 00 5b          inc_chk         local3 local2 ~566e
 5615:  43 8a 00 00 3d          jg              g7a #00 ~5655
 561a:  b2 ...                  print           "The "
 561d:  61 8a 03 c5             je              g7a local2 5624
 5621:  b2 ...                  print           "other "
 5624:  b2 ...                  print           "object"
 5629:  41 8a 01 c5             je              g7a #01 5630
 562d:  b2 ...                  print           "s"
 5630:  b2 ...                  print           " that you mentioned "
 563d:  41 8a 01 c8             je              g7a #01 5647
 5641:  b2 ...                  print           "are"
 5644:  8c 00 05                jump            564a
 5647:  b2 ...                  print           "is"
 564a:  b2 ...                  print           "n't here."
 5651:  bb                      new_line        
 5652:  8c 00 c4                jump            5717
 5655:  a0 0a 00 c0             jz              local9 ~5717
 5659:  b2 ...                  print           "There's nothing here you can take."
 566a:  bb                      new_line        
 566b:  8c 00 ab                jump            5717
 566e:  a0 08 c9                jz              local7 5678
 5671:  6f 66 04 09             loadw           g56 local3 -> local8
 5675:  8c 00 06                jump            567c
 5678:  6f 65 04 09             loadw           g55 local3 -> local8
 567c:  a0 08 c8                jz              local7 5685
 567f:  e8 bf 09                push            local8
 5682:  8c 00 05                jump            5688
 5685:  e8 bf 05                push            local4
 5688:  2d 86 00                store           g76 sp
 568b:  a0 08 c8                jz              local7 5694
 568e:  e8 bf 05                push            local4
 5691:  8c 00 05                jump            5697
 5694:  e8 bf 09                push            local8
 5697:  2d 87 00                store           g77 sp
 569a:  43 03 01 d1             jg              local2 #01 56ad
 569e:  4f 74 06 00             loadw           g64 #06 -> sp
 56a2:  4f 00 00 00             loadw           sp #00 -> sp
 56a6:  c1 8f 00 3b 7c 00 59    je              sp "all" ~5704
 56ad:  41 09 0b 47             je              local8 #0b ~56b6
 56b1:  95 8a                   inc             g7a
 56b3:  8c ff 5c                jump            5610
 56b6:  41 88 5d 5a             je              g78 #5d ~56d2
 56ba:  a0 87 d7                jz              g77 56d2
 56bd:  4f 74 06 00             loadw           g64 #06 -> sp
 56c1:  4f 00 00 00             loadw           sp #00 -> sp
 56c5:  c1 8f 00 3b 7c 49       je              sp "all" ~56d2
 56cb:  66 86 87 c5             jin             g76 g77 56d2
 56cf:  8c ff 40                jump            5610
 56d2:  41 60 01 62             je              g50 #01 ~56f6
 56d6:  41 88 5d 5e             je              g78 #5d ~56f6
 56da:  a3 09 00                get_parent      local8 -> sp
 56dd:  c1 ab 00 7f 10 ca       je              sp g6f g00 56eb
 56e3:  a3 09 00                get_parent      local8 -> sp
 56e6:  4a 00 0a 3f 27          test_attr       sp #0a ~5610
 56eb:  4a 09 11 c9             test_attr       local8 #11 56f6
 56ef:  4a 09 0d c5             test_attr       local8 #0d 56f6
 56f3:  8c ff 1c                jump            5610
 56f6:  41 09 0c 47             je              local8 #0c ~56ff
 56fa:  aa 7b                   print_obj       g6b
 56fc:  8c 00 04                jump            5701
 56ff:  aa 09                   print_obj       local8
 5701:  b2 ...                  print           ": "
 5704:  0d 0a 01                store           local9 #01
 5707:  e0 2a 2b be 88 86 87 07 call            577c g78 g76 g77 -> local6
 570f:  41 07 02 3e fe          je              local6 #02 ~5610
 5714:  8c 00 02                jump            5717
 5717:  41 07 02 ce             je              local6 #02 5727
 571b:  a3 7f 00                get_parent      g6f -> sp
 571e:  51 00 11 00             get_prop        sp #11 -> sp
 5722:  e0 9f 00 06 07          call            sp #06 -> local6
 5727:  c1 95 88 08 89 0f d5    je              g78 #08 #89 #0f 5741
 572e:  c1 95 88 0c 09 07 45    je              g78 #0c #09 #07 ~5738
 5735:  8c 00 0b                jump            5741
 5738:  2d 8e 88                store           g7e g78
 573b:  2d 8d 86                store           g7d g76
 573e:  2d 8c 87                store           g7c g77
 5741:  41 07 02 4b             je              local6 #02 ~574e
 5745:  0d 7c 00                store           g6c #00
 5748:  8c 00 05                jump            574e
 574b:  0d 7c 00                store           g6c #00
 574e:  a0 8f bd ef             jz              g7f 553f
 5752:  c1 95 88 02 01 6f bd e7 je              g78 #02 #01 #6f 553f
 575a:  c1 95 88 0c 08 00 bd df je              g78 #0c #08 #00 553f
 5762:  c1 95 88 09 06 05 bd d7 je              g78 #09 #06 #05 553f
 576a:  c1 95 88 07 0b 0a 45    je              g78 #07 #0b #0a ~5774
 5771:  8c fd cd                jump            553f
 5774:  e0 3f 2a 62 07          call            54c4 -> local6
 5779:  8c fd c5                jump            553f

Routine 577c, 7 locals (0000, 0000, 0000, 0000, 0000, 0000, 0000)

 578b:  2d 05 88                store           local4 g78
 578e:  2d 06 86                store           local5 g76
 5791:  2d 07 87                store           local6 g77
 5794:  c1 6b 0c 03 02 60       je              #0c local2 local1 ~57b8
 579a:  61 7a 10 dc             je              g6a g00 57b8
 579e:  b2 ...                  print           "I don't see what you are referring to."
 57b5:  bb                      new_line        
 57b6:  9b 02                   ret             #02
 57b8:  41 02 0c 45             je              local1 #0c ~57bf
 57bc:  2d 02 7b                store           local1 g6b
 57bf:  41 03 0c 45             je              local2 #0c ~57c6
 57c3:  2d 03 7b                store           local2 g6b
 57c6:  2d 88 01                store           g78 local0
 57c9:  2d 86 02                store           g76 local1
 57cc:  a0 86 d0                jz              g76 57dd
 57cf:  41 87 0c cc             je              g77 #0c 57dd
 57d3:  41 88 89 c8             je              g78 #89 57dd
 57d7:  2d 7b 86                store           g6b g76
 57da:  2d 7a 10                store           g6a g00
 57dd:  2d 87 03                store           g77 local2
 57e0:  c1 6b 0b 86 87 4d       je              #0b g76 g77 ~57f1
 57e6:  e0 3f 27 d1 04          call            4fa2 -> local3
 57eb:  a0 04 c5                jz              local3 57f1
 57ee:  8c 00 85                jump            5874
 57f1:  2d 02 86                store           local1 g76
 57f4:  2d 03 87                store           local2 g77
 57f7:  51 7f 11 00             get_prop        g6f #11 -> sp
 57fb:  e0 bf 00 04             call            sp -> local3
 57ff:  a0 04 c5                jz              local3 5805
 5802:  8c 00 71                jump            5874
 5805:  a3 7f 00                get_parent      g6f -> sp
 5808:  51 00 11 00             get_prop        sp #11 -> sp
 580c:  e0 9f 00 01 04          call            sp #01 -> local3
 5811:  a0 04 c5                jz              local3 5817
 5814:  8c 00 5f                jump            5874
 5817:  6f ac 01 00             loadw           g9c local0 -> sp
 581b:  e0 bf 00 04             call            sp -> local3
 581f:  a0 04 c5                jz              local3 5825
 5822:  8c 00 51                jump            5874
 5825:  a0 03 d0                jz              local2 5836
 5828:  51 03 11 00             get_prop        local2 #11 -> sp
 582c:  e0 bf 00 04             call            sp -> local3
 5830:  a0 04 c5                jz              local3 5836
 5833:  8c 00 40                jump            5874
 5836:  a0 02 dd                jz              local1 5854
 5839:  41 01 89 d9             je              local0 #89 5854
 583d:  a3 02 00                get_parent      local1 -> sp
 5840:  a0 00 d3                jz              sp 5854
 5843:  a3 02 00                get_parent      local1 -> sp
 5846:  51 00 02 00             get_prop        sp #02 -> sp
 584a:  e0 bf 00 04             call            sp -> local3
 584e:  a0 04 c5                jz              local3 5854
 5851:  8c 00 22                jump            5874
 5854:  a0 02 d4                jz              local1 5869
 5857:  41 01 89 d0             je              local0 #89 5869
 585b:  51 02 11 00             get_prop        local1 #11 -> sp
 585f:  e0 bf 00 04             call            sp -> local3
 5863:  a0 04 c5                jz              local3 5869
 5866:  8c 00 0d                jump            5874
 5869:  6f ab 01 00             loadw           g9b local0 -> sp
 586d:  e0 bf 00 04             call            sp -> local3
 5871:  a0 04 c2                jz              local3 5874
 5874:  2d 88 05                store           g78 local4
 5877:  2d 86 06                store           g76 local5
 587a:  2d 87 07                store           g77 local6
 587d:  ab 04                   ret             local3

Routine 5880, 11 locals (0001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, ffff)

 5897:  05 0b 09 45             inc_chk         local10 #09 ~589e
 589b:  8c 00 0a                jump            58a6
 589e:  e1 a7 74 0b 00          storew          g64 local10 #00
 58a3:  8c ff f3                jump            5897
 58a6:  0d 68 00                store           g58 #00
 58a9:  0d 78 00                store           g68 #00
 58ac:  e1 a7 66 61 00          storew          g56 g51 #00
 58b1:  e1 a7 65 61 00          storew          g55 g51 #00
 58b6:  e1 a7 64 61 00          storew          g54 g51 #00
 58bb:  a0 70 59                jz              g60 ~58d5
 58be:  61 7f 90 d5             je              g6f g80 58d5
 58c2:  2d 7f 90                store           g6f g80
 58c5:  a3 7f 00                get_parent      g6f -> sp
 58c8:  4a 00 1b c5             test_attr       sp #1b 58cf
 58cc:  a3 7f 10                get_parent      g6f -> g00
 58cf:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 58d5:  a0 7c d7                jz              g6c 58ed
 58d8:  2d 01 7c                store           local0 g6c
 58db:  a0 56 4b                jz              g46 ~58e7
 58de:  61 90 7f 47             je              g80 g6f ~58e7
 58e2:  41 88 70 c3             je              g78 #70 58e7
 58e6:  bb                      new_line        
 58e7:  0d 7c 00                store           g6c #00
 58ea:  8c 00 25                jump            5910
 58ed:  2d 7f 90                store           g6f g80
 58f0:  0d 70 00                store           g60 #00
 58f3:  a3 7f 00                get_parent      g6f -> sp
 58f6:  4a 00 1b c5             test_attr       sp #1b 58fd
 58fa:  a3 7f 10                get_parent      g6f -> g00
 58fd:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 5903:  a0 56 43                jz              g46 ~5907
 5906:  bb                      new_line        
 5907:  b2 ...                  print           ">"
 590c:  e4 af 7d 7e             read            g6d g6e
 5910:  50 7e 01 81             loadb           g6e #01 -> g71
 5914:  a0 81 51                jz              g71 ~5926
 5917:  b2 ...                  print           "I beg your pardon?"
 5924:  bb                      new_line        
 5925:  b1                      rfalse          
 5926:  2d 05 81                store           local4 g71
 5929:  0d 80 00                store           g70 #00
 592c:  0d 71 00                store           g61 #00
 592f:  0d 60 00                store           g50 #00
 5932:  04 81 00 48             dec_chk         g71 #00 ~593c
 5936:  0d 70 00                store           g60 #00
 5939:  8c 02 35                jump            5b6f
 593c:  6f 7e 01 02             loadw           g6e local0 -> local1
 5940:  a0 02 4c                jz              local1 ~594d
 5943:  e0 2f 2e dc 01 02       call            5db8 local0 -> local1
 5949:  a0 02 82 13             jz              local1 5b5e
 594d:  c1 8f 02 4c 00 4e       je              local1 "to" ~595f
 5953:  41 04 ef 4a             je              local3 #ef ~595f
 5957:  cd 4f 02 3b 3d          store           local1 "~"
 595c:  8c 00 1d                jump            597a
 595f:  c1 8f 02 4b c1 57       je              local1 "then" ~597a
 5965:  a0 04 54                jz              local3 ~597a
 5968:  a0 70 51                jz              g60 ~597a
 596b:  e1 97 74 00 ef          storew          g64 #00 #ef
 5970:  e1 97 74 01 00          storew          g64 #01 #00
 5975:  cd 4f 02 3b 3d          store           local1 "~"
 597a:  c1 83 02 4b c1 3b 2f c8 je              local1 "then" "." 5988
 5982:  c1 8f 02 3b 3d 63       je              local1 "~" ~59a9
 5988:  c1 8f 02 3b 3d 4e       je              local1 "~" ~599a
 598e:  a0 70 c8                jz              g60 5997
 5991:  0d 70 00                store           g60 #00
 5994:  8c 00 05                jump            599a
 5997:  0d 70 01                store           g60 #01
 599a:  a0 81 c6                jz              g71 59a1
 599d:  54 01 02 7c             add             local0 #02 -> g6c
 59a1:  e2 9b 7e 01 81          storeb          g6e #01 g71
 59a6:  8c 01 c8                jump            5b6f
 59a9:  e0 25 2d d5 02 10 03 03 call            5baa local1 #10 #03 -> local2
 59b1:  a0 03 80 65             jz              local2 5a18
 59b5:  c1 97 04 00 f8 00 5e    je              local3 #00 #f8 ~5a18
 59bc:  41 05 01 80 39          je              local4 #01 59f8
 59c1:  41 05 02 46             je              local4 #02 ~59c9
 59c5:  41 04 f8 f1             je              local3 #f8 59f8
 59c9:  54 01 02 00             add             local0 #02 -> sp
 59cd:  6f 7e 00 07             loadw           g6e sp -> local6
 59d1:  c1 80 07 4b c1 3b 2f 3b 3d 46 
                               je              local6 "then" "." "~" ~59df
 59db:  42 05 02 5b             jl              local4 #02 ~59f8
 59df:  a0 70 cc                jz              g60 59ec
 59e2:  41 05 02 48             je              local4 #02 ~59ec
 59e6:  c1 8f 07 3b 3d ce       je              local6 "~" 59f8
 59ec:  43 05 02 6a             jg              local4 #02 ~5a18
 59f0:  c1 83 07 3b 36 3b 98 62 je              local6 "," "and" ~5a18
 59f8:  2d 06 03                store           local5 local2
 59fb:  c1 83 07 3b 36 3b 98 4c je              local6 "," "and" ~5a0d
 5a03:  54 01 02 00             add             local0 #02 -> sp
 5a07:  e1 a3 7e 00 4b c1       storew          g6e sp "then"
 5a0d:  43 05 02 81 55          jg              local4 #02 5b65
 5a12:  0d 70 00                store           g60 #00
 5a15:  8c 01 59                jump            5b6f
 5a18:  e0 25 2d d5 02 40 01 03 call            5baa local1 #40 #01 -> local2
 5a20:  a0 03 f8                jz              local2 5a59
 5a23:  a0 04 75                jz              local3 ~5a59
 5a26:  2d 04 03                store           local3 local2
 5a29:  e1 9b 74 00 03          storew          g64 #00 local2
 5a2e:  e1 9b 74 01 72          storew          g64 #01 g62
 5a33:  e1 9b 72 00 02          storew          g62 #00 local1
 5a38:  56 01 02 00             mul             local0 #02 -> sp
 5a3c:  54 00 02 09             add             sp #02 -> local8
 5a40:  70 7e 09 00             loadb           g6e local8 -> sp
 5a44:  e2 9b 72 02 00          storeb          g62 #02 sp
 5a49:  54 09 01 00             add             local8 #01 -> sp
 5a4d:  70 7e 00 00             loadb           g6e sp -> sp
 5a51:  e2 9b 72 03 00          storeb          g62 #03 sp
 5a56:  8c 01 0e                jump            5b65
 5a59:  e0 25 2d d5 02 08 00 03 call            5baa local1 #08 #00 -> local2
 5a61:  a0 03 62                jz              local2 ~5a84
 5a64:  c1 83 02 3b 7c 46 7a d7 je              local1 "all" "one" 5a81
 5a6c:  e0 27 2d d5 02 20 00    call            5baa local1 #20 -> sp
 5a73:  a0 00 4d                jz              sp ~5a81
 5a76:  e0 27 2d d5 02 80 00    call            5baa local1 #80 -> sp
 5a7d:  a0 00 80 86             jz              sp 5b05
 5a81:  0d 03 00                store           local2 #00
 5a84:  43 81 00 60             jg              g71 #00 ~5aa6
 5a88:  54 01 02 00             add             local0 #02 -> sp
 5a8c:  6f 7e 00 00             loadw           g6e sp -> sp
 5a90:  c1 8f 00 46 50 52       je              sp "of" ~5aa6
 5a96:  a0 03 4f                jz              local2 ~5aa6
 5a99:  c1 80 02 3b 7c 46 7a 3b 44 c5 
                               je              local1 "all" "one" "a" 5aa6
 5aa3:  8c 00 c1                jump            5b65
 5aa6:  a0 03 e7                jz              local2 5ace
 5aa9:  a0 81 d2                jz              g71 5abc
 5aac:  54 01 02 00             add             local0 #02 -> sp
 5ab0:  6f 7e 00 00             loadw           g6e sp -> sp
 5ab4:  c1 83 00 4b c1 3b 2f 54 je              sp "then" "." ~5ace
 5abc:  42 71 02 00 a6          jl              g61 #02 ~5b65
 5ac1:  e1 9b 74 02 03          storew          g64 #02 local2
 5ac6:  e1 9b 74 03 02          storew          g64 #03 local1
 5acb:  8c 00 99                jump            5b65
 5ace:  41 71 02 5d             je              g61 #02 ~5aed
 5ad2:  b2 ...                  print           "There were too many nouns in that sentence."
 5aeb:  bb                      new_line        
 5aec:  b1                      rfalse          
 5aed:  95 71                   inc             g61
 5aef:  e0 2a 2d e8 01 03 02 01 call            5bd0 local0 local2 local1 -> local0
 5af7:  a0 01 c0                jz              local0 rfalse
 5afa:  42 01 00 00 68          jl              local0 #00 ~5b65
 5aff:  0d 70 00                store           g60 #00
 5b02:  8c 00 6c                jump            5b6f
 5b05:  e0 27 2d d5 02 04 00    call            5baa local1 #04 -> sp
 5b0c:  a0 00 c5                jz              sp 5b12
 5b0f:  8c 00 55                jump            5b65
 5b12:  41 04 ef 00 42          je              local3 #ef ~5b57
 5b17:  e0 25 2d d5 02 40 01 00 call            5baa local1 #40 #01 -> sp
 5b1f:  a0 00 f7                jz              sp 5b57
 5b22:  b2 ...                  print           "Please consult your manual for the correct way to talk to other people or creatures."
 5b55:  bb                      new_line        
 5b56:  b1                      rfalse          
 5b57:  e0 2f 30 20 01 00       call            6040 local0 -> sp
 5b5d:  b1                      rfalse          
 5b5e:  e0 2f 2f f8 01 00       call            5ff0 local0 -> sp
 5b64:  b1                      rfalse          
 5b65:  2d 08 02                store           local7 local1
 5b68:  54 01 02 01             add             local0 #02 -> local0
 5b6c:  8c fd c5                jump            5932
 5b6f:  a0 06 cd                jz              local5 5b7d
 5b72:  0d 88 89                store           g78 #89
 5b75:  2d 86 06                store           g76 local5
 5b78:  2d 6f 06                store           g5f local5
 5b7b:  9b 01                   ret             #01
 5b7d:  0d 6f 00                store           g5f #00
 5b80:  a0 79 c7                jz              g69 5b88
 5b83:  e0 3f 2f 21 00          call            5e42 -> sp
 5b88:  e0 3f 30 50 00          call            60a0 -> sp
 5b8d:  a0 00 c0                jz              sp rfalse
 5b90:  e0 3f 32 65 00          call            64ca -> sp
 5b95:  a0 00 c0                jz              sp rfalse
 5b98:  e0 3f 35 cc 00          call            6b98 -> sp
 5b9d:  a0 00 c0                jz              sp rfalse
 5ba0:  e0 3f 35 6c 00          call            6ad8 -> sp
 5ba5:  a0 00 c0                jz              sp rfalse
 5ba8:  b0                      rtrue           

Routine 5baa, 5 locals (0000, 0000, 0005, 0005, 0000)

 5bb5:  50 01 04 05             loadb           local0 #04 -> local4
 5bb9:  67 05 02 40             test            local4 local1 ~rfalse
 5bbd:  43 03 04 c1             jg              local2 #04 rtrue
 5bc1:  49 05 03 05             and             local4 #03 -> local4
 5bc5:  61 05 03 c4             je              local4 local2 5bcb
 5bc9:  95 04                   inc             local3
 5bcb:  70 01 04 00             loadb           local0 local3 -> sp
 5bcf:  b8                      ret_popped      

Routine 5bd0, 10 locals (0000, 0000, 0000, 0000, 0000, 0000, 0001, 0000, 0000, 0000)

 5be5:  55 71 01 00             sub             g61 #01 -> sp
 5be9:  56 00 02 04             mul             sp #02 -> local3
 5bed:  a0 02 db                jz              local1 5c09
 5bf0:  34 02 04 05             add             #02 local3 -> local4
 5bf4:  e1 ab 74 05 02          storew          g64 local4 local1
 5bf9:  54 05 01 00             add             local4 #01 -> sp
 5bfd:  e1 ab 74 00 03          storew          g64 sp local2
 5c02:  54 01 02 01             add             local0 #02 -> local0
 5c06:  8c 00 04                jump            5c0b
 5c09:  95 81                   inc             g71
 5c0b:  a0 81 47                jz              g71 ~5c13
 5c0e:  96 71                   dec             g61
 5c10:  8b ff ff                ret             #ffff
 5c13:  34 06 04 05             add             #06 local3 -> local4
 5c17:  56 01 02 00             mul             local0 #02 -> sp
 5c1b:  74 7e 00 00             add             g6e sp -> sp
 5c1f:  e1 ab 74 05 00          storew          g64 local4 sp
 5c24:  6f 7e 01 00             loadw           g6e local0 -> sp
 5c28:  c1 80 00 4b b3 3b 44 3b 8a 4f 
                               je              sp "the" "a" "an" ~5c3f
 5c32:  6f 74 05 00             loadw           g64 local4 -> sp
 5c36:  54 00 04 00             add             sp #04 -> sp
 5c3a:  e1 ab 74 05 00          storew          g64 local4 sp
 5c3f:  04 81 00 56             dec_chk         g71 #00 ~5c57
 5c43:  54 05 01 0a             add             local4 #01 -> local9
 5c47:  56 01 02 00             mul             local0 #02 -> sp
 5c4b:  74 7e 00 00             add             g6e sp -> sp
 5c4f:  e1 ab 74 0a 00          storew          g64 local9 sp
 5c54:  8b ff ff                ret             #ffff
 5c57:  6f 7e 01 03             loadw           g6e local0 -> local2
 5c5b:  a0 03 4c                jz              local2 ~5c68
 5c5e:  e0 2f 2e dc 01 03       call            5db8 local0 -> local2
 5c64:  a0 03 81 3e             jz              local2 5da4
 5c68:  a0 81 48                jz              g71 ~5c71
 5c6b:  0d 08 00                store           local7 #00
 5c6e:  8c 00 0a                jump            5c79
 5c71:  54 01 02 00             add             local0 #02 -> sp
 5c75:  6f 7e 00 08             loadw           g6e sp -> local7
 5c79:  c1 83 03 3b 98 3b 36 48 je              local2 "and" "," ~5c87
 5c81:  0d 06 01                store           local5 #01
 5c84:  8c 01 26                jump            5dab
 5c87:  c1 83 03 3b 7c 46 7a 52 je              local2 "all" "one" ~5c9f
 5c8f:  c1 8f 08 46 50 01 17    je              local7 "of" ~5dab
 5c96:  96 81                   dec             g71
 5c98:  54 01 02 01             add             local0 #02 -> local0
 5c9c:  8c 01 0e                jump            5dab
 5c9f:  c1 83 03 4b c1 3b 2f d6 je              local2 "then" "." 5cbb
 5ca7:  e0 27 2d d5 03 08 00    call            5baa local2 #08 -> sp
 5cae:  a0 00 e5                jz              sp 5cd4
 5cb1:  4f 74 00 00             loadw           g64 #00 -> sp
 5cb5:  a0 00 de                jz              sp 5cd4
 5cb8:  a0 07 5b                jz              local6 ~5cd4
 5cbb:  95 81                   inc             g71
 5cbd:  54 05 01 0a             add             local4 #01 -> local9
 5cc1:  56 01 02 00             mul             local0 #02 -> sp
 5cc5:  74 7e 00 00             add             g6e sp -> sp
 5cc9:  e1 ab 74 0a 00          storew          g64 local9 sp
 5cce:  55 01 02 00             sub             local0 #02 -> sp
 5cd2:  ab 00                   ret             sp
 5cd4:  e0 27 2d d5 03 80 00    call            5baa local2 #80 -> sp
 5cdb:  a0 00 80 62             jz              sp 5d3f
 5cdf:  43 81 00 53             jg              g71 #00 ~5cf4
 5ce3:  c1 8f 08 46 50 4d       je              local7 "of" ~5cf4
 5ce9:  c1 83 03 3b 7c 46 7a c5 je              local2 "all" "one" 5cf4
 5cf1:  8c 00 b9                jump            5dab
 5cf4:  e0 25 2d d5 03 20 02 00 call            5baa local2 #20 #02 -> sp
 5cfc:  a0 00 d2                jz              sp 5d0f
 5cff:  a0 08 cf                jz              local7 5d0f
 5d02:  e0 27 2d d5 08 80 00    call            5baa local7 #80 -> sp
 5d09:  a0 00 c5                jz              sp 5d0f
 5d0c:  8c 00 9e                jump            5dab
 5d0f:  a0 06 69                jz              local5 ~5d39
 5d12:  c1 83 08 3d 97 40 61 e1 je              local7 "but" "except" 5d39
 5d1a:  c1 83 08 3b 98 3b 36 d9 je              local7 "and" "," 5d39
 5d22:  54 05 01 0a             add             local4 #01 -> local9
 5d26:  54 01 02 00             add             local0 #02 -> sp
 5d2a:  56 00 02 00             mul             sp #02 -> sp
 5d2e:  74 7e 00 00             add             g6e sp -> sp
 5d32:  e1 ab 74 0a 00          storew          g64 local9 sp
 5d37:  ab 01                   ret             local0
 5d39:  0d 06 00                store           local5 #00
 5d3c:  8c 00 6e                jump            5dab
 5d3f:  a0 78 4c                jz              g68 ~5d4c
 5d42:  a0 79 49                jz              g69 ~5d4c
 5d45:  4f 74 00 00             loadw           g64 #00 -> sp
 5d49:  a0 00 da                jz              sp 5d64
 5d4c:  e0 27 2d d5 03 20 00    call            5baa local2 #20 -> sp
 5d53:  a0 00 00 56             jz              sp ~5dab
 5d57:  e0 27 2d d5 03 04 00    call            5baa local2 #04 -> sp
 5d5e:  a0 00 c5                jz              sp 5d64
 5d61:  8c 00 49                jump            5dab
 5d64:  a0 06 eb                jz              local5 5d90
 5d67:  e0 27 2d d5 03 10 00    call            5baa local2 #10 -> sp
 5d6e:  a0 00 4c                jz              sp ~5d7b
 5d71:  e0 27 2d d5 03 40 00    call            5baa local2 #40 -> sp
 5d78:  a0 00 d7                jz              sp 5d90
 5d7b:  55 01 04 01             sub             local0 #04 -> local0
 5d7f:  54 01 02 00             add             local0 #02 -> sp
 5d83:  e1 a3 7e 00 4b c1       storew          g6e sp "then"
 5d89:  54 81 02 81             add             g71 #02 -> g71
 5d8d:  8c 00 1d                jump            5dab
 5d90:  e0 27 2d d5 03 08 00    call            5baa local2 #08 -> sp
 5d97:  a0 00 c5                jz              sp 5d9d
 5d9a:  8c 00 10                jump            5dab
 5d9d:  e0 2f 30 20 01 00       call            6040 local0 -> sp
 5da3:  b1                      rfalse          
 5da4:  e0 2f 2f f8 01 00       call            5ff0 local0 -> sp
 5daa:  b1                      rfalse          
 5dab:  2d 09 03                store           local8 local2
 5dae:  0d 07 00                store           local6 #00
 5db1:  54 01 02 01             add             local0 #02 -> local0
 5db5:  8c fe 89                jump            5c3f

Routine 5db8, 7 locals (0000, 0000, 0000, 0000, 0000, 0000, 0000)

 5dc7:  56 01 02 00             mul             local0 #02 -> sp
 5dcb:  74 7e 00 00             add             g6e sp -> sp
 5dcf:  50 00 02 02             loadb           sp #02 -> local1
 5dd3:  56 01 02 00             mul             local0 #02 -> sp
 5dd7:  74 7e 00 00             add             g6e sp -> sp
 5ddb:  50 00 03 03             loadb           sp #03 -> local2
 5ddf:  04 02 00 45             dec_chk         local1 #00 ~5de6
 5de3:  8c 00 32                jump            5e16
 5de6:  70 7d 03 04             loadb           g6d local2 -> local3
 5dea:  41 04 3a 4b             je              local3 #3a ~5df7
 5dee:  2d 06 05                store           local5 local4
 5df1:  0d 05 00                store           local4 #00
 5df4:  8c 00 1c                jump            5e11
 5df7:  c3 8f 05 27 10 c0       jg              local4 #2710 rfalse
 5dfd:  42 04 3a 40             jl              local3 #3a ~rfalse
 5e01:  43 04 2f 40             jg              local3 #2f ~rfalse
 5e05:  56 05 0a 07             mul             local4 #0a -> local6
 5e09:  55 04 30 00             sub             local3 #30 -> sp
 5e0d:  74 07 00 05             add             local6 sp -> local4
 5e11:  95 03                   inc             local2
 5e13:  8c ff cb                jump            5ddf
 5e16:  e1 a3 7e 01 43 a9       storew          g6e local0 "intnum"
 5e1c:  c3 8f 05 03 e8 c0       jg              local4 #03e8 rfalse
 5e22:  a0 06 d9                jz              local5 5e3c
 5e25:  42 06 08 49             jl              local5 #08 ~5e30
 5e29:  54 06 0c 06             add             local5 #0c -> local5
 5e2d:  8c 00 06                jump            5e34
 5e30:  43 06 17 c0             jg              local5 #17 rfalse
 5e34:  56 06 3c 00             mul             local5 #3c -> sp
 5e38:  74 05 00 05             add             local4 sp -> local4
 5e3c:  2d 6e 05                store           g5e local4
 5e3f:  8b 43 a9                ret             "intnum"

Routine 5e42, 8 locals (ffff, 0000, 0000, 0000, 0000, 0000, 0000, 0000)

 5e53:  0d 79 00                store           g69 #00
 5e56:  4f 74 01 00             loadw           g64 #01 -> sp
 5e5a:  4f 00 00 00             loadw           sp #00 -> sp
 5e5e:  e0 25 2d d5 00 20 02 00 call            5baa sp #20 #02 -> sp
 5e66:  a0 00 c5                jz              sp 5e6c
 5e69:  0d 06 01                store           local5 #01
 5e6c:  4f 74 00 03             loadw           g64 #00 -> local2
 5e70:  a0 03 cd                jz              local2 5e7e
 5e73:  a0 06 4a                jz              local5 ~5e7e
 5e76:  4f 73 00 00             loadw           g63 #00 -> sp
 5e7a:  61 03 00 40             je              local2 sp ~rfalse
 5e7e:  41 71 02 c0             je              g61 #02 rfalse
 5e82:  4f 73 06 00             loadw           g63 #06 -> sp
 5e86:  41 00 01 00 3e          je              sp #01 ~5ec7
 5e8b:  4f 74 02 02             loadw           g64 #02 -> local1
 5e8f:  4f 73 02 00             loadw           g63 #02 -> sp
 5e93:  61 02 00 c5             je              local1 sp 5e9a
 5e97:  a0 02 40                jz              local1 ~rfalse
 5e9a:  a0 06 d7                jz              local5 5eb2
 5e9d:  54 7e 02 00             add             g6e #02 -> sp
 5ea1:  e1 9b 73 06 00          storew          g63 #06 sp
 5ea6:  54 7e 06 00             add             g6e #06 -> sp
 5eaa:  e1 9b 73 07 00          storew          g63 #07 sp
 5eaf:  8c 00 eb                jump            5f9b
 5eb2:  4f 74 06 00             loadw           g64 #06 -> sp
 5eb6:  e1 9b 73 06 00          storew          g63 #06 sp
 5ebb:  4f 74 07 00             loadw           g64 #07 -> sp
 5ebf:  e1 9b 73 07 00          storew          g63 #07 sp
 5ec4:  8c 00 d6                jump            5f9b
 5ec7:  4f 73 08 00             loadw           g63 #08 -> sp
 5ecb:  41 00 01 00 3e          je              sp #01 ~5f0c
 5ed0:  4f 74 02 02             loadw           g64 #02 -> local1
 5ed4:  4f 73 04 00             loadw           g63 #04 -> sp
 5ed8:  61 02 00 c5             je              local1 sp 5edf
 5edc:  a0 02 40                jz              local1 ~rfalse
 5edf:  a0 06 d4                jz              local5 5ef4
 5ee2:  54 7e 02 00             add             g6e #02 -> sp
 5ee6:  e1 9b 74 06 00          storew          g64 #06 sp
 5eeb:  54 7e 06 00             add             g6e #06 -> sp
 5eef:  e1 9b 74 07 00          storew          g64 #07 sp
 5ef4:  4f 74 06 00             loadw           g64 #06 -> sp
 5ef8:  e1 9b 73 08 00          storew          g63 #08 sp
 5efd:  4f 74 07 00             loadw           g64 #07 -> sp
 5f01:  e1 9b 73 09 00          storew          g63 #09 sp
 5f06:  0d 71 02                store           g61 #02
 5f09:  8c 00 91                jump            5f9b
 5f0c:  a0 77 80 8d             jz              g67 5f9b
 5f10:  41 71 01 c9             je              g61 #01 5f1b
 5f14:  a0 06 46                jz              local5 ~5f1b
 5f17:  0d 77 00                store           g67 #00
 5f1a:  b1                      rfalse          
 5f1b:  4f 74 06 04             loadw           g64 #06 -> local3
 5f1f:  a0 06 c9                jz              local5 5f29
 5f22:  54 7e 02 04             add             g6e #02 -> local3
 5f26:  0d 06 00                store           local5 #00
 5f29:  4f 74 07 05             loadw           g64 #07 -> local4
 5f2d:  4f 04 00 07             loadw           local3 #00 -> local6
 5f31:  61 04 05 52             je              local3 local4 ~5f45
 5f35:  a0 06 cb                jz              local5 5f41
 5f38:  e0 2f 2f d8 06 00       call            5fb0 local5 -> sp
 5f3e:  8c 00 5c                jump            5f9b
 5f41:  0d 77 00                store           g67 #00
 5f44:  b1                      rfalse          
 5f45:  a0 06 58                jz              local5 ~5f5e
 5f48:  50 07 04 00             loadb           local6 #04 -> sp
 5f4c:  47 00 20 ca             test            sp #20 5f58
 5f50:  c1 83 07 3b 7c 46 7a 48 je              local6 "all" "one" ~5f5e
 5f58:  2d 06 07                store           local5 local6
 5f5b:  8c 00 20                jump            5f7c
 5f5e:  50 07 04 00             loadb           local6 #04 -> sp
 5f62:  47 00 80 c8             test            sp #80 5f6c
 5f66:  c1 8f 07 46 7a 52       je              local6 "one" ~5f7c
 5f6c:  c1 a3 07 76 46 7a 40    je              local6 g66 "one" ~rfalse
 5f73:  e0 2f 2f d8 06 00       call            5fb0 local5 -> sp
 5f79:  8c 00 21                jump            5f9b
 5f7c:  54 04 04 04             add             local3 #04 -> local3
 5f80:  a0 05 3f ab             jz              local4 ~5f2d
 5f84:  2d 05 04                store           local4 local3
 5f87:  0d 71 01                store           g61 #01
 5f8a:  55 04 04 00             sub             local3 #04 -> sp
 5f8e:  e1 9b 74 06 00          storew          g64 #06 sp
 5f93:  e1 9b 74 07 04          storew          g64 #07 local3
 5f98:  8c ff 94                jump            5f2d
 5f9b:  05 01 09 46             inc_chk         local0 #09 ~5fa3
 5f9f:  0d 78 01                store           g68 #01
 5fa2:  b0                      rtrue           
 5fa3:  6f 73 01 00             loadw           g63 local0 -> sp
 5fa7:  e1 ab 74 01 00          storew          g64 local0 sp
 5fac:  8c ff ee                jump            5f9b

Routine 5fb0, 1 local (0000)

 5fb3:  4f 73 00 00             loadw           g63 #00 -> sp
 5fb7:  e1 9b 74 00 00          storew          g64 #00 sp
 5fbc:  2d 82 73                store           g72 g63
 5fbf:  54 77 01 00             add             g67 #01 -> sp
 5fc3:  e0 2a 31 cf 77 00 01 00 call            639e g67 sp local0 -> sp
 5fcb:  4f 73 08 00             loadw           g63 #08 -> sp
 5fcf:  a0 00 c5                jz              sp 5fd5
 5fd2:  0d 71 02                store           g61 #02
 5fd5:  0d 77 00                store           g67 #00
 5fd8:  b0                      rtrue           

Routine 5fda, 2 locals (0000, 0000)

 5fdf:  04 01 00 c1             dec_chk         local0 #00 rtrue
 5fe3:  70 7d 02 00             loadb           g6d local1 -> sp
 5fe7:  e5 bf 00                print_char      sp
 5fea:  95 02                   inc             local1
 5fec:  8c ff f2                jump            5fdf

Routine 5ff0, 3 locals (0000, 0000, 0000)

 5ff7:  41 88 70 51             je              g78 #70 ~600a
 5ffb:  b2 ...                  print           "Nothing happens."
 6008:  bb                      new_line        
 6009:  b1                      rfalse          
 600a:  b2 ...                  print           "I don't know the word ~"
 6017:  56 01 02 02             mul             local0 #02 -> local1
 601b:  74 7e 02 00             add             g6e local1 -> sp
 601f:  50 00 02 03             loadb           sp #02 -> local2
 6023:  74 7e 02 00             add             g6e local1 -> sp
 6027:  50 00 03 00             loadb           sp #03 -> sp
 602b:  e0 2b 2f ed 03 00 00    call            5fda local2 sp -> sp
 6032:  b2 ...                  print           "~."
 6037:  bb                      new_line        
 6038:  0d 70 00                store           g60 #00
 603b:  0d 79 00                store           g69 #00
 603e:  ab 79                   ret             g69

Routine 6040, 3 locals (0000, 0000, 0000)

 6047:  41 88 70 51             je              g78 #70 ~605a
 604b:  b2 ...                  print           "Nothing happens."
 6058:  bb                      new_line        
 6059:  b1                      rfalse          
 605a:  b2 ...                  print           "You used the word ~"
 6067:  56 01 02 02             mul             local0 #02 -> local1
 606b:  74 7e 02 00             add             g6e local1 -> sp
 606f:  50 00 02 03             loadb           sp #02 -> local2
 6073:  74 7e 02 00             add             g6e local1 -> sp
 6077:  50 00 03 00             loadb           sp #03 -> sp
 607b:  e0 2b 2f ed 03 00 00    call            5fda local2 sp -> sp
 6082:  b2 ...                  print           "~ in a way that I don't understand."
 6097:  bb                      new_line        
 6098:  0d 70 00                store           g60 #00
 609b:  0d 79 00                store           g69 #00
 609e:  ab 79                   ret             g69

Routine 60a0, 11 locals (0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000)

 60b7:  4f 74 00 08             loadw           g64 #00 -> local7
 60bb:  a0 08 59                jz              local7 ~60d5
 60be:  b2 ...                  print           "There was no verb in that sentence!"
 60d3:  bb                      new_line        
 60d4:  b1                      rfalse          
 60d5:  35 ff 08 00             sub             #ff local7 -> sp
 60d9:  6f ad 00 01             loadw           g9d sp -> local0
 60dd:  50 01 00 02             loadb           local0 #00 -> local1
 60e1:  34 01 01 01             add             #01 local0 -> local0
 60e5:  50 01 00 00             loadb           local0 #00 -> sp
 60e9:  49 00 03 03             and             sp #03 -> local2
 60ed:  63 71 03 45             jg              g61 local2 ~60f4
 60f1:  8c 00 4b                jump            613d
 60f4:  42 03 01 da             jl              local2 #01 6110
 60f8:  a0 71 57                jz              g61 ~6110
 60fb:  4f 74 02 07             loadw           g64 #02 -> local6
 60ff:  a0 07 ca                jz              local6 610a
 6102:  50 01 01 00             loadb           local0 #01 -> sp
 6106:  61 07 00 48             je              local6 sp ~6110
 610a:  2d 05 01                store           local4 local0
 610d:  8c 00 2f                jump            613d
 6110:  50 01 01 0b             loadb           local0 #01 -> local10
 6114:  4f 74 02 00             loadw           g64 #02 -> sp
 6118:  61 0b 00 63             je              local10 sp ~613d
 611c:  41 03 02 4c             je              local2 #02 ~612a
 6120:  41 71 01 48             je              g61 #01 ~612a
 6124:  2d 06 01                store           local5 local0
 6127:  8c 00 15                jump            613d
 612a:  50 01 02 0b             loadb           local0 #02 -> local10
 612e:  4f 74 04 00             loadw           g64 #04 -> sp
 6132:  61 0b 00 49             je              local10 sp ~613d
 6136:  e0 2f 32 25 01 00       call            644a local0 -> sp
 613c:  b0                      rtrue           
 613d:  04 02 01 68             dec_chk         local1 #01 ~6167
 6141:  a0 05 6c                jz              local4 ~616e
 6144:  a0 06 c5                jz              local5 614a
 6147:  8c 00 26                jump            616e
 614a:  b2 ...                  print           "That sentence isn't one I recognize."
 6165:  bb                      new_line        
 6166:  b1                      rfalse          
 6167:  54 01 08 01             add             local0 #08 -> local0
 616b:  8c ff 79                jump            60e5
 616e:  a0 05 ea                jz              local4 6199
 6171:  50 05 03 0a             loadb           local4 #03 -> local9
 6175:  50 05 05 0b             loadb           local4 #05 -> local10
 6179:  50 05 01 00             loadb           local4 #01 -> sp
 617d:  e0 2a 32 2b 0a 0b 00 04 call            6456 local9 local10 sp -> local3
 6185:  a0 04 d3                jz              local3 6199
 6188:  e1 a7 66 61 01          storew          g56 g51 #01
 618d:  e1 9b 66 01 04          storew          g56 #01 local3
 6192:  e0 2f 32 25 05 00       call            644a local4 -> sp
 6198:  b8                      ret_popped      
 6199:  a0 06 ea                jz              local5 61c4
 619c:  50 06 04 0a             loadb           local5 #04 -> local9
 61a0:  50 06 06 0b             loadb           local5 #06 -> local10
 61a4:  50 06 02 00             loadb           local5 #02 -> sp
 61a8:  e0 2a 32 2b 0a 0b 00 04 call            6456 local9 local10 sp -> local3
 61b0:  a0 04 d3                jz              local3 61c4
 61b3:  e1 a7 65 61 01          storew          g55 g51 #01
 61b8:  e1 9b 65 01 04          storew          g55 #01 local3
 61bd:  e0 2f 32 25 06 00       call            644a local5 -> sp
 61c3:  b8                      ret_popped      
 61c4:  41 08 ac 59             je              local7 #ac ~61df
 61c8:  b2 ...                  print           "That question can't be answered."
 61dd:  bb                      new_line        
 61de:  b1                      rfalse          
 61df:  61 7f 90 c8             je              g6f g80 61e9
 61e3:  e0 3f 31 2b 00          call            6256 -> sp
 61e8:  b8                      ret_popped      
 61e9:  e0 2b 31 3c 05 06 00    call            6278 local4 local5 -> sp
 61f0:  b2 ...                  print           "What do you want to "
 61fd:  4f 73 01 09             loadw           g63 #01 -> local8
 6201:  a0 09 4a                jz              local8 ~620c
 6204:  b2 ...                  print           "tell"
 6209:  8c 00 26                jump            6230
 620c:  50 72 02 00             loadb           g62 #02 -> sp
 6210:  a0 00 4b                jz              sp ~621c
 6213:  4f 09 00 00             loadw           local8 #00 -> sp
 6217:  a7 00                   print_addr      sp
 6219:  8c 00 16                jump            6230
 621c:  50 09 02 0b             loadb           local8 #02 -> local10
 6220:  50 09 03 00             loadb           local8 #03 -> sp
 6224:  e0 2b 2f ed 0b 00 00    call            5fda local10 sp -> sp
 622b:  e2 97 72 02 00          storeb          g62 #02 #00
 6230:  a0 06 c9                jz              local5 623a
 6233:  e0 17 31 6a 06 07 00    call            62d4 #06 #07 -> sp
 623a:  0d 79 01                store           g69 #01
 623d:  a0 05 c9                jz              local4 6247
 6240:  50 05 01 00             loadb           local4 #01 -> sp
 6244:  8c 00 06                jump            624b
 6247:  50 06 02 00             loadb           local5 #02 -> sp
 624b:  e0 2f 31 c5 00 00       call            638a sp -> sp
 6251:  b2 ...                  print           "?"
 6254:  bb                      new_line        
 6255:  b1                      rfalse          

Routine 6256, 0 locals ()

 6257:  b2 ...                  print           "~I don't understand! What are you referring to?~"
 6276:  bb                      new_line        
 6277:  b1                      rfalse          

Routine 6278, 3 locals (0000, 0000, ffff)

 627f:  e1 a7 62 61 00          storew          g52 g51 #00
 6284:  2d 82 74                store           g72 g64
 6287:  05 03 09 45             inc_chk         local2 #09 ~628e
 628b:  8c 00 0e                jump            629a
 628e:  6f 74 03 00             loadw           g64 local2 -> sp
 6292:  e1 ab 73 03 00          storew          g63 local2 sp
 6297:  8c ff ef                jump            6287
 629a:  41 71 02 49             je              g61 #02 ~62a5
 629e:  e0 17 31 cf 08 09 00    call            639e #08 #09 -> sp
 62a5:  42 71 01 c9             jl              g61 #01 62b0
 62a9:  e0 17 31 cf 06 07 00    call            639e #06 #07 -> sp
 62b0:  a0 01 d1                jz              local0 62c2
 62b3:  50 01 01 00             loadb           local0 #01 -> sp
 62b7:  e1 9b 73 02 00          storew          g63 #02 sp
 62bc:  e1 97 73 06 01          storew          g63 #06 #01
 62c1:  b0                      rtrue           
 62c2:  a0 02 c0                jz              local1 rfalse
 62c5:  50 02 02 00             loadb           local1 #02 -> sp
 62c9:  e1 9b 73 04 00          storew          g63 #04 sp
 62ce:  e1 97 73 08 01          storew          g63 #08 #01
 62d3:  b0                      rtrue           

Routine 62d4, 4 locals (0000, 0000, 0001, 0000)

 62dd:  6f 74 01 04             loadw           g64 local0 -> local3
 62e1:  6f 74 02 00             loadw           g64 local1 -> sp
 62e5:  e0 2a 31 77 04 00 03 00 call            62ee local3 sp local2 -> sp
 62ed:  b8                      ret_popped      

Routine 62ee, 8 locals (0000, 0000, 0000, 0000, 0000, 0001, 0000, 0000)

 62ff:  61 01 02 c1             je              local0 local1 rtrue
 6303:  a0 04 c8                jz              local3 630c
 6306:  0d 04 00                store           local3 #00
 6309:  8c 00 05                jump            630f
 630c:  b2 ...                  print           " "
 630f:  4f 01 00 05             loadw           local0 #00 -> local4
 6313:  c1 8f 05 3b 2f 48       je              local4 "." ~631f
 6319:  0d 04 01                store           local3 #01
 631c:  8c 00 3a                jump            6357
 631f:  a0 06 cb                jz              local5 632b
 6322:  a0 07 48                jz              local6 ~632b
 6325:  a0 03 c5                jz              local2 632b
 6328:  b2 ...                  print           "the "
 632b:  a0 79 45                jz              g69 ~6331
 632e:  a0 78 c7                jz              g68 6336
 6331:  a7 05                   print_addr      local4
 6333:  8c 00 20                jump            6354
 6336:  c1 8f 05 43 cc 4b       je              local4 "it" ~6345
 633c:  61 7a 10 47             je              g6a g00 ~6345
 6340:  aa 7b                   print_obj       g6b
 6342:  8c 00 11                jump            6354
 6345:  50 01 02 08             loadb           local0 #02 -> local7
 6349:  50 01 03 00             loadb           local0 #03 -> sp
 634d:  e0 2b 2f ed 08 00 00    call            5fda local7 sp -> sp
 6354:  0d 06 00                store           local5 #00
 6357:  54 01 04 01             add             local0 #04 -> local0
 635b:  8c ff a3                jump            62ff

Routine 635e, 2 locals (0000, 0000)

 6363:  50 01 03 00             loadb           local0 #03 -> sp
 6367:  70 7d 00 00             loadb           g6d sp -> sp
 636b:  55 00 20 00             sub             sp #20 -> sp
 636f:  e5 bf 00                print_char      sp
 6372:  50 01 02 00             loadb           local0 #02 -> sp
 6376:  55 00 01 02             sub             sp #01 -> local1
 637a:  50 01 03 00             loadb           local0 #03 -> sp
 637e:  54 00 01 00             add             sp #01 -> sp
 6382:  e0 2b 2f ed 02 00 00    call            5fda local1 sp -> sp
 6389:  b8                      ret_popped      

Routine 638a, 2 locals (0000, 0000)

 638f:  a0 01 c0                jz              local0 rfalse
 6392:  b2 ...                  print           " "
 6395:  e0 2f 32 12 01 02       call            6424 local0 -> local1
 639b:  a7 02                   print_addr      local1
 639d:  b0                      rtrue           

Routine 639e, 5 locals (0000, 0000, 0000, 0000, 0000)

 63a9:  6f 82 01 04             loadw           g72 local0 -> local3
 63ad:  6f 82 02 05             loadw           g72 local1 -> local4
 63b1:  6f 62 61 00             loadw           g52 g51 -> sp
 63b5:  56 00 02 00             mul             sp #02 -> sp
 63b9:  54 00 02 00             add             sp #02 -> sp
 63bd:  74 62 00 00             add             g52 sp -> sp
 63c1:  e1 ab 73 01 00          storew          g63 local0 sp
 63c6:  61 04 05 58             je              local3 local4 ~63e0
 63ca:  6f 62 61 00             loadw           g52 g51 -> sp
 63ce:  56 00 02 00             mul             sp #02 -> sp
 63d2:  54 00 02 00             add             sp #02 -> sp
 63d6:  74 62 00 00             add             g52 sp -> sp
 63da:  e1 ab 73 02 00          storew          g63 local1 sp
 63df:  b0                      rtrue           
 63e0:  a0 03 d0                jz              local2 63f1
 63e3:  4f 04 00 00             loadw           local3 #00 -> sp
 63e7:  61 76 00 48             je              g66 sp ~63f1
 63eb:  e0 2f 32 01 03 00       call            6402 local2 -> sp
 63f1:  4f 04 00 00             loadw           local3 #00 -> sp
 63f5:  e0 2f 32 01 00 00       call            6402 sp -> sp
 63fb:  54 04 04 04             add             local3 #04 -> local3
 63ff:  8c ff c6                jump            63c6

Routine 6402, 2 locals (0000, 0000)

 6407:  6f 62 61 00             loadw           g52 g51 -> sp
 640b:  54 00 02 02             add             sp #02 -> local1
 640f:  55 02 01 00             sub             local1 #01 -> sp
 6413:  e1 ab 62 00 01          storew          g52 sp local0
 6418:  e1 a7 62 02 00          storew          g52 local1 #00
 641d:  e1 ab 62 61 02          storew          g52 g51 local1
 6422:  b0                      rtrue           

Routine 6424, 3 locals (0000, 0000, 0000)

 642b:  4f aa 00 00             loadw           g9a #00 -> sp
 642f:  56 00 02 03             mul             sp #02 -> local2
 6433:  25 02 03 c0             inc_chk         local1 local2 rfalse
 6437:  6f aa 02 00             loadw           g9a local1 -> sp
 643b:  61 00 01 3f f5          je              sp local0 ~6433
 6440:  55 02 01 00             sub             local1 #01 -> sp
 6444:  6f aa 00 00             loadw           g9a sp -> sp
 6448:  ab 00                   ret             sp

Routine 644a, 1 local (0000)

 644d:  2d 83 01                store           g73 local0
 6450:  50 01 07 88             loadb           local0 #07 -> g78
 6454:  ab 88                   ret             g78

Routine 6456, 4 locals (0000, 0000, 0000, 0000)

 645f:  41 01 12 44             je              local0 #12 ~6465
 6463:  9b 52                   ret             #52
 6465:  2d 6b 01                store           g5b local0
 6468:  2d 6c 02                store           g5c local1
 646b:  e1 a7 63 61 00          storew          g53 g51 #00
 6470:  e0 27 33 61 63 00 00    call            66c2 g53 #00 -> sp
 6477:  a0 00 80 4c             jz              sp 64c5
 647b:  0d 6b 00                store           g5b #00
 647e:  6f 63 61 00             loadw           g53 g51 -> sp
 6482:  41 00 01 40             je              sp #01 ~rfalse
 6486:  4f 63 01 04             loadw           g53 #01 -> local3
 648a:  41 04 05 c0             je              local3 #05 rfalse
 648e:  b2 ...                  print           "("
 6491:  a0 03 e7                jz              local2 64b9
 6494:  e0 2f 32 12 03 03       call            6424 local2 -> local2
 649a:  a7 03                   print_addr      local2
 649c:  c1 8f 03 46 9d 45       je              local2 "out" ~64a5
 64a2:  b2 ...                  print           " of"
 64a5:  41 04 01 4f             je              local3 #01 ~64b6
 64a9:  b2 ...                  print           " your hands)"
 64b2:  bb                      new_line        
 64b3:  8c 00 05                jump            64b9
 64b6:  b2 ...                  print           " the "
 64b9:  41 04 01 c8             je              local3 #01 64c3
 64bd:  aa 04                   print_obj       local3
 64bf:  b2 ...                  print           ")"
 64c2:  bb                      new_line        
 64c3:  ab 04                   ret             local3
 64c5:  0d 6b 00                store           g5b #00
 64c8:  b1                      rfalse          

Routine 64ca, 1 local (0000)

 64cd:  4f 74 06 01             loadw           g64 #06 -> local0
 64d1:  a0 01 e2                jz              local0 64f4
 64d4:  50 83 05 6c             loadb           g73 #05 -> g5c
 64d8:  4f 74 07 00             loadw           g64 #07 -> sp
 64dc:  e0 2a 32 bd 01 00 66 00 call            657a local0 sp g56 -> sp
 64e4:  a0 00 c0                jz              sp rfalse
 64e7:  6f 64 61 00             loadw           g54 g51 -> sp
 64eb:  a0 00 c8                jz              sp 64f4
 64ee:  e0 2f 32 96 66 66       call            652c g56 -> g56
 64f4:  4f 74 08 01             loadw           g64 #08 -> local0
 64f8:  a0 01 c1                jz              local0 rtrue
 64fb:  50 83 06 6c             loadb           g73 #06 -> g5c
 64ff:  4f 74 09 00             loadw           g64 #09 -> sp
 6503:  e0 2a 32 bd 01 00 65 00 call            657a local0 sp g55 -> sp
 650b:  a0 00 c0                jz              sp rfalse
 650e:  6f 64 61 00             loadw           g54 g51 -> sp
 6512:  a0 00 c1                jz              sp rtrue
 6515:  6f 65 61 00             loadw           g55 g51 -> sp
 6519:  41 00 01 49             je              sp #01 ~6524
 651d:  e0 2f 32 96 66 66       call            652c g56 -> g56
 6523:  b0                      rtrue           
 6524:  e0 2f 32 96 65 65       call            652c g55 -> g55
 652a:  b0                      rtrue           

Routine 652c, 7 locals (0000, 0000, 0000, 0001, 0000, 0000, 0000)

 653b:  6f 01 61 02             loadw           local0 g51 -> local1
 653f:  e1 a7 63 61 00          storew          g53 g51 #00
 6544:  04 02 00 45             dec_chk         local1 #00 ~654b
 6548:  8c 00 23                jump            656c
 654b:  6f 01 04 06             loadw           local0 local3 -> local5
 654f:  e0 2b 36 11 06 64 00    call            6c22 local5 g54 -> sp
 6556:  a0 00 c5                jz              sp 655c
 6559:  8c 00 0d                jump            6567
 655c:  54 05 01 00             add             local4 #01 -> sp
 6560:  e1 ab 63 00 06          storew          g53 sp local5
 6565:  95 05                   inc             local4
 6567:  95 04                   inc             local3
 6569:  8c ff da                jump            6544
 656c:  e1 ab 63 61 05          storew          g53 g51 local4
 6571:  2d 07 63                store           local6 g53
 6574:  2d 63 01                store           g53 local0
 6577:  ab 07                   ret             local6

Routine 657a, 8 locals (0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000)

 658b:  0d 60 00                store           g50 #00
 658e:  2d 5f 01                store           g4f local0
 6591:  2d 5e 02                store           g4e local1
 6594:  0d 5d 00                store           g4d #00
 6597:  e1 a7 64 61 00          storew          g54 g51 #00
 659c:  e1 a7 03 61 00          storew          local2 g51 #00
 65a1:  4f 01 00 07             loadw           local0 #00 -> local6
 65a5:  61 01 02 56             je              local0 local1 ~65bd
 65a9:  a0 04 c8                jz              local3 65b2
 65ac:  e8 bf 04                push            local3
 65af:  8c 00 05                jump            65b5
 65b2:  e8 bf 03                push            local2
 65b5:  e0 2f 33 61 00 00       call            66c2 sp -> sp
 65bb:  ab 00                   ret             sp
 65bd:  4f 01 02 08             loadw           local0 #02 -> local7
 65c1:  c1 8f 07 3b 7c 53       je              local6 "all" ~65d8
 65c7:  0d 60 01                store           g50 #01
 65ca:  c1 8f 08 46 50 00 e4    je              local7 "of" ~66b3
 65d1:  54 01 04 01             add             local0 #04 -> local0
 65d5:  8c 00 dd                jump            66b3
 65d8:  c1 83 07 3d 97 40 61 62 je              local6 "but" "except" ~6600
 65e0:  a0 04 c8                jz              local3 65e9
 65e3:  e8 bf 04                push            local3
 65e6:  8c 00 05                jump            65ec
 65e9:  e8 bf 03                push            local2
 65ec:  e0 2f 33 61 00 00       call            66c2 sp -> sp
 65f2:  a0 00 c0                jz              sp rfalse
 65f5:  2d 04 64                store           local3 g54
 65f8:  e1 a7 04 61 00          storew          local3 g51 #00
 65fd:  8c 00 b5                jump            66b3
 6600:  c1 83 07 3b 44 46 7a 74 je              local6 "a" "one" ~663a
 6608:  a0 69 53                jz              g59 ~661c
 660b:  0d 60 02                store           g50 #02
 660e:  c1 8f 08 46 50 00 a0    je              local7 "of" ~66b3
 6615:  54 01 04 01             add             local0 #04 -> local0
 6619:  8c 00 99                jump            66b3
 661c:  2d 6a 84                store           g5a g74
 661f:  a0 04 c8                jz              local3 6628
 6622:  e8 bf 04                push            local3
 6625:  8c 00 05                jump            662b
 6628:  e8 bf 03                push            local2
 662b:  e0 2f 33 61 00 00       call            66c2 sp -> sp
 6631:  a0 00 c0                jz              sp rfalse
 6634:  a0 08 c1                jz              local7 rtrue
 6637:  8c 00 7b                jump            66b3
 663a:  c1 83 07 3b 98 3b 36 64 je              local6 "and" "," ~6664
 6642:  c1 83 08 3b 98 3b 36 dc je              local7 "and" "," 6664
 664a:  0d 5d 01                store           g4d #01
 664d:  a0 04 c8                jz              local3 6656
 6650:  e8 bf 04                push            local3
 6653:  8c 00 05                jump            6659
 6656:  e8 bf 03                push            local2
 6659:  e0 2f 33 61 00 00       call            66c2 sp -> sp
 665f:  a0 00 00 52             jz              sp ~66b3
 6663:  b1                      rfalse          
 6664:  e0 27 2d d5 07 04 00    call            5baa local6 #04 -> sp
 666b:  a0 00 c5                jz              sp 6671
 666e:  8c 00 44                jump            66b3
 6671:  c1 83 07 3b 98 3b 36 45 je              local6 "and" "," ~667c
 6679:  8c 00 39                jump            66b3
 667c:  c1 8f 07 46 50 4b       je              local6 "of" ~668b
 6682:  a0 60 70                jz              g50 ~66b3
 6685:  0d 60 04                store           g50 #04
 6688:  8c 00 2a                jump            66b3
 668b:  e0 25 2d d5 07 20 02 06 call            5baa local6 #20 #02 -> local5
 6693:  a0 06 ce                jz              local5 66a2
 6696:  a0 69 4b                jz              g59 ~66a2
 6699:  2d 69 06                store           g59 local5
 669c:  2d 67 07                store           g57 local6
 669f:  8c 00 13                jump            66b3
 66a2:  e0 25 2d d5 07 80 00 00 call            5baa local6 #80 #00 -> sp
 66aa:  a0 00 c8                jz              sp 66b3
 66ad:  2d 6a 07                store           g5a local6
 66b0:  2d 84 07                store           g74 local6
 66b3:  61 01 02 be ef          je              local0 local1 65a5
 66b8:  54 01 04 01             add             local0 #04 -> local0
 66bc:  2d 07 08                store           local6 local7
 66bf:  8c fe e5                jump            65a5

Routine 66c2, 9 locals (0000, 0001, 0000, 0000, 0000, 0000, 0000, 0000, 0000)

 66d5:  2d 05 6c                store           local4 g5c
 66d8:  6f 01 61 06             loadw           local0 g51 -> local5
 66dc:  47 60 04 c1             test            g50 #04 rtrue
 66e0:  a0 6a 56                jz              g5a ~66f7
 66e3:  a0 69 d3                jz              g59 66f7
 66e6:  e0 25 2d d5 67 80 00 00 call            5baa g57 #80 #00 -> sp
 66ee:  a0 00 c8                jz              sp 66f7
 66f1:  2d 6a 67                store           g5a g57
 66f4:  0d 69 00                store           g59 #00
 66f7:  a0 6a 6c                jz              g5a ~6724
 66fa:  a0 69 69                jz              g59 ~6724
 66fd:  41 60 01 e5             je              g50 #01 6724
 6701:  a0 6b 62                jz              g5b ~6724
 6704:  a0 02 c0                jz              local1 rfalse
 6707:  b2 ...                  print           "There seems to be a noun missing in that sentence!"
 6722:  bb                      new_line        
 6723:  b1                      rfalse          
 6724:  41 60 01 45             je              g50 #01 ~672b
 6728:  a0 6c 47                jz              g5c ~6730
 672b:  cd 4f 6c ff ff          store           g5c #ffff
 6730:  2d 85 01                store           g75 local0
 6733:  a0 07 cb                jz              local6 673f
 6736:  e0 2f 34 a8 01 00       call            6950 local0 -> sp
 673c:  8c 00 1b                jump            6758
 673f:  a0 52 d0                jz              g42 6750
 6742:  4c 90 0c                clear_attr      g80 #0c
 6745:  e0 25 35 0f 10 10 20 00 call            6a1e g00 #10 #20 -> sp
 674d:  4b 90 0c                set_attr        g80 #0c
 6750:  e0 25 35 0f 90 80 40 00 call            6a1e g80 #80 #40 -> sp
 6758:  6f 01 61 00             loadw           local0 g51 -> sp
 675c:  75 00 06 04             sub             sp local5 -> local3
 6760:  47 60 01 45             test            g50 #01 ~6767
 6764:  8c 01 0d                jump            6872
 6767:  47 60 02 73             test            g50 #02 ~679c
 676b:  a0 04 f0                jz              local3 679c
 676e:  41 04 01 e4             je              local3 #01 6794
 6772:  e7 bf 04 00             random          local3 -> sp
 6776:  6f 01 00 00             loadw           local0 sp -> sp
 677a:  e1 9b 01 01 00          storew          local0 #01 sp
 677f:  b2 ...                  print           "(How about the "
 6788:  4f 01 01 00             loadw           local0 #01 -> sp
 678c:  aa 00                   print_obj       sp
 678e:  b2 ...                  print           "?)"
 6793:  bb                      new_line        
 6794:  e1 a7 01 61 01          storew          local0 g51 #01
 6799:  8c 00 d8                jump            6872
 679c:  43 04 01 cd             jg              local3 #01 67ab
 67a0:  a0 04 00 8c             jz              local3 ~682e
 67a4:  c1 8f 6c ff ff 80 85    je              g5c #ffff 682e
 67ab:  c1 8f 6c ff ff 58       je              g5c #ffff ~67c7
 67b1:  2d 6c 05                store           g5c local4
 67b4:  2d 08 04                store           local7 local3
 67b7:  6f 01 61 00             loadw           local0 g51 -> sp
 67bb:  75 00 04 00             sub             sp local3 -> sp
 67bf:  e1 ab 01 61 00          storew          local0 g51 sp
 67c4:  8c ff 6e                jump            6733
 67c7:  a0 04 45                jz              local3 ~67cd
 67ca:  2d 04 08                store           local3 local7
 67cd:  61 7f 90 c8             je              g6f g80 67d7
 67d1:  e0 3f 31 2b 00          call            6256 -> sp
 67d6:  b1                      rfalse          
 67d7:  a0 02 f0                jz              local1 6808
 67da:  a0 6a ed                jz              g5a 6808
 67dd:  e0 2a 34 6f 06 04 01 00 call            68de local5 local3 local0 -> sp
 67e5:  61 01 66 48             je              local0 g56 ~67ef
 67e9:  e8 7f 06                push            #06
 67ec:  8c 00 05                jump            67f2
 67ef:  e8 7f 08                push            #08
 67f2:  2d 77 00                store           g67 sp
 67f5:  2d 75 69                store           g65 g59
 67f8:  2d 76 6a                store           g66 g5a
 67fb:  e0 17 31 3c 00 00 00    call            6278 #00 #00 -> sp
 6802:  0d 79 01                store           g69 #01
 6805:  8c 00 21                jump            6827
 6808:  a0 02 de                jz              local1 6827
 680b:  b2 ...                  print           "There seems to be a noun missing in that sentence!"
 6826:  bb                      new_line        
 6827:  0d 6a 00                store           g5a #00
 682a:  0d 69 00                store           g59 #00
 682d:  b1                      rfalse          
 682e:  a0 04 7a                jz              local3 ~6869
 6831:  a0 07 f7                jz              local6 6869
 6834:  a0 02 ed                jz              local1 6862
 6837:  a0 52 dc                jz              g42 6854
 683a:  e0 1b 35 5d 0b 01 00    call            6aba #0b local0 -> sp
 6841:  2d 5b 6a                store           g4b g5a
 6844:  2d 5a 69                store           g4a g59
 6847:  2d 59 67                store           g49 g57
 684a:  0d 6a 00                store           g5a #00
 684d:  0d 69 00                store           g59 #00
 6850:  0d 67 00                store           g57 #00
 6853:  b0                      rtrue           
 6854:  b2 ...                  print           "It's too dark to see!"
 6861:  bb                      new_line        
 6862:  0d 6a 00                store           g5a #00
 6865:  0d 69 00                store           g59 #00
 6868:  b1                      rfalse          
 6869:  a0 04 48                jz              local3 ~6872
 686c:  0d 07 01                store           local6 #01
 686f:  8c fe c3                jump            6733
 6872:  2d 6c 05                store           g5c local4
 6875:  0d 6a 00                store           g5a #00
 6878:  0d 69 00                store           g59 #00
 687b:  b0                      rtrue           

Routine 687c, 3 locals (0000, 0000, 0000)

 6883:  cd 4f 6c ff ff          store           g5c #ffff
 6888:  2d 6a 5b                store           g5a g4b
 688b:  2d 69 5a                store           g59 g4a
 688e:  e1 a7 01 61 00          storew          local0 g51 #00
 6893:  92 52 02 c2             get_child       #52 -> local1 6897
 6897:  a0 02 45                jz              local1 ~689d
 689a:  8c 00 11                jump            68ac
 689d:  e0 29 35 29 02 01 01 00 call            6a52 local1 local0 #01 -> sp
 68a5:  a1 02 02 c2             get_sibling     local1 -> local1 68a9
 68a9:  8c ff ed                jump            6897
 68ac:  6f 01 61 03             loadw           local0 g51 -> local2
 68b0:  a0 03 4a                jz              local2 ~68bb
 68b3:  e0 15 35 0f f9 01 01 00 call            6a1e #f9 #01 #01 -> sp
 68bb:  6f 01 61 03             loadw           local0 g51 -> local2
 68bf:  a0 03 4a                jz              local2 ~68ca
 68c2:  e0 15 35 0f 52 01 01 00 call            6a1e #52 #01 #01 -> sp
 68ca:  6f 01 61 03             loadw           local0 g51 -> local2
 68ce:  41 03 01 46             je              local2 #01 ~68d6
 68d2:  4f 01 01 5c             loadw           local0 #01 -> g4c
 68d6:  0d 6a 00                store           g5a #00
 68d9:  0d 69 00                store           g59 #00
 68dc:  ab 03                   ret             local2

Routine 68de, 5 locals (0000, 0000, 0000, 0000, 0000)

 68e9:  2d 05 02                store           local4 local1
 68ec:  b2 ...                  print           "Which"
 68f1:  a0 79 48                jz              g69 ~68fa
 68f4:  a0 78 45                jz              g68 ~68fa
 68f7:  a0 5d ca                jz              g4d 6902
 68fa:  b2 ...                  print           " "
 68fd:  a7 6a                   print_addr      g5a
 68ff:  8c 00 19                jump            6919
 6902:  61 03 66 4d             je              local2 g56 ~6911
 6906:  e0 15 31 6a 06 07 00 00 call            62d4 #06 #07 #00 -> sp
 690e:  8c 00 0a                jump            6919
 6911:  e0 15 31 6a 08 09 00 00 call            62d4 #08 #09 #00 -> sp
 6919:  b2 ...                  print           " do you mean, "
 6922:  95 01                   inc             local0
 6924:  6f 03 01 04             loadw           local2 local0 -> local3
 6928:  b2 ...                  print           "the "
 692b:  aa 04                   print_obj       local3
 692d:  41 02 02 51             je              local1 #02 ~6940
 6931:  41 05 02 c5             je              local4 #02 6938
 6935:  b2 ...                  print           ","
 6938:  b2 ...                  print           " or "
 693d:  8c 00 09                jump            6947
 6940:  43 02 02 45             jg              local1 #02 ~6947
 6944:  b2 ...                  print           ", "
 6947:  04 02 01 3f d8          dec_chk         local1 #01 ~6922
 694c:  b3 ...                  print_ret       "?"

Routine 6950, 8 locals (0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000)

 6961:  6f 01 61 02             loadw           local0 g51 -> local1
 6965:  2d 07 6c                store           local6 g5c
 6968:  52 10 05 03             get_prop_addr   g00 #05 -> local2
 696c:  a0 03 e3                jz              local2 6990
 696f:  a4 03 00                get_prop_len    local2 -> sp
 6972:  55 00 01 04             sub             sp #01 -> local3
 6976:  70 03 05 06             loadb           local2 local4 -> local5
 697a:  e0 2b 36 8e 06 01 00    call            6d1c local5 local0 -> sp
 6981:  a0 00 c9                jz              sp 698b
 6984:  e0 2b 35 5d 06 01 00    call            6aba local5 local0 -> sp
 698b:  25 05 04 3f e8          inc_chk         local4 local3 ~6976
 6990:  52 10 04 03             get_prop_addr   g00 #04 -> local2
 6994:  a0 03 80 56             jz              local2 69ec
 6998:  a4 03 00                get_prop_len    local2 -> sp
 699b:  57 00 04 00             div             sp #04 -> sp
 699f:  55 00 01 04             sub             sp #01 -> local3
 69a3:  0d 05 00                store           local4 #00
 69a6:  56 05 02 00             mul             local4 #02 -> sp
 69aa:  6f 03 00 00             loadw           local2 sp -> sp
 69ae:  61 6a 00 77             je              g5a sp ~69e7
 69b2:  56 05 02 00             mul             local4 #02 -> sp
 69b6:  54 00 01 00             add             sp #01 -> sp
 69ba:  6f 03 00 00             loadw           local2 sp -> sp
 69be:  e3 5b 0d 11 00          put_prop        "pseudo" #11 sp
 69c3:  12 0d 11 00             get_prop_addr   "pseudo" #11 -> sp
 69c7:  55 00 05 08             sub             sp #05 -> local7
 69cb:  4f 6a 00 00             loadw           g5a #00 -> sp
 69cf:  e1 9b 08 00 00          storew          local7 #00 sp
 69d4:  4f 6a 01 00             loadw           g5a #01 -> sp
 69d8:  e1 9b 08 01 00          storew          local7 #01 sp
 69dd:  e0 1b 35 5d 0d 01 00    call            6aba #0d local0 -> sp
 69e4:  8c 00 07                jump            69ec
 69e7:  25 05 04 3f bc          inc_chk         local4 local3 ~69a6
 69ec:  6f 01 61 00             loadw           local0 g51 -> sp
 69f0:  61 00 02 40             je              sp local1 ~rfalse
 69f4:  cd 4f 6c ff ff          store           g5c #ffff
 69f9:  2d 85 01                store           g75 local0
 69fc:  e0 15 35 0f f7 01 01 00 call            6a1e #f7 #01 #01 -> sp
 6a04:  2d 6c 07                store           g5c local6
 6a07:  6f 01 61 00             loadw           local0 g51 -> sp
 6a0b:  a0 00 40                jz              sp ~rfalse
 6a0e:  c1 95 88 39 71 38 40    je              g78 #39 #71 #38 ~rfalse
 6a15:  e0 15 35 0f 52 01 01 00 call            6a1e #52 #01 #01 -> sp
 6a1d:  b8                      ret_popped      

Routine 6a1e, 4 locals (0000, 0000, 0000, 0000)

 6a27:  74 02 03 00             add             local1 local2 -> sp
 6a2b:  67 6c 00 4b             test            g5c sp ~6a38
 6a2f:  e0 29 35 29 01 85 01 00 call            6a52 local0 g75 #01 -> sp
 6a37:  b8                      ret_popped      
 6a38:  67 6c 02 4b             test            g5c local1 ~6a45
 6a3c:  e0 29 35 29 01 85 00 00 call            6a52 local0 g75 #00 -> sp
 6a44:  b8                      ret_popped      
 6a45:  67 6c 03 41             test            g5c local2 ~rtrue
 6a49:  e0 29 35 29 01 85 02 00 call            6a52 local0 g75 #02 -> sp
 6a51:  b8                      ret_popped      

Routine 6a52, 5 locals (0000, 0000, 0000, 0000, 0000)

 6a5d:  a2 01 01 40             get_child       local0 -> local0 ~rfalse
 6a61:  41 03 02 da             je              local2 #02 6a7d
 6a65:  52 01 12 00             get_prop_addr   local0 #12 -> sp
 6a69:  a0 00 d3                jz              sp 6a7d
 6a6c:  e0 2b 36 8e 01 02 00    call            6d1c local0 local1 -> sp
 6a73:  a0 00 c9                jz              sp 6a7d
 6a76:  e0 2b 35 5d 01 02 00    call            6aba local0 local1 -> sp
 6a7d:  41 03 00 4a             je              local2 #00 ~6a89
 6a81:  4a 01 08 c6             test_attr       local0 #08 6a89
 6a85:  4a 01 0a 6d             test_attr       local0 #0a ~6ab4
 6a89:  a2 01 05 69             get_child       local0 -> local4 ~6ab4
 6a8d:  4a 01 0b c6             test_attr       local0 #0b 6a95
 6a91:  4a 01 0c 61             test_attr       local0 #0c ~6ab4
 6a95:  4a 01 0a 48             test_attr       local0 #0a ~6a9f
 6a99:  e8 7f 01                push            #01
 6a9c:  8c 00 0f                jump            6aac
 6a9f:  4a 01 08 48             test_attr       local0 #08 ~6aa9
 6aa3:  e8 7f 01                push            #01
 6aa6:  8c 00 05                jump            6aac
 6aa9:  e8 7f 00                push            #00
 6aac:  e0 2a 35 29 01 02 00 04 call            6a52 local0 local1 sp -> local3
 6ab4:  a1 01 01 bf aa          get_sibling     local0 -> local0 6a61
 6ab9:  b0                      rtrue           

Routine 6aba, 3 locals (0000, 0000, 0000)

 6ac1:  6f 02 61 03             loadw           local1 g51 -> local2
 6ac5:  54 03 01 00             add             local2 #01 -> sp
 6ac9:  e1 ab 02 00 01          storew          local1 sp local0
 6ace:  54 03 01 00             add             local2 #01 -> sp
 6ad2:  e1 ab 02 61 00          storew          local1 g51 sp
 6ad7:  b0                      rtrue           

Routine 6ad8, 0 locals ()

 6ad9:  50 83 05 00             loadb           g73 #05 -> sp
 6add:  e0 2b 35 7a 66 00 00    call            6af4 g56 sp -> sp
 6ae4:  a0 00 c0                jz              sp rfalse
 6ae7:  50 83 06 00             loadb           g73 #06 -> sp
 6aeb:  e0 2b 35 7a 65 00 00    call            6af4 g55 sp -> sp
 6af2:  b8                      ret_popped      

Routine 6af4, 5 locals (0000, 0000, 0000, 0000, 0000)

 6aff:  6f 01 61 03             loadw           local0 g51 -> local2
 6b03:  a0 03 c1                jz              local2 rtrue
 6b06:  47 02 02 c6             test            local1 #02 6b0e
 6b0a:  47 02 08 41             test            local1 #08 ~rtrue
 6b0e:  04 03 00 c1             dec_chk         local2 #00 rtrue
 6b12:  54 03 01 00             add             local2 #01 -> sp
 6b16:  6f 01 00 04             loadw           local0 sp -> local3
 6b1a:  41 04 0c 45             je              local3 #0c ~6b21
 6b1e:  2d 04 7b                store           local3 g6b
 6b21:  e0 2f 4a 76 04 00       call            94ec local3 -> sp
 6b27:  a0 00 3f e5             jz              sp ~6b0e
 6b2b:  41 04 01 bf e0          je              local3 #01 6b0e
 6b30:  2d 86 04                store           g76 local3
 6b33:  4a 04 0d 48             test_attr       local3 #0d ~6b3d
 6b37:  0d 05 01                store           local4 #01
 6b3a:  8c 00 23                jump            6b5e
 6b3d:  41 7f 04 c8             je              g6f #04 6b47
 6b41:  0d 05 00                store           local4 #00
 6b44:  8c 00 19                jump            6b5e
 6b47:  47 02 08 52             test            local1 #08 ~6b5b
 6b4b:  e0 1f 48 7a 00 00       call            90f4 #00 -> sp
 6b51:  41 00 01 48             je              sp #01 ~6b5b
 6b55:  0d 05 00                store           local4 #00
 6b58:  8c 00 05                jump            6b5e
 6b5b:  0d 05 01                store           local4 #01
 6b5e:  a0 05 e3                jz              local4 6b82
 6b61:  47 02 02 5f             test            local1 #02 ~6b82
 6b65:  41 04 0b 4d             je              local3 #0b ~6b74
 6b69:  b2 ...                  print           "You don't have that!"
 6b72:  bb                      new_line        
 6b73:  b1                      rfalse          
 6b74:  b2 ...                  print           "You don't have the "
 6b7b:  aa 04                   print_obj       local3
 6b7d:  b2 ...                  print           "."
 6b80:  bb                      new_line        
 6b81:  b1                      rfalse          
 6b82:  a0 05 3f 8a             jz              local4 ~6b0e
 6b86:  41 7f 04 3f 85          je              g6f #04 ~6b0e
 6b8b:  b2 ...                  print           "(Taken)"
 6b94:  bb                      new_line        
 6b95:  8c ff 78                jump            6b0e

Routine 6b98, 3 locals (0000, 0000, 0000)

 6b9f:  6f 66 61 00             loadw           g56 g51 -> sp
 6ba3:  43 00 01 50             jg              sp #01 ~6bb5
 6ba7:  50 83 05 00             loadb           g73 #05 -> sp
 6bab:  47 00 04 c8             test            sp #04 6bb5
 6baf:  0d 01 01                store           local0 #01
 6bb2:  8c 00 15                jump            6bc8
 6bb5:  6f 65 61 00             loadw           g55 g51 -> sp
 6bb9:  43 00 01 4d             jg              sp #01 ~6bc8
 6bbd:  50 83 06 00             loadb           g73 #06 -> sp
 6bc1:  47 00 04 c5             test            sp #04 6bc8
 6bc5:  0d 01 02                store           local0 #02
 6bc8:  a0 01 c1                jz              local0 rtrue
 6bcb:  b2 ...                  print           "You can't use multiple "
 6bd8:  41 01 02 45             je              local0 #02 ~6bdf
 6bdc:  b2 ...                  print           "in"
 6bdf:  b2 ...                  print           "direct objects with ~"
 6bee:  4f 74 01 02             loadw           g64 #01 -> local1
 6bf2:  a0 02 4a                jz              local1 ~6bfd
 6bf5:  b2 ...                  print           "tell"
 6bfa:  8c 00 20                jump            6c1b
 6bfd:  a0 79 45                jz              g69 ~6c03
 6c00:  a0 78 cb                jz              g68 6c0c
 6c03:  4f 02 00 00             loadw           local1 #00 -> sp
 6c07:  a7 00                   print_addr      sp
 6c09:  8c 00 11                jump            6c1b
 6c0c:  50 02 02 03             loadb           local1 #02 -> local2
 6c10:  50 02 03 00             loadb           local1 #03 -> sp
 6c14:  e0 2b 2f ed 03 00 00    call            5fda local2 sp -> sp
 6c1b:  b2 ...                  print           "~."
 6c20:  bb                      new_line        
 6c21:  b1                      rfalse          

Routine 6c22, 4 locals (0000, 0000, ffff, 0001)

 6c2b:  a0 02 c0                jz              local1 rfalse
 6c2e:  42 03 00 c8             jl              local2 #00 6c38
 6c32:  0d 04 00                store           local3 #00
 6c35:  8c 00 06                jump            6c3c
 6c38:  4f 02 00 03             loadw           local1 #00 -> local2
 6c3c:  6f 02 04 00             loadw           local1 local3 -> sp
 6c40:  61 01 00 c1             je              local0 sp rtrue
 6c44:  25 04 03 3f f5          inc_chk         local3 local2 ~6c3c
 6c49:  b1                      rfalse          

Routine 6c4a, 4 locals (0000, 0000, 0000, 0000)

 6c53:  70 02 04 00             loadb           local1 local3 -> sp
 6c57:  61 01 00 c1             je              local0 sp rtrue
 6c5b:  25 04 03 3f f5          inc_chk         local3 local2 ~6c53
 6c60:  b1                      rfalse          

Routine 6c62, 4 locals (0000, 0001, 0000, 0000)

 6c6b:  a0 58 c6                jz              g48 6c72
 6c6e:  61 7f 90 c1             je              g6f g80 rtrue
 6c72:  0d 6b 14                store           g5b #14
 6c75:  2d 03 10                store           local2 g00
 6c78:  2d 10 01                store           g00 local0
 6c7b:  a0 02 cc                jz              local1 6c88
 6c7e:  4a 01 14 48             test_attr       local0 #14 ~6c88
 6c82:  0d 04 01                store           local3 #01
 6c85:  8c 00 3e                jump            6cc4
 6c88:  e1 a7 63 61 00          storew          g53 g51 #00
 6c8d:  2d 85 63                store           g75 g53
 6c90:  cd 4f 6c ff ff          store           g5c #ffff
 6c95:  61 03 01 5a             je              local2 local0 ~6cb1
 6c99:  e0 25 35 0f 7f 01 01 00 call            6a1e g6f #01 #01 -> sp
 6ca1:  61 7f 90 ce             je              g6f g80 6cb1
 6ca5:  66 90 01 4a             jin             g80 local0 ~6cb1
 6ca9:  e0 25 35 0f 90 01 01 00 call            6a1e g80 #01 #01 -> sp
 6cb1:  e0 25 35 0f 01 01 01 00 call            6a1e local0 #01 #01 -> sp
 6cb9:  6f 85 61 00             loadw           g75 g51 -> sp
 6cbd:  43 00 00 45             jg              sp #00 ~6cc4
 6cc1:  0d 04 01                store           local3 #01
 6cc4:  2d 10 03                store           g00 local2
 6cc7:  0d 6b 00                store           g5b #00
 6cca:  ab 04                   ret             local3

Routine 6ccc, 1 local (0000)

 6ccf:  a0 78 50                jz              g68 ~6ce0
 6cd2:  4f 74 06 01             loadw           g64 #06 -> local0
 6cd6:  4f 01 00 00             loadw           local0 #00 -> sp
 6cda:  c1 8f 00 43 cc 48       je              sp "it" ~6ce6
 6ce0:  b2 ...                  print           " "
 6ce3:  aa 86                   print_obj       g76
 6ce5:  b0                      rtrue           
 6ce6:  4f 74 07 00             loadw           g64 #07 -> sp
 6cea:  e0 29 31 77 01 00 00 00 call            62ee local0 sp #00 -> sp
 6cf2:  b8                      ret_popped      

Routine 6cf4, 1 local (0000)

 6cf7:  a0 78 50                jz              g68 ~6d08
 6cfa:  4f 74 08 01             loadw           g64 #08 -> local0
 6cfe:  4f 01 00 00             loadw           local0 #00 -> sp
 6d02:  c1 8f 00 43 cc 48       je              sp "it" ~6d0e
 6d08:  b2 ...                  print           " "
 6d0b:  aa 86                   print_obj       g76
 6d0d:  b0                      rtrue           
 6d0e:  4f 74 09 00             loadw           g64 #09 -> sp
 6d12:  e0 29 31 77 01 00 00 00 call            62ee local0 sp #00 -> sp
 6d1a:  b8                      ret_popped      

Routine 6d1c, 4 locals (0000, 0000, 0000, 0000)

 6d25:  4a 01 07 c0             test_attr       local0 #07 rfalse
 6d29:  a0 6a dc                jz              g5a 6d46
 6d2c:  52 01 12 03             get_prop_addr   local0 #12 -> local2
 6d30:  a4 03 00                get_prop_len    local2 -> sp
 6d33:  57 00 02 00             div             sp #02 -> sp
 6d37:  55 00 01 00             sub             sp #01 -> sp
 6d3b:  e0 2a 36 11 6a 03 00 00 call            6c22 g5a local2 sp -> sp
 6d43:  a0 00 c0                jz              sp rfalse
 6d46:  a0 69 db                jz              g59 6d62
 6d49:  52 01 10 03             get_prop_addr   local0 #10 -> local2
 6d4d:  a0 03 c0                jz              local2 rfalse
 6d50:  a4 03 00                get_prop_len    local2 -> sp
 6d53:  55 00 01 00             sub             sp #01 -> sp
 6d57:  e0 2a 36 25 69 03 00 00 call            6c4a g59 local2 sp -> sp
 6d5f:  a0 00 c0                jz              sp rfalse
 6d62:  a0 6b c1                jz              g5b rtrue
 6d65:  6a 01 6b c1             test_attr       local0 g5b rtrue
 6d69:  b1                      rfalse          

Routine 6d6a, 0 locals ()
    Action routine for:
        "verbos"

 6d6b:  0d 57 01                store           g47 #01
 6d6e:  0d 56 00                store           g46 #00
 6d71:  b3 ...                  print_ret       "Maximum verbosity."

Routine 6d80, 0 locals ()
    Action routine for:
        "brief"

 6d81:  0d 57 00                store           g47 #00
 6d84:  0d 56 00                store           g46 #00
 6d87:  b3 ...                  print_ret       "Brief descriptions."

Routine 6d96, 0 locals ()
    Action routine for:
        "super"

 6d97:  0d 56 01                store           g46 #01
 6d9a:  b3 ...                  print_ret       "Super-brief descriptions."

Routine 6db0, 0 locals ()
    Action routine for:
        "i"

 6db1:  a2 7f 00 49             get_child       g6f -> sp ~6dbc
 6db5:  e0 2f 47 55 7f 00       call            8eaa g6f -> sp
 6dbb:  b8                      ret_popped      
 6dbc:  b3 ...                  print_ret       "You are empty-handed."

Routine 6dcc, 2 locals (0001, 0000)
    Action routine for:
        "q"

 6dd1:  e0 3f 82 c1 00          call            10582 -> sp
 6dd6:  a0 01 ed                jz              local0 6e04
 6dd9:  b2 ...                  print           "Do you wish to leave the game? (Y is affirmative): "
 6dfc:  e0 3f 48 6e 00          call            90dc -> sp
 6e01:  a0 00 45                jz              sp ~6e07
 6e04:  a0 01 44                jz              local0 ~6e09
 6e07:  ba                      quit            
 6e08:  b0                      rtrue           
 6e09:  b3 ...                  print_ret       "Ok."

Routine 6e0e, 0 locals ()
    Action routine for:
        "restar"

 6e0f:  e0 1f 82 c1 01 00       call            10582 #01 -> sp
 6e15:  b2 ...                  print           "Do you wish to restart? (Y is affirmative): "
 6e36:  e0 3f 48 6e 00          call            90dc -> sp
 6e3b:  a0 00 c0                jz              sp rfalse
 6e3e:  b2 ...                  print           "Restarting."
 6e49:  bb                      new_line        
 6e4a:  b7                      restart         
 6e4b:  b3 ...                  print_ret       "Failed."

Routine 6e52, 0 locals ()
    Action routine for:
        "restor"

 6e53:  b6 4e                   restore         ~6e61
 6e55:  b2 ...                  print           "Ok."
 6e5a:  bb                      new_line        
 6e5b:  e0 3f 46 44 00          call            8c88 -> sp
 6e60:  b8                      ret_popped      
 6e61:  b3 ...                  print_ret       "Failed."

Routine 6e68, 0 locals ()
    Action routine for:
        "save"

 6e69:  b5 47                   save            ~6e70
 6e6b:  b3 ...                  print_ret       "Ok."
 6e70:  b3 ...                  print_ret       "Failed."

Routine 6e78, 0 locals ()
    Action routine for:
        "script"

 6e79:  0f 00 08 00             loadw           #00 #08 -> sp
 6e7d:  48 00 01 00             or              sp #01 -> sp
 6e81:  e1 5b 00 08 00          storew          #00 #08 sp
 6e86:  b2 ...                  print           "Here begins a transcript of interaction with"
 6ea5:  bb                      new_line        
 6ea6:  e0 3f 37 70 00          call            6ee0 -> sp
 6eab:  b0                      rtrue           

Routine 6eac, 0 locals ()
    Action routine for:
        "unscri"

 6ead:  b2 ...                  print           "Here ends a transcript of interaction with"
 6eca:  bb                      new_line        
 6ecb:  e0 3f 37 70 00          call            6ee0 -> sp
 6ed0:  0f 00 08 00             loadw           #00 #08 -> sp
 6ed4:  c9 8f 00 ff fe 00       and             sp #fffe -> sp
 6eda:  e1 5b 00 08 00          storew          #00 #08 sp
 6edf:  b0                      rtrue           

Routine 6ee0, 1 local (0011)
    Action routine for:
        "versio"

 6ee3:  b2 ...                  print           "ZORK I: The Great Underground Empire^Copyright (c) 1981, 1982, 1983 Infocom, Inc. "
 6f28:  b2 ...                  print           "All rights reserved."
 6f39:  bb                      new_line        
 6f3a:  10 00 01 00             loadb           #00 #01 -> sp
 6f3e:  49 00 08 00             and             sp #08 -> sp
 6f42:  a0 00 da                jz              sp 6f5d
 6f45:  b2 ...                  print           "Licensed to Tandy Corporation."
 6f5c:  bb                      new_line        
 6f5d:  b2 ...                  print           "ZORK is a registered trademark of Infocom, Inc.^Revision "
 6f88:  0f 00 01 00             loadw           #00 #01 -> sp
 6f8c:  c9 8f 00 07 ff 00       and             sp #07ff -> sp
 6f92:  e6 bf 00                print_num       sp
 6f95:  b2 ...                  print           " / Serial number "
 6fa4:  05 01 17 45             inc_chk         local0 #17 ~6fab
 6fa8:  8c 00 0c                jump            6fb5
 6fab:  30 00 01 00             loadb           #00 local0 -> sp
 6faf:  e5 bf 00                print_char      sp
 6fb2:  8c ff f1                jump            6fa4
 6fb5:  bb                      new_line        
 6fb6:  b0                      rtrue           

Routine 6fb8, 0 locals ()
    Action routine for:
        "$ve"

 6fb9:  b2 ...                  print           "Verifying disk..."
 6fc8:  bb                      new_line        
 6fc9:  bd 4f                   verify          ~6fd8
 6fcb:  b3 ...                  print_ret       "The disk is correct."
 6fd8:  bb                      new_line        
 6fd9:  b3 ...                  print_ret       "** Disk Failure **"

Routine 6ff0, 0 locals ()
    Action routine for:
        "plugh"

 6ff1:  b3 ...                  print_ret       "A hollow voice says ~Fool.~"

Routine 7008, 1 local (0000)
    Action routine for:
        "again"

 700b:  41 8e 89 4a             je              g7e #89 ~7017
 700f:  e0 2b 2b be 8e 8d 00    call            577c g7e g7d -> sp
 7016:  b8                      ret_popped      
 7017:  a0 8d cf                jz              g7d 7027
 701a:  a3 8d 00                get_parent      g7d -> sp
 701d:  a0 00 c6                jz              sp 7024
 7020:  4a 8d 07 45             test_attr       g7d #07 ~7027
 7024:  2d 01 8d                store           local0 g7d
 7027:  a0 8c cf                jz              g7c 7037
 702a:  a3 8c 00                get_parent      g7c -> sp
 702d:  a0 00 c6                jz              sp 7034
 7030:  4a 8c 07 45             test_attr       g7c #07 ~7037
 7034:  2d 01 8c                store           local0 g7c
 7037:  a0 01 df                jz              local0 7057
 703a:  c1 97 01 0d 52 d9       je              local0 #0d #52 7057
 7040:  b2 ...                  print           "You can't see the "
 7049:  aa 01                   print_obj       local0
 704b:  b2 ...                  print           " anymore."
 7054:  bb                      new_line        
 7055:  9b 02                   ret             #02
 7057:  e0 2a 2b be 8e 8d 8c 00 call            577c g7e g7d g7c -> sp
 705f:  b8                      ret_popped      

Routine 7060, 0 locals ()
    Action routine for:
        "awake up OBJ"
"awake OBJ"

 7061:  4a 86 1e 00 47          test_attr       g76 #1e ~70ab
 7066:  51 86 07 00             get_prop        g76 #07 -> sp
 706a:  42 00 00 5e             jl              sp #00 ~708a
 706e:  b2 ...                  print           "The "
 7071:  aa 86                   print_obj       g76
 7073:  b2 ...                  print           " is rudely awakened."
 7082:  bb                      new_line        
 7083:  e0 2f 80 6c 86 00       call            100d8 g76 -> sp
 7089:  b8                      ret_popped      
 708a:  b3 ...                  print_ret       "He's wide awake, or haven't you noticed..."
 70ab:  b2 ...                  print           "The "
 70ae:  aa 86                   print_obj       g76
 70b0:  b3 ...                  print_ret       " isn't sleeping."

Routine 70be, 0 locals ()
    Action routine for:
        "answer"

 70bf:  b2 ...                  print           "Nobody seems to be awaiting your answer."
 70d6:  bb                      new_line        
 70d7:  0d 7c 00                store           g6c #00
 70da:  0d 70 00                store           g60 #00
 70dd:  b0                      rtrue           

Routine 70de, 0 locals ()
    Action routine for:
        "strike OBJ with OBJ"
"knock down OBJ"
"stab OBJ with OBJ"
"dispat OBJ with OBJ"
"attack OBJ with OBJ"

 70df:  4a 86 1e e4             test_attr       g76 #1e 7105
 70e3:  b2 ...                  print           "I've known strange people, but fighting a "
 7100:  aa 86                   print_obj       g76
 7102:  b3 ...                  print_ret       "?"
 7105:  a0 87 c6                jz              g77 710c
 7108:  41 87 01 66             je              g77 #01 ~7130
 710c:  b2 ...                  print           "Trying to attack a "
 711b:  aa 86                   print_obj       g76
 711d:  b3 ...                  print_ret       " with your bare hands is suicidal."
 7130:  66 87 7f da             jin             g77 g6f 714c
 7134:  b2 ...                  print           "You aren't even holding the "
 7147:  aa 87                   print_obj       g77
 7149:  b3 ...                  print_ret       "."
 714c:  4a 87 1d e5             test_attr       g77 #1d 7173
 7150:  b2 ...                  print           "Trying to attack the "
 715f:  aa 86                   print_obj       g76
 7161:  b2 ...                  print           " with a "
 7166:  aa 87                   print_obj       g77
 7168:  b3 ...                  print_ret       " is suicidal."
 7173:  e0 3f 7e 4e 00          call            fc9c -> sp
 7178:  b8                      ret_popped      

Routine 717a, 0 locals ()
    Action routine for:
        "back"

 717b:  b3 ...                  print_ret       "Sorry, my memory is poor. Please give a direction."

Routine 71a0, 0 locals ()
    Action routine for:
        "blow up OBJ"
"blast"

 71a1:  b3 ...                  print_ret       "You can't blast anything by using words."

Routine 71ba, 1 local (0000)
    Pre-action routine for:
        "carry in OBJ"
"climb in OBJ"
"board OBJ"

 71bd:  a3 7f 01                get_parent      g6f -> local0
 71c0:  e0 3f 28 68 00          call            50d0 -> sp
 71c5:  a0 00 41                jz              sp ~rtrue
 71c8:  4a 86 1b 76             test_attr       g76 #1b ~7200
 71cc:  66 86 10 dd             jin             g76 g00 71eb
 71d0:  b2 ...                  print           "The "
 71d3:  aa 86                   print_obj       g76
 71d5:  b2 ...                  print           " must be on the ground to be boarded."
 71e8:  bb                      new_line        
 71e9:  9b 02                   ret             #02
 71eb:  4a 01 1b 40             test_attr       local0 #1b ~rfalse
 71ef:  b2 ...                  print           "You are already in the "
 71f8:  aa 01                   print_obj       local0
 71fa:  b2 ...                  print           "!"
 71fd:  bb                      new_line        
 71fe:  9b 02                   ret             #02
 7200:  b2 ...                  print           "You have a theory on how to board a "
 7215:  aa 86                   print_obj       g76
 7217:  b2 ...                  print           ", perhaps?"
 7220:  bb                      new_line        
 7221:  9b 02                   ret             #02

Routine 7224, 1 local (0000)
    Action routine for:
        "carry in OBJ"
"climb in OBJ"
"board OBJ"

 7227:  b2 ...                  print           "You are now in the "
 7230:  aa 86                   print_obj       g76
 7232:  b2 ...                  print           "."
 7235:  bb                      new_line        
 7236:  6e 7f 86                insert_obj      g6f g76
 7239:  51 86 11 00             get_prop        g76 #11 -> sp
 723d:  e0 9f 00 02 00          call            sp #02 -> sp
 7242:  b0                      rtrue           

Routine 7244, 0 locals ()
    Action routine for:
        "blow in OBJ"

 7245:  e0 19 2b be 17 86 06 00 call            577c #17 g76 #06 -> sp
 724d:  b8                      ret_popped      

Routine 724e, 0 locals ()
    Action routine for:
        "brush OBJ with OBJ"
"brush OBJ"

 724f:  b3 ...                  print_ret       "If you wish, but heaven only knows why."

Routine 726a, 0 locals ()
    Action routine for:
        "bug"

 726b:  b3 ...                  print_ret       "Bug? Not in a flawless program like this! (Cough, cough)."

Routine 7298, 0 locals ()
    Pre-action routine for:
        "light OBJ with OBJ"
"burn down OBJ with OBJ"
"burn OBJ with OBJ"

 7299:  4a 87 19 46             test_attr       g77 #19 ~72a1
 729d:  4a 87 14 c0             test_attr       g77 #14 rfalse
 72a1:  b2 ...                  print           "With a "
 72a8:  aa 87                   print_obj       g77
 72aa:  b3 ...                  print_ret       "??!?"

Routine 72b2, 0 locals ()
    Action routine for:
        "light OBJ with OBJ"
"burn down OBJ with OBJ"
"burn OBJ with OBJ"

 72b3:  e0 3f 28 68 00          call            50d0 -> sp
 72b8:  a0 00 40                jz              sp ~rfalse
 72bb:  4a 86 1a 00 61          test_attr       g76 #1a ~731f
 72c0:  66 86 7f c6             jin             g76 g6f 72c8
 72c4:  66 7f 86 79             jin             g6f g76 ~72ff
 72c8:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 72ce:  b2 ...                  print           "The "
 72d1:  aa 86                   print_obj       g76
 72d3:  b2 ...                  print           " catches fire. Unfortunately, you were "
 72e6:  66 7f 86 48             jin             g6f g76 ~72f0
 72ea:  b2 ...                  print           "in"
 72ed:  8c 00 09                jump            72f7
 72f0:  b2 ...                  print           "holding"
 72f7:  e0 0f 83 33 9a 47 00    call            10666 s165 -> sp
 72fe:  b8                      ret_popped      
 72ff:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 7305:  b2 ...                  print           "The "
 7308:  aa 86                   print_obj       g76
 730a:  b3 ...                  print_ret       " catches fire and is consumed."
 731f:  b2 ...                  print           "You can't burn a "
 7328:  aa 86                   print_obj       g76
 732a:  b3 ...                  print_ret       "."

Routine 732e, 0 locals ()
    Action routine for:
        "barf"

 732f:  b3 ...                  print_ret       "Preposterous!"

Routine 733a, 0 locals ()
    Action routine for:
        "go down OBJ"
"climb down OBJ"
"climb"

 733b:  e0 1b 39 b7 16 86 00    call            736e #16 g76 -> sp
 7342:  b8                      ret_popped      

Routine 7344, 0 locals ()
    Action routine for:
        "climb OBJ"

 7345:  e0 1b 39 b7 17 86 00    call            736e #17 g76 -> sp
 734c:  b8                      ret_popped      

Routine 734e, 0 locals ()
    Action routine for:
        "carry on OBJ"
"climb on OBJ"

 734f:  4a 86 1b 4a             test_attr       g76 #1b ~735b
 7353:  e0 1b 2b be 19 86 00    call            577c #19 g76 -> sp
 735a:  b0                      rtrue           
 735b:  b2 ...                  print           "You can't climb onto the "
 7368:  aa 86                   print_obj       g76
 736a:  b3 ...                  print_ret       "."

Routine 736e, 5 locals (0017, 0000, 0000, 0000, 0000)
    Action routine for:
        "go up OBJ"
"climb up OBJ"
"climb"

 7379:  a0 02 48                jz              local1 ~7382
 737c:  a0 86 c5                jz              g76 7382
 737f:  2d 02 86                store           local1 g76
 7382:  72 10 01 04             get_prop_addr   g00 local0 -> local3
 7386:  a0 04 80 56             jz              local3 73de
 738a:  a0 02 80 4b             jz              local1 73d7
 738e:  a4 04 03                get_prop_len    local3 -> local2
 7391:  41 03 02 d8             je              local2 #02 73ab
 7395:  c1 95 03 04 05 01 00 3c je              local2 #04 #05 #01 ~73d7
 739d:  50 04 00 00             loadb           local3 #00 -> sp
 73a1:  e0 2b 4a 50 86 00 00    call            94a0 g76 sp -> sp
 73a8:  a0 00 6e                jz              sp ~73d7
 73ab:  b2 ...                  print           "The "
 73ae:  aa 02                   print_obj       local1
 73b0:  b2 ...                  print           " do"
 73b3:  41 02 49 c5             je              local1 #49 73ba
 73b7:  b2 ...                  print           "es"
 73ba:  b2 ...                  print           "n't lead "
 73c3:  41 01 17 48             je              local0 #17 ~73cd
 73c7:  b2 ...                  print           "up"
 73ca:  8c 00 07                jump            73d2
 73cd:  b2 ...                  print           "down"
 73d2:  b3 ...                  print_ret       "ward."
 73d7:  e0 2f 4a 38 01 00       call            9470 local0 -> sp
 73dd:  b0                      rtrue           
 73de:  a0 02 4d                jz              local1 ~73ec
 73e1:  b3 ...                  print_ret       "You can't go that way."
 73ec:  a0 02 ec                jz              local1 7419
 73ef:  52 86 12 03             get_prop_addr   g76 #12 -> local2
 73f3:  a4 03 00                get_prop_len    local2 -> sp
 73f6:  e0 0a 36 11 4d 65 03 00 00 
                               call            6c22 "wall" local2 sp -> sp
 73ff:  a0 00 d9                jz              sp 7419
 7402:  b3 ...                  print_ret       "Climbing the walls is to no avail."
 7419:  b3 ...                  print_ret       "You can't do that!"

Routine 7422, 0 locals ()
    Action routine for:
        "close OBJ"

 7423:  4a 86 13 e2             test_attr       g76 #13 7447
 7427:  4a 86 17 de             test_attr       g76 #17 7447
 742b:  b2 ...                  print           "You must tell me how to do that to a "
 7442:  aa 86                   print_obj       g76
 7444:  b3 ...                  print_ret       "."
 7447:  4a 86 0a fc             test_attr       g76 #0a 7485
 744b:  51 86 0a 00             get_prop        g76 #0a -> sp
 744f:  a0 00 f5                jz              sp 7485
 7452:  4a 86 0b 68             test_attr       g76 #0b ~747c
 7456:  4c 86 0b                clear_attr      g76 #0b
 7459:  b2 ...                  print           "Closed."
 7460:  bb                      new_line        
 7461:  a0 52 c1                jz              g42 rtrue
 7464:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 746a:  a0 52 41                jz              g42 ~rtrue
 746d:  b3 ...                  print_ret       "It is now pitch black."
 747c:  b3 ...                  print_ret       "It is already closed."
 7485:  4a 86 17 60             test_attr       g76 #17 ~74a7
 7489:  4a 86 0b 53             test_attr       g76 #0b ~749e
 748d:  4c 86 0b                clear_attr      g76 #0b
 7490:  b2 ...                  print           "The "
 7493:  aa 86                   print_obj       g76
 7495:  b3 ...                  print_ret       " is now closed."
 749e:  b3 ...                  print_ret       "It is already closed."
 74a7:  b3 ...                  print_ret       "You cannot close that."

Routine 74b2, 0 locals ()
    Action routine for:
        "comman OBJ"

 74b3:  4a 86 1e 56             test_attr       g76 #1e ~74cb
 74b7:  b2 ...                  print           "The "
 74ba:  aa 86                   print_obj       g76
 74bc:  b3 ...                  print_ret       " pays no attention."
 74cb:  b3 ...                  print_ret       "You cannot talk to that!"

Routine 74d6, 0 locals ()
    Action routine for:
        "count OBJ"

 74d7:  41 86 0a 5d             je              g76 #0a ~74f6
 74db:  b3 ...                  print_ret       "Well, for one, you are playing Zork..."
 74f6:  b3 ...                  print_ret       "You have lost your mind."

Routine 7504, 0 locals ()
    Action routine for:
        "cross OBJ"

 7505:  b3 ...                  print_ret       "You can't cross that!"

Routine 7510, 0 locals ()
    Action routine for:
        "curse OBJ"
"curse"

 7511:  a0 86 e8                jz              g76 753a
 7514:  4a 86 1e 59             test_attr       g76 #1e ~752f
 7518:  b3 ...                  print_ret       "Insults of this nature won't help you."
 752f:  b3 ...                  print_ret       "What a loony!"
 753a:  b3 ...                  print_ret       "Such language in a high-class establishment like this!"

Routine 7562, 0 locals ()
    Action routine for:
        "cut OBJ with OBJ"

 7563:  4a 86 1e 4b             test_attr       g76 #1e ~7570
 7567:  e0 1a 2b be 13 86 87 00 call            577c #13 g76 g77 -> sp
 756f:  b8                      ret_popped      
 7570:  4a 86 1a 00 67          test_attr       g76 #1a ~75da
 7575:  4a 87 1d 00 62          test_attr       g77 #1d ~75da
 757a:  66 7f 86 65             jin             g6f g76 ~75a1
 757e:  b3 ...                  print_ret       "Not a bright idea, especially since you're in it."
 75a1:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 75a7:  b2 ...                  print           "Your skillful "
 75b0:  aa 87                   print_obj       g77
 75b2:  b2 ...                  print           "smanship slices the "
 75bf:  aa 86                   print_obj       g76
 75c1:  b3 ...                  print_ret       " into innumerable slivers which blow away."
 75da:  4a 87 1d e4             test_attr       g77 #1d 7600
 75de:  b2 ...                  print           "The ~cutting edge~ of a "
 75ef:  aa 87                   print_obj       g77
 75f1:  b3 ...                  print_ret       " is hardly adequate."
 7600:  b2 ...                  print           "Strange concept, cutting the "
 7615:  aa 86                   print_obj       g76
 7617:  b3 ...                  print_ret       "...."

Routine 761e, 0 locals ()
    Action routine for:
        "deflat OBJ"

 761f:  b3 ...                  print_ret       "Come on, now!"

Routine 762a, 0 locals ()
    Action routine for:
        "dig OBJ with OBJ"
"dig in OBJ with OBJ"

 762b:  a0 87 45                jz              g77 ~7631
 762e:  0d 87 01                store           g77 #01
 7631:  41 87 79 59             je              g77 #79 ~764c
 7635:  b3 ...                  print_ret       "There's no reason to be digging here."
 764c:  4a 87 1c 5e             test_attr       g77 #1c ~766c
 7650:  b2 ...                  print           "Digging with the "
 765b:  aa 87                   print_obj       g77
 765d:  b3 ...                  print_ret       " is slow and tedious."
 766c:  b2 ...                  print           "Digging with a "
 7677:  aa 87                   print_obj       g77
 7679:  b3 ...                  print_ret       " is silly."

Routine 7682, 0 locals ()
    Action routine for:
        "carry out OBJ"
"disemb OBJ"

 7683:  a3 7f 00                get_parent      g6f -> sp
 7686:  61 00 86 ce             je              sp g76 7696
 768a:  b2 ...                  print           "You're not in that!"
 7693:  bb                      new_line        
 7694:  9b 02                   ret             #02
 7696:  4a 10 06 58             test_attr       g00 #06 ~76b0
 769a:  b2 ...                  print           "You are on your own feet again."
 76ab:  bb                      new_line        
 76ac:  6e 7f 10                insert_obj      g6f g00
 76af:  b0                      rtrue           
 76b0:  b2 ...                  print           "You realize that getting out here would be fatal."
 76cb:  bb                      new_line        
 76cc:  9b 02                   ret             #02

Routine 76ce, 0 locals ()
    Action routine for:
        "disenc OBJ"

 76cf:  b3 ...                  print_ret       "Nothing happens."

Routine 76dc, 0 locals ()
    Action routine for:
        "drink OBJ"

 76dd:  e0 3f 3b 89 00          call            7712 -> sp
 76e2:  b8                      ret_popped      

Routine 76e4, 0 locals ()
    Action routine for:
        "drink from OBJ"

 76e5:  b3 ...                  print_ret       "How peculiar!"

Routine 76f0, 0 locals ()
    Pre-action routine for:
        "hide down OBJ"
"pour OBJ from OBJ"
"pour OBJ in OBJ"
"pour OBJ"
"leave OBJ"
"drop OBJ"

 76f1:  a3 7f 00                get_parent      g6f -> sp
 76f4:  61 86 00 40             je              g76 sp ~rfalse
 76f8:  e0 1b 2b be 2d 86 00    call            577c #2d g76 -> sp
 76ff:  b0                      rtrue           

Routine 7700, 0 locals ()
    Action routine for:
        "hide down OBJ"
"pour OBJ from OBJ"
"pour OBJ in OBJ"
"pour OBJ"
"leave OBJ"
"drop OBJ"

 7701:  e0 3f 48 eb 00          call            91d6 -> sp
 7706:  a0 00 c0                jz              sp rfalse
 7709:  b3 ...                  print_ret       "Dropped."

Routine 7712, 3 locals (0000, 0000, 0000)
    Action routine for:
        "bite OBJ"

 7719:  4a 86 15 c8             test_attr       g76 #15 7723
 771d:  e8 7f 00                push            #00
 7720:  8c 00 05                jump            7726
 7723:  e8 7f 01                push            #01
 7726:  2d 01 00                store           local0 sp
 7729:  a0 01 80 59             jz              local0 7784
 772d:  66 86 7f da             jin             g76 g6f 7749
 7731:  a3 86 00                get_parent      g76 -> sp
 7734:  66 00 7f d3             jin             sp g6f 7749
 7738:  b2 ...                  print           "You're not holding that."
 7745:  bb                      new_line        
 7746:  8c 00 3b                jump            7782
 7749:  41 88 2f 54             je              g78 #2f ~775f
 774d:  b2 ...                  print           "How can you drink that?"
 775c:  8c 00 25                jump            7782
 775f:  b2 ...                  print           "Thank you very much. It really hit the spot."
 777c:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 7782:  bb                      new_line        
 7783:  b0                      rtrue           
 7784:  4a 86 16 00 68          test_attr       g76 #16 ~77ef
 7789:  0d 02 01                store           local1 #01
 778c:  a3 86 03                get_parent      g76 -> local2
 778f:  46 86 f7 ca             jin             g76 #f7 779b
 7793:  46 86 f9 c6             jin             g76 #f9 779b
 7797:  41 86 0d 48             je              g76 #0d ~77a1
 779b:  e0 3f 3c 07 00          call            780e -> sp
 77a0:  b8                      ret_popped      
 77a1:  a0 03 51                jz              local2 ~77b3
 77a4:  b3 ...                  print_ret       "You don't have any to drink."
 77b3:  66 03 7f d8             jin             local2 g6f 77cd
 77b7:  b2 ...                  print           "You have to be holding the "
 77c4:  aa 03                   print_obj       local2
 77c6:  b3 ...                  print_ret       " first."
 77cd:  4a 03 0b da             test_attr       local2 #0b 77e9
 77d1:  b2 ...                  print           "You'll have to open the "
 77e0:  aa 03                   print_obj       local2
 77e2:  b3 ...                  print_ret       " first."
 77e9:  e0 3f 3c 07 00          call            780e -> sp
 77ee:  b8                      ret_popped      
 77ef:  a0 01 40                jz              local0 ~rfalse
 77f2:  a0 02 40                jz              local1 ~rfalse
 77f5:  b2 ...                  print           "I don't think that the "
 77fe:  aa 86                   print_obj       g76
 7800:  b3 ...                  print_ret       " would agree with you."

Routine 780e, 0 locals ()

 780f:  b2 ...                  print           "Thank you very much. I was rather thirsty (from all this talking, probably)."
 7840:  bb                      new_line        
 7841:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 7847:  b8                      ret_popped      

Routine 7848, 5 locals (0000, 0000, 0000, 0000, 0000)
    Action routine for:
        "echo"

 7853:  50 7e 01 00             loadb           g6e #01 -> sp
 7857:  43 00 00 00 46          jg              sp #00 ~78a0
 785c:  50 7e 01 00             loadb           g6e #01 -> sp
 7860:  56 00 04 00             mul             sp #04 -> sp
 7864:  74 7e 00 01             add             g6e sp -> local0
 7868:  50 01 00 05             loadb           local0 #00 -> local4
 786c:  50 01 01 00             loadb           local0 #01 -> sp
 7870:  74 05 00 00             add             local4 sp -> sp
 7874:  55 00 01 02             sub             sp #01 -> local1
 7878:  05 03 02 47             inc_chk         local2 #02 ~7881
 787c:  b3 ...                  print_ret       "..."
 7881:  50 01 01 00             loadb           local0 #01 -> sp
 7885:  55 00 01 04             sub             sp #01 -> local3
 7889:  25 04 02 45             inc_chk         local3 local1 ~7890
 788d:  8c 00 0c                jump            789a
 7890:  70 7d 04 00             loadb           g6d local3 -> sp
 7894:  e5 bf 00                print_char      sp
 7897:  8c ff f1                jump            7889
 789a:  b2 ...                  print           " "
 789d:  8c ff da                jump            7878
 78a0:  b3 ...                  print_ret       "echo echo ..."

Routine 78ae, 0 locals ()
    Action routine for:
        "enchan OBJ"

 78af:  e0 3f 28 68 00          call            50d0 -> sp
 78b4:  e0 3f 3b 67 00          call            76ce -> sp
 78b9:  b8                      ret_popped      

Routine 78ba, 2 locals (0000, 0000)

 78bf:  61 01 7b 48             je              local0 g6b ~78c9
 78c3:  0d 7b 00                store           g6b #00
 78c6:  0d 7a 00                store           g6a #00
 78c9:  2d 02 52                store           local1 g42
 78cc:  a9 01                   remove_obj      local0
 78ce:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 78d4:  a0 02 c1                jz              local1 rtrue
 78d7:  61 02 52 c1             je              local1 g42 rtrue
 78db:  b3 ...                  print_ret       "You are left in the dark..."

Routine 78ec, 0 locals ()
    Action routine for:
        "enter"

 78ed:  e0 1f 4a 38 15 00       call            9470 #15 -> sp
 78f3:  b8                      ret_popped      

Routine 78f4, 0 locals ()
    Action routine for:
        "gaze at OBJ"
"descri OBJ"

 78f5:  51 86 08 00             get_prop        g76 #08 -> sp
 78f9:  a0 00 ca                jz              sp 7904
 78fc:  51 86 08 00             get_prop        g76 #08 -> sp
 7900:  ad 00                   print_paddr     sp
 7902:  bb                      new_line        
 7903:  b0                      rtrue           
 7904:  4a 86 13 c6             test_attr       g76 #13 790c
 7908:  4a 86 17 48             test_attr       g76 #17 ~7912
 790c:  e0 3f 3f 14 00          call            7e28 -> sp
 7911:  b8                      ret_popped      
 7912:  b2 ...                  print           "There's nothing special about the "
 7923:  aa 86                   print_obj       g76
 7925:  b3 ...                  print_ret       "."

Routine 7928, 0 locals ()
    Action routine for:
        "exit OBJ"
"exit"

 7929:  e0 1f 4a 38 14 00       call            9470 #14 -> sp
 792f:  b8                      ret_popped      

Routine 7930, 0 locals ()
    Action routine for:
        "banish away OBJ"
"banish out OBJ"
"banish OBJ"

 7931:  b3 ...                  print_ret       "What a bizarre concept!"

Routine 7944, 1 local (0000)
    Pre-action routine for:
        "fill OBJ"
"fill OBJ with OBJ"

 7947:  a0 87 6e                jz              g77 ~7976
 794a:  52 10 05 01             get_prop_addr   g00 #05 -> local0
 794e:  a0 01 e7                jz              local0 7976
 7951:  a4 01 00                get_prop_len    local0 -> sp
 7954:  55 00 01 00             sub             sp #01 -> sp
 7958:  e0 1a 36 25 ee 01 00 00 call            6c4a #ee local0 sp -> sp
 7960:  a0 00 c6                jz              sp 7967
 7963:  0d 87 ee                store           g77 #ee
 7966:  b1                      rfalse          
 7967:  b3 ...                  print_ret       "There is nothing to fill it with."
 7976:  41 87 ee c0             je              g77 #ee rfalse
 797a:  e0 1a 2b be 12 87 86 00 call            577c #12 g77 g76 -> sp
 7982:  b0                      rtrue           

Routine 7984, 0 locals ()
    Action routine for:
        "fill OBJ"
"fill OBJ with OBJ"

 7985:  a0 87 78                jz              g77 ~79be
 7988:  e0 1b 4a 50 ee 10 00    call            94a0 #ee g00 -> sp
 798f:  a0 00 cb                jz              sp 799b
 7992:  e0 19 2b be 3b 86 ee 00 call            577c #3b g76 #ee -> sp
 799a:  b0                      rtrue           
 799b:  a3 7f 00                get_parent      g6f -> sp
 799e:  26 ed 00 4b             jin             "quantity of water" sp ~79ab
 79a2:  e0 19 2b be 3b 86 ed 00 call            577c #3b g76 #ed -> sp
 79aa:  b0                      rtrue           
 79ab:  b3 ...                  print_ret       "There's nothing to fill it with."
 79be:  b3 ...                  print_ret       "You may know how to do that, but I don't."

Routine 79d8, 1 local (0000)
    Action routine for:
        "search for OBJ"
"gaze for OBJ"
"find OBJ"

 79db:  a3 86 01                get_parent      g76 -> local0
 79de:  c1 97 86 01 06 6d       je              g76 #01 #06 ~7a0f
 79e4:  b3 ...                  print_ret       "Within six feet of your head, assuming you haven't left that somewhere."
 7a0f:  41 86 05 55             je              g76 #05 ~7a26
 7a13:  b3 ...                  print_ret       "You're around here somewhere..."
 7a26:  41 01 f7 4b             je              local0 #f7 ~7a33
 7a2a:  b3 ...                  print_ret       "You find it."
 7a33:  66 86 7f 49             jin             g76 g6f ~7a3e
 7a37:  b3 ...                  print_ret       "You have it."
 7a3e:  66 86 10 d0             jin             g76 g00 7a50
 7a42:  e0 2b 4a 50 86 10 00    call            94a0 g76 g00 -> sp
 7a49:  a0 00 46                jz              sp ~7a50
 7a4c:  41 86 0d 4b             je              g76 #0d ~7a59
 7a50:  b3 ...                  print_ret       "It's right here."
 7a59:  4a 01 1e 4e             test_attr       local0 #1e ~7a69
 7a5d:  b2 ...                  print           "The "
 7a60:  aa 01                   print_obj       local0
 7a62:  b3 ...                  print_ret       " has it."
 7a69:  4a 01 0a 4c             test_attr       local0 #0a ~7a77
 7a6d:  b2 ...                  print           "It's on the "
 7a72:  aa 01                   print_obj       local0
 7a74:  b3 ...                  print_ret       "."
 7a77:  4a 01 13 4c             test_attr       local0 #13 ~7a85
 7a7b:  b2 ...                  print           "It's in the "
 7a80:  aa 01                   print_obj       local0
 7a82:  b3 ...                  print_ret       "."
 7a85:  b3 ...                  print_ret       "Beats me."

Routine 7a8e, 0 locals ()
    Action routine for:
        "chase OBJ"
"chase"

 7a8f:  b3 ...                  print_ret       "You're nuts!"

Routine 7a96, 0 locals ()
    Action routine for:
        "froboz"

 7a97:  b3 ...                  print_ret       "The FROBOZZ Corporation created, owns, and operates this dungeon."

Routine 7ac4, 0 locals ()
    Pre-action routine for:
        "hand OBJ to OBJ"
"donate OBJ to OBJ"

 7ac5:  e0 2f 4a 76 86 00       call            94ec g76 -> sp
 7acb:  a0 00 40                jz              sp ~rfalse
 7ace:  b2 ...                  print           "That's easy for you to say since you don't even have the "
 7aed:  aa 86                   print_obj       g76
 7aef:  b3 ...                  print_ret       "."

Routine 7af2, 0 locals ()
    Action routine for:
        "hand OBJ to OBJ"
"donate OBJ to OBJ"

 7af3:  4a 87 1e d7             test_attr       g77 #1e 7b0c
 7af7:  b2 ...                  print           "You can't give a "
 7b00:  aa 86                   print_obj       g76
 7b02:  b2 ...                  print           " to a "
 7b07:  aa 87                   print_obj       g77
 7b09:  b3 ...                  print_ret       "!"
 7b0c:  b2 ...                  print           "The "
 7b0f:  aa 87                   print_obj       g77
 7b11:  b3 ...                  print_ret       " refuses it politely."

Routine 7b20, 0 locals ()
    Action routine for:
        "hatch OBJ"

 7b21:  b3 ...                  print_ret       "Bizarre!"

Routine 7b2a, 0 locals ()
    Action routine for:
        "hello OBJ"
"hello"

 7b2b:  a0 86 80 50             jz              g76 7b7d
 7b2f:  4a 86 1e 5c             test_attr       g76 #1e ~7b4d
 7b33:  b2 ...                  print           "The "
 7b36:  aa 86                   print_obj       g76
 7b38:  b3 ...                  print_ret       " bows his head to you in greeting."
 7b4d:  b2 ...                  print           "It's a well known fact that only schizophrenics say ~Hello~ to a "
 7b78:  aa 86                   print_obj       g76
 7b7a:  b3 ...                  print_ret       "."
 7b7d:  e0 2f 27 36 46 00       call            4e6c g36 -> sp
 7b83:  ad 00                   print_paddr     sp
 7b85:  bb                      new_line        
 7b86:  b0                      rtrue           

Routine 7b88, 0 locals ()
    Action routine for:
        "chant"

 7b89:  b2 ...                  print           "The incantation echoes back faintly, but nothing else happens."
 7bae:  bb                      new_line        
 7baf:  0d 70 00                store           g60 #00
 7bb2:  0d 7c 00                store           g6c #00
 7bb5:  b0                      rtrue           

Routine 7bb6, 0 locals ()
    Action routine for:
        "inflat OBJ with OBJ"
"blow up OBJ with OBJ"

 7bb7:  b3 ...                  print_ret       "How can you inflate that?"

Routine 7bc6, 0 locals ()
    Action routine for:
        "is OBJ on OBJ"
"is OBJ in OBJ"

 7bc7:  66 86 87 60             jin             g76 g77 ~7be9
 7bcb:  b2 ...                  print           "Yes, it is "
 7bd4:  4a 87 0a 48             test_attr       g77 #0a ~7bde
 7bd8:  b2 ...                  print           "on"
 7bdb:  8c 00 05                jump            7be1
 7bde:  b2 ...                  print           "in"
 7be1:  b2 ...                  print           " the "
 7be4:  aa 87                   print_obj       g77
 7be6:  b3 ...                  print_ret       "."
 7be9:  b3 ...                  print_ret       "No, it isn't."

Routine 7bf4, 0 locals ()
    Action routine for:
        "kick OBJ"

 7bf5:  e0 0f 49 2e 9a 4c 00    call            925c s166 -> sp
 7bfc:  b8                      ret_popped      

Routine 7bfe, 0 locals ()
    Action routine for:
        "kiss OBJ"

 7bff:  b3 ...                  print_ret       "I'd sooner kiss a pig."

Routine 7c12, 0 locals ()
    Action routine for:
        "knock on OBJ"
"knock at OBJ"

 7c13:  4a 86 17 4f             test_attr       g76 #17 ~7c24
 7c17:  b3 ...                  print_ret       "Nobody's home."
 7c24:  b2 ...                  print           "Why knock on a "
 7c2f:  aa 86                   print_obj       g76
 7c31:  b3 ...                  print_ret       "?"

Routine 7c34, 0 locals ()
    Action routine for:
        "flip off OBJ"
"hide out OBJ"
"douse OBJ"
"blow out OBJ"

 7c35:  4a 86 1f 00 3e          test_attr       g76 #1f ~7c76
 7c3a:  4a 86 14 cb             test_attr       g76 #14 7c47
 7c3e:  b3 ...                  print_ret       "It is already off."
 7c47:  4c 86 14                clear_attr      g76 #14
 7c4a:  a0 52 c8                jz              g42 7c53
 7c4d:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 7c53:  b2 ...                  print           "The "
 7c56:  aa 86                   print_obj       g76
 7c58:  b2 ...                  print           " is now off."
 7c61:  bb                      new_line        
 7c62:  a0 52 41                jz              g42 ~rtrue
 7c65:  b2 ...                  print           "It is now pitch black."
 7c74:  bb                      new_line        
 7c75:  b0                      rtrue           
 7c76:  b3 ...                  print_ret       "You can't turn that off."

Routine 7c84, 0 locals ()
    Action routine for:
        "flip on OBJ with OBJ"
"flip on OBJ"
"light OBJ"
"activa OBJ"

 7c85:  4a 86 1f 71             test_attr       g76 #1f ~7cb8
 7c89:  4a 86 14 4b             test_attr       g76 #14 ~7c96
 7c8d:  b3 ...                  print_ret       "It is already on."
 7c96:  4b 86 14                set_attr        g76 #14
 7c99:  b2 ...                  print           "The "
 7c9c:  aa 86                   print_obj       g76
 7c9e:  b2 ...                  print           " is now on."
 7ca7:  bb                      new_line        
 7ca8:  a0 52 41                jz              g42 ~rtrue
 7cab:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 7cb1:  bb                      new_line        
 7cb2:  e0 3f 3f 02 00          call            7e04 -> sp
 7cb7:  b0                      rtrue           
 7cb8:  b3 ...                  print_ret       "You can't turn that on."

Routine 7cc6, 0 locals ()
    Action routine for:
        "launch OBJ"

 7cc7:  4a 86 1b 5b             test_attr       g76 #1b ~7ce4
 7ccb:  b3 ...                  print_ret       "You can't launch that by saying ~launch~!"
 7ce4:  b3 ...                  print_ret       "That's pretty weird."

Routine 7cf6, 0 locals ()
    Action routine for:
        "lean on OBJ"

 7cf7:  b3 ...                  print_ret       "Getting tired?"

Routine 7d04, 2 locals (0000, 0000)
    Action routine for:
        "go over OBJ"
"dive off OBJ"
"dive from OBJ"
"dive in OBJ"
"dive across OBJ"
"dive over OBJ"
"dive"

 7d09:  a0 86 f7                jz              g76 7d41
 7d0c:  66 86 10 62             jin             g76 g00 ~7d30
 7d10:  4a 86 1e 58             test_attr       g76 #1e ~7d2a
 7d14:  b2 ...                  print           "The "
 7d17:  aa 86                   print_obj       g76
 7d19:  b3 ...                  print_ret       " is too big to jump over."
 7d2a:  e0 3f 43 12 00          call            8624 -> sp
 7d2f:  b8                      ret_popped      
 7d30:  b3 ...                  print_ret       "That would be a good trick."
 7d41:  52 10 16 01             get_prop_addr   g00 #16 -> local0
 7d45:  a0 01 80 8d             jz              local0 7dd4
 7d49:  a4 01 02                get_prop_len    local0 -> local1
 7d4c:  41 02 02 d0             je              local1 #02 7d5e
 7d50:  41 02 04 77             je              local1 #04 ~7d89
 7d54:  50 01 01 00             loadb           local0 #01 -> sp
 7d58:  ae 00 00                load            [sp] -> sp
 7d5b:  a0 00 6d                jz              sp ~7d89
 7d5e:  b2 ...                  print           "This was not a very safe place to try jumping."
 7d7b:  bb                      new_line        
 7d7c:  e0 2f 27 36 54 00       call            4e6c g44 -> sp
 7d82:  e0 2f 83 33 00 00       call            10666 sp -> sp
 7d88:  b8                      ret_popped      
 7d89:  41 10 58 00 42          je              g00 #58 ~7dce
 7d8e:  b2 ...                  print           "In a feat of unaccustomed daring, you manage to land on your feet without killing yourself."
 7dc5:  bb                      new_line        
 7dc6:  bb                      new_line        
 7dc7:  e0 1f 4a 38 16 00       call            9470 #16 -> sp
 7dcd:  b0                      rtrue           
 7dce:  e0 3f 43 12 00          call            8624 -> sp
 7dd3:  b8                      ret_popped      
 7dd4:  e0 3f 43 12 00          call            8624 -> sp
 7dd9:  b8                      ret_popped      

Routine 7dda, 0 locals ()
    Action routine for:
        "leave"

 7ddb:  e0 1f 4a 38 14 00       call            9470 #14 -> sp
 7de1:  b8                      ret_popped      

Routine 7de2, 0 locals ()
    Action routine for:
        "listen for OBJ"
"listen to OBJ"

 7de3:  b2 ...                  print           "The "
 7de6:  aa 86                   print_obj       g76
 7de8:  b3 ...                  print_ret       " makes no sound."

Routine 7df6, 0 locals ()
    Action routine for:
        "lock OBJ with OBJ"

 7df7:  b3 ...                  print_ret       "It doesn't seem to work."

Routine 7e04, 0 locals ()
    Action routine for:
        "gaze down OBJ"
"gaze up OBJ"
"gaze around OBJ"
"gaze"

 7e05:  e0 1f 46 4d 01 00       call            8c9a #01 -> sp
 7e0b:  a0 00 c0                jz              sp rfalse
 7e0e:  e0 1f 46 a7 01 00       call            8d4e #01 -> sp
 7e14:  b8                      ret_popped      

Routine 7e16, 0 locals ()
    Action routine for:
        "gaze behind OBJ"

 7e17:  b2 ...                  print           "There is nothing behind the "
 7e22:  aa 86                   print_obj       g76
 7e24:  b3 ...                  print_ret       "."

Routine 7e28, 0 locals ()
    Action routine for:
        "gaze in OBJ"
"gaze with OBJ"
"descri on OBJ"
"descri in OBJ"

 7e29:  4a 86 17 77             test_attr       g76 #17 ~7e62
 7e2d:  4a 86 0b 65             test_attr       g76 #0b ~7e54
 7e31:  b2 ...                  print           "The "
 7e34:  aa 86                   print_obj       g76
 7e36:  b2 ...                  print           " is open, but I can't tell what's beyond it."
 7e51:  8c 00 0e                jump            7e60
 7e54:  b2 ...                  print           "The "
 7e57:  aa 86                   print_obj       g76
 7e59:  b2 ...                  print           " is closed."
 7e60:  bb                      new_line        
 7e61:  b0                      rtrue           
 7e62:  4a 86 13 00 47          test_attr       g76 #13 ~7eac
 7e67:  4a 86 1e 53             test_attr       g76 #1e ~7e7c
 7e6b:  b3 ...                  print_ret       "There is nothing special to be seen."
 7e7c:  e0 2f 48 29 86 00       call            9052 g76 -> sp
 7e82:  a0 00 dd                jz              sp 7ea0
 7e85:  a2 86 00 4b             get_child       g76 -> sp ~7e92
 7e89:  e0 2f 47 55 86 00       call            8eaa g76 -> sp
 7e8f:  a0 00 41                jz              sp ~rtrue
 7e92:  b2 ...                  print           "The "
 7e95:  aa 86                   print_obj       g76
 7e97:  b3 ...                  print_ret       " is empty."
 7ea0:  b2 ...                  print           "The "
 7ea3:  aa 86                   print_obj       g76
 7ea5:  b3 ...                  print_ret       " is closed."
 7eac:  b2 ...                  print           "You can't look inside a "
 7eb9:  aa 86                   print_obj       g76
 7ebb:  b3 ...                  print_ret       "."

Routine 7ebe, 0 locals ()
    Action routine for:
        "gaze on OBJ"

 7ebf:  4a 86 0a 4a             test_attr       g76 #0a ~7ecb
 7ec3:  e0 1b 2b be 39 86 00    call            577c #39 g76 -> sp
 7eca:  b0                      rtrue           
 7ecb:  b2 ...                  print           "Look on a "
 7ed4:  aa 86                   print_obj       g76
 7ed6:  b3 ...                  print_ret       "???"

Routine 7edc, 0 locals ()
    Action routine for:
        "gaze under OBJ"

 7edd:  b3 ...                  print_ret       "There is nothing but dust there."

Routine 7eea, 0 locals ()
    Action routine for:
        "lower OBJ"

 7eeb:  e0 0f 49 2e 9a 6e 00    call            925c s170 -> sp
 7ef2:  b8                      ret_popped      

Routine 7ef4, 0 locals ()
    Action routine for:
        "make OBJ"

 7ef5:  b3 ...                  print_ret       "You can't do that."

Routine 7efe, 0 locals ()
    Action routine for:
        "liquif OBJ with OBJ"

 7eff:  b2 ...                  print           "It's not clear that a "
 7f0a:  aa 86                   print_obj       g76
 7f0c:  b3 ...                  print_ret       " can be melted."

Routine 7f18, 0 locals ()
    Pre-action routine for:
        "pull up OBJ"
"pull on OBJ"
"pull OBJ"
"roll OBJ"
"roll up OBJ"
"move OBJ"

 7f19:  e0 2f 4a 76 86 00       call            94ec g76 -> sp
 7f1f:  a0 00 c0                jz              sp rfalse
 7f22:  b3 ...                  print_ret       "You aren't an accomplished enough juggler."

Routine 7f40, 0 locals ()
    Action routine for:
        "pull up OBJ"
"pull on OBJ"
"pull OBJ"
"roll OBJ"
"roll up OBJ"
"move OBJ"

 7f41:  4a 86 11 5a             test_attr       g76 #11 ~7f5d
 7f45:  b2 ...                  print           "Moving the "
 7f4e:  aa 86                   print_obj       g76
 7f50:  b3 ...                  print_ret       " reveals nothing."
 7f5d:  b2 ...                  print           "You can't move the "
 7f66:  aa 86                   print_obj       g76
 7f68:  b3 ...                  print_ret       "."

Routine 7f6c, 0 locals ()
    Action routine for:
        "mumble"

 7f6d:  b3 ...                  print_ret       "You'll have to speak up if you expect me to hear you!"

Routine 7f90, 0 locals ()
    Pre-action routine for:
        "punctu OBJ with OBJ"
"poke OBJ with OBJ"
"block down OBJ with OBJ"
"block OBJ with OBJ"

 7f91:  e0 3f 28 68 00          call            50d0 -> sp
 7f96:  a0 00 41                jz              sp ~rtrue
 7f99:  a0 87 c6                jz              g77 7fa0
 7f9c:  4a 87 1d c0             test_attr       g77 #1d rfalse
 7fa0:  b2 ...                  print           "Trying to destroy the "
 7faf:  aa 86                   print_obj       g76
 7fb1:  b2 ...                  print           " with "
 7fb4:  a0 87 4e                jz              g77 ~7fc3
 7fb7:  b2 ...                  print           "your bare hands"
 7fc0:  8c 00 07                jump            7fc8
 7fc3:  b2 ...                  print           "a "
 7fc6:  aa 87                   print_obj       g77
 7fc8:  b3 ...                  print_ret       " is futile."

Routine 7fd2, 0 locals ()
    Action routine for:
        "punctu OBJ with OBJ"
"poke OBJ with OBJ"
"block down OBJ with OBJ"
"block OBJ with OBJ"

 7fd3:  4a 86 1e 4a             test_attr       g76 #1e ~7fdf
 7fd7:  e0 1b 2b be 13 86 00    call            577c #13 g76 -> sp
 7fde:  b0                      rtrue           
 7fdf:  b3 ...                  print_ret       "Nice try."

Routine 7fe8, 0 locals ()
    Action routine for:
        "odysse"

 7fe9:  41 10 b9 00 6d          je              g00 #b9 ~8059
 7fee:  26 ba 10 00 68          jin             "cyclops" g00 ~8059
 7ff3:  a0 a5 00 64             jz              g95 ~8059
 7ff7:  e0 0f 2a 43 64 9f 00    call            5486 #649f -> sp
 7ffe:  e1 97 00 00 00          storew          sp #00 #00
 8003:  0d a5 01                store           g95 #01
 8006:  b2 ...                  print           "The cyclops, hearing the name of his father's deadly nemesis, flees the room by knocking down the wall on the east of the room."
 804b:  bb                      new_line        
 804c:  0d 9f 01                store           g8f #01
 804f:  0c ba 02                clear_attr      "cyclops" #02
 8052:  e0 1f 3c 5d ba 00       call            78ba #ba -> sp
 8058:  b8                      ret_popped      
 8059:  b3 ...                  print_ret       "Wasn't he a sailor?"

Routine 806a, 0 locals ()
    Action routine for:
        "grease OBJ with OBJ"

 806b:  b3 ...                  print_ret       "You probably put spinach in your gas tank, too."

Routine 8084, 2 locals (0000, 0000)
    Action routine for:
        "open OBJ with OBJ"
"open up OBJ"
"open OBJ"
"block in OBJ"

 8089:  4a 86 13 00 6b          test_attr       g76 #13 ~80f7
 808e:  51 86 0a 00             get_prop        g76 #0a -> sp
 8092:  a0 00 80 63             jz              sp 80f7
 8096:  4a 86 0b 4b             test_attr       g76 #0b ~80a3
 809a:  b3 ...                  print_ret       "It is already open."
 80a3:  4b 86 0b                set_attr        g76 #0b
 80a6:  4b 86 03                set_attr        g76 #03
 80a9:  a2 86 00 46             get_child       g76 -> sp ~80b1
 80ad:  4a 86 0c 49             test_attr       g76 #0c ~80b8
 80b1:  b3 ...                  print_ret       "Opened."
 80b8:  a2 86 01 62             get_child       g76 -> local0 ~80dc
 80bc:  a1 01 00 de             get_sibling     local0 -> sp 80dc
 80c0:  4a 01 03 da             test_attr       local0 #03 80dc
 80c4:  51 01 0e 02             get_prop        local0 #0e -> local1
 80c8:  a0 02 d3                jz              local1 80dc
 80cb:  b2 ...                  print           "The "
 80ce:  aa 86                   print_obj       g76
 80d0:  b2 ...                  print           " opens."
 80d7:  bb                      new_line        
 80d8:  ad 02                   print_paddr     local1
 80da:  bb                      new_line        
 80db:  b0                      rtrue           
 80dc:  b2 ...                  print           "Opening the "
 80e5:  aa 86                   print_obj       g76
 80e7:  b2 ...                  print           " reveals "
 80ee:  e0 2f 47 2c 86 00       call            8e58 g76 -> sp
 80f4:  b3 ...                  print_ret       "."
 80f7:  4a 86 17 60             test_attr       g76 #17 ~8119
 80fb:  4a 86 0b 4b             test_attr       g76 #0b ~8108
 80ff:  b3 ...                  print_ret       "It is already open."
 8108:  b2 ...                  print           "The "
 810b:  aa 86                   print_obj       g76
 810d:  b2 ...                  print           " opens."
 8114:  bb                      new_line        
 8115:  4b 86 0b                set_attr        g76 #0b
 8118:  b0                      rtrue           
 8119:  b2 ...                  print           "You must tell me how to do that to a "
 8130:  aa 86                   print_obj       g76
 8132:  b3 ...                  print_ret       "."

Routine 8136, 1 local (0000)
    Action routine for:
        "chuck OBJ OBJ"

 8139:  41 87 f8 70             je              g77 #f8 ~816b
 813d:  a3 7f 01                get_parent      g6f -> local0
 8140:  4a 01 1b 5c             test_attr       local0 #1b ~815e
 8144:  a3 01 00                get_parent      local0 -> sp
 8147:  6e 86 00                insert_obj      g76 sp
 814a:  b2 ...                  print           "Ahoy -- "
 8153:  aa 86                   print_obj       g76
 8155:  b3 ...                  print_ret       " overboard!"
 815e:  b3 ...                  print_ret       "You're not in anything!"
 816b:  b3 ...                  print_ret       "Huh?"

Routine 8170, 0 locals ()
    Action routine for:
        "pick OBJ with OBJ"
"pick OBJ"

 8171:  b3 ...                  print_ret       "You can't pick that."

Routine 817c, 0 locals ()
    Action routine for:
        "play OBJ"

 817d:  b3 ...                  print_ret       "That's silly!"

Routine 818a, 0 locals ()
    Action routine for:
        "fix OBJ with OBJ"

 818b:  b3 ...                  print_ret       "This has no effect."

Routine 8196, 0 locals ()
    Action routine for:
        "pour OBJ on OBJ"

 8197:  41 86 ed 00 4a          je              g76 #ed ~81e4
 819c:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 81a2:  4a 87 19 60             test_attr       g77 #19 ~81c4
 81a6:  4a 87 14 5c             test_attr       g77 #14 ~81c4
 81aa:  b2 ...                  print           "The "
 81ad:  aa 87                   print_obj       g77
 81af:  b2 ...                  print           " is extinguished."
 81bc:  bb                      new_line        
 81bd:  4c 87 14                clear_attr      g77 #14
 81c0:  4c 87 19                clear_attr      g77 #19
 81c3:  b0                      rtrue           
 81c4:  b2 ...                  print           "The water spills over the "
 81cf:  aa 87                   print_obj       g77
 81d1:  b3 ...                  print_ret       ", to the floor, and evaporates."
 81e4:  41 86 62 4b             je              g76 #62 ~81f1
 81e8:  e0 16 2b be 12 62 87 00 call            577c #12 #62 g77 -> sp
 81f0:  b8                      ret_popped      
 81f1:  b3 ...                  print_ret       "You can't pour that."

Routine 81fc, 0 locals ()
    Action routine for:
        "pray"

 81fd:  41 10 d4 49             je              g00 #d4 ~8208
 8201:  e0 1f 49 5b 4e 00       call            92b6 #4e -> sp
 8207:  b8                      ret_popped      
 8208:  b3 ...                  print_ret       "If you pray enough, your prayers may be answered."

Routine 8228, 0 locals ()
    Action routine for:
        "pump up OBJ with OBJ"
"pump up OBJ"

 8229:  a0 87 d6                jz              g77 8240
 822c:  41 87 ad d2             je              g77 #ad 8240
 8230:  b2 ...                  print           "Pump it up with a "
 823b:  aa 87                   print_obj       g77
 823d:  b3 ...                  print_ret       "?"
 8240:  26 ad 7f 4b             jin             "hand-held air pump" g6f ~824d
 8244:  e0 19 2b be 17 86 ad 00 call            577c #17 g76 #ad -> sp
 824c:  b8                      ret_popped      
 824d:  b3 ...                  print_ret       "It's really not clear how."

Routine 825e, 0 locals ()
    Action routine for:
        "press on OBJ"
"press OBJ"

 825f:  e0 0f 49 2e 9a 75 00    call            925c s171 -> sp
 8266:  b8                      ret_popped      

Routine 8268, 0 locals ()
    Action routine for:
        "slide OBJ to OBJ"
"slide OBJ OBJ"
"press OBJ to OBJ"
"press OBJ OBJ"

 8269:  b3 ...                  print_ret       "You can't push things to that."

Routine 827a, 0 locals ()
    Pre-action routine for:
        "chuck OBJ in OBJ"
"squeez OBJ on OBJ"
"hide OBJ in OBJ"
"move OBJ in OBJ"
"drop OBJ in OBJ"
"drop OBJ down OBJ"
"apply OBJ to OBJ"
"chuck OBJ on OBJ"
"hide OBJ on OBJ"
"drop OBJ on OBJ"

 827b:  e0 3f 28 68 00          call            50d0 -> sp
 8280:  a0 00 40                jz              sp ~rfalse
 8283:  e0 3f 3d 62 00          call            7ac4 -> sp
 8288:  b8                      ret_popped      

Routine 828a, 1 local (0000)
    Action routine for:
        "chuck OBJ in OBJ"
"squeez OBJ on OBJ"
"hide OBJ in OBJ"
"move OBJ in OBJ"
"drop OBJ in OBJ"
"drop OBJ down OBJ"
"apply OBJ to OBJ"

 828d:  4a 87 0b da             test_attr       g77 #0b 82a9
 8291:  4a 87 17 c6             test_attr       g77 #17 8299
 8295:  4a 87 13 d2             test_attr       g77 #13 82a9
 8299:  4a 87 1b 45             test_attr       g77 #1b ~82a0
 829d:  8c 00 0b                jump            82a9
 82a0:  b3 ...                  print_ret       "You can't do that."
 82a9:  4a 87 0b da             test_attr       g77 #0b 82c5
 82ad:  b2 ...                  print           "The "
 82b0:  aa 87                   print_obj       g77
 82b2:  b2 ...                  print           " isn't open."
 82bd:  bb                      new_line        
 82be:  e0 2f 4a 98 87 00       call            9530 g77 -> sp
 82c4:  b8                      ret_popped      
 82c5:  61 87 86 4f             je              g77 g76 ~82d6
 82c9:  b3 ...                  print_ret       "How can you do that?"
 82d6:  66 86 87 53             jin             g76 g77 ~82eb
 82da:  b2 ...                  print           "The "
 82dd:  aa 86                   print_obj       g76
 82df:  b2 ...                  print           " is already in the "
 82e6:  aa 87                   print_obj       g77
 82e8:  b3 ...                  print_ret       "."
 82eb:  e0 2f 49 16 87 01       call            922c g77 -> local0
 82f1:  e0 2f 49 16 86 00       call            922c g76 -> sp
 82f7:  74 01 00 01             add             local0 sp -> local0
 82fb:  51 87 0f 00             get_prop        g77 #0f -> sp
 82ff:  75 01 00 01             sub             local0 sp -> local0
 8303:  51 87 0a 00             get_prop        g77 #0a -> sp
 8307:  63 01 00 4d             jg              local0 sp ~8316
 830b:  b3 ...                  print_ret       "There's no room."
 8316:  e0 2f 4a 76 86 00       call            94ec g76 -> sp
 831c:  a0 00 52                jz              sp ~832f
 831f:  4a 86 0d 4e             test_attr       g76 #0d ~832f
 8323:  b2 ...                  print           "You don't have the "
 832a:  aa 86                   print_obj       g76
 832c:  b3 ...                  print_ret       "."
 832f:  e0 2f 4a 76 86 00       call            94ec g76 -> sp
 8335:  a0 00 4a                jz              sp ~8340
 8338:  e0 3f 48 7a 00          call            90f4 -> sp
 833d:  a0 00 c1                jz              sp rtrue
 8340:  6e 86 87                insert_obj      g76 g77
 8343:  4b 86 03                set_attr        g76 #03
 8346:  e0 2f 48 5d 86 00       call            90ba g76 -> sp
 834c:  b3 ...                  print_ret       "Done."

Routine 8354, 0 locals ()
    Action routine for:
        "hide OBJ behind OBJ"

 8355:  b3 ...                  print_ret       "That hiding place is too obvious."

Routine 836c, 0 locals ()
    Action routine for:
        "chuck OBJ on OBJ"
"hide OBJ on OBJ"
"drop OBJ on OBJ"

 836d:  41 87 08 4a             je              g77 #08 ~8379
 8371:  e0 1b 2b be 31 86 00    call            577c #31 g76 -> sp
 8378:  b0                      rtrue           
 8379:  4a 87 0a 48             test_attr       g77 #0a ~8383
 837d:  e0 3f 41 45 00          call            828a -> sp
 8382:  b8                      ret_popped      
 8383:  b2 ...                  print           "There's no good surface on the "
 8398:  aa 87                   print_obj       g77
 839a:  b3 ...                  print_ret       "."

Routine 839e, 0 locals ()
    Action routine for:
        "slide OBJ under OBJ"
"hide OBJ under OBJ"
"press OBJ under OBJ"

 839f:  b3 ...                  print_ret       "You can't do that."

Routine 83a8, 0 locals ()
    Action routine for:
        "lift up OBJ"
"lift OBJ"

 83a9:  e0 3f 3f 75 00          call            7eea -> sp
 83ae:  b8                      ret_popped      

Routine 83b0, 0 locals ()
    Action routine for:
        "molest OBJ"

 83b1:  b3 ...                  print_ret       "What a (ahem!) strange idea."

Routine 83c8, 0 locals ()
    Pre-action routine for:
        "read OBJ with OBJ"
"read from OBJ"
"read OBJ"
"gaze at OBJ with OBJ"

 83c9:  a0 52 53                jz              g42 ~83dd
 83cc:  b3 ...                  print_ret       "It is impossible to read in the dark."
 83dd:  a0 87 c0                jz              g77 rfalse
 83e0:  4a 87 0c c0             test_attr       g77 #0c rfalse
 83e4:  b2 ...                  print           "How does one look through a "
 83f5:  aa 87                   print_obj       g77
 83f7:  b3 ...                  print_ret       "?"

Routine 83fa, 0 locals ()
    Action routine for:
        "read OBJ with OBJ"
"read from OBJ"
"read OBJ"
"gaze at OBJ with OBJ"

 83fb:  4a 86 10 d6             test_attr       g76 #10 8413
 83ff:  b2 ...                  print           "How does one read a "
 840e:  aa 86                   print_obj       g76
 8410:  b3 ...                  print_ret       "?"
 8413:  51 86 08 00             get_prop        g76 #08 -> sp
 8417:  ad 00                   print_paddr     sp
 8419:  bb                      new_line        
 841a:  b0                      rtrue           

Routine 841c, 0 locals ()
    Action routine for:
        "read OBJ OBJ"

 841d:  e0 1b 2b be 53 86 00    call            577c #53 g76 -> sp
 8424:  b0                      rtrue           

Routine 8426, 0 locals ()
    Action routine for:
        "repent"

 8427:  b3 ...                  print_ret       "It could very well be too late!"

Routine 843c, 0 locals ()
    Action routine for:
        "answer OBJ"

 843d:  b2 ...                  print           "It is hardly likely that the "
 844e:  aa 86                   print_obj       g76
 8450:  b2 ...                  print           " is interested."
 845b:  bb                      new_line        
 845c:  0d 7c 00                store           g6c #00
 845f:  0d 70 00                store           g60 #00
 8462:  b0                      rtrue           

Routine 8464, 0 locals ()
    Action routine for:
        "peal OBJ with OBJ"
"peal OBJ"

 8465:  b3 ...                  print_ret       "How, exactly, can you ring that?"

Routine 847a, 0 locals ()
    Action routine for:
        "feel OBJ with OBJ"
"feel OBJ"

 847b:  e0 0f 49 2e 9a 79 00    call            925c s172 -> sp
 8482:  b8                      ret_popped      

Routine 8484, 1 local (0000)
    Action routine for:
        "say"

 8487:  a0 7c 4b                jz              g6c ~8493
 848a:  b3 ...                  print_ret       "Say what?"
 8493:  0d 70 00                store           g60 #00
 8496:  b0                      rtrue           

orphan code fragment:

 8497:  e0 27 4a 5f 10 1e 01    call            94be g00 #1e -> local0
 849e:  a0 01 e3                jz              local0 84c2
 84a1:  b2 ...                  print           "You must address the "
 84ae:  aa 01                   print_obj       local0
 84b0:  b2 ...                  print           " directly."
 84b9:  bb                      new_line        
 84ba:  0d 70 00                store           g60 #00
 84bd:  0d 7c 00                store           g6c #00
 84c0:  ab 7c                   ret             g6c
 84c2:  6f 7e 7c 00             loadw           g6e g6c -> sp
 84c6:  c1 8f 00 42 de 46       je              sp "hello" ~84d0
 84cc:  0d 70 00                store           g60 #00
 84cf:  b0                      rtrue           
 84d0:  0d 70 00                store           g60 #00
 84d3:  0d 7c 00                store           g6c #00
 84d6:  b3 ...                  print_ret       "Talking to yourself is a sign of impending mental collapse."

Routine 8500, 0 locals ()
    Action routine for:
        "search in OBJ"
"search OBJ"

 8501:  b3 ...                  print_ret       "You find nothing unusual."

Routine 850e, 0 locals ()
    Action routine for:
        "send for OBJ"

 850f:  4a 86 1e 54             test_attr       g76 #1e ~8525
 8513:  b2 ...                  print           "Why would you send for the "
 8520:  aa 86                   print_obj       g76
 8522:  b3 ...                  print_ret       "?"
 8525:  b3 ...                  print_ret       "That doesn't make sends."

Routine 8534, 0 locals ()
    Pre-action routine for:
        "hand OBJ OBJ"
"donate OBJ OBJ"

 8535:  e0 1a 2b be 3f 87 86 00 call            577c #3f g77 g76 -> sp
 853d:  b0                      rtrue           

Routine 853e, 0 locals ()
    Action routine for:
        "hand OBJ OBJ"
"donate OBJ OBJ"

 853f:  b3 ...                  print_ret       "Foo!"

Routine 8544, 0 locals ()
    Action routine for:
        "shake OBJ"

 8545:  4a 86 1e 51             test_attr       g76 #1e ~8558
 8549:  b3 ...                  print_ret       "This seems to have no effect."
 8558:  4a 86 11 db             test_attr       g76 #11 8575
 855c:  b3 ...                  print_ret       "You can't take it; thus, you can't shake it!"
 8575:  4a 86 13 00 7d          test_attr       g76 #13 ~85f5
 857a:  4a 86 0b 00 44          test_attr       g76 #0b ~85c1
 857f:  a2 86 00 79             get_child       g76 -> sp ~85ba
 8583:  e0 3f 42 fe 00          call            85fc -> sp
 8588:  b2 ...                  print           "The contents of the "
 8593:  aa 86                   print_obj       g76
 8595:  b2 ...                  print           " spills "
 859c:  4a 10 06 d0             test_attr       g00 #06 85ae
 85a0:  b2 ...                  print           "out and disappears"
 85ab:  8c 00 0b                jump            85b7
 85ae:  b2 ...                  print           "to the ground"
 85b7:  b3 ...                  print_ret       "."
 85ba:  b3 ...                  print_ret       "Shaken."
 85c1:  a2 86 00 62             get_child       g76 -> sp ~85e5
 85c5:  b2 ...                  print           "It sounds like there is something inside the "
 85e0:  aa 86                   print_obj       g76
 85e2:  b3 ...                  print_ret       "."
 85e5:  b2 ...                  print           "The "
 85e8:  aa 86                   print_obj       g76
 85ea:  b3 ...                  print_ret       " sounds empty."
 85f5:  b3 ...                  print_ret       "Shaken."

Routine 85fc, 1 local (0000)

 85ff:  a2 86 01 41             get_child       g76 -> local0 ~rtrue
 8603:  4b 01 03                set_attr        local0 #03
 8606:  41 10 58 48             je              g00 #58 ~8610
 860a:  e8 7f 4b                push            #4b
 860d:  8c 00 0f                jump            861d
 8610:  4a 10 06 c8             test_attr       g00 #06 861a
 8614:  e8 7f 0d                push            #0d
 8617:  8c 00 05                jump            861d
 861a:  e8 bf 10                push            g00
 861d:  6e 01 00                insert_obj      local0 sp
 8620:  8c ff de                jump            85ff

Routine 8624, 0 locals ()
    Action routine for:
        "hop"

 8625:  e0 2f 27 36 53 00       call            4e6c g43 -> sp
 862b:  ad 00                   print_paddr     sp
 862d:  bb                      new_line        
 862e:  b0                      rtrue           

Routine 8630, 0 locals ()
    Action routine for:
        "smell OBJ"

 8631:  b2 ...                  print           "It smells like a "
 863e:  aa 86                   print_obj       g76
 8640:  b3 ...                  print_ret       "."

Routine 8644, 0 locals ()
    Action routine for:
        "spin OBJ"

 8645:  b3 ...                  print_ret       "You can't spin that!"

Routine 864e, 0 locals ()
    Action routine for:
        "spray OBJ on OBJ"

 864f:  e0 3f 43 2b 00          call            8656 -> sp
 8654:  b8                      ret_popped      

Routine 8656, 0 locals ()
    Action routine for:
        "squeez OBJ"

 8657:  4a 86 1e 5b             test_attr       g76 #1e ~8674
 865b:  b2 ...                  print           "The "
 865e:  aa 86                   print_obj       g76
 8660:  b2 ...                  print           " does not understand this."
 8671:  8c 00 15                jump            8687
 8674:  b2 ...                  print           "How singularly useless."
 8687:  bb                      new_line        
 8688:  b0                      rtrue           

Routine 868a, 0 locals ()
    Action routine for:
        "spray OBJ with OBJ"

 868b:  e0 1a 2b be 77 87 86 00 call            577c #77 g77 g76 -> sp
 8693:  b8                      ret_popped      

Routine 8694, 1 local (0000)
    Action routine for:
        "stab OBJ"

 8697:  e0 2f 7d 76 7f 01       call            faec g6f -> local0
 869d:  a0 01 cb                jz              local0 86a9
 86a0:  e0 1a 2b be 13 86 01 00 call            577c #13 g76 local0 -> sp
 86a8:  b0                      rtrue           
 86a9:  b2 ...                  print           "No doubt you propose to stab the "
 86be:  aa 86                   print_obj       g76
 86c0:  b3 ...                  print_ret       " with your pinky?"

Routine 86ca, 0 locals ()
    Action routine for:
        "carry up OBJ"
"stand up OBJ"
"stand"

 86cb:  a3 7f 00                get_parent      g6f -> sp
 86ce:  4a 00 1b 4d             test_attr       sp #1b ~86dd
 86d2:  a3 7f 00                get_parent      g6f -> sp
 86d5:  e0 1b 2b be 2d 00 00    call            577c #2d sp -> sp
 86dc:  b0                      rtrue           
 86dd:  b3 ...                  print_ret       "You are already standing, I think."

Routine 86f0, 0 locals ()
    Action routine for:
        "stay"

 86f1:  b3 ...                  print_ret       "You will be lost without me!"

Routine 8702, 0 locals ()
    Action routine for:
        "strike OBJ"

 8703:  4a 86 1e 00 40          test_attr       g76 #1e ~8746
 8708:  b2 ...                  print           "Since you aren't versed in hand-to-hand combat, you'd better attack the "
 8739:  aa 86                   print_obj       g76
 873b:  b3 ...                  print_ret       " with a weapon."
 8746:  e0 1b 2b be 0e 86 00    call            577c #0e g76 -> sp
 874d:  b0                      rtrue           

Routine 874e, 0 locals ()
    Action routine for:
        "bathe in OBJ"
"bathe"

 874f:  e0 1b 4a 50 ee 10 00    call            94a0 #ee g00 -> sp
 8756:  a0 00 f1                jz              sp 8788
 8759:  b2 ...                  print           "Swimming isn't usually allowed in the "
 8774:  a0 86 ca                jz              g76 877f
 8777:  aa 86                   print_obj       g76
 8779:  b2 ...                  print           "."
 877c:  8c 00 09                jump            8786
 877f:  b2 ...                  print           "dungeon."
 8786:  bb                      new_line        
 8787:  b0                      rtrue           
 8788:  e0 3f 28 68 00          call            50d0 -> sp
 878d:  a0 00 40                jz              sp ~rfalse
 8790:  b3 ...                  print_ret       "Go jump in a lake!"

Routine 87a0, 0 locals ()
    Action routine for:
        "swing OBJ at OBJ"
"swing OBJ"

 87a1:  a0 87 49                jz              g77 ~87ab
 87a4:  b3 ...                  print_ret       "Whoosh!"
 87ab:  e0 1a 2b be 13 87 86 00 call            577c #13 g77 g76 -> sp
 87b3:  b8                      ret_popped      

Routine 87b4, 0 locals ()
    Pre-action routine for:
        "carry OBJ from OBJ"
"carry OBJ off OBJ"
"carry OBJ out OBJ"
"carry OBJ"
"pick up OBJ"

 87b5:  66 86 7f 5c             jin             g76 g6f ~87d3
 87b9:  4a 86 00 4f             test_attr       g76 #00 ~87ca
 87bd:  b3 ...                  print_ret       "You are already wearing it."
 87ca:  b3 ...                  print_ret       "You already have that!"
 87d3:  a3 86 00                get_parent      g76 -> sp
 87d6:  4a 00 13 6c             test_attr       sp #13 ~8804
 87da:  a3 86 00                get_parent      g76 -> sp
 87dd:  4a 00 0b e5             test_attr       sp #0b 8804
 87e1:  b3 ...                  print_ret       "You can't reach something that's inside a closed container."
 8804:  a0 87 e8                jz              g77 882d
 8807:  41 87 08 46             je              g77 #08 ~880f
 880b:  0d 87 00                store           g77 #00
 880e:  b1                      rfalse          
 880f:  a3 86 00                get_parent      g76 -> sp
 8812:  61 87 00 d5             je              g77 sp 8829
 8816:  b2 ...                  print           "The "
 8819:  aa 86                   print_obj       g76
 881b:  b2 ...                  print           " isn't in the "
 8824:  aa 87                   print_obj       g77
 8826:  b3 ...                  print_ret       "."
 8829:  0d 87 00                store           g77 #00
 882c:  b1                      rfalse          
 882d:  a3 7f 00                get_parent      g6f -> sp
 8830:  61 86 00 40             je              g76 sp ~rfalse
 8834:  b3 ...                  print_ret       "You're inside of it!"

Routine 8840, 0 locals ()
    Action routine for:
        "carry OBJ from OBJ"
"carry OBJ off OBJ"
"carry OBJ out OBJ"
"carry OBJ"
"pick up OBJ"

 8841:  e0 3f 48 7a 00          call            90f4 -> sp
 8846:  41 00 01 40             je              sp #01 ~rfalse
 884a:  4a 86 00 54             test_attr       g76 #00 ~8860
 884e:  b2 ...                  print           "You are now wearing the "
 885b:  aa 86                   print_obj       g76
 885d:  b3 ...                  print_ret       "."
 8860:  b3 ...                  print_ret       "Taken."

Routine 8868, 0 locals ()
    Action routine for:
        "ask OBJ"
"talk to OBJ"

 8869:  4a 86 1e 00 41          test_attr       g76 #1e ~88ad
 886e:  a0 7c ca                jz              g6c 8879
 8871:  2d 7f 86                store           g6f g76
 8874:  a3 7f 10                get_parent      g6f -> g00
 8877:  ab 10                   ret             g00
 8879:  b2 ...                  print           "The "
 887c:  aa 86                   print_obj       g76
 887e:  b3 ...                  print_ret       " pauses for a moment, perhaps thinking that you should re-read the manual."
 88ad:  b2 ...                  print           "You can't talk to the "
 88b8:  aa 86                   print_obj       g76
 88ba:  b2 ...                  print           "!"
 88bd:  bb                      new_line        
 88be:  0d 70 00                store           g60 #00
 88c1:  0d 7c 00                store           g6c #00
 88c4:  9b 02                   ret             #02

Routine 88c6, 2 locals (0000, 0000)
    Action routine for:
        "go on OBJ"
"go with OBJ"
"go in OBJ"
"enter OBJ"
"climb with OBJ"

 88cb:  4a 86 17 4f             test_attr       g76 #17 ~88dc
 88cf:  e0 2f 4a 7e 86 00       call            94fc g76 -> sp
 88d5:  e0 2f 4a 38 00 00       call            9470 sp -> sp
 88db:  b0                      rtrue           
 88dc:  a0 01 4e                jz              local0 ~88eb
 88df:  4a 86 1b 4a             test_attr       g76 #1b ~88eb
 88e3:  e0 1b 2b be 19 86 00    call            577c #19 g76 -> sp
 88ea:  b0                      rtrue           
 88eb:  a0 01 00 4b             jz              local0 ~8938
 88ef:  4a 86 11 80 46          test_attr       g76 #11 8938
 88f4:  e0 3f 28 68 00          call            50d0 -> sp
 88f9:  a0 00 41                jz              sp ~rtrue
 88fc:  e0 3f 28 68 00          call            50d0 -> sp
 8901:  a0 00 41                jz              sp ~rtrue
 8904:  e0 3f 28 68 00          call            50d0 -> sp
 8909:  a0 00 41                jz              sp ~rtrue
 890c:  e0 3f 28 68 00          call            50d0 -> sp
 8911:  a0 00 41                jz              sp ~rtrue
 8914:  b2 ...                  print           "You hit your head against the "
 8925:  aa 86                   print_obj       g76
 8927:  b3 ...                  print_ret       " as you attempt this feat."
 8938:  a0 01 cb                jz              local0 8944
 893b:  b3 ...                  print_ret       "You can't do that!"
 8944:  66 86 7f 5b             jin             g76 g6f ~8961
 8948:  b3 ...                  print_ret       "That would involve quite a contortion!"
 8961:  e0 2f 27 36 45 00       call            4e6c g35 -> sp
 8967:  ad 00                   print_paddr     sp
 8969:  bb                      new_line        
 896a:  b0                      rtrue           

Routine 896c, 0 locals ()
    Action routine for:
        "chuck OBJ with OBJ"
"chuck OBJ at OBJ"

 896d:  e0 3f 48 eb 00          call            91d6 -> sp
 8972:  a0 00 c0                jz              sp rfalse
 8975:  41 87 05 5b             je              g77 #05 ~8992
 8979:  b2 ...                  print           "A terrific throw! The "
 8988:  aa 86                   print_obj       g76
 898a:  e0 0f 83 33 9a a6 00    call            10666 s177 -> sp
 8991:  b8                      ret_popped      
 8992:  4a 87 1e 69             test_attr       g77 #1e ~89bd
 8996:  b2 ...                  print           "The "
 8999:  aa 87                   print_obj       g77
 899b:  b2 ...                  print           " ducks as the "
 89a4:  aa 86                   print_obj       g76
 89a6:  b3 ...                  print_ret       " flies by and crashes to the ground."
 89bd:  b3 ...                  print_ret       "Thrown."

Routine 89c4, 0 locals ()
    Action routine for:
        "chuck OBJ over OBJ"
"chuck OBJ off OBJ"

 89c5:  b3 ...                  print_ret       "You can't throw anything off of that!"

Routine 89da, 0 locals ()
    Action routine for:
        "attach OBJ to OBJ"

 89db:  61 87 7f 57             je              g77 g6f ~89f4
 89df:  b3 ...                  print_ret       "You can't tie anything to yourself."
 89f4:  b2 ...                  print           "You can't tie the "
 89fd:  aa 86                   print_obj       g76
 89ff:  b3 ...                  print_ret       " to that."

Routine 8a06, 0 locals ()
    Action routine for:
        "attach up OBJ with OBJ"

 8a07:  b3 ...                  print_ret       "You could certainly never tie it with that!"

Routine 8a20, 0 locals ()
    Action routine for:
        "temple"

 8a21:  41 10 dc 49             je              g00 #dc ~8a2c
 8a25:  e0 1f 49 5b be 00       call            92b6 #be -> sp
 8a2b:  b8                      ret_popped      
 8a2c:  41 10 be 49             je              g00 #be ~8a37
 8a30:  e0 1f 49 5b dc 00       call            92b6 #dc -> sp
 8a36:  b8                      ret_popped      
 8a37:  b3 ...                  print_ret       "Nothing happens."

Routine 8a44, 0 locals ()
    Pre-action routine for:
        "flip OBJ for OBJ"
"flip OBJ to OBJ"
"flip OBJ with OBJ"
"press OBJ with OBJ"
"move OBJ with OBJ"

 8a45:  4a 86 0f c0             test_attr       g76 #0f rfalse
 8a49:  b3 ...                  print_ret       "You can't turn that!"

Routine 8a54, 0 locals ()
    Action routine for:
        "flip OBJ for OBJ"
"flip OBJ to OBJ"
"flip OBJ with OBJ"
"press OBJ with OBJ"
"move OBJ with OBJ"

 8a55:  b3 ...                  print_ret       "This has no effect."

Routine 8a60, 0 locals ()
    Action routine for:
        "unlock OBJ with OBJ"

 8a61:  e0 3f 3e fb 00          call            7df6 -> sp
 8a66:  b8                      ret_popped      

Routine 8a68, 0 locals ()
    Action routine for:
        "free OBJ from OBJ"
"free OBJ"

 8a69:  b3 ...                  print_ret       "This cannot be tied, so it cannot be untied!"

Routine 8a7e, 1 local (0003)
    Action routine for:
        "wait"

 8a81:  b2 ...                  print           "Time passes..."
 8a8e:  bb                      new_line        
 8a8f:  04 01 00 45             dec_chk         local0 #00 ~8a96
 8a93:  8c 00 0b                jump            8a9f
 8a96:  e0 3f 2a 62 00          call            54c4 -> sp
 8a9b:  a0 00 bf f2             jz              sp 8a8f
 8a9f:  0d 91 01                store           g81 #01
 8aa2:  ab 91                   ret             g81

Routine 8aa4, 5 locals (0000, 0000, 0000, 0000, 0000)
    Action routine for:
        "go away OBJ"
"go OBJ"

 8aaf:  a0 6f 4a                jz              g5f ~8aba
 8ab2:  e0 1b 2b be 8a 86 00    call            577c #8a g76 -> sp
 8ab9:  b0                      rtrue           
 8aba:  72 10 86 01             get_prop_addr   g00 g76 -> local0
 8abe:  a0 01 80 ac             jz              local0 8b6c
 8ac2:  a4 01 02                get_prop_len    local0 -> local1
 8ac5:  41 02 01 4d             je              local1 #01 ~8ad4
 8ac9:  50 01 00 00             loadb           local0 #00 -> sp
 8acd:  e0 2f 49 5b 00 00       call            92b6 sp -> sp
 8ad3:  b8                      ret_popped      
 8ad4:  41 02 02 4b             je              local1 #02 ~8ae1
 8ad8:  4f 01 00 00             loadw           local0 #00 -> sp
 8adc:  ad 00                   print_paddr     sp
 8ade:  bb                      new_line        
 8adf:  9b 02                   ret             #02
 8ae1:  41 02 03 5e             je              local1 #03 ~8b01
 8ae5:  4f 01 00 00             loadw           local0 #00 -> sp
 8ae9:  e0 bf 00 05             call            sp -> local4
 8aed:  a0 05 c9                jz              local4 8af7
 8af0:  e0 2f 49 5b 05 00       call            92b6 local4 -> sp
 8af6:  b8                      ret_popped      
 8af7:  e0 3f 28 68 00          call            50d0 -> sp
 8afc:  a0 00 40                jz              sp ~rfalse
 8aff:  9b 02                   ret             #02
 8b01:  41 02 04 71             je              local1 #04 ~8b34
 8b05:  50 01 01 00             loadb           local0 #01 -> sp
 8b09:  ae 00 00                load            [sp] -> sp
 8b0c:  a0 00 cd                jz              sp 8b1a
 8b0f:  50 01 00 00             loadb           local0 #00 -> sp
 8b13:  e0 2f 49 5b 00 00       call            92b6 sp -> sp
 8b19:  b8                      ret_popped      
 8b1a:  4f 01 01 03             loadw           local0 #01 -> local2
 8b1e:  a0 03 c7                jz              local2 8b26
 8b21:  ad 03                   print_paddr     local2
 8b23:  bb                      new_line        
 8b24:  9b 02                   ret             #02
 8b26:  b2 ...                  print           "You can't go that way."
 8b31:  bb                      new_line        
 8b32:  9b 02                   ret             #02
 8b34:  41 02 05 40             je              local1 #05 ~rfalse
 8b38:  50 01 01 04             loadb           local0 #01 -> local3
 8b3c:  4a 04 0b 4d             test_attr       local3 #0b ~8b4b
 8b40:  50 01 00 00             loadb           local0 #00 -> sp
 8b44:  e0 2f 49 5b 00 00       call            92b6 sp -> sp
 8b4a:  b8                      ret_popped      
 8b4b:  4f 01 01 03             loadw           local0 #01 -> local2
 8b4f:  a0 03 c7                jz              local2 8b57
 8b52:  ad 03                   print_paddr     local2
 8b54:  bb                      new_line        
 8b55:  9b 02                   ret             #02
 8b57:  b2 ...                  print           "The "
 8b5a:  aa 04                   print_obj       local3
 8b5c:  b2 ...                  print           " is closed."
 8b63:  bb                      new_line        
 8b64:  e0 2f 4a 98 04 00       call            9530 local3 -> sp
 8b6a:  9b 02                   ret             #02
 8b6c:  a0 52 00 4f             jz              g42 ~8bbd
 8b70:  e7 7f 64 00             random          #64 -> sp
 8b74:  23 50 00 00 46          jg              #50 sp ~8bbd
 8b79:  4a 10 04 80 41          test_attr       g00 #04 8bbd
 8b7e:  a0 51 ee                jz              g41 8bad
 8b81:  b2 ...                  print           "There are odd noises in the darkness, and there is no exit in that direction."
 8baa:  bb                      new_line        
 8bab:  9b 02                   ret             #02
 8bad:  e0 3f 28 68 00          call            50d0 -> sp
 8bb2:  a0 00 40                jz              sp ~rfalse
 8bb5:  e0 0f 83 33 9a ea 00    call            10666 s178 -> sp
 8bbc:  b8                      ret_popped      
 8bbd:  b2 ...                  print           "You can't go that way."
 8bc8:  bb                      new_line        
 8bc9:  9b 02                   ret             #02

Routine 8bcc, 0 locals ()
    Action routine for:
        "go around OBJ"

 8bcd:  b3 ...                  print_ret       "Use compass directions for movement."

Routine 8be6, 0 locals ()
    Action routine for:
        "go to OBJ"

 8be7:  66 86 10 cc             jin             g76 g00 8bf5
 8beb:  e0 2b 4a 50 86 10 00    call            94a0 g76 g00 -> sp
 8bf2:  a0 00 c7                jz              sp 8bfa
 8bf5:  b3 ...                  print_ret       "It's here!"
 8bfa:  b3 ...                  print_ret       "You should supply a direction!"

Routine 8c10, 0 locals ()
    Action routine for:
        "brandi OBJ at OBJ"
"brandi OBJ"

 8c11:  e0 0f 49 2e 9a fe 00    call            925c s179 -> sp
 8c18:  b8                      ret_popped      

Routine 8c1a, 0 locals ()
    Action routine for:
        "wear OBJ"
"hide on OBJ"

 8c1b:  4a 86 00 d0             test_attr       g76 #00 8c2d
 8c1f:  b2 ...                  print           "You can't wear the "
 8c28:  aa 86                   print_obj       g76
 8c2a:  b3 ...                  print_ret       "."
 8c2d:  e0 1b 2b be 5d 86 00    call            577c #5d g76 -> sp
 8c34:  b0                      rtrue           

Routine 8c36, 0 locals ()
    Action routine for:
        "win"

 8c37:  b3 ...                  print_ret       "Naturally!"

Routine 8c40, 0 locals ()
    Action routine for:
        "wind up OBJ"
"wind OBJ"

 8c41:  b2 ...                  print           "You cannot wind up a "
 8c4c:  aa 86                   print_obj       g76
 8c4e:  b3 ...                  print_ret       "."

Routine 8c52, 0 locals ()
    Action routine for:
        "wish"

 8c53:  b3 ...                  print_ret       "With luck, your wish will come true."

Routine 8c6c, 0 locals ()
    Action routine for:
        "scream"

 8c6d:  b3 ...                  print_ret       "Aaaarrrrgggghhhh!"

Routine 8c7c, 0 locals ()
    Action routine for:
        "zork"

 8c7d:  b3 ...                  print_ret       "At your service!"

Routine 8c88, 0 locals ()

 8c89:  e0 3f 46 4d 00          call            8c9a -> sp
 8c8e:  a0 00 c0                jz              sp rfalse
 8c91:  a0 56 40                jz              g46 ~rfalse
 8c94:  e0 3f 46 a7 00          call            8d4e -> sp
 8c99:  b8                      ret_popped      

Routine 8c9a, 4 locals (0000, 0000, 0000, 0000)

 8ca3:  a0 01 c8                jz              local0 8cac
 8ca6:  e8 bf 01                push            local0
 8ca9:  8c 00 05                jump            8caf
 8cac:  e8 bf 57                push            g47
 8caf:  e9 7f 02                pull            local1
 8cb2:  a0 52 71                jz              g42 ~8ce4
 8cb5:  b2 ...                  print           "It is pitch black."
 8cc2:  a0 51 59                jz              g41 ~8cdc
 8cc5:  b2 ...                  print           " You are likely to be eaten by a grue."
 8cdc:  bb                      new_line        
 8cdd:  e0 3f 28 68 00          call            50d0 -> sp
 8ce2:  9b 00                   ret             #00
 8ce4:  4a 10 03 c8             test_attr       g00 #03 8cee
 8ce8:  4b 10 03                set_attr        g00 #03
 8ceb:  0d 02 01                store           local1 #01
 8cee:  4a 10 05 45             test_attr       g00 #05 ~8cf5
 8cf2:  4c 10 03                clear_attr      g00 #03
 8cf5:  46 10 52 53             jin             g00 #52 ~8d0a
 8cf9:  aa 10                   print_obj       g00
 8cfb:  a3 7f 04                get_parent      g6f -> local3
 8cfe:  4a 04 1b 49             test_attr       local3 #1b ~8d09
 8d02:  b2 ...                  print           ", in the "
 8d07:  aa 04                   print_obj       local3
 8d09:  bb                      new_line        
 8d0a:  a0 01 45                jz              local0 ~8d10
 8d0d:  a0 56 41                jz              g46 ~rtrue
 8d10:  a3 7f 04                get_parent      g6f -> local3
 8d13:  a0 02 ce                jz              local1 8d22
 8d16:  51 10 11 00             get_prop        g00 #11 -> sp
 8d1a:  e0 9f 00 03 00          call            sp #03 -> sp
 8d1f:  a0 00 41                jz              sp ~rtrue
 8d22:  a0 02 cf                jz              local1 8d32
 8d25:  51 10 0b 03             get_prop        g00 #0b -> local2
 8d29:  a0 03 c8                jz              local2 8d32
 8d2c:  ad 03                   print_paddr     local2
 8d2e:  bb                      new_line        
 8d2f:  8c 00 0b                jump            8d3b
 8d32:  51 10 11 00             get_prop        g00 #11 -> sp
 8d36:  e0 9f 00 04 00          call            sp #04 -> sp
 8d3b:  61 10 04 c1             je              g00 local3 rtrue
 8d3f:  4a 04 1b 41             test_attr       local3 #1b ~rtrue
 8d43:  51 04 11 00             get_prop        local3 #11 -> sp
 8d47:  e0 9f 00 03 00          call            sp #03 -> sp
 8d4c:  b0                      rtrue           

Routine 8d4e, 1 local (0000)

 8d51:  a0 52 df                jz              g42 8d71
 8d54:  a2 10 00 40             get_child       g00 -> sp ~rfalse
 8d58:  a0 01 c8                jz              local0 8d61
 8d5b:  e8 bf 01                push            local0
 8d5e:  8c 00 05                jump            8d64
 8d61:  e8 bf 57                push            g47
 8d64:  e9 7f 01                pull            local0
 8d67:  e0 28 47 55 10 01 ff ff 00 
                               call            8eaa g00 local0 #ffff -> sp
 8d70:  b8                      ret_popped      
 8d71:  b3 ...                  print_ret       "Only bats can see in the dark. And you're not one."

Routine 8d92, 5 locals (0000, 0000, 0000, 0000, 0000)

 8d9d:  2d 50 01                store           g40 local0
 8da0:  a0 03 4e                jz              local2 ~8daf
 8da3:  51 01 09 00             get_prop        local0 #09 -> sp
 8da7:  e0 9f 00 05 00          call            sp #05 -> sp
 8dac:  a0 00 41                jz              sp ~rtrue
 8daf:  a0 03 59                jz              local2 ~8dc9
 8db2:  4a 01 03 c9             test_attr       local0 #03 8dbd
 8db6:  51 01 0e 04             get_prop        local0 #0e -> local3
 8dba:  a0 04 49                jz              local3 ~8dc4
 8dbd:  51 01 0b 04             get_prop        local0 #0b -> local3
 8dc1:  a0 04 c7                jz              local3 8dc9
 8dc4:  ad 04                   print_paddr     local3
 8dc6:  8c 00 58                jump            8e1f
 8dc9:  a0 03 65                jz              local2 ~8def
 8dcc:  b2 ...                  print           "There is a "
 8dd1:  aa 01                   print_obj       local0
 8dd3:  b2 ...                  print           " here"
 8dd6:  4a 01 14 51             test_attr       local0 #14 ~8de9
 8dda:  b2 ...                  print           " (providing light)"
 8de9:  b2 ...                  print           "."
 8dec:  8c 00 32                jump            8e1f
 8def:  6f 49 03 00             loadw           g39 local2 -> sp
 8df3:  ad 00                   print_paddr     sp
 8df5:  b2 ...                  print           "A "
 8df8:  aa 01                   print_obj       local0
 8dfa:  4a 01 14 54             test_attr       local0 #14 ~8e10
 8dfe:  b2 ...                  print           " (providing light)"
 8e0d:  8c 00 11                jump            8e1f
 8e10:  4a 01 00 4d             test_attr       local0 #00 ~8e1f
 8e14:  b2 ...                  print           " (being worn)"
 8e1f:  e0 3f 28 68 00          call            50d0 -> sp
 8e24:  a0 03 5c                jz              local2 ~8e41
 8e27:  a3 7f 05                get_parent      g6f -> local4
 8e2a:  a0 05 d6                jz              local4 8e41
 8e2d:  4a 05 1b 52             test_attr       local4 #1b ~8e41
 8e31:  b2 ...                  print           " (outside the "
 8e3c:  aa 05                   print_obj       local4
 8e3e:  b2 ...                  print           ")"
 8e41:  bb                      new_line        
 8e42:  e0 2f 48 29 01 00       call            9052 local0 -> sp
 8e48:  a0 00 c0                jz              sp rfalse
 8e4b:  a2 01 00 40             get_child       local0 -> sp ~rfalse
 8e4f:  e0 2a 47 55 01 02 03 00 call            8eaa local0 local1 local2 -> sp
 8e57:  b8                      ret_popped      

Routine 8e58, 6 locals (0000, 0000, 0000, 0001, 0000, 0000)

 8e65:  a2 01 02 40             get_child       local0 -> local1 ~rfalse
 8e69:  a1 02 03 c2             get_sibling     local1 -> local2 8e6d
 8e6d:  a0 04 c8                jz              local3 8e76
 8e70:  0d 04 00                store           local3 #00
 8e73:  8c 00 0b                jump            8e7f
 8e76:  b2 ...                  print           ", "
 8e79:  a0 03 45                jz              local2 ~8e7f
 8e7c:  b2 ...                  print           "and "
 8e7f:  b2 ...                  print           "a "
 8e82:  aa 02                   print_obj       local1
 8e84:  a0 05 4b                jz              local4 ~8e90
 8e87:  a0 06 48                jz              local5 ~8e90
 8e8a:  2d 05 02                store           local4 local1
 8e8d:  8c 00 08                jump            8e96
 8e90:  0d 06 01                store           local5 #01
 8e93:  0d 05 00                store           local4 #00
 8e96:  2d 02 03                store           local1 local2
 8e99:  a0 02 3f ce             jz              local1 ~8e69
 8e9d:  a0 05 c1                jz              local4 rtrue
 8ea0:  a0 06 41                jz              local5 ~rtrue
 8ea3:  e0 2f 4a 98 05 00       call            9530 local4 -> sp
 8ea9:  b0                      rtrue           

Routine 8eaa, 10 locals (0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000)

 8ebf:  a2 01 04 41             get_child       local0 -> local3 ~rtrue
 8ec3:  a3 7f 07                get_parent      g6f -> local6
 8ec6:  a0 07 c9                jz              local6 8ed0
 8ec9:  4a 07 1b 45             test_attr       local6 #1b ~8ed0
 8ecd:  8c 00 05                jump            8ed3
 8ed0:  0d 07 00                store           local6 #00
 8ed3:  0d 05 01                store           local4 #01
 8ed6:  0d 06 01                store           local5 #01
 8ed9:  a3 01 00                get_parent      local0 -> sp
 8edc:  c1 ab 7f 01 00 48       je              g6f local0 sp ~8ee8
 8ee2:  0d 0a 01                store           local9 #01
 8ee5:  8c 00 5f                jump            8f45
 8ee8:  a0 04 45                jz              local3 ~8eee
 8eeb:  8c 00 59                jump            8f45
 8eee:  61 04 07 48             je              local3 local6 ~8ef8
 8ef2:  0d 09 01                store           local8 #01
 8ef5:  8c 00 48                jump            8f3e
 8ef8:  61 04 7f 45             je              local3 g6f ~8eff
 8efc:  8c 00 41                jump            8f3e
 8eff:  4a 04 07 80 3c          test_attr       local3 #07 8f3e
 8f04:  4a 04 03 f8             test_attr       local3 #03 8f3e
 8f08:  51 04 0e 08             get_prop        local3 #0e -> local7
 8f0c:  a0 08 f1                jz              local7 8f3e
 8f0f:  4a 04 0e c8             test_attr       local3 #0e 8f19
 8f13:  ad 08                   print_paddr     local7
 8f15:  bb                      new_line        
 8f16:  0d 06 00                store           local5 #00
 8f19:  e0 2f 48 29 04 00       call            9052 local3 -> sp
 8f1f:  a0 00 de                jz              sp 8f3e
 8f22:  a3 04 00                get_parent      local3 -> sp
 8f25:  51 00 09 00             get_prop        sp #09 -> sp
 8f29:  a0 00 54                jz              sp ~8f3e
 8f2c:  a2 04 00 50             get_child       local3 -> sp ~8f3e
 8f30:  e0 29 47 55 04 02 00 00 call            8eaa local3 local1 #00 -> sp
 8f38:  a0 00 c5                jz              sp 8f3e
 8f3b:  0d 05 00                store           local4 #00
 8f3e:  a1 04 04 c2             get_sibling     local3 -> local3 8f42
 8f42:  8c ff a5                jump            8ee8
 8f45:  a2 01 04 c2             get_child       local0 -> local3 8f49
 8f49:  a0 04 5c                jz              local3 ~8f66
 8f4c:  a0 09 80 82             jz              local8 8fd0
 8f50:  a0 07 80 7e             jz              local6 8fd0
 8f54:  a2 07 00 00 79          get_child       local6 -> sp ~8fd0
 8f59:  95 03                   inc             local2
 8f5b:  e0 2a 47 55 07 02 03 00 call            8eaa local6 local1 local2 -> sp
 8f63:  8c 00 6c                jump            8fd0
 8f66:  c1 a7 04 07 04 45       je              local3 local6 #04 ~8f6f
 8f6c:  8c 00 5c                jump            8fc9
 8f6f:  4a 04 07 80 57          test_attr       local3 #07 8fc9
 8f74:  a0 0a 4e                jz              local9 ~8f83
 8f77:  4a 04 03 ca             test_attr       local3 #03 8f83
 8f7b:  51 04 0e 00             get_prop        local3 #0e -> sp
 8f7f:  a0 00 00 48             jz              sp ~8fc9
 8f83:  4a 04 0e ed             test_attr       local3 #0e 8fb2
 8f87:  a0 05 d8                jz              local4 8fa0
 8f8a:  e0 2b 47 ec 01 03 00    call            8fd8 local0 local2 -> sp
 8f91:  a0 00 c9                jz              sp 8f9b
 8f94:  42 03 00 45             jl              local2 #00 ~8f9b
 8f98:  0d 03 00                store           local2 #00
 8f9b:  95 03                   inc             local2
 8f9d:  0d 05 00                store           local4 #00
 8fa0:  42 03 00 45             jl              local2 #00 ~8fa7
 8fa4:  0d 03 00                store           local2 #00
 8fa7:  e0 2a 46 c9 04 02 03 00 call            8d92 local3 local1 local2 -> sp
 8faf:  8c 00 19                jump            8fc9
 8fb2:  a2 04 00 55             get_child       local3 -> sp ~8fc9
 8fb6:  e0 2f 48 29 04 00       call            9052 local3 -> sp
 8fbc:  a0 00 cc                jz              sp 8fc9
 8fbf:  95 03                   inc             local2
 8fc1:  e0 2a 47 55 04 02 03 00 call            8eaa local3 local1 local2 -> sp
 8fc9:  a1 04 04 c2             get_sibling     local3 -> local3 8fcd
 8fcd:  8c ff 7b                jump            8f49
 8fd0:  a0 05 c1                jz              local4 rtrue
 8fd3:  a0 06 c1                jz              local5 rtrue
 8fd6:  b1                      rfalse          

Routine 8fd8, 2 locals (0000, 0000)

 8fdd:  41 01 c2 5d             je              local0 #c2 ~8ffc
 8fe1:  b3 ...                  print_ret       "Your collection of treasures consists of:"
 8ffc:  61 01 7f 4d             je              local0 g6f ~900b
 9000:  b3 ...                  print_ret       "You are carrying:"
 900b:  46 01 52 c0             jin             local0 #52 rfalse
 900f:  43 02 00 48             jg              local1 #00 ~9019
 9013:  6f 49 02 00             loadw           g39 local1 -> sp
 9017:  ad 00                   print_paddr     sp
 9019:  4a 01 0a 54             test_attr       local0 #0a ~902f
 901d:  b2 ...                  print           "Sitting on the "
 9028:  aa 01                   print_obj       local0
 902a:  b3 ...                  print_ret       " is: "
 902f:  4a 01 1e 52             test_attr       local0 #1e ~9043
 9033:  b2 ...                  print           "The "
 9036:  aa 01                   print_obj       local0
 9038:  b3 ...                  print_ret       " is holding: "
 9043:  b2 ...                  print           "The "
 9046:  aa 01                   print_obj       local0
 9048:  b3 ...                  print_ret       " contains:"

Routine 9052, 1 local (0000)

 9055:  4a 01 07 c0             test_attr       local0 #07 rfalse
 9059:  4a 01 0c c1             test_attr       local0 #0c rtrue
 905d:  4a 01 0b c1             test_attr       local0 #0b rtrue
 9061:  b1                      rfalse          

Routine 9062, 1 local (0000)

 9065:  74 4f 01 4f             add             g3f local0 -> g3f
 9069:  74 11 01 11             add             g01 local0 -> g01
 906d:  c1 8f 11 01 5e 41       je              g01 #015e ~rtrue
 9073:  a0 9c 41                jz              g8c ~rtrue
 9076:  0d 9c 01                store           g8c #01
 9079:  0c 6d 07                clear_attr      "ancient map" #07
 907c:  0c b4 03                clear_attr      "West of House" #03
 907f:  b3 ...                  print_ret       "An almost inaudible voice whispers in your ear, ~Look to your treasures for the final secret.~"

Routine 90ba, 2 locals (0000, 0000)

 90bf:  51 01 0d 02             get_prop        local0 #0d -> local1
 90c3:  43 02 00 40             jg              local1 #00 ~rfalse
 90c7:  e0 2f 48 31 02 00       call            9062 local1 -> sp
 90cd:  e3 97 01 0d 00          put_prop        local0 #0d #00
 90d2:  b0                      rtrue           

Routine 90d4, 0 locals ()

 90d5:  e0 3f 82 c1 00          call            10582 -> sp
 90da:  ba                      quit            

Routine 90dc, 0 locals ()

 90dd:  b2 ...                  print           ">"
 90e2:  e4 af 7d 7e             read            g6d g6e
 90e6:  4f 7e 01 00             loadw           g6e #01 -> sp
 90ea:  c1 83 00 4e 14 4d f8 40 je              sp "yes" "y" ~rfalse
 90f2:  b0                      rtrue           

Routine 90f4, 4 locals (0001, 0000, 0000, 0000)

 90fd:  a0 4e da                jz              g3e 9118
 9100:  a0 01 c0                jz              local0 rfalse
 9103:  b2 ...                  print           "Your hand passes through its object."
 9116:  bb                      new_line        
 9117:  b1                      rfalse          
 9118:  4a 86 11 cf             test_attr       g76 #11 9129
 911c:  a0 01 c0                jz              local0 rfalse
 911f:  e0 2f 27 36 45 00       call            4e6c g35 -> sp
 9125:  ad 00                   print_paddr     sp
 9127:  bb                      new_line        
 9128:  b1                      rfalse          
 9129:  e0 3f 28 68 00          call            50d0 -> sp
 912e:  a0 00 40                jz              sp ~rfalse
 9131:  a3 86 00                get_parent      g76 -> sp
 9134:  4a 00 13 49             test_attr       sp #13 ~913f
 9138:  a3 86 00                get_parent      g76 -> sp
 913b:  4a 00 0b 40             test_attr       sp #0b ~rfalse
 913f:  a3 86 00                get_parent      g76 -> sp
 9142:  66 00 7f 80 4c          jin             sp g6f 9191
 9147:  e0 2f 49 16 86 04       call            922c g76 -> local3
 914d:  e0 2f 49 16 7f 00       call            922c g6f -> sp
 9153:  74 04 00 00             add             local3 sp -> sp
 9157:  63 00 95 78             jg              sp g85 ~9191
 915b:  a0 01 f3                jz              local0 918f
 915e:  b2 ...                  print           "Your load is too heavy"
 916b:  62 95 96 5e             jl              g85 g86 ~918b
 916f:  b2 ...                  print           ", especially in light of your condition."
 9188:  8c 00 05                jump            918e
 918b:  b2 ...                  print           "."
 918e:  bb                      new_line        
 918f:  9b 02                   ret             #02
 9191:  41 88 5d 71             je              g78 #5d ~91c4
 9195:  e0 2f 49 0a 7f 02       call            9214 g6f -> local1
 919b:  63 02 4b 67             jg              local1 g3b ~91c4
 919f:  76 02 4a 04             mul             local1 g3a -> local3
 91a3:  e7 7f 64 00             random          #64 -> sp
 91a7:  63 04 00 5b             jg              local3 sp ~91c4
 91ab:  b2 ...                  print           "You're holding too many things already!"
 91c2:  bb                      new_line        
 91c3:  b1                      rfalse          
 91c4:  6e 86 7f                insert_obj      g76 g6f
 91c7:  4b 86 03                set_attr        g76 #03
 91ca:  e0 3f 28 68 00          call            50d0 -> sp
 91cf:  e0 2f 48 5d 86 00       call            90ba g76 -> sp
 91d5:  b0                      rtrue           

Routine 91d6, 0 locals ()

 91d7:  66 86 7f db             jin             g76 g6f 91f4
 91db:  a3 86 00                get_parent      g76 -> sp
 91de:  66 00 7f d4             jin             sp g6f 91f4
 91e2:  b2 ...                  print           "You're not carrying the "
 91ed:  aa 86                   print_obj       g76
 91ef:  b2 ...                  print           "."
 91f2:  bb                      new_line        
 91f3:  b1                      rfalse          
 91f4:  66 86 7f d7             jin             g76 g6f 920d
 91f8:  a3 86 00                get_parent      g76 -> sp
 91fb:  4a 00 0b d0             test_attr       sp #0b 920d
 91ff:  b2 ...                  print           "The "
 9202:  aa 86                   print_obj       g76
 9204:  b2 ...                  print           " is closed."
 920b:  bb                      new_line        
 920c:  b1                      rfalse          
 920d:  a3 7f 00                get_parent      g6f -> sp
 9210:  6e 86 00                insert_obj      g76 sp
 9213:  b0                      rtrue           

Routine 9214, 3 locals (0000, 0000, 0000)

 921b:  a2 01 03 4d             get_child       local0 -> local2 ~922a
 921f:  4a 03 00 c4             test_attr       local2 #00 9225
 9223:  95 02                   inc             local1
 9225:  a1 03 03 bf f7          get_sibling     local2 -> local2 921f
 922a:  ab 02                   ret             local1

Routine 922c, 3 locals (0000, 0000, 0000)

 9233:  a2 01 02 5e             get_child       local0 -> local1 ~9253
 9237:  61 01 90 4b             je              local0 g80 ~9244
 923b:  4a 02 00 47             test_attr       local1 #00 ~9244
 923f:  95 03                   inc             local2
 9241:  8c 00 0c                jump            924e
 9244:  e0 2f 49 16 02 00       call            922c local1 -> sp
 924a:  74 03 00 03             add             local2 sp -> local2
 924e:  a1 02 02 bf e6          get_sibling     local1 -> local1 9237
 9253:  51 01 0f 00             get_prop        local0 #0f -> sp
 9257:  74 03 00 00             add             local2 sp -> sp
 925b:  b8                      ret_popped      

Routine 925c, 1 local (0000)

 925f:  46 86 f7 57             jin             g76 #f7 ~9278
 9263:  c1 95 88 54 69 8c 50    je              g78 #54 #69 #8c ~9278
 926a:  b2 ...                  print           "The "
 926d:  aa 86                   print_obj       g76
 926f:  b3 ...                  print_ret       " isn't here!"
 9278:  ad 01                   print_paddr     local0
 927a:  aa 86                   print_obj       g76
 927c:  e0 2f 27 36 48 00       call            4e6c g38 -> sp
 9282:  ad 00                   print_paddr     sp
 9284:  bb                      new_line        
 9285:  b0                      rtrue           

Routine 9286, 2 locals (0000, 0000)

 928b:  a0 01 d5                jz              local0 92a1
 928e:  b2 ...                  print           "You can't go there in a "
 9299:  aa 02                   print_obj       local1
 929b:  b2 ...                  print           "."
 929e:  8c 00 15                jump            92b4
 92a1:  b2 ...                  print           "You can't go there without a vehicle."
 92b4:  bb                      new_line        
 92b5:  b0                      rtrue           

Routine 92b6, 6 locals (0000, 0001, 0000, 0000, 0000, 0000)

 92c3:  4a 01 06 c8             test_attr       local0 #06 92cd
 92c7:  e8 7f 00                push            #00
 92ca:  8c 00 05                jump            92d0
 92cd:  e8 7f 01                push            #01
 92d0:  2d 03 00                store           local2 sp
 92d3:  a3 7f 04                get_parent      g6f -> local3
 92d6:  2d 06 52                store           local5 g42
 92d9:  4a 04 1b 46             test_attr       local3 #1b ~92e1
 92dd:  51 04 06 05             get_prop        local3 #06 -> local4
 92e1:  a0 03 4d                jz              local2 ~92ef
 92e4:  a0 05 4a                jz              local4 ~92ef
 92e7:  e0 2b 49 43 05 04 00    call            9286 local4 local3 -> sp
 92ee:  b1                      rfalse          
 92ef:  a0 03 4e                jz              local2 ~92fe
 92f2:  6a 01 05 ca             test_attr       local0 local4 92fe
 92f6:  e0 2b 49 43 05 04 00    call            9286 local4 local3 -> sp
 92fd:  b1                      rfalse          
 92fe:  4a 10 06 58             test_attr       g00 #06 ~9318
 9302:  a0 03 d5                jz              local2 9318
 9305:  a0 05 d2                jz              local4 9318
 9308:  41 05 06 ce             je              local4 #06 9318
 930c:  6a 01 05 ca             test_attr       local0 local4 9318
 9310:  e0 2b 49 43 05 04 00    call            9286 local4 local3 -> sp
 9317:  b1                      rfalse          
 9318:  4a 01 12 4a             test_attr       local0 #12 ~9324
 931c:  51 01 0b 00             get_prop        local0 #0b -> sp
 9320:  ad 00                   print_paddr     sp
 9322:  bb                      new_line        
 9323:  b1                      rfalse          
 9324:  a0 03 e7                jz              local2 934c
 9327:  4a 10 06 e3             test_attr       g00 #06 934c
 932b:  a0 4e 60                jz              g3e ~934c
 932e:  4a 04 1b 5c             test_attr       local3 #1b ~934c
 9332:  b2 ...                  print           "The "
 9335:  aa 04                   print_obj       local3
 9337:  b2 ...                  print           " comes to a rest on the shore."
 934a:  bb                      new_line        
 934b:  bb                      new_line        
 934c:  a0 05 c8                jz              local4 9355
 934f:  6e 04 01                insert_obj      local3 local0
 9352:  8c 00 05                jump            9358
 9355:  6e 7f 01                insert_obj      g6f local0
 9358:  2d 10 01                store           g00 local0
 935b:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 9361:  a0 06 00 7c             jz              local5 ~93df
 9365:  a0 52 00 78             jz              g42 ~93df
 9369:  e7 7f 64 00             random          #64 -> sp
 936d:  23 50 00 00 6f          jg              #50 sp ~93df
 9372:  a0 51 ef                jz              g41 93a2
 9375:  b2 ...                  print           "There are sinister gurgling noises in the darkness all around you!"
 939e:  bb                      new_line        
 939f:  8c 00 3f                jump            93df
 93a2:  e0 3f 28 68 00          call            50d0 -> sp
 93a7:  a0 00 40                jz              sp ~rfalse
 93aa:  b2 ...                  print           "Oh, no! A lurking grue slithered into the "
 93c5:  a3 7f 00                get_parent      g6f -> sp
 93c8:  4a 00 1b 4a             test_attr       sp #1b ~93d4
 93cc:  a3 7f 00                get_parent      g6f -> sp
 93cf:  aa 00                   print_obj       sp
 93d1:  8c 00 05                jump            93d7
 93d4:  b2 ...                  print           "room"
 93d7:  e0 0f 83 33 9b 22 00    call            10666 s188 -> sp
 93de:  b0                      rtrue           
 93df:  a0 52 5d                jz              g42 ~93fd
 93e2:  41 7f 04 59             je              g6f #04 ~93fd
 93e6:  b2 ...                  print           "You have moved into a dark place."
 93f9:  bb                      new_line        
 93fa:  0d 7c 00                store           g6c #00
 93fd:  51 10 11 00             get_prop        g00 #11 -> sp
 9401:  e0 9f 00 02 00          call            sp #02 -> sp
 9406:  e0 2f 48 5d 01 00       call            90ba local0 -> sp
 940c:  61 10 01 41             je              g00 local0 ~rtrue
 9410:  21 04 7f d2             je              #04 g6f 9424
 9414:  b2 ...                  print           "The "
 9417:  aa 7f                   print_obj       g6f
 9419:  b3 ...                  print_ret       " leaves the room."
 9424:  a0 02 c1                jz              local1 rtrue
 9427:  e0 3f 46 44 00          call            8c88 -> sp
 942c:  b0                      rtrue           

Routine 942e, 2 locals (0000, 0000)

 9433:  e0 2b 4a 24 10 01 02    call            9448 g00 local0 -> local1
 943a:  a0 02 c0                jz              local1 rfalse
 943d:  e0 2f 49 5b 02 00       call            92b6 local1 -> sp
 9443:  a0 00 41                jz              sp ~rtrue
 9446:  9b 02                   ret             #02

Routine 9448, 4 locals (0000, 0000, 0000, 0000)

 9451:  4f 02 00 04             loadw           local1 #00 -> local3
 9455:  25 03 04 c0             inc_chk         local2 local3 rfalse
 9459:  6f 02 03 00             loadw           local1 local2 -> sp
 945d:  61 00 01 3f f5          je              sp local0 ~9455
 9462:  61 03 04 c0             je              local2 local3 rfalse
 9466:  54 03 01 00             add             local2 #01 -> sp
 946a:  6f 02 00 00             loadw           local1 sp -> sp
 946e:  ab 00                   ret             sp

Routine 9470, 1 local (0000)

 9473:  2d 6f 01                store           g5f local0
 9476:  e0 1b 2b be 89 01 00    call            577c #89 local0 -> sp
 947d:  b8                      ret_popped      

Routine 947e, 4 locals (0000, 0000, 0000, 0000)

 9487:  52 01 12 03             get_prop_addr   local0 #12 -> local2
 948b:  a4 03 00                get_prop_len    local2 -> sp
 948e:  57 00 02 00             div             sp #02 -> sp
 9492:  55 00 01 00             sub             sp #01 -> sp
 9496:  e0 2a 36 11 02 03 00 00 call            6c22 local1 local2 sp -> sp
 949e:  b8                      ret_popped      

Routine 94a0, 3 locals (0000, 0000, 0000)

 94a7:  52 02 05 03             get_prop_addr   local1 #05 -> local2
 94ab:  a0 03 c0                jz              local2 rfalse
 94ae:  a4 03 00                get_prop_len    local2 -> sp
 94b1:  55 00 01 00             sub             sp #01 -> sp
 94b5:  e0 2a 36 25 01 03 00 00 call            6c4a local0 local2 sp -> sp
 94bd:  b8                      ret_popped      

Routine 94be, 3 locals (0000, 0000, 0000)

 94c5:  a2 01 03 c2             get_child       local0 -> local2 94c9
 94c9:  a0 03 c0                jz              local2 rfalse
 94cc:  6a 03 02 48             test_attr       local2 local1 ~94d6
 94d0:  41 03 04 c4             je              local2 #04 94d6
 94d4:  ab 03                   ret             local2
 94d6:  a1 03 03 bf f3          get_sibling     local2 -> local2 94cc
 94db:  b1                      rfalse          

Routine 94dc, 1 local (0000)

 94df:  66 01 10 c1             jin             local0 g00 rtrue
 94e3:  e0 2b 4a 50 01 10 00    call            94a0 local0 g00 -> sp
 94ea:  b8                      ret_popped      

Routine 94ec, 1 local (0000)

 94ef:  a3 01 01                get_parent      local0 -> local0
 94f2:  a0 01 c0                jz              local0 rfalse
 94f5:  61 01 7f 3f f7          je              local0 g6f ~94ef
 94fa:  b0                      rtrue           

Routine 94fc, 3 locals (0000, 0000, 0000)

 9503:  73 10 02 02             get_next_prop   g00 local1 -> local1
 9507:  62 02 a8 c0             jl              local1 g98 rfalse
 950b:  72 10 02 03             get_prop_addr   g00 local1 -> local2
 950f:  a4 03 00                get_prop_len    local2 -> sp
 9512:  41 00 05 3f ee          je              sp #05 ~9503
 9517:  50 03 01 00             loadb           local2 #01 -> sp
 951b:  61 00 01 3f e5          je              sp local0 ~9503
 9520:  ab 02                   ret             local1

Routine 9522, 2 locals (0000, 0000)

 9527:  4b 01 12                set_attr        local0 #12
 952a:  e3 9b 01 0b 02          put_prop        local0 #0b local1
 952f:  b0                      rtrue           

Routine 9530, 1 local (0000)

 9533:  2d 7b 01                store           g6b local0
 9536:  2d 7a 10                store           g6a g00
 9539:  ab 7a                   ret             g6a

Routine 953c, 1 local (0000)

 953f:  41 01 03 40             je              local0 #03 ~rfalse
 9543:  b2 ...                  print           "You are standing in an open field west of a white house, with a boarded front door."
 9574:  a0 9c dd                jz              g8c 9592
 9577:  b2 ...                  print           " A secret path leads southwest into the forest."
 9592:  bb                      new_line        
 9593:  b0                      rtrue           

Routine 9594, 1 local (0000)

 9597:  41 01 03 40             je              local0 #03 ~rfalse
 959b:  b2 ...                  print           "You are behind the white house. A path leads into the forest to the east. In one corner of the house there is a small window which is "
 95e0:  0a eb 0b 4a             test_attr       "kitchen window" #0b ~95ec
 95e4:  b2 ...                  print           "open."
 95e9:  8c 00 0d                jump            95f7
 95ec:  b2 ...                  print           "slightly ajar."
 95f7:  bb                      new_line        
 95f8:  b0                      rtrue           

Routine 95fa, 3 locals (0000, 0000, 0000)

 9601:  41 88 2b 58             je              g78 #2b ~961b
 9605:  4a 01 0b 4d             test_attr       local0 #0b ~9614
 9609:  e0 2f 27 36 44 00       call            4e6c g34 -> sp
 960f:  ad 00                   print_paddr     sp
 9611:  8c 00 07                jump            9619
 9614:  ad 02                   print_paddr     local1
 9616:  4b 01 0b                set_attr        local0 #0b
 9619:  bb                      new_line        
 961a:  b0                      rtrue           
 961b:  41 88 23 40             je              g78 #23 ~rfalse
 961f:  4a 01 0b 4a             test_attr       local0 #0b ~962b
 9623:  ad 03                   print_paddr     local2
 9625:  4c 01 0b                clear_attr      local0 #0b
 9628:  8c 00 0a                jump            9633
 962b:  e0 2f 27 36 44 00       call            4e6c g34 -> sp
 9631:  ad 00                   print_paddr     sp
 9633:  bb                      new_line        
 9634:  b0                      rtrue           

Routine 9636, 0 locals ()

 9637:  c1 97 88 38 5d 40       je              g78 #38 #5d ~rfalse
 963d:  b3 ...                  print_ret       "The boards are securely fastened."

Routine 9652, 0 locals ()

 9653:  41 88 1a 40             je              g78 #1a ~rfalse
 9657:  41 86 f8 40             je              g76 #f8 ~rfalse
 965b:  41 87 62 4e             je              g77 #62 ~966b
 965f:  66 87 7f 4a             jin             g77 g6f ~966b
 9663:  e0 0f 83 33 9b 77 00    call            10666 s201 -> sp
 966a:  b8                      ret_popped      
 966b:  a0 87 7b                jz              g77 ~96a7
 966e:  b3 ...                  print_ret       "Dental hygiene is highly recommended, but I'm not sure what you want to brush them with."
 96a7:  b2 ...                  print           "A nice idea, but with a "
 96b6:  aa 87                   print_obj       g77
 96b8:  b3 ...                  print_ret       "?"

Routine 96bc, 0 locals ()

 96bd:  41 10 dc 59             je              g00 #dc ~96d8
 96c1:  41 88 3c 40             je              g78 #3c ~rfalse
 96c5:  b3 ...                  print_ret       "The west wall is solid granite here."
 96d8:  41 10 be 59             je              g00 #be ~96f3
 96dc:  41 88 3c 40             je              g78 #3c ~rfalse
 96e0:  b3 ...                  print_ret       "The east wall is solid granite here."
 96f3:  41 10 0f 70             je              g00 #0f ~9725
 96f7:  c1 97 88 53 3c 5b       je              g78 #53 #3c ~9716
 96fd:  b3 ...                  print_ret       "It only SAYS ~Granite Wall~."
 9716:  b3 ...                  print_ret       "The wall isn't granite."
 9725:  b3 ...                  print_ret       "There is no granite wall here."

Routine 9734, 0 locals ()

 9735:  c1 97 88 5d 3c 59       je              g78 #5d #3c ~9752
 973b:  b3 ...                  print_ret       "The songbird is not here but is probably nearby."
 9752:  41 88 4d 55             je              g78 #4d ~9769
 9756:  b3 ...                  print_ret       "You can't hear the songbird now."
 9769:  41 88 3d 4f             je              g78 #3d ~977a
 976d:  b3 ...                  print_ret       "It can't be followed."
 977a:  b3 ...                  print_ret       "You can't see any songbird here."

Routine 978e, 0 locals ()

 978f:  c1 95 10 cb c1 c9 62    je              g00 #cb #c1 #c9 ~97b6
 9796:  41 88 3c 53             je              g78 #3c ~97ab
 979a:  b3 ...                  print_ret       "Why not find your brains?"
 97ab:  41 88 8b 40             je              g78 #8b ~rfalse
 97af:  e0 2f 4a 17 98 00       call            942e g88 -> sp
 97b5:  b0                      rtrue           
 97b6:  c1 97 10 4f b4 80 44    je              g00 #4f #b4 97ff
 97bd:  c1 97 10 51 50 80 3d    je              g00 #51 #50 97ff
 97c4:  41 88 3c 6c             je              g78 #3c ~97f2
 97c8:  41 10 4a 4f             je              g00 #4a ~97d9
 97cc:  b3 ...                  print_ret       "It seems to be to the west."
 97d9:  b3 ...                  print_ret       "It was here just a minute ago...."
 97f2:  b3 ...                  print_ret       "You're not at the house."
 97ff:  41 88 3c 5f             je              g78 #3c ~9820
 9803:  b3 ...                  print_ret       "It's right here! Are you blind or something?"
 9820:  41 88 8b 49             je              g78 #8b ~982b
 9824:  e0 2f 4a 17 9a 00       call            942e g8a -> sp
 982a:  b0                      rtrue           
 982b:  41 88 38 00 4d          je              g78 #38 ~987b
 9830:  b3 ...                  print_ret       "The house is a beautiful colonial house which is painted white. It is clear that the owners must have been extremely wealthy."
 987b:  c1 97 88 2b 22 77       je              g78 #2b #22 ~98b6
 9881:  41 10 4f 60             je              g00 #4f ~98a3
 9885:  0a eb 0b 49             test_attr       "kitchen window" #0b ~9890
 9889:  e0 1f 49 5b cb 00       call            92b6 #cb -> sp
 988f:  b8                      ret_popped      
 9890:  b2 ...                  print           "The window is closed."
 989b:  bb                      new_line        
 989c:  e0 1f 4a 98 eb 00       call            9530 #eb -> sp
 98a2:  b8                      ret_popped      
 98a3:  b3 ...                  print_ret       "I can't see how to get in from here."
 98b6:  41 88 1c 40             je              g78 #1c ~rfalse
 98ba:  b3 ...                  print_ret       "You must be joking."

Routine 98c8, 0 locals ()

 98c9:  41 88 8b 49             je              g78 #8b ~98d4
 98cd:  e0 2f 4a 17 99 00       call            942e g89 -> sp
 98d3:  b8                      ret_popped      
 98d4:  41 88 2d 59             je              g78 #2d ~98ef
 98d8:  b3 ...                  print_ret       "You will have to specify a direction."
 98ef:  41 88 3c 57             je              g78 #3c ~9908
 98f3:  b3 ...                  print_ret       "You cannot see the forest for the trees."
 9908:  41 88 4d 40             je              g78 #4d ~rfalse
 990c:  b3 ...                  print_ret       "The pines and the hemlocks seem to be murmuring."

Routine 992a, 0 locals ()

 992b:  c1 95 88 20 1f 1e 40    je              g78 #20 #1f #1e ~rfalse
 9932:  b3 ...                  print_ret       "Don't you believe me? The mountains are impassable!"

Routine 9956, 3 locals (0000, 0000, 0000)

 995d:  41 88 40 c0             je              g78 #40 rfalse
 9961:  41 88 22 4c             je              g78 #22 ~996f
 9965:  e0 2f 27 36 47 00       call            4e6c g37 -> sp
 996b:  ad 00                   print_paddr     sp
 996d:  bb                      new_line        
 996e:  b0                      rtrue           
 996f:  41 88 3b 54             je              g78 #3b ~9985
 9973:  2d 02 87                store           local1 g77
 9976:  0d 88 12                store           g78 #12
 9979:  2d 87 86                store           g77 g76
 997c:  2d 86 02                store           g76 local1
 997f:  0d 03 00                store           local2 #00
 9982:  8c 00 1c                jump            999f
 9985:  41 86 ee c6             je              g76 #ee 998d
 9989:  41 86 ed 4b             je              g76 #ed ~9996
 998d:  2d 02 86                store           local1 g76
 9990:  0d 03 00                store           local2 #00
 9993:  8c 00 0b                jump            999f
 9996:  2d 02 87                store           local1 g77
 9999:  a0 02 c5                jz              local1 999f
 999c:  0d 03 01                store           local2 #01
 999f:  41 02 ee 51             je              local1 #ee ~99b2
 99a3:  0d 02 ed                store           local1 #ed
 99a6:  c1 97 88 12 5d 48       je              g78 #12 #5d ~99b2
 99ac:  e0 2f 3c 5d 02 00       call            78ba local1 -> sp
 99b2:  a0 03 c8                jz              local2 99bb
 99b5:  2d 87 02                store           g77 local1
 99b8:  8c 00 05                jump            99be
 99bb:  2d 86 02                store           g76 local1
 99be:  a3 7f 01                get_parent      g6f -> local0
 99c1:  4a 01 1b c5             test_attr       local0 #1b 99c8
 99c5:  0d 01 00                store           local0 #00
 99c8:  c1 97 88 12 5d 00 f4    je              g78 #12 #5d ~9ac1
 99cf:  a0 03 00 f0             jz              local2 ~9ac1
 99d3:  a0 01 f4                jz              local0 9a08
 99d6:  61 01 87 c9             je              local0 g77 99e1
 99da:  a0 87 6d                jz              g77 ~9a08
 99dd:  66 02 01 e9             jin             local1 local0 9a08
 99e1:  b2 ...                  print           "There is now a puddle in the bottom of the "
 99f8:  aa 01                   print_obj       local0
 99fa:  b2 ...                  print           "."
 99fd:  bb                      new_line        
 99fe:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 9a04:  6e 86 01                insert_obj      g76 local0
 9a07:  b0                      rtrue           
 9a08:  a0 87 f0                jz              g77 9a39
 9a0b:  41 87 ec ec             je              g77 #ec 9a39
 9a0f:  b2 ...                  print           "The water leaks out of the "
 9a1c:  aa 87                   print_obj       g77
 9a1e:  b2 ...                  print           " and evaporates immediately."
 9a31:  bb                      new_line        
 9a32:  e0 2f 3c 5d 02 00       call            78ba local1 -> sp
 9a38:  b8                      ret_popped      
 9a39:  26 ec 7f 00 46          jin             "glass bottle" g6f ~9a82
 9a3e:  0a ec 0b d5             test_attr       "glass bottle" #0b 9a55
 9a42:  b2 ...                  print           "The bottle is closed."
 9a4d:  bb                      new_line        
 9a4e:  e0 1f 4a 98 ec 00       call            9530 #ec -> sp
 9a54:  b8                      ret_popped      
 9a55:  92 ec 00 da             get_child       "glass bottle" -> sp 9a71
 9a59:  0e ed ec                insert_obj      "quantity of water" "glass bottle"
 9a5c:  b3 ...                  print_ret       "The bottle is now full of water."
 9a71:  b3 ...                  print_ret       "The water slips through your fingers."
 9a82:  46 86 ec 6c             jin             g76 "glass bottle" ~9ab0
 9a86:  41 88 5d 68             je              g78 #5d ~9ab0
 9a8a:  a0 87 65                jz              g77 ~9ab0
 9a8d:  b3 ...                  print_ret       "It's in the bottle. Perhaps you should take that instead."
 9ab0:  b3 ...                  print_ret       "The water slips through your fingers."
 9ac1:  a0 03 cb                jz              local2 9acd
 9ac4:  b3 ...                  print_ret       "Nice try."
 9acd:  c1 97 88 3f 31 00 55    je              g78 #3f #31 ~9b27
 9ad4:  e0 1f 3c 5d ed 00       call            78ba #ed -> sp
 9ada:  a0 01 e3                jz              local0 9afe
 9add:  b2 ...                  print           "There is now a puddle in the bottom of the "
 9af4:  aa 01                   print_obj       local0
 9af6:  b2 ...                  print           "."
 9af9:  bb                      new_line        
 9afa:  2e ed 01                insert_obj      "quantity of water" local0
 9afd:  b0                      rtrue           
 9afe:  b2 ...                  print           "The water spills to the floor and evaporates immediately."
 9b1f:  bb                      new_line        
 9b20:  e0 1f 3c 5d ed 00       call            78ba #ed -> sp
 9b26:  b8                      ret_popped      
 9b27:  41 88 7f 40             je              g78 #7f ~rfalse
 9b2b:  b2 ...                  print           "The water splashes on the walls and evaporates immediately."
 9b4e:  bb                      new_line        
 9b4f:  e0 1f 3c 5d ed 00       call            78ba #ed -> sp
 9b55:  b8                      ret_popped      

Routine 9b56, 0 locals ()

 9b57:  c1 97 88 23 2b 50       je              g78 #23 #2b ~9b6b
 9b5d:  0d 43 01                store           g33 #01
 9b60:  e0 10 4a fd eb 9b a8 9b bd 00 
                               call            95fa #eb s202 s203 -> sp
 9b6a:  b8                      ret_popped      
 9b6b:  41 88 38 6a             je              g78 #38 ~9b97
 9b6f:  a0 43 67                jz              g33 ~9b97
 9b72:  b3 ...                  print_ret       "The window is slightly ajar, but not enough to allow entry."
 9b97:  c1 95 88 22 19 89 54    je              g78 #22 #19 #89 ~9bb0
 9b9e:  41 10 cb 49             je              g00 #cb ~9ba9
 9ba2:  e0 1f 4a 38 1e 00       call            9470 #1e -> sp
 9ba8:  b0                      rtrue           
 9ba9:  e0 1f 4a 38 1d 00       call            9470 #1d -> sp
 9baf:  b0                      rtrue           
 9bb0:  41 88 39 40             je              g78 #39 ~rfalse
 9bb4:  b2 ...                  print           "You can see "
 9bbb:  41 10 cb 59             je              g00 #cb ~9bd6
 9bbf:  b3 ...                  print_ret       "a clear area leading towards a forest."
 9bd6:  b3 ...                  print_ret       "what appears to be a kitchen."

Routine 9be8, 0 locals ()

 9be9:  41 88 6f 61             je              g78 #6f ~9c0c
 9bed:  b2 ...                  print           "The spirits jeer loudly and ignore you."
 9c06:  bb                      new_line        
 9c07:  0d 7c 00                store           g6c #00
 9c0a:  ab 7c                   ret             g6c
 9c0c:  41 88 3a 5d             je              g78 #3a ~9c2b
 9c10:  b3 ...                  print_ret       "Only the ceremony itself has any effect."
 9c2b:  c1 97 88 2a 13 65       je              g78 #2a #13 ~9c54
 9c31:  41 86 e9 61             je              g76 #e9 ~9c54
 9c35:  b3 ...                  print_ret       "How can you attack a spirit with material objects?"
 9c54:  b3 ...                  print_ret       "You seem unable to interact with these spirits."

Routine 9c72, 0 locals ()

 9c73:  41 88 69 79             je              g78 #69 ~9cae
 9c77:  a0 42 cc                jz              g32 9c84
 9c7a:  e0 2f 27 36 44 00       call            4e6c g34 -> sp
 9c80:  ad 00                   print_paddr     sp
 9c82:  bb                      new_line        
 9c83:  b0                      rtrue           
 9c84:  0e e3 e2                insert_obj      "basket" "Shaft Room"
 9c87:  0e e5 e4                insert_obj      "basket" "Drafty Room"
 9c8a:  0d 42 01                store           g32 #01
 9c8d:  e0 1f 4a 98 e3 00       call            9530 #e3 -> sp
 9c93:  b3 ...                  print_ret       "The basket is raised to the top of the shaft."
 9cae:  41 88 54 00 59          je              g78 #54 ~9d0a
 9cb3:  a0 42 4c                jz              g32 ~9cc0
 9cb6:  e0 2f 27 36 44 00       call            4e6c g34 -> sp
 9cbc:  ad 00                   print_paddr     sp
 9cbe:  bb                      new_line        
 9cbf:  b0                      rtrue           
 9cc0:  0e e3 e4                insert_obj      "basket" "Drafty Room"
 9cc3:  0e e5 e2                insert_obj      "basket" "Shaft Room"
 9cc6:  e0 1f 4a 98 e5 00       call            9530 #e5 -> sp
 9ccc:  b2 ...                  print           "The basket is lowered to the bottom of the shaft."
 9ce9:  bb                      new_line        
 9cea:  0d 42 00                store           g32 #00
 9ced:  a0 52 c1                jz              g42 rtrue
 9cf0:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 9cf6:  a0 52 41                jz              g42 ~rtrue
 9cf9:  b2 ...                  print           "It is now pitch black."
 9d08:  bb                      new_line        
 9d09:  b0                      rtrue           
 9d0a:  41 86 e5 c6             je              g76 #e5 9d12
 9d0e:  41 87 e5 59             je              g77 #e5 ~9d29
 9d12:  b3 ...                  print_ret       "The basket is at the other end of the chain."
 9d29:  41 88 5d 40             je              g78 #5d ~rfalse
 9d2d:  c1 97 86 e3 e5 40       je              g76 #e3 #e5 ~rfalse
 9d33:  b3 ...                  print_ret       "The cage is securely fastened to the iron chain."

Routine 9d50, 0 locals ()

 9d51:  41 88 6f 4d             je              g78 #6f ~9d60
 9d55:  e0 1f 4e eb 06 00       call            9dd6 #06 -> sp
 9d5b:  0d 7c 00                store           g6c #00
 9d5e:  ab 7c                   ret             g6c
 9d60:  c1 95 88 2a 13 5d 40    je              g78 #2a #13 #5d ~rfalse
 9d67:  93 bd 00                get_parent      "clove of garlic" -> sp
 9d6a:  c1 ab 00 7f 10 5d       je              sp g6f g00 ~9d8b
 9d70:  b3 ...                  print_ret       "You can't reach him; he's on the ceiling."
 9d8b:  e0 3f 4e c9 00          call            9d92 -> sp
 9d90:  b8                      ret_popped      

Routine 9d92, 0 locals ()

 9d93:  e0 1f 4e eb 04 00       call            9dd6 #04 -> sp
 9d99:  bb                      new_line        
 9d9a:  b2 ...                  print           "The bat grabs you by the scruff of your neck and lifts you away...."
 9dc1:  bb                      new_line        
 9dc2:  bb                      new_line        
 9dc3:  e0 2f 27 36 41 00       call            4e6c g31 -> sp
 9dc9:  e0 27 49 5b 00 00 00    call            92b6 sp #00 -> sp
 9dd0:  e0 3f 46 44 00          call            8c88 -> sp
 9dd5:  b0                      rtrue           

Routine 9dd6, 1 local (0000)

 9dd9:  04 01 01 45             dec_chk         local0 #01 ~9de0
 9ddd:  8c 00 0f                jump            9ded
 9de0:  b2 ...                  print           "    Fweep!"
 9de9:  bb                      new_line        
 9dea:  8c ff ee                jump            9dd9
 9ded:  bb                      new_line        
 9dee:  b0                      rtrue           

Routine 9df0, 0 locals ()

 9df1:  41 88 6d 40             je              g78 #6d ~rfalse
 9df5:  c1 8f 10 5a 7f 45       je              g00 #5a7f ~9dfe
 9dfb:  a0 a1 c0                jz              g91 rfalse
 9dfe:  b3 ...                  print_ret       "Ding, dong."

Routine 9e0a, 0 locals ()

 9e0b:  41 88 5d 59             je              g78 #5d ~9e26
 9e0f:  b3 ...                  print_ret       "The bell is very hot and cannot be taken."
 9e26:  41 88 6e cb             je              g78 #6e 9e33
 9e2a:  41 88 6d 00 50          je              g78 #6d ~9e7d
 9e2f:  a0 87 80 4c             jz              g77 9e7d
 9e33:  4a 87 1a 5e             test_attr       g77 #1a ~9e53
 9e37:  b2 ...                  print           "The "
 9e3a:  aa 87                   print_obj       g77
 9e3c:  b2 ...                  print           " burns and is consumed."
 9e4b:  bb                      new_line        
 9e4c:  e0 2f 3c 5d 87 00       call            78ba g77 -> sp
 9e52:  b8                      ret_popped      
 9e53:  41 87 01 53             je              g77 #01 ~9e68
 9e57:  b3 ...                  print_ret       "The bell is too hot to touch."
 9e68:  b3 ...                  print_ret       "The heat from the bell is too intense."
 9e7d:  41 88 61 6e             je              g78 #61 ~9ead
 9e81:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 9e87:  b2 ...                  print           "The water cools the bell and is evaporated."
 9e9e:  bb                      new_line        
 9e9f:  e0 07 2a 39 5c 72 00 00 call            5472 #5c72 #00 -> sp
 9ea7:  e0 3f 5c 72 00          call            b8e4 -> sp
 9eac:  b8                      ret_popped      
 9ead:  41 88 6d 40             je              g78 #6d ~rfalse
 9eb1:  b3 ...                  print_ret       "The bell is too hot to reach."

Routine 9ec2, 0 locals ()

 9ec3:  41 88 2b 5b             je              g78 #2b ~9ee0
 9ec7:  b3 ...                  print_ret       "The windows are boarded and can't be opened."
 9ee0:  41 88 2a 40             je              g78 #2a ~rfalse
 9ee4:  b3 ...                  print_ret       "You can't break the windows open."

Routine 9ef8, 0 locals ()

 9ef9:  41 88 5d 40             je              g78 #5d ~rfalse
 9efd:  b3 ...                  print_ret       "The nails, deeply imbedded in the door, cannot be removed."

Routine 9f1e, 0 locals ()

 9f1f:  41 88 22 40             je              g78 #22 ~rfalse
 9f23:  b3 ...                  print_ret       "You can't fit through the crack."

Routine 9f30, 1 local (0000)

 9f33:  41 01 03 00 93          je              local0 #03 ~9fc9
 9f38:  b2 ...                  print           "You are in the kitchen of the white house. A table seems to have been used recently for the preparation of food. A passage leads to the west and a dark staircase can be seen leading upward. A dark chimney leads down and to the east is a small window which is "
 9fb5:  0a eb 0b 47             test_attr       "kitchen window" #0b ~9fbe
 9fb9:  b3 ...                  print_ret       "open."
 9fbe:  b3 ...                  print_ret       "slightly ajar."
 9fc9:  41 01 01 40             je              local0 #01 ~rfalse
 9fcd:  41 88 1e 4d             je              g78 #1e ~9fdc
 9fd1:  41 86 49 49             je              g76 #49 ~9fdc
 9fd5:  e0 1f 4a 38 17 00       call            9470 #17 -> sp
 9fdb:  b8                      ret_popped      
 9fdc:  41 88 1e 40             je              g78 #1e ~rfalse
 9fe0:  41 86 49 40             je              g76 #49 ~rfalse
 9fe4:  b3 ...                  print_ret       "There are no stairs leading down."

Routine 9ff6, 1 local (0000)

 9ff9:  41 01 01 40             je              local0 #01 ~rfalse
 9ffd:  41 88 36 d4             je              g78 #36 a013
 a001:  41 88 89 48             je              g78 #89 ~a00b
 a005:  c1 97 86 1d 15 ca       je              g76 #1d #15 a013
 a00b:  41 88 22 40             je              g78 #22 ~rfalse
 a00f:  41 86 b1 40             je              g76 #b1 ~rfalse
 a013:  b2 ...                  print           "Inside the Barrow^As you enter the barrow, the door closes inexorably behind you. Around you it is dark, but ahead is an enormous cavern, brightly lit. Through its center runs a wide stream. Spanning the stream is a small wooden footbridge, and beyond a path leads into a dark tunnel. Above the bridge, floating in the air, is a large sign. It reads:  All ye who stand before this bridge have completed a great and perilous adventure which has tested your wit and courage. You have mastered"
 a12e:  10 00 01 00             loadb           #00 #01 -> sp
 a132:  49 00 08 00             and             sp #08 -> sp
 a136:  a0 00 00 c9             jz              sp ~a201
 a13a:  b2 ...                  print           " the first part of the ZORK trilogy. Those who pass over this bridge must be prepared to undertake an even greater adventure that will severely test your skill and bravery!^^The ZORK trilogy continues with ~ZORK II: The Wizard of Frobozz~ and is completed in ~ZORK III: The Dungeon Master.~"
 a1fd:  bb                      new_line        
 a1fe:  8c 00 20                jump            a21f
 a201:  b2 ...                  print           " ZORK: The Great Underground Empire.^"
 a21e:  bb                      new_line        
 a21f:  e0 1f 36 e6 00 00       call            6dcc #00 -> sp
 a225:  b8                      ret_popped      

Routine a226, 0 locals ()

 a227:  c1 97 88 23 2b 40       je              g78 #23 #2b ~rfalse
 a22d:  b3 ...                  print_ret       "The door is too heavy."

Routine a238, 0 locals ()

 a239:  41 88 22 40             je              g78 #22 ~rfalse
 a23d:  e0 1f 4a 38 1d 00       call            9470 #1d -> sp
 a243:  b8                      ret_popped      

Routine a244, 0 locals ()

 a245:  41 88 5d 40             je              g78 #5d ~rfalse
 a249:  41 86 c2 40             je              g76 #c2 ~rfalse
 a24d:  b3 ...                  print_ret       "The trophy case is securely fastened to the wall."

Routine a26c, 3 locals (0000, 0000, 0000)

 a273:  41 01 03 01 1f          je              local0 #03 ~a395
 a278:  b2 ...                  print           "You are in the living room. There is a doorway to the east"
 a295:  a0 9f 80 4a             jz              g8f a2e1
 a299:  b2 ...                  print           ". To the west is a cyclops-shaped opening in an old wooden door, above which is some strange gothic lettering, "
 a2de:  8c 00 33                jump            a312
 a2e1:  b2 ...                  print           ", a wooden door with strange gothic lettering to the west, which appears to be nailed shut, "
 a312:  b2 ...                  print           "a trophy case, "
 a31d:  2d 02 40                store           local1 g30
 a320:  a0 02 e4                jz              local1 a345
 a323:  0a b7 0b 60             test_attr       "trap door" #0b ~a345
 a327:  b2 ...                  print           "and a rug lying beside an open trap door."
 a342:  8c 00 50                jump            a393
 a345:  a0 02 d8                jz              local1 a35e
 a348:  b2 ...                  print           "and a closed trap door at your feet."
 a35b:  8c 00 37                jump            a393
 a35e:  0a b7 0b 58             test_attr       "trap door" #0b ~a378
 a362:  b2 ...                  print           "and an open trap door at your feet."
 a375:  8c 00 1d                jump            a393
 a378:  b2 ...                  print           "and a large oriental rug in the center of the room."
 a393:  bb                      new_line        
 a394:  b0                      rtrue           
 a395:  41 01 06 40             je              local0 #06 ~rfalse
 a399:  41 88 5d ca             je              g78 #5d a3a5
 a39d:  41 88 12 40             je              g78 #12 ~rfalse
 a3a1:  41 87 c2 40             je              g77 #c2 ~rfalse
 a3a5:  46 86 c2 48             jin             g76 "trophy case" ~a3af
 a3a9:  e0 2f 51 e0 86 00       call            a3c0 g76 -> sp
 a3af:  e0 3f 51 f0 00          call            a3e0 -> sp
 a3b4:  74 4f 00 11             add             g3f sp -> g01
 a3b8:  e0 1f 48 31 00 00       call            9062 #00 -> sp
 a3be:  b1                      rfalse          

Routine a3c0, 2 locals (0000, 0000)

 a3c5:  a2 01 02 c2             get_child       local0 -> local1 a3c9
 a3c9:  a0 02 c1                jz              local1 rtrue
 a3cc:  4b 02 03                set_attr        local1 #03
 a3cf:  a2 02 00 48             get_child       local1 -> sp ~a3d9
 a3d3:  e0 2f 51 e0 02 00       call            a3c0 local1 -> sp
 a3d9:  a1 02 02 c2             get_sibling     local1 -> local1 a3dd
 a3dd:  8c ff eb                jump            a3c9

Routine a3e0, 3 locals (00c2, 0000, 0000)

 a3e7:  a2 01 02 c2             get_child       local0 -> local1 a3eb
 a3eb:  a0 02 44                jz              local1 ~a3f0
 a3ee:  ab 03                   ret             local2
 a3f0:  51 02 0c 00             get_prop        local1 #0c -> sp
 a3f4:  74 03 00 03             add             local2 sp -> local2
 a3f8:  a2 02 00 48             get_child       local1 -> sp ~a402
 a3fc:  e0 2f 51 f0 02 00       call            a3e0 local1 -> sp
 a402:  a1 02 02 c2             get_sibling     local1 -> local1 a406
 a406:  8c ff e4                jump            a3eb

Routine a40a, 0 locals ()

 a40b:  41 88 69 4a             je              g78 #69 ~a417
 a40f:  e0 17 2b be 2b b7 00    call            577c #2b #b7 -> sp
 a416:  b0                      rtrue           
 a417:  c1 97 88 23 2b 51       je              g78 #23 #2b ~a42c
 a41d:  41 10 c1 4d             je              g00 #c1 ~a42c
 a421:  e0 20 4a fd 86 9b cd 9b e3 00 
                               call            95fa g76 s204 s205 -> sp
 a42b:  b8                      ret_popped      
 a42c:  41 88 51 6c             je              g78 #51 ~a45a
 a430:  41 10 c1 68             je              g00 #c1 ~a45a
 a434:  0a b7 0b 5f             test_attr       "trap door" #0b ~a455
 a438:  b3 ...                  print_ret       "You see a rickety staircase descending into darkness."
 a455:  b3 ...                  print_ret       "It's closed."
 a45a:  41 10 48 40             je              g00 #48 ~rfalse
 a45e:  c1 97 88 85 2b 57       je              g78 #85 #2b ~a479
 a464:  0a b7 0b d3             test_attr       "trap door" #0b a479
 a468:  b3 ...                  print_ret       "The door is locked from above."
 a479:  41 88 23 5b             je              g78 #23 ~a496
 a47d:  0a b7 0b d7             test_attr       "trap door" #0b a496
 a481:  0c b7 03                clear_attr      "trap door" #03
 a484:  0c b7 0b                clear_attr      "trap door" #0b
 a487:  b3 ...                  print_ret       "The door closes and locks."
 a496:  c1 97 88 23 2b 40       je              g78 #23 #2b ~rfalse
 a49c:  e0 2f 27 36 44 00       call            4e6c g34 -> sp
 a4a2:  ad 00                   print_paddr     sp
 a4a4:  bb                      new_line        
 a4a5:  b0                      rtrue           

Routine a4a6, 1 local (0000)

 a4a9:  41 01 03 00 5d          je              local0 #03 ~a509
 a4ae:  b3 ...                  print_ret       "You are in a dark and damp cellar with a narrow passageway leading north, and a crawlway to the south. On the west is the bottom of a steep metal ramp which is unclimbable."
 a509:  41 01 02 40             je              local0 #02 ~rfalse
 a50d:  0a b7 0b 40             test_attr       "trap door" #0b ~rfalse
 a511:  0a b7 03 c0             test_attr       "trap door" #03 rfalse
 a515:  0c b7 0b                clear_attr      "trap door" #0b
 a518:  0b b7 03                set_attr        "trap door" #03
 a51b:  b2 ...                  print           "The trap door crashes shut, and you hear someone barring it."
 a540:  bb                      new_line        
 a541:  bb                      new_line        
 a542:  b0                      rtrue           

Routine a544, 0 locals ()

 a545:  41 88 38 40             je              g78 #38 ~rfalse
 a549:  b2 ...                  print           "The chimney leads "
 a556:  41 10 cb 4a             je              g00 #cb ~a562
 a55a:  b2 ...                  print           "down"
 a55f:  8c 00 05                jump            a565
 a562:  b2 ...                  print           "up"
 a565:  b3 ...                  print_ret       "ward, and looks climbable."

Routine a578, 1 local (0000)

 a57b:  a2 7f 01 df             get_child       g6f -> local0 a59c
 a57f:  b2 ...                  print           "Going up empty-handed is a bad idea."
 a59a:  bb                      new_line        
 a59b:  b1                      rfalse          
 a59c:  a1 01 01 46             get_sibling     local0 -> local0 ~a5a4
 a5a0:  a1 01 00 d1             get_sibling     local0 -> sp a5b3
 a5a4:  26 a4 7f 4d             jin             "brass lantern" g6f ~a5b3
 a5a8:  0a b7 0b c7             test_attr       "trap door" #0b a5b1
 a5ac:  0c b7 03                clear_attr      "trap door" #03
 a5af:  9b cb                   ret             #cb
 a5b1:  9b cb                   ret             #cb
 a5b3:  b2 ...                  print           "You can't get up there with what you're carrying."
 a5ce:  bb                      new_line        
 a5cf:  b1                      rfalse          

Routine a5d0, 0 locals ()

 a5d1:  a0 40 db                jz              g30 a5ed
 a5d4:  0a b7 0b 44             test_attr       "trap door" #0b ~a5da
 a5d8:  9b 48                   ret             #48
 a5da:  b2 ...                  print           "The trap door is closed."
 a5e5:  bb                      new_line        
 a5e6:  e0 1f 4a 98 b7 00       call            9530 #b7 -> sp
 a5ec:  b1                      rfalse          
 a5ed:  b2 ...                  print           "You can't go that way."
 a5f8:  bb                      new_line        
 a5f9:  b1                      rfalse          

Routine a5fa, 0 locals ()

 a5fb:  41 88 69 00 44          je              g78 #69 ~a642
 a600:  b2 ...                  print           "The rug is too heavy to lift"
 a611:  a0 40 c5                jz              g30 a617
 a614:  b3 ...                  print_ret       "."
 a617:  b3 ...                  print_ret       ", but in trying to take it you have noticed an irregularity beneath it."
 a642:  c1 97 88 65 58 00 80    je              g78 #65 #58 ~a6c7
 a649:  a0 40 ed                jz              g30 a677
 a64c:  b3 ...                  print_ret       "Having moved the carpet previously, you find it impossible to move it again."
 a677:  b2 ...                  print           "With a great effort, the rug is moved to one side of the room, revealing the dusty cover of a closed trap door."
 a6b8:  bb                      new_line        
 a6b9:  0c b7 07                clear_attr      "trap door" #07
 a6bc:  e0 1f 4a 98 b7 00       call            9530 #b7 -> sp
 a6c2:  0d 40 01                store           g30 #01
 a6c5:  ab 40                   ret             g30
 a6c7:  41 88 5d 5d             je              g78 #5d ~a6e6
 a6cb:  b3 ...                  print_ret       "The rug is extremely heavy and cannot be carried."
 a6e6:  41 88 51 00 52          je              g78 #51 ~a73b
 a6eb:  a0 40 00 4e             jz              g30 ~a73b
 a6ef:  0a b7 0b 80 49          test_attr       "trap door" #0b a73b
 a6f4:  b3 ...                  print_ret       "Underneath the rug is a closed trap door. As you drop the corner of the rug, the trap door is once again concealed from view."
 a73b:  41 88 21 40             je              g78 #21 ~rfalse
 a73f:  a0 40 00 48             jz              g30 ~a789
 a743:  0a b7 0b 80 43          test_attr       "trap door" #0b a789
 a748:  b3 ...                  print_ret       "As you sit, you notice an irregularity underneath it. Rather than be uncomfortable, you stand up again."
 a789:  b3 ...                  print_ret       "I suppose you think it's a magic carpet?"

Routine a7a2, 0 locals ()

 a7a3:  a0 9d 40                jz              g8d ~rfalse
 a7a6:  e0 17 53 dc da d9 00    call            a7b8 #da #d9 -> sp
 a7ad:  b8                      ret_popped      

Routine a7ae, 0 locals ()

 a7af:  e0 17 53 dc 71 72 00    call            a7b8 #71 #72 -> sp
 a7b6:  b8                      ret_popped      

Routine a7b8, 2 locals (0000, 0000)

 a7bd:  66 02 10 40             jin             local1 g00 ~rfalse
 a7c1:  41 88 5d 40             je              g78 #5d ~rfalse
 a7c5:  66 01 02 58             jin             local0 local1 ~a7df
 a7c9:  b2 ...                  print           "The "
 a7cc:  aa 02                   print_obj       local1
 a7ce:  b3 ...                  print_ret       " swings it out of your reach."
 a7df:  b2 ...                  print           "The "
 a7e2:  aa 01                   print_obj       local0
 a7e4:  b2 ...                  print           " seems white-hot. You can't hold on to it."
 a7fb:  bb                      new_line        
 a7fc:  b0                      rtrue           

Routine a7fe, 1 local (0000)

 a801:  41 88 6f 63             je              g78 #6f ~a826
 a805:  b2 ...                  print           "The troll isn't much of a conversationalist."
 a820:  bb                      new_line        
 a821:  0d 7c 00                store           g6c #00
 a824:  ab 7c                   ret             g6c
 a826:  41 01 01 00 a2          je              local0 #01 ~a8cb
 a82b:  06 da d9 c0             jin             "bloody axe" "troll" rfalse
 a82f:  26 da 10 00 56          jin             "bloody axe" g00 ~a888
 a834:  e0 1f 27 21 4b 00       call            4e42 #4b -> sp
 a83a:  a0 00 80 4c             jz              sp a888
 a83e:  0b da 0e                set_attr        "bloody axe" #0e
 a841:  0c da 1d                clear_attr      "bloody axe" #1d
 a844:  0e da d9                insert_obj      "bloody axe" "troll"
 a847:  e3 53 d9 0b 9b ec       put_prop        "troll" #0b s206
 a84d:  26 d9 10 41             jin             "troll" g00 ~rtrue
 a851:  b3 ...                  print_ret       "The troll, angered and humiliated, recovers his weapon. He appears to have an axe to grind with you."
 a888:  26 d9 10 40             jin             "troll" g00 ~rfalse
 a88c:  e3 53 d9 0b 9c 03       put_prop        "troll" #0b s207
 a892:  b2 ...                  print           "The troll, disarmed, cowers in terror, pleading for his life in the guttural tongue of the trolls."
 a8c9:  bb                      new_line        
 a8ca:  b0                      rtrue           
 a8cb:  41 01 02 54             je              local0 #02 ~a8e1
 a8cf:  06 da d9 4b             jin             "bloody axe" "troll" ~a8dc
 a8d3:  2e da 10                insert_obj      "bloody axe" g00
 a8d6:  0c da 0e                clear_attr      "bloody axe" #0e
 a8d9:  0b da 1d                set_attr        "bloody axe" #1d
 a8dc:  0d 9d 01                store           g8d #01
 a8df:  ab 9d                   ret             g8d
 a8e1:  41 01 03 5d             je              local0 #03 ~a900
 a8e5:  0c d9 02                clear_attr      "troll" #02
 a8e8:  06 da d9 4b             jin             "bloody axe" "troll" ~a8f5
 a8ec:  2e da 10                insert_obj      "bloody axe" g00
 a8ef:  0c da 0e                clear_attr      "bloody axe" #0e
 a8f2:  0b da 1d                set_attr        "bloody axe" #1d
 a8f5:  e3 53 d9 0b 9c 0e       put_prop        "troll" #0b s208
 a8fb:  0d 9d 01                store           g8d #01
 a8fe:  ab 9d                   ret             g8d
 a900:  41 01 04 00 59          je              local0 #04 ~a95c
 a905:  26 d9 10 67             jin             "troll" g00 ~a92e
 a909:  0b d9 02                set_attr        "troll" #02
 a90c:  b2 ...                  print           "The troll stirs, quickly resuming a fighting stance."
 a92d:  bb                      new_line        
 a92e:  06 da d9 4b             jin             "bloody axe" "troll" ~a93b
 a932:  e3 53 d9 0b 9c 24       put_prop        "troll" #0b s209
 a938:  8c 00 1e                jump            a957
 a93b:  06 da 66 54             jin             "bloody axe" "The Troll Room" ~a951
 a93f:  0b da 0e                set_attr        "bloody axe" #0e
 a942:  0c da 1d                clear_attr      "bloody axe" #1d
 a945:  0e da d9                insert_obj      "bloody axe" "troll"
 a948:  e3 53 d9 0b 9c 24       put_prop        "troll" #0b s209
 a94e:  8c 00 08                jump            a957
 a951:  e3 53 d9 0b 9c 3b       put_prop        "troll" #0b s210
 a957:  0d 9d 00                store           g8d #00
 a95a:  ab 9d                   ret             g8d
 a95c:  41 01 05 51             je              local0 #05 ~a96f
 a960:  e7 7f 64 00             random          #64 -> sp
 a964:  23 21 00 40             jg              #21 sp ~rfalse
 a968:  0b d9 02                set_attr        "troll" #02
 a96b:  0d 7c 00                store           g6c #00
 a96e:  b0                      rtrue           
 a96f:  a0 01 40                jz              local0 ~rfalse
 a972:  41 88 38 4a             je              g78 #38 ~a97e
 a976:  11 d9 0b 00             get_prop        "troll" #0b -> sp
 a97a:  ad 00                   print_paddr     sp
 a97c:  bb                      new_line        
 a97d:  b0                      rtrue           
 a97e:  c1 97 88 3f 7f 49       je              g78 #3f #7f ~a98b
 a984:  a0 86 c6                jz              g76 a98b
 a987:  41 87 d9 ca             je              g77 #d9 a993
 a98b:  c1 95 88 2a 58 5d 02 23 je              g78 #2a #58 #5d ~abb4
 a993:  e0 1f 80 6c d9 00       call            100d8 #d9 -> sp
 a999:  c1 97 88 3f 7f 01 bc    je              g78 #3f #7f ~ab5a
 a9a0:  41 86 da 73             je              g76 #da ~a9d5
 a9a4:  26 da 7f 6f             jin             "bloody axe" g6f ~a9d5
 a9a8:  b2 ...                  print           "The troll scratches his head in confusion, then takes the axe."
 a9cd:  bb                      new_line        
 a9ce:  0b d9 02                set_attr        "troll" #02
 a9d1:  0e da d9                insert_obj      "bloody axe" "troll"
 a9d4:  b0                      rtrue           
 a9d5:  c1 97 86 d9 da 62       je              g76 #d9 #da ~a9fb
 a9db:  b2 ...                  print           "You would have to get the "
 a9e6:  aa 86                   print_obj       g76
 a9e8:  b3 ...                  print_ret       " first, and that seems unlikely."
 a9fb:  41 88 7f 6a             je              g78 #7f ~aa27
 a9ff:  b2 ...                  print           "The troll, who is remarkably coordinated, catches the "
 aa22:  aa 86                   print_obj       g76
 aa24:  8c 00 29                jump            aa4e
 aa27:  b2 ...                  print           "The troll, who is not overly proud, graciously accepts the gift"
 aa4e:  e7 7f 64 00             random          #64 -> sp
 aa52:  23 14 00 00 6e          jg              #14 sp ~aac3
 aa57:  c1 95 86 a9 6e da 00 66 je              g76 #a9 #6e #da ~aac3
 aa5f:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 aa65:  b2 ...                  print           " and eats it hungrily. Poor troll, he dies from an internal hemorrhage and his carcass disappears in a sinister black fog."
 aaae:  bb                      new_line        
 aaaf:  e0 1f 3c 5d d9 00       call            78ba #d9 -> sp
 aab5:  11 d9 11 00             get_prop        "troll" #11 -> sp
 aab9:  e0 9f 00 02 00          call            sp #02 -> sp
 aabe:  0d 9d 01                store           g8d #01
 aac1:  ab 9d                   ret             g8d
 aac3:  c1 95 86 a9 6e da 00 5e je              g76 #a9 #6e #da ~ab27
 aacb:  6e 86 10                insert_obj      g76 g00
 aace:  b2 ...                  print           " and, being for the moment sated, throws it back. Fortunately, the troll has poor control, and the "
 ab01:  aa 86                   print_obj       g76
 ab03:  b2 ...                  print           " falls to the floor. He does not look pleased."
 ab22:  bb                      new_line        
 ab23:  0b d9 02                set_attr        "troll" #02
 ab26:  b0                      rtrue           
 ab27:  b2 ...                  print           " and not having the most discriminating tastes, gleefully eats it."
 ab52:  bb                      new_line        
 ab53:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 ab59:  b8                      ret_popped      
 ab5a:  c1 97 88 58 5d 7d       je              g78 #58 #5d ~ab9b
 ab60:  b3 ...                  print_ret       "The troll spits in your face, grunting ~Better luck next time~ in a rather barbarous accent."
 ab9b:  41 88 2a 40             je              g78 #2a ~rfalse
 ab9f:  b3 ...                  print_ret       "The troll laughs at your puny gesture."
 abb4:  41 88 4d 77             je              g78 #4d ~abed
 abb8:  b3 ...                  print_ret       "Every so often the troll says something, probably uncomplimentary, in his guttural tongue."
 abed:  a0 9d c0                jz              g8d rfalse
 abf0:  41 88 42 40             je              g78 #42 ~rfalse
 abf4:  b3 ...                  print_ret       "Unfortunately, the troll can't hear you."

Routine ac04, 0 locals ()

 ac05:  0a ae 0b c0             test_attr       "grating" #0b rfalse
 ac09:  a0 3e 40                jz              g2e ~rfalse
 ac0c:  c1 97 88 5d 58 67       je              g78 #5d #58 ~ac37
 ac12:  b2 ...                  print           "In disturbing the pile of leaves, a grating is revealed."
 ac33:  bb                      new_line        
 ac34:  8c 00 1e                jump            ac53
 ac37:  b2 ...                  print           "With the leaves moved, a grating is revealed."
 ac52:  bb                      new_line        
 ac53:  0c ae 07                clear_attr      "grating" #07
 ac56:  0d 3e 01                store           g2e #01
 ac59:  b1                      rfalse          

Routine ac5a, 0 locals ()

 ac5b:  41 88 25 57             je              g78 #25 ~ac74
 ac5f:  b3 ...                  print_ret       "There are 69,105 leaves here."
 ac74:  41 88 1c 64             je              g78 #1c ~ac9a
 ac78:  e0 3f 56 02 00          call            ac04 -> sp
 ac7d:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 ac83:  66 86 10 4d             jin             g76 g00 ~ac92
 ac87:  b3 ...                  print_ret       "The leaves burn."
 ac92:  e0 0f 83 33 9c 3f 00    call            10666 s211 -> sp
 ac99:  b8                      ret_popped      
 ac9a:  41 88 27 6a             je              g78 #27 ~acc6
 ac9e:  b2 ...                  print           "You rustle the leaves around, making quite a mess."
 acbf:  bb                      new_line        
 acc0:  e0 3f 56 02 00          call            ac04 -> sp
 acc5:  b0                      rtrue           
 acc6:  c1 97 88 5d 58 5b       je              g78 #5d #58 ~ace5
 accc:  41 88 58 4a             je              g78 #58 ~acd8
 acd0:  b2 ...                  print           "Done."
 acd7:  bb                      new_line        
 acd8:  a0 3e 40                jz              g2e ~rfalse
 acdb:  e0 3f 56 02 00          call            ac04 -> sp
 ace0:  41 88 5d 41             je              g78 #5d ~rtrue
 ace4:  b1                      rfalse          
 ace5:  41 88 51 40             je              g78 #51 ~rfalse
 ace9:  a0 3e 40                jz              g2e ~rfalse
 acec:  b3 ...                  print_ret       "Underneath the pile of leaves is a grating. As you release the leaves, the grating is once again concealed from view."

Routine ad30, 1 local (0000)

 ad33:  41 01 02 49             je              local0 #02 ~ad3e
 ad37:  a0 3e 40                jz              g2e ~rfalse
 ad3a:  0b ae 07                set_attr        "grating" #07
 ad3d:  b0                      rtrue           
 ad3e:  41 01 03 40             je              local0 #03 ~rfalse
 ad42:  b2 ...                  print           "You are in a clearing, with a forest surrounding you on all sides. A path leads south."
 ad75:  0a ae 0b 65             test_attr       "grating" #0b ~ad9c
 ad79:  bb                      new_line        
 ad7a:  b2 ...                  print           "There is an open grating, descending into darkness."
 ad99:  8c 00 21                jump            adbb
 ad9c:  a0 3e de                jz              g2e adbb
 ad9f:  bb                      new_line        
 ada0:  b2 ...                  print           "There is a grating securely fastened into the ground."
 adbb:  bb                      new_line        
 adbc:  b0                      rtrue           

Routine adbe, 1 local (0000)

 adc1:  41 01 02 46             je              local0 #02 ~adc9
 adc5:  0c ae 07                clear_attr      "grating" #07
 adc8:  b0                      rtrue           
 adc9:  41 01 03 40             je              local0 #03 ~rfalse
 adcd:  b2 ...                  print           "You are in a small room near the maze. There are twisty passages in the immediate vicinity."
 adf8:  bb                      new_line        
 adf9:  0a ae 0b 64             test_attr       "grating" #0b ~ae1f
 adfd:  b2 ...                  print           "Above you is an open grating with sunlight pouring in."
 ae1c:  8c 00 40                jump            ae5d
 ae1f:  a0 3d d6                jz              g2d ae36
 ae22:  b2 ...                  print           "Above you is a grating."
 ae33:  8c 00 29                jump            ae5d
 ae36:  b2 ...                  print           "Above you is a grating locked with a skull-and-crossbones lock."
 ae5d:  bb                      new_line        
 ae5e:  b0                      rtrue           

Routine ae60, 0 locals ()

 ae61:  41 88 2b 4f             je              g78 #2b ~ae72
 ae65:  41 87 7a 4b             je              g77 #7a ~ae72
 ae69:  e0 15 2b be 85 ae 7a 00 call            577c #85 #ae #7a -> sp
 ae71:  b0                      rtrue           
 ae72:  41 88 4e 69             je              g78 #4e ~ae9d
 ae76:  41 10 39 52             je              g00 #39 ~ae8a
 ae7a:  0d 3d 00                store           g2d #00
 ae7d:  b3 ...                  print_ret       "The grate is locked."
 ae8a:  41 10 8f 40             je              g00 #8f ~rfalse
 ae8e:  b3 ...                  print_ret       "You can't lock it from this side."
 ae9d:  41 88 85 00 4e          je              g78 #85 ~aeee
 aea2:  41 86 ae 00 49          je              g76 #ae ~aeee
 aea7:  41 10 39 58             je              g00 #39 ~aec1
 aeab:  41 87 7a 54             je              g77 #7a ~aec1
 aeaf:  0d 3d 01                store           g2d #01
 aeb2:  b3 ...                  print_ret       "The grate is unlocked."
 aec1:  41 10 8f 57             je              g00 #8f ~aeda
 aec5:  41 87 7a 53             je              g77 #7a ~aeda
 aec9:  b3 ...                  print_ret       "You can't reach the lock from here."
 aeda:  b2 ...                  print           "Can you unlock a grating with a "
 aee9:  aa 87                   print_obj       g77
 aeeb:  b3 ...                  print_ret       "?"
 aeee:  41 88 5c 4f             je              g78 #5c ~aeff
 aef2:  b3 ...                  print_ret       "You can't pick the lock."
 aeff:  c1 97 88 23 2b 00 64    je              g78 #23 #2b ~af68
 af06:  a0 3d 80 55             jz              g2d af5d
 af0a:  41 10 4a 49             je              g00 #4a ~af15
 af0e:  e8 3f 9c 49             push            s212
 af12:  8c 00 06                jump            af19
 af15:  e8 3f 9c 4d             push            s213
 af19:  e0 18 4a fd ae 00 91 11 00 
                               call            95fa #ae sp s090 -> sp
 af22:  0a ae 0b 75             test_attr       "grating" #0b ~af59
 af26:  41 10 4a ed             je              g00 #4a af55
 af2a:  a0 3e 6a                jz              g2e ~af55
 af2d:  b2 ...                  print           "A pile of leaves falls onto your head and to the ground."
 af4e:  bb                      new_line        
 af4f:  0d 3e 01                store           g2e #01
 af52:  2e 90 10                insert_obj      "pile of leaves" g00
 af55:  0b 39 14                set_attr        "Grating Room" #14
 af58:  b0                      rtrue           
 af59:  0c 39 14                clear_attr      "Grating Room" #14
 af5c:  b0                      rtrue           
 af5d:  b3 ...                  print_ret       "The grating is locked."
 af68:  41 88 12 40             je              g78 #12 ~rfalse
 af6c:  41 87 ae 40             je              g77 #ae ~rfalse
 af70:  51 86 0f 00             get_prop        g76 #0f -> sp
 af74:  43 00 14 51             jg              sp #14 ~af87
 af78:  b3 ...                  print_ret       "It won't fit through the grating."
 af87:  4e 86 39                insert_obj      g76 "Grating Room"
 af8a:  b2 ...                  print           "The "
 af8d:  aa 86                   print_obj       g76
 af8f:  b3 ...                  print_ret       " goes through the grating into the darkness below."

Routine afa6, 0 locals ()

 afa7:  b2 ...                  print           "You won't be able to get back up to the tunnel you are going through when it gets to the next room."
 afda:  bb                      new_line        
 afdb:  bb                      new_line        
 afdc:  41 10 45 44             je              g00 #45 ~afe2
 afe0:  9b 43                   ret             #43
 afe2:  41 10 3f 44             je              g00 #3f ~afe8
 afe6:  9b 42                   ret             #42
 afe8:  41 10 3c 44             je              g00 #3c ~afee
 afec:  9b 3a                   ret             #3a
 afee:  41 10 38 40             je              g00 #38 ~rfalse
 aff2:  9b a7                   ret             #a7

Routine aff4, 0 locals ()

 aff5:  41 88 5d 00 3f          je              g78 #5d ~b037
 affa:  26 6e 7f 40             jin             "sword" g6f ~rfalse
 affe:  b2 ...                  print           "As you touch the rusty knife, your sword gives a single pulse of blinding blue light."
 b035:  bb                      new_line        
 b036:  b1                      rfalse          
 b037:  41 87 80 46             je              g77 #80 ~b03f
 b03b:  41 88 13 cd             je              g78 #13 b04a
 b03f:  41 88 7e 40             je              g78 #7e ~rfalse
 b043:  41 86 80 40             je              g76 #80 ~rfalse
 b047:  a0 87 c0                jz              g77 rfalse
 b04a:  e0 1f 3c 5d 80 00       call            78ba #80 -> sp
 b050:  e0 0f 83 33 9c 59 00    call            10666 s214 -> sp
 b057:  b8                      ret_popped      

Routine b058, 0 locals ()

 b059:  41 88 5d 40             je              g78 #5d ~rfalse
 b05d:  0c ca 0e                clear_attr      "table" #0e
 b060:  b1                      rfalse          

Routine b062, 0 locals ()

 b063:  c1 95 88 58 6e 5d d0    je              g78 #58 #6e #5d b078
 b06a:  c1 95 88 54 69 65 c9    je              g78 #54 #69 #65 b078
 b071:  c1 95 88 48 46 13 40    je              g78 #48 #46 #13 ~rfalse
 b078:  b2 ...                  print           "A ghost appears in the room and is appalled at your desecration of the remains of a fellow adventurer. He casts a curse on your valuables and banishes them to the Land of the Living Dead. The ghost leaves, muttering obscenities."
 b0fb:  bb                      new_line        
 b0fc:  e0 25 81 dc 10 e6 64 00 call            103b8 g00 #e6 #64 -> sp
 b104:  e0 17 81 dc 04 e6 00    call            103b8 #04 #e6 -> sp
 b10b:  b0                      rtrue           

Routine b10c, 0 locals ()

 b10d:  41 88 38 51             je              g78 #38 ~b120
 b111:  b3 ...                  print_ret       "The torch is burning."
 b120:  41 88 61 5d             je              g78 #61 ~b13f
 b124:  41 87 68 59             je              g77 #68 ~b13f
 b128:  b3 ...                  print_ret       "The water evaporates before it gets close."
 b13f:  41 88 16 40             je              g78 #16 ~rfalse
 b143:  4a 86 14 40             test_attr       g76 #14 ~rfalse
 b147:  b3 ...                  print_ret       "You nearly burn your hand trying to extinguish the flame."

Routine b168, 1 local (0000)

 b16b:  41 01 03 40             je              local0 #03 ~rfalse
 b16f:  b2 ...                  print           "You are in a large square room with tall ceilings. On the south wall is an enormous mirror which fills the entire wall. There are exits on the other three sides of the room."
 b1c4:  bb                      new_line        
 b1c5:  a0 3c c0                jz              g2c rfalse
 b1c8:  b3 ...                  print_ret       "Unfortunately, the mirror has been destroyed by your recklessness."

Routine b1ec, 4 locals (0098, 0000, 0000, 0000)

 b1f5:  a0 3c 00 8f             jz              g2c ~b286
 b1f9:  41 88 6e 00 8a          je              g78 #6e ~b286
 b1fe:  a0 87 e8                jz              g77 b227
 b201:  41 87 01 e4             je              g77 #01 b227
 b205:  b2 ...                  print           "You feel a faint tingling transmitted through the "
 b222:  aa 87                   print_obj       g77
 b224:  b3 ...                  print_ret       "."
 b227:  61 10 01 45             je              g00 local0 ~b22e
 b22b:  0d 01 96                store           local0 #96
 b22e:  a2 10 02 c2             get_child       g00 -> local1 b232
 b232:  a2 01 03 c2             get_child       local0 -> local2 b236
 b236:  a0 02 45                jz              local1 ~b23c
 b239:  8c 00 0f                jump            b249
 b23c:  a1 02 04 c2             get_sibling     local1 -> local3 b240
 b240:  6e 02 01                insert_obj      local1 local0
 b243:  2d 02 04                store           local1 local3
 b246:  8c ff ef                jump            b236
 b249:  a0 03 45                jz              local2 ~b24f
 b24c:  8c 00 0f                jump            b25c
 b24f:  a1 03 04 c2             get_sibling     local2 -> local3 b253
 b253:  6e 03 10                insert_obj      local2 g00
 b256:  2d 03 04                store           local2 local3
 b259:  8c ff ef                jump            b249
 b25c:  e0 27 49 5b 01 00 00    call            92b6 local0 #00 -> sp
 b263:  b3 ...                  print_ret       "There is a rumble from deep within the earth and the room shakes."
 b286:  c1 97 88 38 39 7c       je              g78 #38 #39 ~b2c6
 b28c:  a0 3c dc                jz              g2c b2a9
 b28f:  b2 ...                  print           "The mirror is broken into many pieces."
 b2a6:  8c 00 1d                jump            b2c4
 b2a9:  b2 ...                  print           "There is an ugly person staring back at you."
 b2c4:  bb                      new_line        
 b2c5:  b0                      rtrue           
 b2c6:  41 88 5d 5f             je              g78 #5d ~b2e7
 b2ca:  b3 ...                  print_ret       "The mirror is many times your size. Give up."
 b2e7:  c1 95 88 13 7f 2a 40    je              g78 #13 #7f #2a ~rfalse
 b2ee:  a0 3c df                jz              g2c b30e
 b2f1:  b3 ...                  print_ret       "Haven't you done enough damage already?"
 b30e:  0d 3c 01                store           g2c #01
 b311:  0d 4c 00                store           g3c #00
 b314:  b3 ...                  print_ret       "You have broken the mirror. I hope you have a seven years' supply of good luck handy."

Routine b348, 1 local (0000)

 b34b:  41 01 03 40             je              local0 #03 ~rfalse
 b34f:  b2 ...                  print           "This is a large room with a prominent doorway leading to a down staircase. Above you is a large dome. Up around the edge of the dome (20 feet up) is a wooden railing. In the center of the room sits a white marble pedestal."
 b3d0:  bb                      new_line        
 b3d1:  a0 a3 c0                jz              g93 rfalse
 b3d4:  b3 ...                  print_ret       "A piece of rope descends from the railing above, ending some five feet above your head."

Routine b40c, 1 local (0000)

 b40f:  41 01 03 00 94          je              local0 #03 ~b4a6
 b414:  b2 ...                  print           "You are at the periphery of a large dome, which forms the ceiling of another room below. Protecting you from a precipitous drop is a wooden railing which circles the dome."
 b471:  bb                      new_line        
 b472:  a0 a3 c0                jz              g93 rfalse
 b475:  b3 ...                  print_ret       "Hanging down from the railing is a rope which ends about ten feet from the floor below."
 b4a6:  41 01 02 40             je              local0 #02 ~rfalse
 b4aa:  a0 4e 80 45             jz              g3e b4f1
 b4ae:  b2 ...                  print           "As you enter the dome you feel a strong pull as if from a wind drawing you over the railing and down."
 b4e9:  bb                      new_line        
 b4ea:  4e 7f 69                insert_obj      g6f "Torch Room"
 b4ed:  0d 10 69                store           g00 #69
 b4f0:  b0                      rtrue           
 b4f1:  41 88 45 40             je              g78 #45 ~rfalse
 b4f5:  e0 0f 83 33 9c 97 00    call            10666 s215 -> sp
 b4fc:  b8                      ret_popped      

Routine b4fe, 1 local (0000)

 b501:  41 01 03 00 d9          je              local0 #03 ~b5dd
 b506:  b2 ...                  print           "You are outside a large gateway, on which is inscribed^^  Abandon every hope all ye who enter here!^^The gate is open; through it you can see a desolation, with a pile of mangled bodies in one corner. Thousands of voices, lamenting some hideous fate, can be heard."
 b5a5:  bb                      new_line        
 b5a6:  a0 a1 40                jz              g91 ~rfalse
 b5a9:  a0 4e 40                jz              g3e ~rfalse
 b5ac:  b3 ...                  print_ret       "The way through the gate is barred by evil spirits, who jeer at your attempts to pass."
 b5dd:  41 01 01 02 06          je              local0 #01 ~b7e6
 b5e2:  41 88 3a 7b             je              g78 #3a ~b61f
 b5e6:  a0 a1 40                jz              g91 ~rfalse
 b5e9:  26 dd 7f 5d             jin             "brass bell" g6f ~b608
 b5ed:  26 d3 7f 59             jin             "black book" g6f ~b608
 b5f1:  26 93 7f 55             jin             "pair of candles" g6f ~b608
 b5f5:  b3 ...                  print_ret       "You must perform the ceremony."
 b608:  b3 ...                  print_ret       "You aren't equipped for an exorcism."
 b61f:  a0 a1 00 fb             jz              g91 ~b71c
 b623:  41 88 6d 00 f6          je              g78 #6d ~b71c
 b628:  41 86 dd 00 f1          je              g76 #dd ~b71c
 b62d:  0d 3a 01                store           g2a #01
 b630:  e0 1f 3c 5d dd 00       call            78ba #dd -> sp
 b636:  e0 1f 4a 98 db 00       call            9530 #db -> sp
 b63c:  2e db 10                insert_obj      "red hot brass bell" g00
 b63f:  b2 ...                  print           "The bell suddenly becomes red hot and falls to the ground. The wraiths, as if paralyzed, stop their jeering and slowly turn to face you. On their ashen faces, the expression of a long-forgotten terror takes shape."
 b6c6:  bb                      new_line        
 b6c7:  26 93 7f 78             jin             "pair of candles" g6f ~b701
 b6cb:  b2 ...                  print           "In your confusion, the candles drop to the ground (and they are out)."
 b6ee:  bb                      new_line        
 b6ef:  2e 93 10                insert_obj      "pair of candles" g00
 b6f2:  0c 93 14                clear_attr      "pair of candles" #14
 b6f5:  e0 0f 2a 43 6f 6a 00    call            5486 #6f6a -> sp
 b6fc:  e1 97 00 00 00          storew          sp #00 #00
 b701:  e0 07 2a 39 5c 3e 06 00 call            5472 #5c3e #06 -> sp
 b709:  e1 97 00 00 01          storew          sp #00 #01
 b70e:  e0 07 2a 39 5c 72 14 00 call            5472 #5c72 #14 -> sp
 b716:  e1 97 00 00 01          storew          sp #00 #01
 b71b:  b0                      rtrue           
 b71c:  a0 39 c0                jz              g29 rfalse
 b71f:  41 88 53 40             je              g78 #53 ~rfalse
 b723:  41 86 d3 40             je              g76 #d3 ~rfalse
 b727:  a0 a1 40                jz              g91 ~rfalse
 b72a:  b2 ...                  print           "Each word of the prayer reverberates through the hall in a deafening confusion. As the last word fades, a voice, loud and commanding, speaks: ~Begone, fiends!~ A heart-stopping scream fills the cavern, and the spirits, sensing a greater power, flee through the walls."
 b7cf:  bb                      new_line        
 b7d0:  e0 1f 3c 5d e9 00       call            78ba #e9 -> sp
 b7d6:  0d a1 01                store           g91 #01
 b7d9:  e0 0f 2a 43 5c 6d 00    call            5486 #5c6d -> sp
 b7e0:  e1 97 00 00 00          storew          sp #00 #00
 b7e5:  b0                      rtrue           
 b7e6:  41 01 06 40             je              local0 #06 ~rfalse
 b7ea:  a0 3a c0                jz              g2a rfalse
 b7ed:  26 93 7f 40             jin             "pair of candles" g6f ~rfalse
 b7f1:  0a 93 14 40             test_attr       "pair of candles" #14 ~rfalse
 b7f5:  a0 39 40                jz              g29 ~rfalse
 b7f8:  0d 39 01                store           g29 #01
 b7fb:  b2 ...                  print           "The flames flicker wildly and appear to dance. The earth beneath your feet trembles, and your legs nearly buckle beneath you. The spirits cower at your unearthly power."
 b860:  bb                      new_line        
 b861:  e0 0f 2a 43 5c 3e 00    call            5486 #5c3e -> sp
 b868:  e1 97 00 00 00          storew          sp #00 #00
 b86d:  e0 07 2a 39 5c 6d 03 00 call            5472 #5c6d #03 -> sp
 b875:  e1 97 00 00 01          storew          sp #00 #01
 b87a:  b0                      rtrue           

Routine b87c, 0 locals ()

 b87d:  a0 39 00 55             jz              g29 ~b8d4
 b881:  41 10 e8 00 50          je              g00 #e8 ~b8d4
 b886:  b2 ...                  print           "The tension of this ceremony is broken, and the wraiths, amused but shaken at your clumsy attempt, resume their hideous jeering."
 b8d3:  bb                      new_line        
 b8d4:  0d 3a 00                store           g2a #00
 b8d7:  ab 3a                   ret             g2a

Routine b8da, 0 locals ()

 b8db:  0d 39 00                store           g29 #00
 b8de:  e0 3f 5c 3e 00          call            b87c -> sp
 b8e3:  b8                      ret_popped      

Routine b8e4, 0 locals ()

 b8e5:  e0 1f 3c 5d db 00       call            78ba #db -> sp
 b8eb:  0e dd e8                insert_obj      "brass bell" "Entrance to Hades"
 b8ee:  41 10 e8 40             je              g00 #e8 ~rfalse
 b8f2:  b3 ...                  print_ret       "The bell appears to have cooled down."

Routine b906, 1 local (0000)

 b909:  41 01 03 40             je              local0 #03 ~rfalse
 b90d:  b2 ...                  print           "You are standing on the top of the Flood Control Dam #3, which was quite a tourist attraction in times far distant. There are paths to the north, south, and west, and a scramble down."
 b97a:  bb                      new_line        
 b97b:  a0 a0 80 49             jz              g90 b9c6
 b97f:  a0 37 80 45             jz              g27 b9c6
 b983:  b2 ...                  print           "The water level behind the dam is low: The sluice gates have been opened. Water rushes through the dam and downstream."
 b9c2:  bb                      new_line        
 b9c3:  8c 00 ce                jump            ba92
 b9c6:  a0 37 fb                jz              g27 ba02
 b9c9:  b2 ...                  print           "The sluice gates are open, and water rushes through the dam. The water level behind the dam is still high."
 b9fe:  bb                      new_line        
 b9ff:  8c 00 92                jump            ba92
 ba02:  a0 a0 fb                jz              g90 ba3e
 ba05:  b2 ...                  print           "The sluice gates are closed. The water level in the reservoir is quite low, but the level is rising quickly."
 ba3a:  bb                      new_line        
 ba3b:  8c 00 56                jump            ba92
 ba3e:  b2 ...                  print           "The sluice gates on the dam are closed. Behind the dam, there can be seen a wide reservoir. Water is pouring over the top of the now abandoned dam."
 ba91:  bb                      new_line        
 ba92:  b2 ...                  print           "There is a control panel here, on which a large metal bolt is mounted. Directly above the bolt is a small green plastic bubble"
 bad9:  a0 38 d1                jz              g28 baeb
 badc:  b2 ...                  print           " which is glowing serenely"
 baeb:  b3 ...                  print_ret       "."

Routine baee, 0 locals ()

 baef:  41 88 59 00 c8          je              g78 #59 ~bbba
 baf4:  41 87 5b 00 9d          je              g77 #5b ~bb94
 baf9:  a0 38 80 82             jz              g28 bb7d
 bafd:  0c 32 03                clear_attr      "Reservoir South" #03
 bb00:  a0 37 80 46             jz              g27 bb48
 bb04:  0d 37 00                store           g27 #00
 bb07:  0c 8a 03                clear_attr      "Loud Room" #03
 bb0a:  b2 ...                  print           "The sluice gates close and water starts to collect behind the dam."
 bb31:  bb                      new_line        
 bb32:  e0 07 2a 39 5e 14 08 00 call            5472 #5e14 #08 -> sp
 bb3a:  e1 97 00 00 01          storew          sp #00 #01
 bb3f:  e0 07 2a 39 5e 94 00 00 call            5472 #5e94 #00 -> sp
 bb47:  b0                      rtrue           
 bb48:  0d 37 01                store           g27 #01
 bb4b:  b2 ...                  print           "The sluice gates open and water pours through the dam."
 bb66:  bb                      new_line        
 bb67:  e0 07 2a 39 5e 94 08 00 call            5472 #5e94 #08 -> sp
 bb6f:  e1 97 00 00 01          storew          sp #00 #01
 bb74:  e0 07 2a 39 5e 14 00 00 call            5472 #5e14 #00 -> sp
 bb7c:  b0                      rtrue           
 bb7d:  b3 ...                  print_ret       "The bolt won't turn with your best effort."
 bb94:  a0 87 d8                jz              g77 bbad
 bb97:  b2 ...                  print           "The bolt won't turn using the "
 bba8:  aa 87                   print_obj       g77
 bbaa:  b3 ...                  print_ret       "."
 bbad:  b3 ...                  print_ret       "You can't with your bare hands."
 bbba:  41 88 5d 48             je              g78 #5d ~bbc4
 bbbe:  e0 3f 5e 06 00          call            bc0c -> sp
 bbc3:  b8                      ret_popped      
 bbc4:  41 88 55 40             je              g78 #55 ~rfalse
 bbc8:  b3 ...                  print_ret       "Hmm. It appears the tube contained glue, not oil. Turning the bolt won't get any easier...."

Routine bc00, 0 locals ()

 bc01:  41 88 5d 40             je              g78 #5d ~rfalse
 bc05:  e0 3f 5e 06 00          call            bc0c -> sp
 bc0a:  b8                      ret_popped      

Routine bc0c, 0 locals ()

 bc0d:  b3 ...                  print_ret       "It is an integral part of the control panel."

Routine bc28, 0 locals ()

 bc29:  0b 64 04                set_attr        "Reservoir" #04
 bc2c:  0c 64 06                clear_attr      "Reservoir" #06
 bc2f:  0c 28 03                clear_attr      "Deep Canyon" #03
 bc32:  0c 8a 03                clear_attr      "Loud Room" #03
 bc35:  06 65 64 45             jin             "trunk of jewels" "Reservoir" ~bc3c
 bc39:  0b 65 07                set_attr        "trunk of jewels" #07
 bc3c:  0d a0 00                store           g90 #00
 bc3f:  41 10 64 7c             je              g00 #64 ~bc7d
 bc43:  a3 7f 00                get_parent      g6f -> sp
 bc46:  4a 00 1b 6d             test_attr       sp #1b ~bc75
 bc4a:  b3 ...                  print_ret       "The boat lifts gently out of the mud and is now floating on the reservoir."
 bc75:  e0 0f 83 33 9c a7 00    call            10666 s216 -> sp
 bc7c:  b0                      rtrue           
 bc7d:  41 10 28 69             je              g00 #28 ~bca8
 bc81:  b3 ...                  print_ret       "A sound, like that of flowing water, starts to come from below."
 bca8:  41 10 8a 00 51          je              g00 #8a ~bcfc
 bcad:  b2 ...                  print           "All of a sudden, an alarmingly loud roaring sound fills the room. Filled with fear, you scramble away."
 bcee:  bb                      new_line        
 bcef:  e0 2f 27 36 36 00       call            4e6c g26 -> sp
 bcf5:  e0 2f 49 5b 00 00       call            92b6 sp -> sp
 bcfb:  b0                      rtrue           
 bcfc:  c1 97 10 ac 32 41       je              g00 #ac #32 ~rtrue
 bd02:  b3 ...                  print_ret       "You notice that the water level has risen to the point that it is impossible to cross."

Routine bd28, 0 locals ()

 bd29:  0b 64 06                set_attr        "Reservoir" #06
 bd2c:  0c 64 04                clear_attr      "Reservoir" #04
 bd2f:  0c 28 03                clear_attr      "Deep Canyon" #03
 bd32:  0c 8a 03                clear_attr      "Loud Room" #03
 bd35:  0c 65 07                clear_attr      "trunk of jewels" #07
 bd38:  0d a0 01                store           g90 #01
 bd3b:  41 10 64 00 40          je              g00 #64 ~bd7e
 bd40:  a3 7f 00                get_parent      g6f -> sp
 bd43:  4a 00 1b 79             test_attr       sp #1b ~bd7e
 bd47:  b3 ...                  print_ret       "The water level has dropped to the point at which the boat can no longer stay afloat. It sinks into the mud."
 bd7e:  41 10 28 5b             je              g00 #28 ~bd9b
 bd82:  b3 ...                  print_ret       "The roar of rushing water is quieter now."
 bd9b:  c1 97 10 ac 32 41       je              g00 #ac #32 ~rtrue
 bda1:  b3 ...                  print_ret       "The water level is now quite low here and you could easily cross over to the other side."

Routine bdcc, 0 locals ()

 bdcd:  41 88 53 53             je              g78 #53 ~bde2
 bdd1:  b3 ...                  print_ret       "They're greek to you."
 bde2:  41 88 65 40             je              g78 #65 ~rfalse
 bde6:  41 86 c3 00 76          je              g76 #c3 ~be5f
 bdeb:  a0 34 00 5f             jz              g24 ~be4c
 bdef:  0c 9f 07                clear_attr      "leak" #07
 bdf2:  b2 ...                  print           "There is a rumbling sound and a stream of water appears to burst from the east wall of the room (apparently, a leak has occurred in a pipe)."
 be39:  bb                      new_line        
 be3a:  0d 34 01                store           g24 #01
 be3d:  e0 03 2a 39 5f 89 ff ff 00 
                               call            5472 #5f89 #ffff -> sp
 be46:  e1 97 00 00 01          storew          sp #00 #01
 be4b:  b0                      rtrue           
 be4c:  b3 ...                  print_ret       "The blue button appears to be jammed."
 be5f:  41 86 c4 6b             je              g76 #c4 ~be8c
 be63:  b2 ...                  print           "The lights within the room "
 be72:  4a 10 14 4e             test_attr       g00 #14 ~be82
 be76:  4c 10 14                clear_attr      g00 #14
 be79:  b3 ...                  print_ret       "shut off."
 be82:  4b 10 14                set_attr        g00 #14
 be85:  b3 ...                  print_ret       "come on."
 be8c:  41 86 c5 4f             je              g76 #c5 ~be9d
 be90:  0c d7 03                clear_attr      "Dam" #03
 be93:  0d 38 00                store           g28 #00
 be96:  b3 ...                  print_ret       "Click."
 be9d:  41 86 c6 40             je              g76 #c6 ~rfalse
 bea1:  0c d7 03                clear_attr      "Dam" #03
 bea4:  0d 38 01                store           g28 #01
 bea7:  b3 ...                  print_ret       "Click."

Routine beae, 0 locals ()

 beaf:  41 88 38 53             je              g78 #38 ~bec4
 beb3:  b3 ...                  print_ret       "The chests are all empty."
 bec4:  c1 95 88 12 2b 5d 75    je              g78 #12 #2b #5d ~befe
 becb:  e0 1f 3c 5d c8 00       call            78ba #c8 -> sp
 bed1:  b3 ...                  print_ret       "The chests are so rusty and corroded that they crumble when you touch them."
 befe:  41 88 2b 40             je              g78 #2b ~rfalse
 bf02:  b3 ...                  print_ret       "The chests are already open."

Routine bf12, 1 local (0000)

 bf15:  41 10 c7 c8             je              g00 #c7 bf1f
 bf19:  e8 7f 00                push            #00
 bf1c:  8c 00 05                jump            bf22
 bf1f:  e8 7f 01                push            #01
 bf22:  2d 01 00                store           local0 sp
 bf25:  a0 01 d8                jz              local0 bf3e
 bf28:  b2 ...                  print           "The water level here is now "
 bf33:  57 34 02 00             div             g24 #02 -> sp
 bf37:  6f 35 00 00             loadw           g25 sp -> sp
 bf3b:  ad 00                   print_paddr     sp
 bf3d:  bb                      new_line        
 bf3e:  95 34                   inc             g24
 bf40:  42 34 0e dd             jl              g24 #0e bf5f
 bf44:  e0 13 4a 91 c7 9d 34 00 call            9522 #c7 s226 -> sp
 bf4c:  e0 07 2a 39 5f 89 00 00 call            5472 #5f89 #00 -> sp
 bf54:  a0 01 c1                jz              local0 rtrue
 bf57:  e0 0f 83 33 9d 3f 00    call            10666 s227 -> sp
 bf5e:  b0                      rtrue           
 bf5f:  46 7f 9c 41             jin             g6f "magic boat" ~rtrue
 bf63:  c1 95 10 c7 d7 9a 41    je              g00 #c7 #d7 #9a ~rtrue
 bf6a:  e0 0f 83 33 9d 4d 00    call            10666 s228 -> sp
 bf71:  b0                      rtrue           

Routine bf72, 0 locals ()

 bf73:  43 34 00 40             jg              g24 #00 ~rfalse
 bf77:  c1 97 88 32 12 4c       je              g78 #32 #12 ~bf87
 bf7d:  41 86 62 48             je              g76 #62 ~bf87
 bf81:  e0 3f 5f ce 00          call            bf9c -> sp
 bf86:  b8                      ret_popped      
 bf87:  41 88 5f 40             je              g78 #5f ~rfalse
 bf8b:  41 87 62 48             je              g77 #62 ~bf95
 bf8f:  e0 3f 5f ce 00          call            bf9c -> sp
 bf94:  b8                      ret_popped      
 bf95:  e0 2f 60 7f 87 00       call            c0fe g77 -> sp
 bf9b:  b8                      ret_popped      

Routine bf9c, 0 locals ()

 bf9d:  cd 4f 34 ff ff          store           g24 #ffff
 bfa2:  e0 07 2a 39 5f 89 00 00 call            5472 #5f89 #00 -> sp
 bfaa:  b3 ...                  print_ret       "By some miracle of Zorkian technology, you have managed to stop the leak in the dam."

Routine bfde, 0 locals ()

 bfdf:  41 88 55 46             je              g78 #55 ~bfe7
 bfe3:  41 87 62 ca             je              g77 #62 bfef
 bfe7:  41 88 12 40             je              g78 #12 ~rfalse
 bfeb:  41 86 62 40             je              g76 #62 ~rfalse
 bfef:  b3 ...                  print_ret       "The all-purpose gunk isn't a lubricant."

Routine c00c, 0 locals ()

 c00d:  41 88 12 5d             je              g78 #12 ~c02c
 c011:  41 87 63 59             je              g77 #63 ~c02c
 c015:  b3 ...                  print_ret       "The tube refuses to accept anything."
 c02c:  41 88 79 40             je              g78 #79 ~rfalse
 c030:  4a 86 0b 62             test_attr       g76 #0b ~c054
 c034:  26 62 86 5e             jin             "viscous material" g76 ~c054
 c038:  2e 62 7f                insert_obj      "viscous material" g6f
 c03b:  b3 ...                  print_ret       "The viscous material oozes into your hand."
 c054:  4a 86 0b 55             test_attr       g76 #0b ~c06b
 c058:  b3 ...                  print_ret       "The tube is apparently empty."
 c06b:  b3 ...                  print_ret       "The tube is closed."

Routine c074, 0 locals ()

 c075:  c1 97 88 23 2b 5b       je              g78 #23 #2b ~c094
 c07b:  b3 ...                  print_ret       "Sounds reasonable, but this isn't how."
 c094:  41 88 5f 40             je              g78 #5f ~rfalse
 c098:  41 87 01 6b             je              g77 #01 ~c0c5
 c09c:  b3 ...                  print_ret       "Are you the little Dutch boy, then? Sorry, this is a big dam."
 c0c5:  b2 ...                  print           "With a "
 c0cc:  aa 87                   print_obj       g77
 c0ce:  b3 ...                  print_ret       "? Do you know how big this dam is? You could only stop a tiny leak with that."

Routine c0fe, 1 local (0000)

 c101:  b2 ...                  print           "With a "
 c108:  aa 01                   print_obj       local0
 c10a:  b3 ...                  print_ret       "?"

Routine c10e, 1 local (0000)

 c111:  41 01 03 40             je              local0 #03 ~rfalse
 c115:  a0 a0 80 60             jz              g90 c177
 c119:  a0 37 80 5c             jz              g27 c177
 c11d:  b2 ...                  print           "You are in a long room, to the north of which was formerly a lake. However, with the water level lowered, there is merely a wide stream running through the center of the room."
 c174:  8c 01 2f                jump            c2a4
 c177:  a0 37 80 78             jz              g27 c1f1
 c17b:  b2 ...                  print           "You are in a long room. To the north is a large lake, too deep to cross. You notice, however, that the water level appears to be dropping at a rapid rate. Before long, it might be possible to cross to the other side from here."
 c1ee:  8c 00 b5                jump            c2a4
 c1f1:  a0 a0 80 80             jz              g90 c273
 c1f5:  b2 ...                  print           "You are in a long room, to the north of which is a wide area which was formerly a reservoir, but now is merely a stream. You notice, however, that the level of the stream is rising quickly and that before long it will be impossible to cross here."
 c270:  8c 00 33                jump            c2a4
 c273:  b2 ...                  print           "You are in a long room on the south shore of a large lake, far too deep and wide for crossing."
 c2a4:  bb                      new_line        
 c2a5:  b3 ...                  print_ret       "There is a path along the stream to the east or west, a steep pathway climbing southwest along the edge of a chasm, and a path leading into a canyon to the southeast."

Routine c2fc, 1 local (0000)

 c2ff:  41 01 06 00 5b          je              local0 #06 ~c35d
 c304:  a3 7f 00                get_parent      g6f -> sp
 c307:  4a 00 1b 80 53          test_attr       sp #1b c35d
 c30c:  a0 37 00 4f             jz              g27 ~c35d
 c310:  a0 a0 80 4b             jz              g90 c35d
 c314:  b3 ...                  print_ret       "You notice that the water level here is rising rapidly. The currents are also becoming stronger. Staying here seems quite perilous!"
 c35d:  41 01 03 40             je              local0 #03 ~rfalse
 c361:  a0 a0 fe                jz              g90 c3a0
 c364:  b2 ...                  print           "You are on what used to be a large lake, but which is now a large mud pile. There are ~shores~ to the north and south."
 c39d:  8c 00 59                jump            c3f7
 c3a0:  b2 ...                  print           "You are on the lake. Beaches can be seen north and south. Upstream a small stream enters the lake through a narrow cleft in the rocks. The dam can be seen downstream."
 c3f7:  bb                      new_line        
 c3f8:  b0                      rtrue           

Routine c3fa, 1 local (0000)

 c3fd:  41 01 03 40             je              local0 #03 ~rfalse
 c401:  a0 a0 80 5a             jz              g90 c45d
 c405:  a0 37 80 56             jz              g27 c45d
 c409:  b2 ...                  print           "You are in a large cavernous room, the south of which was formerly a lake. However, with the water level lowered, there is merely a wide stream running through there."
 c45a:  8c 00 c0                jump            c51b
 c45d:  a0 37 fe                jz              g27 c49c
 c460:  b2 ...                  print           "You are in a large cavernous area. To the south is a wide lake, whose water level appears to be falling rapidly."
 c499:  8c 00 81                jump            c51b
 c49c:  a0 a0 80 62             jz              g90 c500
 c4a0:  b2 ...                  print           "You are in a cavernous area, to the south of which is a very wide stream. The level of the stream is rising rapidly, and it appears that before long it will be impossible to cross to the other side."
 c4fd:  8c 00 1d                jump            c51b
 c500:  b2 ...                  print           "You are in a large cavernous room, north of a large lake."
 c51b:  bb                      new_line        
 c51c:  b3 ...                  print_ret       "There is a slimy stairway leaving the room to the north."

Routine c53c, 1 local (0000)

 c53f:  41 88 7f 6c             je              g78 #7f ~c56d
 c543:  41 86 ec 68             je              g76 #ec ~c56d
 c547:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 c54d:  0d 01 01                store           local0 #01
 c550:  b2 ...                  print           "The bottle hits the far wall and shatters."
 c569:  bb                      new_line        
 c56a:  8c 00 3f                jump            c5aa
 c56d:  41 88 2a 6c             je              g78 #2a ~c59b
 c571:  0d 01 01                store           local0 #01
 c574:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 c57a:  b2 ...                  print           "A brilliant maneuver destroys the bottle."
 c597:  bb                      new_line        
 c598:  8c 00 11                jump            c5aa
 c59b:  41 88 73 4d             je              g78 #73 ~c5aa
 c59f:  4a 86 0b 49             test_attr       g76 #0b ~c5aa
 c5a3:  26 ed 86 45             jin             "quantity of water" g76 ~c5aa
 c5a7:  0d 01 01                store           local0 #01
 c5aa:  a0 01 e7                jz              local0 c5d2
 c5ad:  26 ed 86 63             jin             "quantity of water" g76 ~c5d2
 c5b1:  b2 ...                  print           "The water spills to the floor and evaporates."
 c5ca:  bb                      new_line        
 c5cb:  e0 1f 3c 5d ed 00       call            78ba #ed -> sp
 c5d1:  b0                      rtrue           
 c5d2:  a0 01 c0                jz              local0 rfalse
 c5d5:  b0                      rtrue           

Routine c5d6, 1 local (0000)

 c5d9:  2d 01 33                store           local0 g23
 c5dc:  41 7f ba 00 4f          je              g6f #ba ~c62e
 c5e1:  a0 a5 e1                jz              g95 c603
 c5e4:  b3 ...                  print_ret       "No use talking to him. He's fast asleep."
 c603:  41 88 5b 4c             je              g78 #5b ~c611
 c607:  0d 7f 04                store           g6f #04
 c60a:  e0 1f 2b be 5b 00       call            577c #5b -> sp
 c610:  b0                      rtrue           
 c611:  b3 ...                  print_ret       "The cyclops prefers eating to making conversation."
 c62e:  a0 a5 80 6d             jz              g95 c69d
 c632:  41 88 38 65             je              g78 #38 ~c659
 c636:  b3 ...                  print_ret       "The cyclops is sleeping like a baby, albeit a very ugly one."
 c659:  c1 95 88 13 46 88 c8    je              g78 #13 #46 #88 c666
 c660:  c1 97 88 2a 1c 40       je              g78 #2a #1c ~rfalse
 c666:  b2 ...                  print           "The cyclops yawns and stares at the thing that woke him up."
 c687:  bb                      new_line        
 c688:  0d a5 00                store           g95 #00
 c68b:  0b ba 02                set_attr        "cyclops" #02
 c68e:  42 01 00 48             jl              local0 #00 ~c698
 c692:  35 00 01 33             sub             #00 local0 -> g23
 c696:  ab 33                   ret             g23
 c698:  2d 33 01                store           g23 local0
 c69b:  ab 33                   ret             g23
 c69d:  41 88 38 61             je              g78 #38 ~c6c0
 c6a1:  b3 ...                  print_ret       "A hungry cyclops is standing at the foot of the stairs."
 c6c0:  41 88 3f 01 ae          je              g78 #3f ~c871
 c6c5:  41 87 ba 01 a9          je              g77 #ba ~c871
 c6ca:  41 86 e1 00 a4          je              g76 #e1 ~c771
 c6cf:  42 01 00 80 90          jl              local0 #00 c762
 c6d4:  e0 1f 3c 5d e1 00       call            78ba #e1 -> sp
 c6da:  b2 ...                  print           "The cyclops says ~Mmm Mmm. I love hot peppers! But oh, could I use a drink. Perhaps I could drink the blood of that thing.~  From the gleam in his eye, it could be surmised that you are ~that thing~."
 c755:  bb                      new_line        
 c756:  35 00 01 00             sub             #00 local0 -> sp
 c75a:  e0 0b 6f a4 ff ff 00 33 call            df48 #ffff sp -> g23
 c762:  e0 03 2a 39 64 9f ff ff 00 
                               call            5472 #649f #ffff -> sp
 c76b:  e1 97 00 00 01          storew          sp #00 #01
 c770:  b0                      rtrue           
 c771:  41 86 ed cc             je              g76 #ed c77f
 c775:  41 86 ec 00 c3          je              g76 #ec ~c83b
 c77a:  06 ed ec 00 be          jin             "quantity of water" "glass bottle" ~c83b
 c77f:  42 01 00 00 92          jl              local0 #00 ~c814
 c784:  e0 1f 3c 5d ed 00       call            78ba #ed -> sp
 c78a:  2e ec 10                insert_obj      "glass bottle" g00
 c78d:  0b ec 0b                set_attr        "glass bottle" #0b
 c790:  0c ba 02                clear_attr      "cyclops" #02
 c793:  b2 ...                  print           "The cyclops takes the bottle, checks that it's open, and drinks the water. A moment later, he lets out a yawn that nearly blows you over, and then falls fast asleep (what did you put in that drink, anyway?)."
 c80e:  bb                      new_line        
 c80f:  0d a5 01                store           g95 #01
 c812:  ab a5                   ret             g95
 c814:  b3 ...                  print_ret       "The cyclops apparently is not thirsty and refuses your generous offer."
 c83b:  41 86 bd 59             je              g76 #bd ~c856
 c83f:  b3 ...                  print_ret       "The cyclops may be hungry, but there is a limit."
 c856:  b3 ...                  print_ret       "The cyclops is not so stupid as to eat THAT!"
 c871:  c1 95 88 2a 13 7f 00 6d je              g78 #2a #13 #7f ~c8e4
 c879:  e0 03 2a 39 64 9f ff ff 00 
                               call            5472 #649f #ffff -> sp
 c882:  e1 97 00 00 01          storew          sp #00 #01
 c887:  41 88 2a 6f             je              g78 #2a ~c8b8
 c88b:  b3 ...                  print_ret       "~Do you think I'm as stupid as my father was?~, he says, dodging."
 c8b8:  b2 ...                  print           "The cyclops shrugs but otherwise ignores your pitiful attempt."
 c8db:  bb                      new_line        
 c8dc:  41 88 7f 41             je              g78 #7f ~rtrue
 c8e0:  6e 86 10                insert_obj      g76 g00
 c8e3:  b0                      rtrue           
 c8e4:  41 88 5d 5b             je              g78 #5d ~c901
 c8e8:  b3 ...                  print_ret       "The cyclops doesn't take kindly to being grabbed."
 c901:  41 88 82 61             je              g78 #82 ~c924
 c905:  b3 ...                  print_ret       "You cannot tie the cyclops, though he is fit to be tied."
 c924:  41 88 4d 40             je              g78 #4d ~rfalse
 c928:  b3 ...                  print_ret       "You can hear his stomach rumbling."

Routine c93e, 0 locals ()

 c93f:  a0 a5 41                jz              g95 ~rtrue
 c942:  a0 4e 41                jz              g3e ~rtrue
 c945:  41 10 b9 cf             je              g00 #b9 c956
 c949:  e0 0f 2a 43 64 9f 00    call            5486 #649f -> sp
 c950:  e1 97 00 00 00          storew          sp #00 #00
 c955:  b0                      rtrue           
 c956:  42 33 00 49             jl              g23 #00 ~c961
 c95a:  35 00 33 00             sub             #00 g23 -> sp
 c95e:  8c 00 05                jump            c964
 c961:  e8 bf 33                push            g23
 c964:  43 00 05 56             jg              sp #05 ~c97c
 c968:  e0 0f 2a 43 64 9f 00    call            5486 #649f -> sp
 c96f:  e1 97 00 00 00          storew          sp #00 #00
 c974:  e0 0f 83 33 9d 66 00    call            10666 s229 -> sp
 c97b:  b8                      ret_popped      
 c97c:  42 33 00 47             jl              g23 #00 ~c985
 c980:  96 33                   dec             g23
 c982:  8c 00 04                jump            c987
 c985:  95 33                   inc             g23
 c987:  a0 a5 40                jz              g95 ~rfalse
 c98a:  42 33 00 49             jl              g23 #00 ~c995
 c98e:  35 00 33 00             sub             #00 g23 -> sp
 c992:  8c 00 05                jump            c998
 c995:  e8 bf 33                push            g23
 c998:  55 00 01 00             sub             sp #01 -> sp
 c99c:  6f 32 00 00             loadw           g22 sp -> sp
 c9a0:  ad 00                   print_paddr     sp
 c9a2:  bb                      new_line        
 c9a3:  b0                      rtrue           

Routine c9a4, 1 local (0000)

 c9a7:  41 01 03 01 a7          je              local0 #03 ~cb51
 c9ac:  b2 ...                  print           "This room has an exit on the northwest, and a staircase leading up."
 c9c9:  bb                      new_line        
 c9ca:  a0 a5 e6                jz              g95 c9f1
 c9cd:  a0 9f 63                jz              g8f ~c9f1
 c9d0:  b3 ...                  print_ret       "The cyclops is sleeping blissfully at the foot of the stairs."
 c9f1:  a0 9f ef                jz              g8f ca21
 c9f4:  b3 ...                  print_ret       "The east wall, previously solid, now has a cyclops-sized opening in it."
 ca21:  a0 33 00 8b             jz              g23 ~caae
 ca25:  b3 ...                  print_ret       "A cyclops, who looks prepared to eat horses (much less mere adventurers), blocks the staircase. From his state of health, and the bloodstains on the walls, you gather that he is not very friendly, though he likes people."
 caae:  43 33 00 00 53          jg              g23 #00 ~cb04
 cab3:  b3 ...                  print_ret       "The cyclops is standing in the corner, eyeing you closely. I don't think he likes you very much. He looks extremely hungry, even for a cyclops."
 cb04:  42 33 00 40             jl              g23 #00 ~rfalse
 cb08:  b3 ...                  print_ret       "The cyclops, having eaten the hot peppers, appears to be gasping. His enflamed tongue protrudes from his man-sized mouth."
 cb51:  41 01 02 40             je              local0 #02 ~rfalse
 cb55:  a0 33 c1                jz              g23 rtrue
 cb58:  e0 0f 2a 43 64 9f 00    call            5486 #649f -> sp
 cb5f:  e1 97 00 00 01          storew          sp #00 #01
 cb64:  b0                      rtrue           

Routine cb66, 2 locals (0000, 0000)

 cb6b:  41 01 03 00 c3          je              local0 #03 ~cc31
 cb70:  b2 ...                  print           "This is a large room with a ceiling which cannot be detected from the ground. There is a narrow passage from east to west and a stone stairway leading upward."
 cbb3:  a0 31 48                jz              g21 ~cbbc
 cbb6:  a0 37 5f                jz              g27 ~cbd6
 cbb9:  a0 a0 dc                jz              g90 cbd6
 cbbc:  b2 ...                  print           " The room is eerie in its quietness."
 cbd3:  8c 00 5b                jump            cc2f
 cbd6:  b2 ...                  print           " The room is deafeningly loud with an undetermined rushing sound. The sound seems to reverberate from all of the walls, making it difficult even to think."
 cc2f:  bb                      new_line        
 cc30:  b0                      rtrue           
 cc31:  41 01 06 00 88          je              local0 #06 ~ccbc
 cc36:  a0 37 80 84             jz              g27 ccbc
 cc3a:  a0 a0 00 80             jz              g90 ~ccbc
 cc3e:  b2 ...                  print           "It is unbearably loud here, with an ear-splitting roar seeming to come from all around you. There is a pounding in your head which won't stop. With a tremendous effort, you scramble out of the room."
 ccad:  bb                      new_line        
 ccae:  bb                      new_line        
 ccaf:  e0 2f 27 36 36 00       call            4e6c g26 -> sp
 ccb5:  e0 2f 49 5b 00 00       call            92b6 sp -> sp
 ccbb:  b1                      rfalse          
 ccbc:  41 01 02 40             je              local0 #02 ~rfalse
 ccc0:  a0 31 40                jz              g21 ~rfalse
 ccc3:  a0 37 45                jz              g27 ~ccc9
 ccc6:  a0 a0 40                jz              g90 ~rfalse
 ccc9:  a0 37 c5                jz              g27 cccf
 cccc:  a0 a0 c0                jz              g90 rfalse
 cccf:  e0 3f 46 44 00          call            8c88 -> sp
 ccd4:  a0 7c e5                jz              g6c ccfa
 ccd7:  b2 ...                  print           "The rest of your commands have been lost in the noise."
 ccf6:  bb                      new_line        
 ccf7:  0d 7c 00                store           g6c #00
 ccfa:  bb                      new_line        
 ccfb:  b2 ...                  print           ">"
 cd00:  e4 af 7d 7e             read            g6d g6e
 cd04:  50 7e 01 00             loadb           g6e #01 -> sp
 cd08:  a0 00 53                jz              sp ~cd1c
 cd0b:  b2 ...                  print           "I beg your pardon?"
 cd18:  bb                      new_line        
 cd19:  8c ff e0                jump            ccfa
 cd1c:  4f 7e 01 02             loadw           g6e #01 -> local1
 cd20:  c1 80 02 42 36 4d 5e 48 e2 49 
                               je              local1 "go" "walk" "run" ~cd31
 cd2a:  4f 7e 03 02             loadw           g6e #03 -> local1
 cd2e:  8c 00 0c                jump            cd3b
 cd31:  c1 8f 02 49 21 46       je              local1 "say" ~cd3b
 cd37:  4f 7e 05 02             loadw           g6e #05 -> local1
 cd3b:  c1 8f 02 49 1a 4a       je              local1 "save" ~cd49
 cd41:  e0 3f 37 34 00          call            6e68 -> sp
 cd46:  8c ff b3                jump            ccfa
 cd49:  c1 8f 02 48 9c 4a       je              local1 "restor" ~cd57
 cd4f:  e0 3f 37 29 00          call            6e52 -> sp
 cd54:  8c ff a5                jump            ccfa
 cd57:  c1 83 02 48 02 48 10 4a je              local1 "q" "quit" ~cd67
 cd5f:  e0 3f 36 e6 00          call            6dcc -> sp
 cd64:  8c ff 95                jump            ccfa
 cd67:  c1 83 02 4d 42 4d 88 4a je              local1 "w" "west" ~cd77
 cd6f:  e0 1f 49 5b 6b 00       call            92b6 #6b -> sp
 cd75:  ab 00                   ret             sp
 cd77:  c1 83 02 3f ea 3f f1 4a je              local1 "e" "east" ~cd87
 cd7f:  e0 1f 49 5b 27 00       call            92b6 #27 -> sp
 cd85:  ab 00                   ret             sp
 cd87:  c1 83 02 4c af 4c fc 4a je              local1 "u" "up" ~cd97
 cd8f:  e0 1f 49 5b 28 00       call            92b6 #28 -> sp
 cd95:  ab 00                   ret             sp
 cd97:  c1 8f 02 3d 74 59       je              local1 "bug" ~cdb4
 cd9d:  b2 ...                  print           "That's only your opinion."
 cdb0:  bb                      new_line        
 cdb1:  8c ff 48                jump            ccfa
 cdb4:  c1 8f 02 3f ff 64       je              local1 "echo" ~cddc
 cdba:  0d 31 01                store           g21 #01
 cdbd:  0c 8b 09                clear_attr      "platinum bar" #09
 cdc0:  b2 ...                  print           "The acoustics of the room change subtly."
 cdd9:  bb                      new_line        
 cdda:  bb                      new_line        
 cddb:  b0                      rtrue           
 cddc:  e0 3f 3c 24 00          call            7848 -> sp
 cde1:  8c ff 18                jump            ccfa

Routine cde4, 1 local (0000)

 cde7:  41 01 03 40             je              local0 #03 ~rfalse
 cdeb:  b2 ...                  print           "You are on the south edge of a deep canyon. Passages lead off to the east, northwest and southwest. A stairway leads down."
 ce32:  a0 37 f5                jz              g27 ce68
 ce35:  a0 a0 72                jz              g90 ~ce68
 ce38:  b2 ...                  print           " You can hear a loud roaring sound, like that of rushing water, from below."
 ce65:  8c 00 25                jump            ce8b
 ce68:  a0 37 47                jz              g27 ~ce70
 ce6b:  a0 a0 c4                jz              g90 ce70
 ce6e:  bb                      new_line        
 ce6f:  b0                      rtrue           
 ce70:  b2 ...                  print           " You can hear the sound of flowing water from below."
 ce8b:  bb                      new_line        
 ce8c:  b0                      rtrue           

Routine ce8e, 4 locals (0000, 0000, 0000, 0000)

 ce97:  a0 4e 46                jz              g3e ~ce9e
 ce9a:  41 10 be c0             je              g00 #be rfalse
 ce9e:  a0 2f 03 6e             jz              g1f ~d20e
 cea2:  a0 4e 00 e3             jz              g3e ~cf87
 cea6:  a0 01 00 df             jz              local0 ~cf87
 ceaa:  e7 7f 64 00             random          #64 -> sp
 ceae:  23 1e 00 00 d6          jg              #1e sp ~cf87
 ceb3:  06 71 72 00 73          jin             "stiletto" "thief" ~cf29
 ceb8:  0c 72 07                clear_attr      "thief" #07
 cebb:  b2 ...                  print           "Someone carrying a large bag is casually leaning against one of the walls here. He does not speak, but it is clear from his aspect that the bag will be taken only over his dead body."
 cf24:  bb                      new_line        
 cf25:  0d 2f 01                store           g1f #01
 cf28:  b0                      rtrue           
 cf29:  26 71 7f 40             jin             "stiletto" g6f ~rfalse
 cf2d:  0e 71 72                insert_obj      "stiletto" "thief"
 cf30:  0b 71 0e                set_attr        "stiletto" #0e
 cf33:  0c 72 07                clear_attr      "thief" #07
 cf36:  b2 ...                  print           "You feel a light finger-touch, and turning, notice a grinning figure holding a large bag in one hand and a stiletto in the other."
 cf83:  0d 2f 01                store           g1f #01
 cf86:  b0                      rtrue           
 cf87:  a0 01 80 93             jz              local0 d01c
 cf8b:  0a 72 02 00 8e          test_attr       "thief" #02 ~d01c
 cf90:  e0 1f 7f c2 72 00       call            ff84 #72 -> sp
 cf96:  a0 00 00 84             jz              sp ~d01c
 cf9a:  b2 ...                  print           "Your opponent, determining discretion to be the better part of valor, decides to terminate this little contretemps. With a rueful nod of his head, he steps backward into the gloom and disappears."
 d00f:  bb                      new_line        
 d010:  0b 72 07                set_attr        "thief" #07
 d013:  0c 72 02                clear_attr      "thief" #02
 d016:  e0 3f 81 9e 00          call            1033c -> sp
 d01b:  b0                      rtrue           
 d01c:  a0 01 ce                jz              local0 d02b
 d01f:  0a 72 02 4a             test_attr       "thief" #02 ~d02b
 d023:  e7 7f 64 00             random          #64 -> sp
 d027:  23 5a 00 c0             jg              #5a sp rfalse
 d02b:  a0 01 80 41             jz              local0 d06e
 d02f:  e7 7f 64 00             random          #64 -> sp
 d033:  23 1e 00 79             jg              #1e sp ~d06e
 d037:  b2 ...                  print           "The holder of the large bag just left, looking disgusted. Fortunately, he took nothing."
 d064:  bb                      new_line        
 d065:  0b 72 07                set_attr        "thief" #07
 d068:  e0 3f 81 9e 00          call            1033c -> sp
 d06d:  b0                      rtrue           
 d06e:  e7 7f 64 00             random          #64 -> sp
 d072:  23 46 00 c0             jg              #46 sp rfalse
 d076:  a0 4e 40                jz              g3e ~rfalse
 d079:  e0 25 81 dc 10 72 64 00 call            103b8 g00 #72 #64 -> sp
 d081:  a0 00 c8                jz              sp d08a
 d084:  0d 02 01                store           local1 #01
 d087:  8c 00 12                jump            d09a
 d08a:  e0 27 81 dc 7f 72 00    call            103b8 g6f #72 -> sp
 d091:  a0 00 c8                jz              sp d09a
 d094:  0d 02 01                store           local1 #01
 d097:  0d 03 01                store           local2 #01
 d09a:  0d 2f 01                store           g1f #01
 d09d:  a0 02 80 8e             jz              local1 d12d
 d0a1:  a0 01 00 8a             jz              local0 ~d12d
 d0a5:  b2 ...                  print           "A seedy-looking individual with a large bag just wandered through the room. On the way through, he quietly abstracted some valuables from the room and from your possession, mumbling something about ~Doing unto others before...~"
 d126:  bb                      new_line        
 d127:  e0 3f 69 56 00          call            d2ac -> sp
 d12c:  b1                      rfalse          
 d12d:  a0 01 80 94             jz              local0 d1c3
 d131:  e0 3f 81 9e 00          call            1033c -> sp
 d136:  a0 02 80 64             jz              local1 d19c
 d13a:  b2 ...                  print           "The thief just left, still carrying his large bag. You may not have noticed that he "
 d165:  a0 03 d6                jz              local2 d17c
 d168:  b2 ...                  print           "robbed you blind first."
 d179:  8c 00 19                jump            d193
 d17c:  b2 ...                  print           "appropriated the valuables in the room."
 d193:  bb                      new_line        
 d194:  e0 3f 69 56 00          call            d2ac -> sp
 d199:  8c 00 22                jump            d1bc
 d19c:  b2 ...                  print           "The thief, finding nothing of value, left disgusted."
 d1bb:  bb                      new_line        
 d1bc:  0b 72 07                set_attr        "thief" #07
 d1bf:  0d 01 00                store           local0 #00
 d1c2:  b0                      rtrue           
 d1c3:  b3 ...                  print_ret       "A ~lean and hungry~ gentleman just wandered through, carrying a large bag. Finding nothing of value, he left disgruntled."
 d20e:  a0 01 c0                jz              local0 rfalse
 d211:  e7 7f 64 00             random          #64 -> sp
 d215:  23 1e 00 40             jg              #1e sp ~rfalse
 d219:  e0 25 81 dc 10 72 64 00 call            103b8 g00 #72 #64 -> sp
 d221:  e9 7f 04                pull            local3
 d224:  a0 04 c8                jz              local3 d22d
 d227:  e8 bf 04                push            local3
 d22a:  8c 00 09                jump            d234
 d22d:  e0 27 81 dc 7f 72 00    call            103b8 g6f #72 -> sp
 d234:  e9 7f 02                pull            local1
 d237:  a0 02 80 46             jz              local1 d27f
 d23b:  b2 ...                  print           "The thief just left, still carrying his large bag. You may not have noticed that he robbed you blind first."
 d276:  bb                      new_line        
 d277:  e0 3f 69 56 00          call            d2ac -> sp
 d27c:  8c 00 22                jump            d29f
 d27f:  b2 ...                  print           "The thief, finding nothing of value, left disgusted."
 d29e:  bb                      new_line        
 d29f:  0b 72 07                set_attr        "thief" #07
 d2a2:  0d 01 00                store           local0 #00
 d2a5:  e0 3f 81 9e 00          call            1033c -> sp
 d2aa:  b1                      rfalse          

Routine d2ac, 1 local (0000)

 d2af:  2d 01 52                store           local0 g42
 d2b2:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 d2b8:  a0 52 41                jz              g42 ~rtrue
 d2bb:  a0 01 c1                jz              local0 rtrue
 d2be:  b3 ...                  print_ret       "The thief seems to have left you in the dark."

Routine d2d2, 1 local (0000)

 d2d5:  e0 3f 81 9e 00          call            1033c -> sp
 d2da:  0b 72 07                set_attr        "thief" #07
 d2dd:  92 be 01 c2             get_child       "Treasure Room" -> local0 d2e1
 d2e1:  a0 01 c1                jz              local0 rtrue
 d2e4:  4c 01 07                clear_attr      local0 #07
 d2e7:  a1 01 01 c2             get_sibling     local0 -> local0 d2eb
 d2eb:  8c ff f5                jump            d2e1

Routine d2ee, 4 locals (0000, 0000, 0000, 0000)

 d2f7:  92 72 02 c2             get_child       "thief" -> local1 d2fb
 d2fb:  a0 02 44                jz              local1 ~d300
 d2fe:  ab 04                   ret             local3
 d300:  a1 02 03 c2             get_sibling     local1 -> local2 d304
 d304:  c1 97 02 71 73 45       je              local1 #71 #73 ~d30d
 d30a:  8c 00 1a                jump            d325
 d30d:  51 02 0c 00             get_prop        local1 #0c -> sp
 d311:  43 00 00 52             jg              sp #00 ~d325
 d315:  6e 02 01                insert_obj      local1 local0
 d318:  0d 04 01                store           local3 #01
 d31b:  41 02 57 48             je              local1 #57 ~d325
 d31f:  0d 30 01                store           g20 #01
 d322:  0b 57 0b                set_attr        "jewel-encrusted egg" #0b
 d325:  2d 02 03                store           local1 local2
 d328:  8c ff d2                jump            d2fb

Routine d32c, 3 locals (0000, 0000, 0000)

 d333:  a2 01 02 c2             get_child       local0 -> local1 d337
 d337:  a0 02 c0                jz              local1 rfalse
 d33a:  a1 02 03 c2             get_sibling     local1 -> local2 d33e
 d33e:  4a 02 11 00 60          test_attr       local1 #11 ~d3a1
 d343:  4a 02 07 80 5b          test_attr       local1 #07 d3a1
 d348:  e7 7f 64 00             random          #64 -> sp
 d34c:  23 28 00 00 52          jg              #28 sp ~d3a1
 d351:  b2 ...                  print           "You hear, off in the distance, someone saying ~My, I wonder what this fine "
 d380:  aa 02                   print_obj       local1
 d382:  b2 ...                  print           " is doing here.~"
 d38d:  bb                      new_line        
 d38e:  e0 1f 27 21 3c 00       call            4e42 #3c -> sp
 d394:  a0 00 c1                jz              sp rtrue
 d397:  4e 02 72                insert_obj      local1 "thief"
 d39a:  4b 02 03                set_attr        local1 #03
 d39d:  4b 02 07                set_attr        local1 #07
 d3a0:  b0                      rtrue           
 d3a1:  2d 02 03                store           local1 local2
 d3a4:  8c ff 92                jump            d337

Routine d3a8, 4 locals (0000, 0000, 0000, 0000)

 d3b1:  41 88 6f 5d             je              g78 #6f ~d3d0
 d3b5:  b2 ...                  print           "The thief is a strong, silent type."
 d3ca:  bb                      new_line        
 d3cb:  0d 7c 00                store           g6c #00
 d3ce:  ab 7c                   ret             g6c
 d3d0:  a0 01 02 ea             jz              local0 ~d6bc
 d3d4:  41 88 42 00 50          je              g78 #42 ~d427
 d3d9:  11 72 0b 00             get_prop        "thief" #0b -> sp
 d3dd:  61 00 2c 00 47          je              sp g1c ~d427
 d3e2:  b3 ...                  print_ret       "The thief, being temporarily incapacitated, is unable to acknowledge your greeting with his usual graciousness."
 d427:  41 86 a9 00 d6          je              g76 #a9 ~d500
 d42c:  41 88 7f 00 d1          je              g78 #7f ~d500
 d431:  0a 72 02 80 cc          test_attr       "thief" #02 d500
 d436:  e0 1f 27 21 0a 00       call            4e42 #0a -> sp
 d43c:  a0 00 80 62             jz              sp d4a0
 d440:  b2 ...                  print           "You evidently frightened the robber, though you didn't hit him. He flees"
 d46f:  92 72 03 67             get_child       "thief" -> local2 ~d498
 d473:  e0 1b 6c a3 72 10 00    call            d946 #72 g00 -> sp
 d47a:  b2 ...                  print           ", but the contents of his bag fall on the floor."
 d495:  8c 00 05                jump            d49b
 d498:  b2 ...                  print           "."
 d49b:  bb                      new_line        
 d49c:  0b 72 07                set_attr        "thief" #07
 d49f:  b0                      rtrue           
 d4a0:  b2 ...                  print           "You missed. The thief makes no attempt to take the knife, though it would be a fine addition to the collection in his bag. He does seem angered by your attempt."
 d4fb:  bb                      new_line        
 d4fc:  0b 72 02                set_attr        "thief" #02
 d4ff:  b0                      rtrue           
 d500:  c1 97 88 3f 7f 00 d1    je              g78 #3f #7f ~d5d6
 d507:  a0 86 80 cd             jz              g76 d5d6
 d50b:  41 86 72 80 c8          je              g76 #72 d5d6
 d510:  41 87 72 00 c3          je              g77 #72 ~d5d6
 d515:  11 72 07 00             get_prop        "thief" #07 -> sp
 d519:  42 00 00 00 49          jl              sp #00 ~d565
 d51e:  11 72 07 00             get_prop        "thief" #07 -> sp
 d522:  35 00 00 00             sub             #00 sp -> sp
 d526:  e3 5b 72 07 00          put_prop        "thief" #07 sp
 d52b:  e0 0f 2a 43 80 f0 00    call            5486 #80f0 -> sp
 d532:  e1 97 00 00 01          storew          sp #00 #01
 d537:  e0 3f 81 9e 00          call            1033c -> sp
 d53c:  e3 5b 72 0b 2d          put_prop        "thief" #0b g1d
 d541:  b2 ...                  print           "Your proposed victim suddenly recovers consciousness."
 d564:  bb                      new_line        
 d565:  4e 86 72                insert_obj      g76 "thief"
 d568:  51 86 0c 00             get_prop        g76 #0c -> sp
 d56c:  43 00 00 00 45          jg              sp #00 ~d5b4
 d571:  0d 2e 01                store           g1e #01
 d574:  b2 ...                  print           "The thief is taken aback by your unexpected generosity, but accepts the "
 d59d:  aa 86                   print_obj       g76
 d59f:  b3 ...                  print_ret       " and stops to admire its beauty."
 d5b4:  b2 ...                  print           "The thief places the "
 d5bf:  aa 86                   print_obj       g76
 d5c1:  b3 ...                  print_ret       " in his bag and thanks you politely."
 d5d6:  41 88 5d 5b             je              g78 #5d ~d5f3
 d5da:  b3 ...                  print_ret       "Once you got him, what would you do with him?"
 d5f3:  c1 97 88 39 38 00 9b    je              g78 #39 #38 ~d693
 d5fa:  b3 ...                  print_ret       "The thief is a slippery character with beady eyes that flit back and forth. He carries, along with an unmistakable arrogance, a large bag over his shoulder and a vicious stiletto, whose blade is aimed menacingly in your direction. I'd watch out if I were you."
 d693:  41 88 4d 40             je              g78 #4d ~rfalse
 d697:  b3 ...                  print_ret       "The thief says nothing, as you have not been formally introduced."
 d6bc:  41 01 01 00 4e          je              local0 #01 ~d70d
 d6c1:  06 71 72 c0             jin             "stiletto" "thief" rfalse
 d6c5:  93 72 00                get_parent      "thief" -> sp
 d6c8:  26 71 00 40             jin             "stiletto" sp ~rfalse
 d6cc:  0e 71 72                insert_obj      "stiletto" "thief"
 d6cf:  0b 71 0e                set_attr        "stiletto" #0e
 d6d2:  26 72 10 41             jin             "thief" g00 ~rtrue
 d6d6:  b2 ...                  print           "The robber, somewhat surprised at this turn of events, nimbly retrieves his stiletto."
 d70b:  bb                      new_line        
 d70c:  b0                      rtrue           
 d70d:  41 01 02 00 bb          je              local0 #02 ~d7cb
 d712:  2e 71 10                insert_obj      "stiletto" g00
 d715:  0c 71 0e                clear_attr      "stiletto" #0e
 d718:  e0 2f 69 77 10 03       call            d2ee g00 -> local2
 d71e:  41 10 be 00 8a          je              g00 #be ~d7ab
 d723:  a2 10 03 c2             get_child       g00 -> local2 d727
 d727:  a0 03 5b                jz              local2 ~d743
 d72a:  b2 ...                  print           "The chalice is now safe to take."
 d73f:  bb                      new_line        
 d740:  8c 00 7d                jump            d7be
 d743:  c1 95 03 bf 72 04 80 5b je              local2 #bf #72 #04 d7a4
 d74b:  4c 03 07                clear_attr      local2 #07
 d74e:  a0 02 75                jz              local1 ~d784
 d751:  0d 02 01                store           local1 #01
 d754:  b2 ...                  print           "As the thief dies, the power of his magic decreases, and his treasures reappear:"
 d783:  bb                      new_line        
 d784:  b2 ...                  print           "  A "
 d789:  aa 03                   print_obj       local2
 d78b:  a2 03 00 56             get_child       local2 -> sp ~d7a3
 d78f:  e0 2f 48 29 03 00       call            9052 local2 -> sp
 d795:  a0 00 cd                jz              sp d7a3
 d798:  b2 ...                  print           ", with "
 d79d:  e0 2f 47 2c 03 00       call            8e58 local2 -> sp
 d7a3:  bb                      new_line        
 d7a4:  a1 03 03 c2             get_sibling     local2 -> local2 d7a8
 d7a8:  8c ff 7e                jump            d727
 d7ab:  a0 03 d2                jz              local2 d7be
 d7ae:  b2 ...                  print           "His booty remains."
 d7bd:  bb                      new_line        
 d7be:  e0 0f 2a 43 80 f0 00    call            5486 #80f0 -> sp
 d7c5:  e1 97 00 00 00          storew          sp #00 #00
 d7ca:  b0                      rtrue           
 d7cb:  41 01 05 58             je              local0 #05 ~d7e5
 d7cf:  a0 2f c0                jz              g1f rfalse
 d7d2:  0a 72 07 c0             test_attr       "thief" #07 rfalse
 d7d6:  e7 7f 64 00             random          #64 -> sp
 d7da:  23 14 00 40             jg              #14 sp ~rfalse
 d7de:  0b 72 02                set_attr        "thief" #02
 d7e1:  0d 7c 00                store           g6c #00
 d7e4:  b0                      rtrue           
 d7e5:  41 01 03 5d             je              local0 #03 ~d804
 d7e9:  e0 0f 2a 43 80 f0 00    call            5486 #80f0 -> sp
 d7f0:  e1 97 00 00 00          storew          sp #00 #00
 d7f5:  0c 72 02                clear_attr      "thief" #02
 d7f8:  2e 71 10                insert_obj      "stiletto" g00
 d7fb:  0c 71 0e                clear_attr      "stiletto" #0e
 d7fe:  e3 5b 72 0b 2c          put_prop        "thief" #0b g1c
 d803:  b0                      rtrue           
 d804:  41 01 04 40             je              local0 #04 ~rfalse
 d808:  93 72 00                get_parent      "thief" -> sp
 d80b:  61 00 10 00 53          je              sp g00 ~d861
 d810:  0b 72 02                set_attr        "thief" #02
 d813:  b2 ...                  print           "The robber revives, briefly feigning continued unconsciousness, and, when he sees his moment, scrambles away from you."
 d860:  bb                      new_line        
 d861:  e0 0f 2a 43 80 f0 00    call            5486 #80f0 -> sp
 d868:  e1 97 00 00 01          storew          sp #00 #01
 d86d:  e3 5b 72 0b 2d          put_prop        "thief" #0b g1d
 d872:  e0 3f 81 9e 00          call            1033c -> sp
 d877:  b8                      ret_popped      

Routine d878, 0 locals ()

 d879:  41 88 5d 00 58          je              g78 #5d ~d8d4
 d87e:  11 72 0b 00             get_prop        "thief" #0b -> sp
 d882:  61 00 2c 77             je              sp g1c ~d8bb
 d886:  b3 ...                  print_ret       "Sadly for you, the robber collapsed on top of the bag. Trying to take it would wake him."
 d8bb:  b3 ...                  print_ret       "The bag will be taken over his dead body."
 d8d4:  41 88 12 55             je              g78 #12 ~d8eb
 d8d8:  41 87 73 51             je              g77 #73 ~d8eb
 d8dc:  b3 ...                  print_ret       "It would be a good trick."
 d8eb:  c1 97 88 23 2b 5f       je              g78 #23 #2b ~d90e
 d8f1:  b3 ...                  print_ret       "Getting close enough would be a good trick."
 d90e:  c1 97 88 39 38 40       je              g78 #39 #38 ~rfalse
 d914:  b3 ...                  print_ret       "The bag is underneath the thief, so one can't say what, if anything, is inside."

Routine d946, 4 locals (0000, 0000, 0000, 0000)

 d94f:  a2 01 03 40             get_child       local0 -> local2 ~rfalse
 d953:  a0 03 c1                jz              local2 rtrue
 d956:  a1 03 04 c2             get_sibling     local2 -> local3 d95a
 d95a:  4c 03 07                clear_attr      local2 #07
 d95d:  6e 03 02                insert_obj      local2 local1
 d960:  2d 03 04                store           local2 local3
 d963:  8c ff ef                jump            d953

Routine d966, 0 locals ()

 d967:  41 88 5d 73             je              g78 #5d ~d99c
 d96b:  46 86 be 40             jin             g76 "Treasure Room" ~rfalse
 d96f:  06 72 be 40             jin             "thief" "Treasure Room" ~rfalse
 d973:  0a 72 02 40             test_attr       "thief" #02 ~rfalse
 d977:  0a 72 07 c0             test_attr       "thief" #07 rfalse
 d97b:  11 72 0b 00             get_prop        "thief" #0b -> sp
 d97f:  61 00 2c c0             je              sp g1c rfalse
 d983:  b3 ...                  print_ret       "You'd be stabbed in the back first."
 d99c:  41 88 12 63             je              g78 #12 ~d9c1
 d9a0:  41 87 bf 5f             je              g77 #bf ~d9c1
 d9a4:  b3 ...                  print_ret       "You can't. It's not a very good chalice, is it?"
 d9c1:  e0 3f 85 1f 00          call            10a3e -> sp
 d9c6:  b8                      ret_popped      

Routine d9c8, 3 locals (0000, 0000, 0000)

 d9cf:  41 01 02 40             je              local0 #02 ~rfalse
 d9d3:  e0 0f 2a 43 80 f0 00    call            5486 #80f0 -> sp
 d9da:  4f 00 00 00             loadw           sp #00 -> sp
 d9de:  41 00 01 40             je              sp #01 ~rfalse
 d9e2:  a0 4e 40                jz              g3e ~rfalse
 d9e5:  26 72 10 c8             jin             "thief" g00 d9ef
 d9e9:  e8 7f 01                push            #01
 d9ec:  8c 00 05                jump            d9f2
 d9ef:  e8 7f 00                push            #00
 d9f2:  2d 02 00                store           local1 sp
 d9f5:  a0 02 80 5a             jz              local1 da51
 d9f9:  b2 ...                  print           "You hear a scream of anguish as you violate the robber's hideaway. Using passages unknown to you, he rushes to its defense."
 da44:  bb                      new_line        
 da45:  2e 72 10                insert_obj      "thief" g00
 da48:  0b 72 02                set_attr        "thief" #02
 da4b:  0c 72 07                clear_attr      "thief" #07
 da4e:  8c 00 05                jump            da54
 da51:  0b 72 02                set_attr        "thief" #02
 da54:  e0 3f 6d 2d 00          call            da5a -> sp
 da59:  b8                      ret_popped      

Routine da5a, 2 locals (0000, 0000)

 da5f:  a2 10 01 c2             get_child       g00 -> local0 da63
 da63:  a0 01 f5                jz              local0 da99
 da66:  a1 01 00 71             get_sibling     local0 -> sp ~da99
 da6a:  b2 ...                  print           "The thief gestures mysteriously, and the treasures in the room suddenly vanish."
 da97:  bb                      new_line        
 da98:  bb                      new_line        
 da99:  a0 01 c1                jz              local0 rtrue
 da9c:  41 01 bf c9             je              local0 #bf daa7
 daa0:  41 01 72 c5             je              local0 #72 daa7
 daa4:  4b 01 07                set_attr        local0 #07
 daa7:  a1 01 01 c2             get_sibling     local0 -> local0 daab
 daab:  8c ff ed                jump            da99

Routine daae, 0 locals ()

 daaf:  41 88 2b 4f             je              g78 #2b ~dac0
 dab3:  b3 ...                  print_ret       "The door cannot be opened."
 dac0:  41 88 1c 4f             je              g78 #1c ~dad1
 dac4:  b3 ...                  print_ret       "You cannot burn this door."
 dad1:  41 88 2a 55             je              g78 #2a ~dae8
 dad5:  b3 ...                  print_ret       "You can't seem to damage the door."
 dae8:  41 88 52 40             je              g78 #52 ~rfalse
 daec:  b3 ...                  print_ret       "It won't open."

Routine daf6, 0 locals ()

 daf7:  41 88 5d 5b             je              g78 #5d ~db14
 dafb:  b3 ...                  print_ret       "A force keeps you from taking the bodies."
 db14:  c1 97 88 1c 2a 40       je              g78 #1c #2a ~rfalse
 db1a:  e0 0f 83 33 9e 2f 00    call            10666 s238 -> sp
 db21:  b8                      ret_popped      

Routine db22, 0 locals ()

 db23:  41 88 2b 59             je              g78 #2b ~db3e
 db27:  b3 ...                  print_ret       "The book is already open to page 569."
 db3e:  41 88 23 5b             je              g78 #23 ~db5b
 db42:  b3 ...                  print_ret       "As hard as you try, the book cannot be closed."
 db5b:  41 88 59 d3             je              g78 #59 db70
 db5f:  41 88 6b 00 99          je              g78 #6b ~dbfb
 db64:  41 87 0e 00 94          je              g77 #0e ~dbfb
 db69:  c1 8f 6e 02 39 80 8d    je              g5e #0239 dbfb
 db70:  b3 ...                  print_ret       "Beside page 569, there is only one other page with any legible printing on it. Most of it is unreadable, but the subject seems to be the banishment of evil. Apparently, certain noises, lights, and prayers are efficacious in this regard."
 dbfb:  41 88 1c 40             je              g78 #1c ~rfalse
 dbff:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 dc05:  e0 0f 83 33 9e 57 00    call            10666 s239 -> sp
 dc0c:  b8                      ret_popped      

Routine dc0e, 0 locals ()

 dc0f:  41 88 2a 40             je              g78 #2a ~rfalse
 dc13:  e3 97 86 0c 00          put_prop        g76 #0c #00
 dc18:  e3 93 86 0b 9e 7a       put_prop        g76 #0b s240
 dc1e:  b3 ...                  print_ret       "Congratulations! Unlike the other vandals, who merely stole the artist's masterpieces, you have destroyed one."

Routine dc64, 0 locals ()

 dc65:  41 88 7f 7c             je              g78 #7f ~dca3
 dc69:  b2 ...                  print           "The lamp has smashed into the floor, and the light has gone out."
 dc8c:  bb                      new_line        
 dc8d:  e0 0f 2a 43 6f 55 00    call            5486 #6f55 -> sp
 dc94:  e1 97 00 00 00          storew          sp #00 #00
 dc99:  e0 1f 3c 5d a4 00       call            78ba #a4 -> sp
 dc9f:  2e d2 10                insert_obj      "broken lantern" g00
 dca2:  b0                      rtrue           
 dca3:  41 88 0e 66             je              g78 #0e ~dccb
 dca7:  0a a4 12 55             test_attr       "brass lantern" #12 ~dcbe
 dcab:  b3 ...                  print_ret       "A burned-out lamp won't light."
 dcbe:  e0 0f 2a 43 6f 55 00    call            5486 #6f55 -> sp
 dcc5:  e1 97 00 00 01          storew          sp #00 #01
 dcca:  b1                      rfalse          
 dccb:  41 88 16 64             je              g78 #16 ~dcf1
 dccf:  0a a4 12 53             test_attr       "brass lantern" #12 ~dce4
 dcd3:  b3 ...                  print_ret       "The lamp has already burned out."
 dce4:  e0 0f 2a 43 6f 55 00    call            5486 #6f55 -> sp
 dceb:  e1 97 00 00 00          storew          sp #00 #00
 dcf0:  b1                      rfalse          
 dcf1:  41 88 38 40             je              g78 #38 ~rfalse
 dcf5:  b2 ...                  print           "The lamp "
 dcfc:  0a a4 12 50             test_attr       "brass lantern" #12 ~dd0e
 dd00:  b2 ...                  print           "has burned out."
 dd0b:  8c 00 19                jump            dd25
 dd0e:  0a a4 14 4a             test_attr       "brass lantern" #14 ~dd1a
 dd12:  b2 ...                  print           "is on."
 dd17:  8c 00 0d                jump            dd25
 dd1a:  b2 ...                  print           "is turned off."
 dd25:  bb                      new_line        
 dd26:  b0                      rtrue           

Routine dd28, 0 locals ()

 dd29:  41 88 5d 40             je              g78 #5d ~rfalse
 dd2d:  41 86 a0 40             je              g76 #a0 ~rfalse
 dd31:  b3 ...                  print_ret       "It is securely anchored."

Routine dd42, 1 local (0000)

 dd45:  c1 97 88 1c 0e 00 88    je              g78 #1c #0e ~ddd2
 dd4c:  41 86 9b 00 83          je              g76 #9b ~ddd2
 dd51:  43 2a 00 44             jg              g1a #00 ~dd57
 dd55:  96 2a                   dec             g1a
 dd57:  43 2a 00 dd             jg              g1a #00 dd76
 dd5b:  b3 ...                  print_ret       "I'm afraid that you have run out of matches."
 dd76:  c1 97 10 e4 ce 61       je              g00 #e4 #ce ~dd9b
 dd7c:  b3 ...                  print_ret       "This room is drafty, and the match goes out instantly."
 dd9b:  0b 9b 19                set_attr        "matchbook" #19
 dd9e:  0b 9b 14                set_attr        "matchbook" #14
 dda1:  e0 07 2a 39 6f 46 02 00 call            5472 #6f46 #02 -> sp
 dda9:  e1 97 00 00 01          storew          sp #00 #01
 ddae:  b2 ...                  print           "One of the matches starts to burn."
 ddc5:  bb                      new_line        
 ddc6:  a0 52 41                jz              g42 ~rtrue
 ddc9:  0d 52 01                store           g42 #01
 ddcc:  e0 3f 3f 02 00          call            7e04 -> sp
 ddd1:  b0                      rtrue           
 ddd2:  41 88 16 7a             je              g78 #16 ~de0e
 ddd6:  0a 9b 19 76             test_attr       "matchbook" #19 ~de0e
 ddda:  b2 ...                  print           "The match is out."
 dde5:  bb                      new_line        
 dde6:  0c 9b 19                clear_attr      "matchbook" #19
 dde9:  0c 9b 14                clear_attr      "matchbook" #14
 ddec:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 ddf2:  a0 52 52                jz              g42 ~de05
 ddf5:  b2 ...                  print           "It's pitch black in here!"
 de04:  bb                      new_line        
 de05:  e0 07 2a 39 6f 46 00 00 call            5472 #6f46 #00 -> sp
 de0d:  b0                      rtrue           
 de0e:  c1 97 88 2b 25 6e       je              g78 #2b #25 ~de40
 de14:  b2 ...                  print           "You have "
 de19:  55 2a 01 01             sub             g1a #01 -> local0
 de1d:  43 01 00 c8             jg              local0 #00 de27
 de21:  b2 ...                  print           "no"
 de24:  8c 00 05                jump            de2a
 de27:  e6 bf 01                print_num       local0
 de2a:  b2 ...                  print           " match"
 de2f:  41 01 01 ca             je              local0 #01 de3b
 de33:  b2 ...                  print           "es."
 de38:  8c 00 05                jump            de3e
 de3b:  b2 ...                  print           "."
 de3e:  bb                      new_line        
 de3f:  b0                      rtrue           
 de40:  41 88 38 40             je              g78 #38 ~rfalse
 de44:  0a 9b 14 54             test_attr       "matchbook" #14 ~de5a
 de48:  b2 ...                  print           "The match is burning."
 de57:  8c 00 31                jump            de89
 de5a:  b2 ...                  print           "The matchbook isn't very interesting, except for what's written on it."
 de89:  bb                      new_line        
 de8a:  b0                      rtrue           

Routine de8c, 0 locals ()

 de8d:  b2 ...                  print           "The match has gone out."
 de9c:  bb                      new_line        
 de9d:  0c 9b 19                clear_attr      "matchbook" #19
 dea0:  0c 9b 14                clear_attr      "matchbook" #14
 dea3:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 dea9:  b0                      rtrue           

Routine deaa, 2 locals (0000, 0000)

 deaf:  9e 2b 02                load            g1b -> local1
 deb2:  4f 02 00 01             loadw           local1 #00 -> local0
 deb6:  e0 0b 2a 39 6f 55 01 00 call            5472 #6f55 local0 -> sp
 debe:  e1 97 00 00 01          storew          sp #00 #01
 dec3:  e0 1a 6f 81 a4 02 01 00 call            df02 #a4 local1 local0 -> sp
 decb:  a0 01 c0                jz              local0 rfalse
 dece:  54 02 04 2b             add             local1 #04 -> g1b
 ded2:  ab 2b                   ret             g1b

Routine ded4, 2 locals (0000, 0000)

 ded9:  9e 29 02                load            g19 -> local1
 dedc:  0b 93 03                set_attr        "pair of candles" #03
 dedf:  4f 02 00 01             loadw           local1 #00 -> local0
 dee3:  e0 0b 2a 39 6f 6a 01 00 call            5472 #6f6a local0 -> sp
 deeb:  e1 97 00 00 01          storew          sp #00 #01
 def0:  e0 1a 6f 81 93 02 01 00 call            df02 #93 local1 local0 -> sp
 def8:  a0 01 c0                jz              local0 rfalse
 defb:  54 02 04 29             add             local1 #04 -> g19
 deff:  ab 29                   ret             g19

Routine df02, 3 locals (0000, 0000, 0000)

 df09:  a0 03 48                jz              local2 ~df12
 df0c:  4c 01 14                clear_attr      local0 #14
 df0f:  4b 01 12                set_attr        local0 #12
 df12:  e0 2f 4a 76 01 00       call            94ec local0 -> sp
 df18:  a0 00 46                jz              sp ~df1f
 df1b:  66 01 10 40             jin             local0 g00 ~rfalse
 df1f:  a0 03 60                jz              local2 ~df40
 df22:  b2 ...                  print           "You'd better have more light than from the "
 df3b:  aa 01                   print_obj       local0
 df3d:  b3 ...                  print_ret       "."
 df40:  4f 02 01 00             loadw           local1 #01 -> sp
 df44:  ad 00                   print_paddr     sp
 df46:  bb                      new_line        
 df47:  b0                      rtrue           

Routine df48, 2 locals (0000, 0000)

 df4d:  62 01 02 44             jl              local0 local1 ~df53
 df51:  ab 01                   ret             local0
 df53:  ab 02                   ret             local1

Routine df56, 0 locals ()

 df57:  0a 93 03 ce             test_attr       "pair of candles" #03 df67
 df5b:  e0 0f 2a 43 6f 6a 00    call            5486 #6f6a -> sp
 df62:  e1 97 00 00 01          storew          sp #00 #01
 df67:  21 93 87 c0             je              #93 g77 rfalse
 df6b:  c1 97 88 1c 0e 01 15    je              g78 #1c #0e ~e085
 df72:  0a 93 12 71             test_attr       "pair of candles" #12 ~dfa5
 df76:  b3 ...                  print_ret       "Alas, there's not much left of the candles. Certainly not enough to burn."
 dfa5:  a0 87 79                jz              g77 ~dfdf
 dfa8:  0a 9b 19 57             test_attr       "matchbook" #19 ~dfc1
 dfac:  b2 ...                  print           "(with the match)"
 dfb7:  bb                      new_line        
 dfb8:  e0 15 2b be 0e 93 9b 00 call            577c #0e #93 #9b -> sp
 dfc0:  b0                      rtrue           
 dfc1:  b2 ...                  print           "You should say what to light them with."
 dfdc:  bb                      new_line        
 dfdd:  9b 02                   ret             #02
 dfdf:  41 87 9b 6c             je              g77 #9b ~e00d
 dfe3:  0a 9b 14 68             test_attr       "matchbook" #14 ~e00d
 dfe7:  b2 ...                  print           "The candles are "
 dfec:  0a 93 14 49             test_attr       "pair of candles" #14 ~dff7
 dff0:  b3 ...                  print_ret       "already lit."
 dff7:  0b 93 14                set_attr        "pair of candles" #14
 dffa:  b2 ...                  print           "lit."
 dfff:  bb                      new_line        
 e000:  e0 0f 2a 43 6f 6a 00    call            5486 #6f6a -> sp
 e007:  e1 97 00 00 01          storew          sp #00 #01
 e00c:  b0                      rtrue           
 e00d:  41 87 68 00 50          je              g77 #68 ~e060
 e012:  0a 93 14 61             test_attr       "pair of candles" #14 ~e035
 e016:  b3 ...                  print_ret       "You realize, just in time, that the candles are already lighted."
 e035:  b2 ...                  print           "The heat from the torch is so intense that the candles are vaporized."
 e058:  bb                      new_line        
 e059:  e0 1f 3c 5d 93 00       call            78ba #93 -> sp
 e05f:  b8                      ret_popped      
 e060:  b3 ...                  print_ret       "You have to light them with something that's burning, you know."
 e085:  41 88 25 75             je              g78 #25 ~e0bc
 e089:  b3 ...                  print_ret       "Let's see, how many objects in a pair? Don't tell me, I'll get it."
 e0bc:  41 88 16 00 51          je              g78 #16 ~e110
 e0c1:  e0 0f 2a 43 6f 6a 00    call            5486 #6f6a -> sp
 e0c8:  e1 97 00 00 00          storew          sp #00 #00
 e0cd:  0a 93 14 74             test_attr       "pair of candles" #14 ~e103
 e0d1:  b2 ...                  print           "The flame is extinguished."
 e0e2:  0c 93 14                clear_attr      "pair of candles" #14
 e0e5:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 e0eb:  a0 52 55                jz              g42 ~e101
 e0ee:  b2 ...                  print           " It's really dark in here...."
 e101:  bb                      new_line        
 e102:  b0                      rtrue           
 e103:  b3 ...                  print_ret       "The candles are not lighted."
 e110:  41 88 12 59             je              g78 #12 ~e12b
 e114:  4a 87 1a 55             test_attr       g77 #1a ~e12b
 e118:  b3 ...                  print_ret       "That wouldn't be smart."
 e12b:  41 88 38 40             je              g78 #38 ~rfalse
 e12f:  b2 ...                  print           "The candles are "
 e134:  0a 93 14 4c             test_attr       "pair of candles" #14 ~e142
 e138:  b2 ...                  print           "burning."
 e13f:  8c 00 07                jump            e147
 e142:  b2 ...                  print           "out."
 e147:  bb                      new_line        
 e148:  b0                      rtrue           

Routine e14a, 1 local (0000)

 e14d:  41 01 06 40             je              local0 #06 ~rfalse
 e151:  26 93 7f 40             jin             "pair of candles" g6f ~rfalse
 e155:  e0 1f 27 21 32 00       call            4e42 #32 -> sp
 e15b:  a0 00 c0                jz              sp rfalse
 e15e:  0a 93 14 40             test_attr       "pair of candles" #14 ~rfalse
 e162:  e0 0f 2a 43 6f 6a 00    call            5486 #6f6a -> sp
 e169:  e1 97 00 00 00          storew          sp #00 #00
 e16e:  0c 93 14                clear_attr      "pair of candles" #14
 e171:  b2 ...                  print           "A gust of wind blows out your candles!"
 e188:  bb                      new_line        
 e189:  e0 2f 36 31 10 52       call            6c62 g00 -> g42
 e18f:  a0 52 40                jz              g42 ~rfalse
 e192:  b3 ...                  print_ret       "It is now completely dark."

Routine e1a6, 1 local (0000)

 e1a9:  41 88 5d 55             je              g78 #5d ~e1c0
 e1ad:  41 7f 04 51             je              g6f #04 ~e1c0
 e1b1:  e0 03 2a 39 80 7c ff ff 00 
                               call            5472 #807c #ffff -> sp
 e1ba:  e1 97 00 00 01          storew          sp #00 #01
 e1bf:  b1                      rfalse          
 e1c0:  41 88 38 40             je              g78 #38 ~rfalse
 e1c4:  11 6e 0c 01             get_prop        "sword" #0c -> local0
 e1c8:  41 01 01 5d             je              local0 #01 ~e1e7
 e1cc:  b3 ...                  print_ret       "Your sword is glowing with a faint blue glow."
 e1e7:  41 01 02 40             je              local0 #02 ~rfalse
 e1eb:  b3 ...                  print_ret       "Your sword is glowing very brightly."

Routine e202, 3 locals (0000, 0000, 0000)

 e209:  41 01 06 40             je              local0 #06 ~rfalse
 e20d:  41 01 06 52             je              local0 #06 ~e221
 e211:  c1 97 88 1c 0e 4c       je              g78 #1c #0e ~e221
 e217:  c1 95 86 93 68 9b 45    je              g76 #93 #68 #9b ~e221
 e21e:  0d 02 01                store           local1 #01
 e221:  e0 1f 4a 76 93 00       call            94ec #93 -> sp
 e227:  a0 00 c6                jz              sp e22e
 e22a:  0a 93 14 dc             test_attr       "pair of candles" #14 e248
 e22e:  e0 1f 4a 76 68 00       call            94ec #68 -> sp
 e234:  a0 00 c6                jz              sp e23b
 e237:  0a 68 14 cf             test_attr       "torch" #14 e248
 e23b:  e0 1f 4a 76 9b 00       call            94ec #9b -> sp
 e241:  a0 00 c0                jz              sp rfalse
 e244:  0a 9b 14 40             test_attr       "matchbook" #14 ~rfalse
 e248:  a0 02 80 4a             jz              local1 e294
 e24c:  b2 ...                  print           "How sad for an aspiring adventurer to light a "
 e26b:  aa 86                   print_obj       g76
 e26d:  b2 ...                  print           " in a room which reeks of gas. Fortunately, there is justice in the world."
 e290:  bb                      new_line        
 e291:  8c 00 4c                jump            e2de
 e294:  b2 ...                  print           "Oh dear. It appears that the smell coming from this room was coal gas. I would have thought twice about carrying flaming objects in here."
 e2dd:  bb                      new_line        
 e2de:  e0 0f 83 33 9e b7 00    call            10666 s247 -> sp
 e2e5:  b8                      ret_popped      

Routine e2e6, 1 local (0000)

 e2e9:  93 bd 00                get_parent      "clove of garlic" -> sp
 e2ec:  c1 ab 00 7f 10 00 41    je              sp g6f g00 ~e332
 e2f3:  b3 ...                  print_ret       "In the corner of the room on the ceiling is a large vampire bat who is obviously deranged and holding his nose."
 e332:  b3 ...                  print_ret       "A large vampire bat, hanging from the ceiling, swoops down at you!"

Routine e35c, 1 local (0000)

 e35f:  41 01 03 61             je              local0 #03 ~e382
 e363:  b3 ...                  print_ret       "You are in a small room which has doors only to the east and south."
 e382:  41 01 02 40             je              local0 #02 ~rfalse
 e386:  a0 4e 40                jz              g3e ~rfalse
 e389:  93 bd 00                get_parent      "clove of garlic" -> sp
 e38c:  c1 ab 00 7f 10 c0       je              sp g6f g00 rfalse
 e392:  e0 3f 3f 02 00          call            7e04 -> sp
 e397:  e0 3f 4e c9 00          call            9d92 -> sp
 e39c:  b8                      ret_popped      

Routine e39e, 1 local (0000)

 e3a1:  41 01 03 40             je              local0 #03 ~rfalse
 e3a5:  b2 ...                  print           "This is a large, cold room whose sole exit is to the north. In one corner there is a machine which is reminiscent of a clothes dryer. On its face is a switch which is labelled ~START~. The switch does not appear to be manipulable by any human hand (unless the fingers are about 1/16 by 1/4 inch). On the front of the machine is a large lid, which is "
 e474:  0a 9e 0b 4a             test_attr       "machine" #0b ~e480
 e478:  b2 ...                  print           "open."
 e47d:  8c 00 07                jump            e485
 e480:  b2 ...                  print           "closed."
 e485:  bb                      new_line        
 e486:  b0                      rtrue           

Routine e488, 0 locals ()

 e489:  41 88 5d 51             je              g78 #5d ~e49c
 e48d:  b3 ...                  print_ret       "It is far too large to carry."
 e49c:  41 88 2b 00 43          je              g78 #2b ~e4e2
 e4a1:  0a 9e 0b 4c             test_attr       "machine" #0b ~e4af
 e4a5:  e0 2f 27 36 44 00       call            4e6c g34 -> sp
 e4ab:  ad 00                   print_paddr     sp
 e4ad:  bb                      new_line        
 e4ae:  b0                      rtrue           
 e4af:  92 9e 00 61             get_child       "machine" -> sp ~e4d2
 e4b3:  b2 ...                  print           "The lid opens, revealing "
 e4c4:  e0 1f 47 2c 9e 00       call            8e58 #9e -> sp
 e4ca:  b2 ...                  print           "."
 e4cd:  bb                      new_line        
 e4ce:  0b 9e 0b                set_attr        "machine" #0b
 e4d1:  b0                      rtrue           
 e4d2:  b2 ...                  print           "The lid opens."
 e4dd:  bb                      new_line        
 e4de:  0b 9e 0b                set_attr        "machine" #0b
 e4e1:  b0                      rtrue           
 e4e2:  41 88 23 60             je              g78 #23 ~e504
 e4e6:  0a 9e 0b 52             test_attr       "machine" #0b ~e4fa
 e4ea:  b2 ...                  print           "The lid closes."
 e4f5:  bb                      new_line        
 e4f6:  0c 9e 0b                clear_attr      "machine" #0b
 e4f9:  b0                      rtrue           
 e4fa:  e0 2f 27 36 44 00       call            4e6c g34 -> sp
 e500:  ad 00                   print_paddr     sp
 e502:  bb                      new_line        
 e503:  b0                      rtrue           
 e504:  41 88 0e 40             je              g78 #0e ~rfalse
 e508:  a0 87 5d                jz              g77 ~e526
 e50b:  b3 ...                  print_ret       "It's not clear how to turn it on with your bare hands."
 e526:  e0 16 2b be 59 70 87 00 call            577c #59 #70 g77 -> sp
 e52e:  b0                      rtrue           

Routine e530, 1 local (0000)

 e533:  41 88 59 40             je              g78 #59 ~rfalse
 e537:  41 87 7b 00 a0          je              g77 #7b ~e5da
 e53c:  0a 9e 0b 5d             test_attr       "machine" #0b ~e55b
 e540:  b3 ...                  print_ret       "The machine doesn't seem to want to do anything."
 e55b:  b2 ...                  print           "The machine comes to life (figuratively) with a dazzling display of colored lights and bizarre noises. After a few moments, the excitement abates."
 e5ba:  bb                      new_line        
 e5bb:  06 77 9e 4c             jin             "small pile of coal" "machine" ~e5c9
 e5bf:  e0 1f 3c 5d 77 00       call            78ba #77 -> sp
 e5c5:  0e ab 9e                insert_obj      "huge diamond" "machine"
 e5c8:  b0                      rtrue           
 e5c9:  92 9e 01 4b             get_child       "machine" -> local0 ~e5d6
 e5cd:  e0 2f 3c 5d 01 00       call            78ba local0 -> sp
 e5d3:  8c ff f5                jump            e5c9
 e5d6:  0e 92 9e                insert_obj      "small piece of vitreous slag" "machine"
 e5d9:  b0                      rtrue           
 e5da:  a0 87 55                jz              g77 ~e5f0
 e5dd:  b3 ...                  print_ret       "You can't turn it with your hands..."
 e5f0:  b2 ...                  print           "It seems that a "
 e5f7:  aa 87                   print_obj       g77
 e5f9:  b3 ...                  print_ret       " won't do."

Routine e600, 0 locals ()

 e601:  e0 1f 3c 5d 92 00       call            78ba #92 -> sp
 e607:  b3 ...                  print_ret       "The slag was rather insubstantial, and crumbles into dust at your touch."

Routine e632, 2 locals (0000, 0000)

 e637:  41 01 01 40             je              local0 #01 ~rfalse
 e63b:  a2 7f 02 c2             get_child       g6f -> local1 e63f
 e63f:  0d a2 01                store           g92 #01
 e642:  a0 02 45                jz              local1 ~e648
 e645:  8c 00 19                jump            e65f
 e648:  e0 2f 49 16 02 00       call            922c local1 -> sp
 e64e:  43 00 04 48             jg              sp #04 ~e658
 e652:  0d a2 00                store           g92 #00
 e655:  8c 00 09                jump            e65f
 e658:  a1 02 02 c2             get_sibling     local1 -> local1 e65c
 e65c:  8c ff e5                jump            e642
 e65f:  41 10 e4 40             je              g00 #e4 ~rfalse
 e663:  a0 52 c0                jz              g42 rfalse
 e666:  e0 2f 48 31 28 00       call            9062 g18 -> sp
 e66c:  0d 28 00                store           g18 #00
 e66f:  b1                      rfalse          

Routine e670, 1 local (0000)

 e673:  41 01 01 40             je              local0 #01 ~rfalse
 e677:  26 d0 7f c8             jin             "gold coffin" g6f e681
 e67b:  e8 7f 01                push            #01
 e67e:  8c 00 05                jump            e684
 e681:  e8 7f 00                push            #00
 e684:  2d 9b 00                store           g8b sp
 e687:  b1                      rfalse          

Routine e688, 1 local (0000)

 e68b:  41 01 06 40             je              local0 #06 ~rfalse
 e68f:  26 9c 7f 47             jin             "magic boat" g6f ~e698
 e693:  0d a4 00                store           g94 #00
 e696:  ab a4                   ret             g94
 e698:  0d a4 01                store           g94 #01
 e69b:  ab a4                   ret             g94

Routine e69e, 0 locals ()

 e69f:  c1 97 88 69 8c 40       je              g78 #69 #8c ~rfalse
 e6a5:  41 10 1d c7             je              g00 #1d e6ae
 e6a9:  41 10 88 00 b4          je              g00 #88 ~e760
 e6ae:  a0 9e 00 7e             jz              g8e ~e72e
 e6b2:  0c 89 07                clear_attr      "pot of gold" #07
 e6b5:  b2 ...                  print           "Suddenly, the rainbow appears to become solid and, I venture, walkable (I think the giveaway was the stairs and bannister)."
 e6fe:  bb                      new_line        
 e6ff:  41 10 88 68             je              g00 #88 ~e729
 e703:  06 89 88 64             jin             "pot of gold" "End of Rainbow" ~e729
 e707:  b2 ...                  print           "A shimmering pot of gold appears at the end of the rainbow."
 e728:  bb                      new_line        
 e729:  0d 9e 01                store           g8e #01
 e72c:  ab 9e                   ret             g8e
 e72e:  e0 17 81 dc 1c f6 00    call            103b8 #1c #f6 -> sp
 e735:  b2 ...                  print           "The rainbow seems to have become somewhat run-of-the-mill."
 e75a:  bb                      new_line        
 e75b:  0d 9e 00                store           g8e #00
 e75e:  ab 9e                   ret             g8e
 e760:  41 10 1c 4d             je              g00 #1c ~e76f
 e764:  0d 9e 00                store           g8e #00
 e767:  e0 0f 83 33 9e c9 00    call            10666 s248 -> sp
 e76e:  b8                      ret_popped      
 e76f:  b3 ...                  print_ret       "A dazzling display of color briefly emanates from the sceptre."

Routine e796, 1 local (0000)

 e799:  41 01 03 40             je              local0 #03 ~rfalse
 e79d:  b2 ...                  print           "You are at the top of Aragain Falls, an enormous waterfall with a drop of about 450 feet. The only path here is on the north end."
 e7e4:  bb                      new_line        
 e7e5:  a0 9e dc                jz              g8e e802
 e7e8:  b2 ...                  print           "A solid rainbow spans the falls."
 e7ff:  8c 00 25                jump            e825
 e802:  b2 ...                  print           "A beautiful rainbow can be seen over the falls and to the west."
 e825:  bb                      new_line        
 e826:  b0                      rtrue           

Routine e828, 0 locals ()

 e829:  c1 97 88 22 26 00 50    je              g78 #22 #26 ~e87e
 e830:  41 10 19 4d             je              g00 #19 ~e83f
 e834:  b3 ...                  print_ret       "From here?!?"
 e83f:  a0 9e ed                jz              g8e e86d
 e842:  41 10 1d 49             je              g00 #1d ~e84d
 e846:  e0 1f 49 5b 88 00       call            92b6 #88 -> sp
 e84c:  b8                      ret_popped      
 e84d:  41 10 88 49             je              g00 #88 ~e858
 e851:  e0 1f 49 5b 1d 00       call            92b6 #1d -> sp
 e857:  b8                      ret_popped      
 e858:  b3 ...                  print_ret       "You'll have to say which way..."
 e86d:  b3 ...                  print_ret       "Can you walk on water vapor?"
 e87e:  41 88 51 40             je              g78 #51 ~rfalse
 e882:  b3 ...                  print_ret       "The Frigid River flows under the rainbow."

Routine e89c, 0 locals ()

 e89d:  c1 97 88 32 12 4c       je              g78 #32 #12 ~e8ad
 e8a3:  41 86 62 48             je              g76 #62 ~e8ad
 e8a7:  e0 3f 74 72 00          call            e8e4 -> sp
 e8ac:  b8                      ret_popped      
 e8ad:  c1 97 88 3b 17 5d       je              g78 #3b #17 ~e8ce
 e8b3:  b3 ...                  print_ret       "No chance. Some moron punctured it."
 e8ce:  41 88 5f 40             je              g78 #5f ~rfalse
 e8d2:  41 87 62 48             je              g77 #62 ~e8dc
 e8d6:  e0 3f 74 72 00          call            e8e4 -> sp
 e8db:  b8                      ret_popped      
 e8dc:  e0 2f 60 7f 87 00       call            c0fe g77 -> sp
 e8e2:  b8                      ret_popped      

Routine e8e4, 0 locals ()

 e8e5:  b2 ...                  print           "Well done. The boat is repaired."
 e8fc:  bb                      new_line        
 e8fd:  93 8e 00                get_parent      "punctured boat" -> sp
 e900:  2e 8d 00                insert_obj      "pile of plastic" sp
 e903:  e0 1f 3c 5d 8e 00       call            78ba #8e -> sp
 e909:  b8                      ret_popped      

Routine e90a, 0 locals ()

 e90b:  41 88 12 00 7b          je              g78 #12 ~e989
 e910:  41 87 83 40             je              g77 #83 ~rfalse
 e914:  41 86 05 4a             je              g76 #05 ~e920
 e918:  e0 0f 83 33 9e f2 00    call            10666 s249 -> sp
 e91f:  b8                      ret_popped      
 e920:  41 86 9c 5d             je              g76 #9c ~e93f
 e924:  b3 ...                  print_ret       "You should get in the boat then launch it."
 e93f:  4a 86 1a 64             test_attr       g76 #1a ~e965
 e943:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 e949:  b2 ...                  print           "The "
 e94c:  aa 86                   print_obj       g76
 e94e:  b3 ...                  print_ret       " floats for a moment, then sinks."
 e965:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 e96b:  b2 ...                  print           "The "
 e96e:  aa 86                   print_obj       g76
 e970:  b3 ...                  print_ret       " splashes into the water and is gone forever."
 e989:  c1 97 88 22 45 40       je              g78 #22 #45 ~rfalse
 e98f:  b3 ...                  print_ret       "A look before leaping reveals that the river is wide and dangerous, with swift currents and large, half-hidden rocks. You decide to forgo your swim."

Routine e9e2, 1 local (0000)

 e9e5:  c1 95 10 24 23 22 d5    je              g00 #24 #23 #22 e9ff
 e9ec:  c1 97 10 82 1f cf       je              g00 #82 #1f e9ff
 e9f2:  e0 0f 2a 43 74 f1 00    call            5486 #74f1 -> sp
 e9f9:  e1 97 00 00 00          storew          sp #00 #00
 e9fe:  b0                      rtrue           
 e9ff:  e0 2b 4a 24 10 26 01    call            9448 g00 g16 -> local0
 ea06:  a0 01 f8                jz              local0 ea3f
 ea09:  b2 ...                  print           "The flow of the river carries you downstream."
 ea22:  bb                      new_line        
 ea23:  bb                      new_line        
 ea24:  e0 2f 49 5b 01 00       call            92b6 local0 -> sp
 ea2a:  e0 2b 4a 24 10 27 00    call            9448 g00 g17 -> sp
 ea31:  e0 0b 2a 39 74 f1 00 00 call            5472 #74f1 sp -> sp
 ea39:  e1 97 00 00 01          storew          sp #00 #01
 ea3e:  b0                      rtrue           
 ea3f:  e0 0f 83 33 9f 07 00    call            10666 s250 -> sp
 ea46:  b8                      ret_popped      

Routine ea48, 2 locals (0000, 0000)

 ea4d:  c1 95 01 02 06 03 c0    je              local0 #02 #06 #03 rfalse
 ea54:  41 01 01 01 85          je              local0 #01 ~ebdc
 ea59:  41 88 89 78             je              g78 #89 ~ea93
 ea5d:  c1 95 86 13 1e 1d c0    je              g76 #13 #1e #1d rfalse
 ea64:  41 10 64 48             je              g00 #64 ~ea6e
 ea68:  c1 97 86 1f 1c c0       je              g76 #1f #1c rfalse
 ea6e:  41 10 30 46             je              g00 #30 ~ea76
 ea72:  41 86 1c c0             je              g76 #1c rfalse
 ea76:  b3 ...                  print_ret       "Read the label for the boat's instructions."
 ea93:  41 88 4a 00 75          je              g78 #4a ~eb0b
 ea98:  c1 95 10 24 23 22 c9    je              g00 #24 #23 #22 eaa6
 ea9f:  c1 95 10 82 64 30 77    je              g00 #82 #64 #30 ~eadb
 eaa6:  b2 ...                  print           "You are on the "
 eaad:  41 10 64 4c             je              g00 #64 ~eabb
 eab1:  b2 ...                  print           "reservoir"
 eab8:  8c 00 13                jump            eacc
 eabb:  41 10 30 4a             je              g00 #30 ~eac7
 eabf:  b2 ...                  print           "stream"
 eac4:  8c 00 07                jump            eacc
 eac7:  b2 ...                  print           "river"
 eacc:  b3 ...                  print_ret       ", or have you forgotten?"
 eadb:  e0 2f 4a 17 25 02       call            942e g15 -> local1
 eae1:  41 02 01 57             je              local1 #01 ~eafa
 eae5:  e0 2b 4a 24 10 27 00    call            9448 g00 g17 -> sp
 eaec:  e0 0b 2a 39 74 f1 00 00 call            5472 #74f1 sp -> sp
 eaf4:  e1 97 00 00 01          storew          sp #00 #01
 eaf9:  b0                      rtrue           
 eafa:  41 02 02 c1             je              local1 #02 rtrue
 eafe:  b3 ...                  print_ret       "You can't launch it here."
 eb0b:  41 88 31 46             je              g78 #31 ~eb13
 eb0f:  4a 86 1d da             test_attr       g76 #1d eb2b
 eb13:  41 88 12 4a             je              g78 #12 ~eb1f
 eb17:  4a 86 1d 46             test_attr       g76 #1d ~eb1f
 eb1b:  41 87 9c ce             je              g77 #9c eb2b
 eb1f:  c1 97 88 2a 13 00 a9    je              g78 #2a #13 ~ebcd
 eb26:  4a 87 1d 00 a4          test_attr       g77 #1d ~ebcd
 eb2b:  e0 1f 3c 5d 9c 00       call            78ba #9c -> sp
 eb31:  2e 8e 10                insert_obj      "punctured boat" g00
 eb34:  e0 1b 81 dc 9c 10 00    call            103b8 #9c g00 -> sp
 eb3b:  6e 7f 10                insert_obj      g6f g00
 eb3e:  b2 ...                  print           "It seems that the "
 eb45:  c1 97 88 12 31 47       je              g78 #12 #31 ~eb50
 eb4b:  aa 86                   print_obj       g76
 eb4d:  8c 00 04                jump            eb52
 eb50:  aa 87                   print_obj       g77
 eb52:  b2 ...                  print           " didn't agree with the boat, as evidenced by the loud hissing noise issuing therefrom. With a pathetic sputter, the boat deflates, leaving you without."
 ebb1:  bb                      new_line        
 ebb2:  4a 10 04 41             test_attr       g00 #04 ~rtrue
 ebb6:  bb                      new_line        
 ebb7:  c1 97 10 64 30 4a       je              g00 #64 #30 ~ebc5
 ebbd:  e0 0f 83 33 9f 2d 00    call            10666 s251 -> sp
 ebc4:  b0                      rtrue           
 ebc5:  e0 0f 83 33 9f 40 00    call            10666 s252 -> sp
 ebcc:  b0                      rtrue           
 ebcd:  41 88 4a 40             je              g78 #4a ~rfalse
 ebd1:  b3 ...                  print_ret       "You're not in the boat!"
 ebdc:  41 88 19 00 7c          je              g78 #19 ~ec5b
 ebe1:  26 d1 7f d6             jin             "sceptre" g6f ebf9
 ebe5:  26 a9 7f d2             jin             "nasty knife" g6f ebf9
 ebe9:  26 6e 7f ce             jin             "sword" g6f ebf9
 ebed:  26 80 7f ca             jin             "rusty knife" g6f ebf9
 ebf1:  26 da 7f c6             jin             "bloody axe" g6f ebf9
 ebf5:  26 71 7f 40             jin             "stiletto" g6f ~rfalse
 ebf9:  b2 ...                  print           "Oops! Something sharp seems to have slipped and punctured the boat. The boat deflates to the sounds of hissing, sputtering, and cursing."
 ec4a:  bb                      new_line        
 ec4b:  e0 1f 3c 5d 9c 00       call            78ba #9c -> sp
 ec51:  2e 8e 10                insert_obj      "punctured boat" g00
 ec54:  e0 1f 4a 98 8e 00       call            9530 #8e -> sp
 ec5a:  b0                      rtrue           
 ec5b:  c1 97 88 3b 17 5b       je              g78 #3b #17 ~ec7a
 ec61:  b3 ...                  print_ret       "Inflating it further would probably burst it."
 ec7a:  41 88 29 40             je              g78 #29 ~rfalse
 ec7e:  a3 7f 00                get_parent      g6f -> sp
 ec81:  41 00 9c 5d             je              sp #9c ~eca0
 ec85:  b3 ...                  print_ret       "You can't deflate the boat while you're in it."
 eca0:  26 9c 10 db             jin             "magic boat" g00 ecbd
 eca4:  b3 ...                  print_ret       "The boat must be on the ground to be deflated."
 ecbd:  b2 ...                  print           "The boat deflates."
 ecca:  bb                      new_line        
 eccb:  0d a4 01                store           g94 #01
 ecce:  e0 1f 3c 5d 9c 00       call            78ba #9c -> sp
 ecd4:  2e 8d 10                insert_obj      "pile of plastic" g00
 ecd7:  e0 1f 4a 98 8d 00       call            9530 #8d -> sp
 ecdd:  b8                      ret_popped      

Routine ecde, 0 locals ()

 ecdf:  e0 19 2b be 17 86 06 00 call            577c #17 g76 #06 -> sp
 ece7:  b8                      ret_popped      

Routine ece8, 0 locals ()

 ece9:  c1 97 88 3b 17 40       je              g78 #3b #17 ~rfalse
 ecef:  26 8d 10 db             jin             "pile of plastic" g00 ed0c
 ecf3:  b3 ...                  print_ret       "The boat must be on the ground to be inflated."
 ed0c:  41 87 ad 00 4b          je              g77 #ad ~ed5a
 ed11:  b2 ...                  print           "The boat inflates and appears seaworthy."
 ed28:  bb                      new_line        
 ed29:  0a 6c 03 dc             test_attr       "tan label" #03 ed47
 ed2d:  b2 ...                  print           "A tan label is lying inside the boat."
 ed46:  bb                      new_line        
 ed47:  0d a4 00                store           g94 #00
 ed4a:  e0 1f 3c 5d 8d 00       call            78ba #8d -> sp
 ed50:  2e 9c 10                insert_obj      "magic boat" g00
 ed53:  e0 1f 4a 98 9c 00       call            9530 #9c -> sp
 ed59:  b8                      ret_popped      
 ed5a:  41 87 06 5d             je              g77 #06 ~ed79
 ed5e:  b3 ...                  print_ret       "You don't have enough lung power to inflate it."
 ed79:  b2 ...                  print           "With a "
 ed80:  aa 87                   print_obj       g77
 ed82:  b3 ...                  print_ret       "? Surely you jest!"

Routine ed92, 1 local (0000)

 ed95:  41 01 06 40             je              local0 #06 ~rfalse
 ed99:  26 a2 7f 40             jin             "red buoy" g6f ~rfalse
 ed9d:  a0 24 c0                jz              g14 rfalse
 eda0:  b2 ...                  print           "You notice something funny about the feel of the buoy."
 edbf:  bb                      new_line        
 edc0:  0d 24 00                store           g14 #00
 edc3:  ab 24                   ret             g14

Routine edc6, 0 locals ()

 edc7:  41 88 2c 40             je              g78 #2c ~rfalse
 edcb:  41 87 79 40             je              g77 #79 ~rfalse
 edcf:  95 23                   inc             g13
 edd1:  43 23 03 56             jg              g13 #03 ~ede9
 edd5:  cd 4f 23 ff ff          store           g13 #ffff
 edda:  26 74 10 45             jin             "beautiful jeweled scarab" g00 ~ede1
 edde:  0b 74 07                set_attr        "beautiful jeweled scarab" #07
 ede1:  e0 0f 83 33 9f 71 00    call            10666 s253 -> sp
 ede8:  b8                      ret_popped      
 ede9:  41 23 03 66             je              g13 #03 ~ee11
 eded:  0a 74 07 40             test_attr       "beautiful jeweled scarab" #07 ~rfalse
 edf1:  b2 ...                  print           "You can see a scarab here in the sand."
 ee06:  bb                      new_line        
 ee07:  e0 1f 4a 98 74 00       call            9530 #74 -> sp
 ee0d:  0c 74 07                clear_attr      "beautiful jeweled scarab" #07
 ee10:  b0                      rtrue           
 ee11:  6f 22 23 00             loadw           g12 g13 -> sp
 ee15:  ad 00                   print_paddr     sp
 ee17:  bb                      new_line        
 ee18:  b0                      rtrue           

Routine ee1a, 2 locals (0000, 0000)

 ee1f:  41 01 03 00 6a          je              local0 #03 ~ee8c
 ee24:  b2 ...                  print           "You are about 10 feet above the ground nestled among some large branches. The nearest branch above you is above your reach."
 ee67:  bb                      new_line        
 ee68:  92 4b 02 40             get_child       "Forest Path" -> local1 ~rfalse
 ee6c:  a1 02 00 40             get_sibling     local1 -> sp ~rfalse
 ee70:  b2 ...                  print           "On the ground below you can see:  "
 ee83:  e0 1f 47 2c 4b 00       call            8e58 #4b -> sp
 ee89:  b3 ...                  print_ret       "."
 ee8c:  41 01 01 00 cd          je              local0 #01 ~ef5c
 ee91:  41 88 1f 4d             je              g78 #1f ~eea0
 ee95:  41 86 f1 49             je              g76 #f1 ~eea0
 ee99:  e0 1f 4a 38 16 00       call            9470 #16 -> sp
 ee9f:  b8                      ret_popped      
 eea0:  c1 97 88 20 1e 4d       je              g78 #20 #1e ~eeb1
 eea6:  41 86 f1 49             je              g76 #f1 ~eeb1
 eeaa:  e0 1f 4a 38 17 00       call            9470 #17 -> sp
 eeb0:  b8                      ret_popped      
 eeb1:  41 88 31 40             je              g78 #31 ~rfalse
 eeb5:  e0 3f 48 eb 00          call            91d6 -> sp
 eeba:  a0 00 c1                jz              sp rtrue
 eebd:  41 86 59 00 40          je              g76 #59 ~ef00
 eec2:  06 57 59 7c             jin             "jewel-encrusted egg" "bird's nest" ~ef00
 eec6:  b2 ...                  print           "The nest falls to the ground, and the egg spills out of it, seriously damaged."
 eef5:  bb                      new_line        
 eef6:  e0 1f 3c 5d 57 00       call            78ba #57 -> sp
 eefc:  0e 56 4b                insert_obj      "broken jewel-encrusted egg" "Forest Path"
 eeff:  b0                      rtrue           
 ef00:  41 86 57 71             je              g76 #57 ~ef33
 ef04:  b2 ...                  print           "The egg falls to the ground and springs open, seriously damaged."
 ef29:  0e 57 4b                insert_obj      "jewel-encrusted egg" "Forest Path"
 ef2c:  e0 3f 78 8c 00          call            f118 -> sp
 ef31:  bb                      new_line        
 ef32:  b0                      rtrue           
 ef33:  c1 a7 86 7f f1 d9       je              g76 g6f #f1 ef50
 ef39:  4e 86 4b                insert_obj      g76 "Forest Path"
 ef3c:  b2 ...                  print           "The "
 ef3f:  aa 86                   print_obj       g76
 ef41:  b3 ...                  print_ret       " falls to the ground."
 ef50:  41 88 45 40             je              g78 #45 ~rfalse
 ef54:  e0 0f 83 33 9f a2 00    call            10666 s257 -> sp
 ef5b:  b8                      ret_popped      
 ef5c:  41 01 02 40             je              local0 #02 ~rfalse
 ef60:  e0 03 2a 39 79 54 ff ff 00 
                               call            5472 #7954 #ffff -> sp
 ef69:  e1 97 00 00 01          storew          sp #00 #01
 ef6e:  b0                      rtrue           

Routine ef70, 0 locals ()

 ef71:  c1 97 88 2a 2b 00 f9    je              g78 #2a #2b ~f06f
 ef78:  41 86 57 00 f4          je              g76 #57 ~f06f
 ef7d:  4a 86 0b 4f             test_attr       g76 #0b ~ef8e
 ef81:  b3 ...                  print_ret       "The egg is already open."
 ef8e:  a0 87 5d                jz              g77 ~efac
 ef91:  b3 ...                  print_ret       "You have neither the tools nor the expertise."
 efac:  41 87 01 5f             je              g77 #01 ~efcd
 efb0:  b3 ...                  print_ret       "I doubt you could do that without damaging it."
 efcd:  4a 87 1d cb             test_attr       g77 #1d efda
 efd1:  4a 87 1c c7             test_attr       g77 #1c efda
 efd5:  41 88 2a 00 46          je              g78 #2a ~f01e
 efda:  b2 ...                  print           "The egg is now open, but the clumsiness of your attempt has seriously compromised its esthetic appeal."
 f017:  e0 3f 78 8c 00          call            f118 -> sp
 f01c:  bb                      new_line        
 f01d:  b0                      rtrue           
 f01e:  4a 86 02 68             test_attr       g76 #02 ~f048
 f022:  b2 ...                  print           "Not to say that using the "
 f033:  aa 87                   print_obj       g77
 f035:  b3 ...                  print_ret       " isn't original too..."
 f048:  b2 ...                  print           "The concept of using a "
 f057:  aa 87                   print_obj       g77
 f059:  b2 ...                  print           " is certainly original."
 f06a:  bb                      new_line        
 f06b:  4b 86 02                set_attr        g76 #02
 f06e:  b0                      rtrue           
 f06f:  c1 97 88 41 21 00 4c    je              g78 #41 #21 ~f0c0
 f076:  b2 ...                  print           "There is a noticeable crunch from beneath you, and inspection reveals that the egg is lying open, badly damaged."
 f0b9:  e0 3f 78 8c 00          call            f118 -> sp
 f0be:  bb                      new_line        
 f0bf:  b0                      rtrue           
 f0c0:  c1 95 88 7f 2a 2b 40    je              g78 #7f #2a #2b ~rfalse
 f0c7:  41 88 7f 45             je              g78 #7f ~f0ce
 f0cb:  6e 86 10                insert_obj      g76 g00
 f0ce:  b2 ...                  print           "Your rather indelicate handling of the egg has caused it some damage, although you have succeeded in opening it."
 f111:  e0 3f 78 8c 00          call            f118 -> sp
 f116:  bb                      new_line        
 f117:  b0                      rtrue           

Routine f118, 1 local (0000)

 f11b:  06 54 57 4e             jin             "golden clockwork canary" "jewel-encrusted egg" ~f12b
 f11f:  b2 ...                  print           " "
 f122:  11 53 0e 00             get_prop        "broken clockwork canary" #0e -> sp
 f126:  ad 00                   print_paddr     sp
 f128:  8c 00 08                jump            f131
 f12b:  e0 1f 3c 5d 53 00       call            78ba #53 -> sp
 f131:  93 57 00                get_parent      "jewel-encrusted egg" -> sp
 f134:  2e 56 00                insert_obj      "broken jewel-encrusted egg" sp
 f137:  e0 1f 3c 5d 57 00       call            78ba #57 -> sp
 f13d:  b0                      rtrue           

Routine f13e, 0 locals ()

 f13f:  41 88 8e 40             je              g78 #8e ~rfalse
 f143:  41 86 54 01 2e          je              g76 #54 ~f274
 f148:  a0 21 00 ff             jz              g11 ~f249
 f14c:  e0 3f 79 4c 00          call            f298 -> sp
 f151:  a0 00 80 f6             jz              sp f249
 f155:  b2 ...                  print           "The canary chirps, slightly off-key, an aria from a forgotten opera. From out of the greenery flies a lovely songbird. It perches on a limb just over your head and opens its beak to sing. As it does so a beautiful brass bauble drops from its mouth, bounces off the top of your head, and lands glimmering in the grass. As the canary winds down, the songbird flies away."
 f234:  bb                      new_line        
 f235:  0d 21 01                store           g11 #01
 f238:  41 10 58 48             je              g00 #58 ~f242
 f23c:  e8 7f 4b                push            #4b
 f23f:  8c 00 05                jump            f245
 f242:  e8 bf 10                push            g00
 f245:  2e 55 00                insert_obj      "beautiful brass bauble" sp
 f248:  b0                      rtrue           
 f249:  b3 ...                  print_ret       "The canary chirps blithely, if somewhat tinnily, for a short time."
 f274:  b3 ...                  print_ret       "There is an unpleasant grinding noise from inside the canary."

Routine f298, 0 locals ()

 f299:  c1 95 10 4e 4d 4c c1    je              g00 #4e #4d #4c rtrue
 f2a0:  c1 97 10 4b 58 c1       je              g00 #4b #58 rtrue
 f2a6:  b1                      rfalse          

Routine f2a8, 0 locals ()

 f2a9:  e0 3f 79 4c 00          call            f298 -> sp
 f2ae:  a0 00 4f                jz              sp ~f2be
 f2b1:  e0 0f 2a 43 79 54 00    call            5486 #7954 -> sp
 f2b8:  e1 97 00 00 00          storew          sp #00 #00
 f2bd:  b1                      rfalse          
 f2be:  e7 7f 64 00             random          #64 -> sp
 f2c2:  23 0f 00 40             jg              #0f sp ~rfalse
 f2c6:  b3 ...                  print_ret       "You hear in the distance the chirping of a song bird."

Routine f2e8, 1 local (0000)

 f2eb:  41 01 02 51             je              local0 #02 ~f2fe
 f2ef:  e0 03 2a 39 79 54 ff ff 00 
                               call            5472 #7954 #ffff -> sp
 f2f8:  e1 97 00 00 01          storew          sp #00 #01
 f2fd:  b0                      rtrue           
 f2fe:  41 01 01 40             je              local0 #01 ~rfalse
 f302:  c1 97 88 1e 20 40       je              g78 #1e #20 ~rfalse
 f308:  41 86 f1 40             je              g76 #f1 ~rfalse
 f30c:  e0 1f 4a 38 17 00       call            9470 #17 -> sp
 f312:  b8                      ret_popped      

Routine f314, 0 locals ()

 f315:  c1 95 88 20 1f 1e 40    je              g78 #20 #1f #1e ~rfalse
 f31c:  b3 ...                  print_ret       "The cliff is too steep for climbing."

Routine f332, 0 locals ()

 f333:  41 88 45 ca             je              g78 #45 f33f
 f337:  41 88 12 65             je              g78 #12 ~f35e
 f33b:  41 86 05 61             je              g76 #05 ~f35e
 f33f:  b3 ...                  print_ret       "That would be very unwise. Perhaps even fatal."
 f35e:  41 87 5d 40             je              g77 #5d ~rfalse
 f362:  c1 97 88 81 12 40       je              g78 #81 #12 ~rfalse
 f368:  b2 ...                  print           "The "
 f36b:  aa 86                   print_obj       g76
 f36d:  b2 ...                  print           " tumbles into the river and is seen no more."
 f384:  bb                      new_line        
 f385:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 f38b:  b8                      ret_popped      

Routine f38c, 1 local (0000)

 f38f:  41 10 85 d8             je              g00 #85 f3a9
 f393:  0d a3 00                store           g93 #00
 f396:  41 88 82 40             je              g78 #82 ~rfalse
 f39a:  b3 ...                  print_ret       "You can't tie the rope to that."
 f3a9:  41 88 82 00 56          je              g78 #82 ~f402
 f3ae:  41 87 86 40             je              g77 #86 ~rfalse
 f3b2:  a0 a3 d3                jz              g93 f3c6
 f3b5:  b3 ...                  print_ret       "The rope is already tied to it."
 f3c6:  b2 ...                  print           "The rope drops over the side and comes within ten feet of the floor."
 f3ed:  bb                      new_line        
 f3ee:  0d a3 01                store           g93 #01
 f3f1:  0b 81 0e                set_attr        "rope" #0e
 f3f4:  93 81 01                get_parent      "rope" -> local0
 f3f7:  a0 01 c6                jz              local0 f3fe
 f3fa:  46 01 52 c1             jin             local0 #52 rtrue
 f3fe:  2e 81 10                insert_obj      "rope" g00
 f401:  b0                      rtrue           
 f402:  41 88 1f 50             je              g78 #1f ~f414
 f406:  41 86 81 4c             je              g76 #81 ~f414
 f40a:  a0 a3 c9                jz              g93 f414
 f40d:  e0 1f 4a 38 16 00       call            9470 #16 -> sp
 f413:  b8                      ret_popped      
 f414:  41 88 83 00 63          je              g78 #83 ~f47a
 f419:  21 81 87 00 5e          je              #81 g77 ~f47a
 f41e:  4a 86 1e 00 47          test_attr       g76 #1e ~f468
 f423:  51 86 07 00             get_prop        g76 #07 -> sp
 f427:  42 00 00 65             jl              sp #00 ~f44e
 f42b:  b2 ...                  print           "Your attempt to tie up the "
 f43a:  aa 86                   print_obj       g76
 f43c:  b2 ...                  print           " awakens him."
 f447:  e0 2f 80 6c 86 00       call            100d8 g76 -> sp
 f44d:  b8                      ret_popped      
 f44e:  b2 ...                  print           "The "
 f451:  aa 86                   print_obj       g76
 f453:  b3 ...                  print_ret       " struggles and you cannot tie him up."
 f468:  b2 ...                  print           "Why would you tie up a "
 f475:  aa 86                   print_obj       g76
 f477:  b3 ...                  print_ret       "?"
 f47a:  41 88 86 6b             je              g78 #86 ~f4a7
 f47e:  a0 a3 d7                jz              g93 f496
 f481:  0d a3 00                store           g93 #00
 f484:  0c 81 0e                clear_attr      "rope" #0e
 f487:  b3 ...                  print_ret       "The rope is now untied."
 f496:  b3 ...                  print_ret       "It is not tied to anything."
 f4a7:  41 88 31 67             je              g78 #31 ~f4d0
 f4ab:  41 10 85 63             je              g00 #85 ~f4d0
 f4af:  a0 a3 60                jz              g93 ~f4d0
 f4b2:  0e 81 69                insert_obj      "rope" "Torch Room"
 f4b5:  b3 ...                  print_ret       "The rope drops gently to the floor below."
 f4d0:  41 88 5d 40             je              g78 #5d ~rfalse
 f4d4:  a0 a3 c0                jz              g93 rfalse
 f4d7:  b3 ...                  print_ret       "The rope is tied to the railing."

Routine f4ea, 0 locals ()

 f4eb:  41 86 81 51             je              g76 #81 ~f4fe
 f4ef:  a0 a3 ce                jz              g93 f4fe
 f4f2:  41 87 86 4a             je              g77 #86 ~f4fe
 f4f6:  e0 1b 2b be 86 86 00    call            577c #86 g76 -> sp
 f4fd:  b8                      ret_popped      
 f4fe:  b3 ...                  print_ret       "It's not attached to that!"

Routine f50e, 0 locals ()

 f50f:  c1 95 88 1f 1e 22 c6    je              g78 #1f #1e #22 f51a
 f516:  41 88 20 ca             je              g78 #20 f522
 f51a:  41 88 12 6e             je              g78 #12 ~f54a
 f51e:  41 86 05 6a             je              g76 #05 ~f54a
 f522:  41 10 48 49             je              g00 #48 ~f52d
 f526:  e0 1f 4a 38 1d 00       call            9470 #1d -> sp
 f52c:  b0                      rtrue           
 f52d:  b2 ...                  print           "You tumble down the slide...."
 f542:  bb                      new_line        
 f543:  e0 1f 49 5b 48 00       call            92b6 #48 -> sp
 f549:  b8                      ret_popped      
 f54a:  41 88 12 40             je              g78 #12 ~rfalse
 f54e:  e0 2f 7a ab 86 00       call            f556 g76 -> sp
 f554:  b8                      ret_popped      

Routine f556, 1 local (0000)

 f559:  4a 01 11 6a             test_attr       local0 #11 ~f585
 f55d:  b2 ...                  print           "The "
 f560:  aa 01                   print_obj       local0
 f562:  b2 ...                  print           " falls into the slide and is gone."
 f575:  bb                      new_line        
 f576:  41 01 ed 49             je              local0 #ed ~f581
 f57a:  e0 2f 3c 5d 01 00       call            78ba local0 -> sp
 f580:  b8                      ret_popped      
 f581:  4e 01 48                insert_obj      local0 "Cellar"
 f584:  b0                      rtrue           
 f585:  e0 2f 27 36 45 00       call            4e6c g35 -> sp
 f58b:  ad 00                   print_paddr     sp
 f58d:  bb                      new_line        
 f58e:  b0                      rtrue           

Routine f590, 0 locals ()

 f591:  41 88 75 40             je              g78 #75 ~rfalse
 f595:  26 e1 86 40             jin             "lunch" g76 ~rfalse
 f599:  b3 ...                  print_ret       "It smells of hot peppers."

Routine f5aa, 2 locals (0000, 0000)

 f5af:  41 88 89 5d             je              g78 #89 ~f5ce
 f5b3:  41 10 ce 40             je              g00 #ce ~rfalse
 f5b7:  41 86 1d 40             je              g76 #1d ~rfalse
 f5bb:  b3 ...                  print_ret       "You cannot enter in your condition."
 f5ce:  c1 95 88 02 00 01 c0    je              g78 #02 #00 #01 rfalse
 f5d5:  c1 95 88 08 0f 0c c0    je              g78 #08 #0f #0c rfalse
 f5dc:  c1 95 88 06 05 07 c0    je              g78 #06 #05 #07 rfalse
 f5e3:  c1 95 88 88 2a 13 c6    je              g78 #88 #2a #13 f5ee
 f5ea:  41 88 7e 5d             je              g78 #7e ~f609
 f5ee:  b3 ...                  print_ret       "All such attacks are vain in your condition."
 f609:  c1 95 88 33 23 2b d6    je              g78 #33 #23 #2b f624
 f610:  c1 95 88 29 17 2f cf    je              g78 #29 #17 #2f f624
 f617:  c1 95 88 82 1c 59 c8    je              g78 #82 #1c #59 f624
 f61e:  c1 97 88 6e 86 61       je              g78 #6e #86 ~f643
 f624:  b3 ...                  print_ret       "Even such an action is beyond your capabilities."
 f643:  41 88 87 5f             je              g78 #87 ~f664
 f647:  b3 ...                  print_ret       "Might as well. You've got an eternity."
 f664:  41 88 0e 57             je              g78 #0e ~f67d
 f668:  b3 ...                  print_ret       "You need no light to guide you."
 f67d:  41 88 09 59             je              g78 #09 ~f698
 f681:  b3 ...                  print_ret       "You're dead! How can you think of your score?"
 f698:  41 88 5d 55             je              g78 #5d ~f6af
 f69c:  b3 ...                  print_ret       "Your hand passes through its object."
 f6af:  c1 95 88 04 7f 31 51    je              g78 #04 #7f #31 ~f6c5
 f6b6:  b3 ...                  print_ret       "You have no possessions."
 f6c5:  41 88 03 4b             je              g78 #03 ~f6d2
 f6c9:  b3 ...                  print_ret       "You are dead."
 f6d2:  41 88 4f 00 61          je              g78 #4f ~f736
 f6d7:  b2 ...                  print           "The room looks strange and unearthly"
 f6ec:  a2 10 00 c8             get_child       g00 -> sp f6f6
 f6f0:  b2 ...                  print           "."
 f6f3:  8c 00 17                jump            f70b
 f6f6:  b2 ...                  print           " and objects appear indistinct."
 f70b:  bb                      new_line        
 f70c:  4a 10 14 e6             test_attr       g00 #14 f734
 f710:  b2 ...                  print           "Although there is no light, the room seems dimly illuminated."
 f733:  bb                      new_line        
 f734:  bb                      new_line        
 f735:  b1                      rfalse          
 f736:  41 88 62 00 e6          je              g78 #62 ~f81f
 f73b:  41 10 d4 00 d2          je              g00 #d4 ~f810
 f740:  0c a4 07                clear_attr      "brass lantern" #07
 f743:  e3 97 7f 11 00          put_prop        g6f #11 #00
 f748:  0d 89 00                store           g79 #00
 f74b:  0d 58 00                store           g48 #00
 f74e:  0d 4e 00                store           g3e #00
 f751:  06 d9 66 45             jin             "troll" "The Troll Room" ~f758
 f755:  0d 9d 00                store           g8d #00
 f758:  b2 ...                  print           "From the distance the sound of a lone trumpet is heard. The room becomes very bright and you feel disembodied. In a moment, the brightness fades and you find yourself rising as if from a long sleep, deep in the woods. In the distance you can faintly hear a songbird and the sounds of the forest."
 f807:  bb                      new_line        
 f808:  bb                      new_line        
 f809:  e0 1f 49 5b 4e 00       call            92b6 #4e -> sp
 f80f:  b8                      ret_popped      
 f810:  b3 ...                  print_ret       "Your prayers are not heard."
 f81f:  b2 ...                  print           "You can't even do that."
 f82c:  bb                      new_line        
 f82d:  0d 7c 00                store           g6c #00
 f830:  9b 02                   ret             #02

Routine f832, 0 locals ()

 f833:  a0 a0 d9                jz              g90 f84d
 f836:  b3 ...                  print_ret       "There's not much lake left...."
 f84d:  41 88 26 4f             je              g78 #26 ~f85e
 f851:  b3 ...                  print_ret       "It's too wide to cross."
 f85e:  41 88 22 40             je              g78 #22 ~rfalse
 f862:  b3 ...                  print_ret       "You can't swim in this lake."

Routine f872, 0 locals ()

 f873:  c1 97 88 22 7d 51       je              g78 #22 #7d ~f888
 f879:  b3 ...                  print_ret       "You can't swim in the stream."
 f888:  41 88 26 40             je              g78 #26 ~rfalse
 f88c:  b3 ...                  print_ret       "The other side is a sheer rock cliff."

Routine f8a4, 0 locals ()

 f8a5:  41 88 45 ca             je              g78 #45 f8b1
 f8a9:  41 88 12 69             je              g78 #12 ~f8d4
 f8ad:  41 86 05 65             je              g76 #05 ~f8d4
 f8b1:  b3 ...                  print_ret       "You look before leaping, and realize that you would never survive."
 f8d4:  41 88 26 5b             je              g78 #26 ~f8f1
 f8d8:  b3 ...                  print_ret       "It's too far to jump, and there's no bridge."
 f8f1:  c1 97 88 81 12 40       je              g78 #81 #12 ~rfalse
 f8f7:  41 87 0d 40             je              g77 #0d ~rfalse
 f8fb:  b2 ...                  print           "The "
 f8fe:  aa 86                   print_obj       g76
 f900:  b2 ...                  print           " drops out of sight into the chasm."
 f915:  bb                      new_line        
 f916:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
 f91c:  b8                      ret_popped      

Routine f91e, 0 locals ()

 f91f:  41 88 48 40             je              g78 #48 ~rfalse
 f923:  b3 ...                  print_ret       "No."

Routine f928, 0 locals ()

 f929:  41 88 22 49             je              g78 #22 ~f934
 f92d:  e0 1f 4a 38 15 00       call            9470 #15 -> sp
 f933:  b0                      rtrue           
 f934:  b3 ...                  print_ret       "The gate is protected by an invisible force. It makes your teeth ache to touch it."

Routine f968, 0 locals ()

 f969:  c1 97 88 23 2b 4d       je              g78 #23 #2b ~f97a
 f96f:  b3 ...                  print_ret       "The door won't budge."
 f97a:  41 88 22 40             je              g78 #22 ~rfalse
 f97e:  e0 1f 4a 38 1c 00       call            9470 #1c -> sp
 f984:  b8                      ret_popped      

Routine f986, 0 locals ()

 f987:  41 88 2a 40             je              g78 #2a ~rfalse
 f98b:  b3 ...                  print_ret       "Some paint chips away, revealing more paint."

Routine f9ac, 0 locals ()

 f9ad:  41 88 18 57             je              g78 #18 ~f9c6
 f9b1:  b3 ...                  print_ret       "There is too much gas to blow away."
 f9c6:  41 88 75 40             je              g78 #75 ~rfalse
 f9ca:  b3 ...                  print_ret       "It smells like coal gas in here."

Routine f9e0, 6 locals (0000, 0000, 0000, 0000, 0000, 0000)

 f9ed:  0d 02 00                store           local1 #00
 f9f0:  95 02                   inc             local1
 f9f2:  61 02 01 48             je              local1 local0 ~f9fc
 f9f6:  0d 03 01                store           local2 #01
 f9f9:  8c 00 40                jump            fa3a
 f9fc:  6f 13 02 05             loadw           g03 local1 -> local4
 fa00:  4f 05 00 04             loadw           local4 #00 -> local3
 fa04:  4a 04 02 c5             test_attr       local3 #02 fa0b
 fa08:  8c ff e7                jump            f9f0
 fa0b:  51 04 11 00             get_prop        local3 #11 -> sp
 fa0f:  e0 9f 00 01 00          call            sp #01 -> sp
 fa14:  a0 00 c5                jz              sp fa1a
 fa17:  8c ff d8                jump            f9f0
 fa1a:  e0 2b 7d 87 05 06 03    call            fb0e local4 local5 -> local2
 fa21:  a0 03 48                jz              local2 ~fa2a
 fa24:  0d 03 00                store           local2 #00
 fa27:  8c 00 12                jump            fa3a
 fa2a:  41 03 02 3f c3          je              local2 #02 ~f9f0
 fa2f:  e7 7f 03 00             random          #03 -> sp
 fa33:  34 01 00 06             add             #01 sp -> local5
 fa37:  8c ff b8                jump            f9f0
 fa3a:  a0 03 c1                jz              local2 rtrue
 fa3d:  a0 06 c1                jz              local5 rtrue
 fa40:  a6 06                   dec             [local5]
 fa42:  a0 06 3f a9             jz              local5 ~f9ed
 fa46:  b0                      rtrue           

Routine fa48, 6 locals (0000, 0000, 0000, 0000, 0000, 0000)

 fa55:  4f 01 00 04             loadw           local0 #00 -> local3
 fa59:  25 05 04 45             inc_chk         local4 local3 ~fa60
 fa5d:  8c 00 1d                jump            fa7b
 fa60:  6f 01 05 06             loadw           local0 local4 -> local5
 fa64:  41 06 00 47             je              local5 #00 ~fa6d
 fa68:  aa 03                   print_obj       local2
 fa6a:  8c ff ee                jump            fa59
 fa6d:  41 06 01 47             je              local5 #01 ~fa76
 fa71:  aa 02                   print_obj       local1
 fa73:  8c ff e5                jump            fa59
 fa76:  ad 06                   print_paddr     local5
 fa78:  8c ff e0                jump            fa59
 fa7b:  bb                      new_line        
 fa7c:  b0                      rtrue           

Routine fa7e, 2 locals (0001, 0000)

 fa83:  15 07 02 00             sub             #07 #02 -> sp
 fa87:  77 a7 00 00             div             g97 sp -> sp
 fa8b:  77 11 00 00             div             g01 sp -> sp
 fa8f:  34 02 00 02             add             #02 sp -> local1
 fa93:  a0 01 cb                jz              local0 fa9f
 fa96:  51 7f 07 00             get_prop        g6f #07 -> sp
 fa9a:  74 02 00 00             add             local1 sp -> sp
 fa9e:  b8                      ret_popped      
 fa9f:  ab 02                   ret             local1

Routine faa2, 4 locals (0000, 0000, 0000, 0000)

 faab:  4f 01 00 02             loadw           local0 #00 -> local1
 faaf:  51 02 07 03             get_prop        local1 #07 -> local2
 fab3:  42 03 00 f4             jl              local2 #00 fae9
 fab7:  41 02 72 4f             je              local1 #72 ~fac8
 fabb:  a0 2e cc                jz              g1e fac8
 fabe:  43 03 02 45             jg              local2 #02 ~fac5
 fac2:  0d 03 02                store           local2 #02
 fac5:  0d 2e 00                store           g1e #00
 fac8:  a0 87 e0                jz              g77 fae9
 facb:  4a 87 1d 5c             test_attr       g77 #1d ~fae9
 facf:  4f 01 01 00             loadw           local0 #01 -> sp
 fad3:  61 00 87 54             je              sp g77 ~fae9
 fad7:  4f 01 02 00             loadw           local0 #02 -> sp
 fadb:  75 03 00 04             sub             local2 sp -> local3
 fadf:  42 04 01 45             jl              local3 #01 ~fae6
 fae3:  0d 04 01                store           local3 #01
 fae6:  2d 03 04                store           local2 local3
 fae9:  ab 03                   ret             local2

Routine faec, 2 locals (0000, 0000)

 faf1:  a2 01 02 c2             get_child       local0 -> local1 faf5
 faf5:  a0 02 c0                jz              local1 rfalse
 faf8:  c1 95 02 71 da 6e c8    je              local1 #71 #da #6e fb05
 faff:  c1 97 02 a9 80 44       je              local1 #a9 #80 ~fb07
 fb05:  ab 02                   ret             local1
 fb07:  a1 02 02 bf ee          get_sibling     local1 -> local1 faf8
 fb0c:  b1                      rfalse          

Routine fb0e, 12 locals (0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000)

 fb27:  4f 01 00 03             loadw           local0 #00 -> local2
 fb2b:  4f 01 04 04             loadw           local0 #04 -> local3
 fb2f:  4c 7f 01                clear_attr      g6f #01
 fb32:  4a 03 01 5d             test_attr       local2 #01 ~fb51
 fb36:  b2 ...                  print           "The "
 fb39:  aa 03                   print_obj       local2
 fb3b:  b2 ...                  print           " slowly regains his feet."
 fb4c:  bb                      new_line        
 fb4d:  4c 03 01                clear_attr      local2 #01
 fb50:  b0                      rtrue           
 fb51:  e0 2f 7d 51 01 00       call            faa2 local0 -> sp
 fb57:  2d 06 00                store           local5 sp
 fb5a:  0d 08 01                store           local7 #01
 fb5d:  e0 3f 7d 3f 07          call            fa7e -> local6
 fb62:  43 07 00 41             jg              local6 #00 ~rtrue
 fb66:  e0 1f 7d 3f 00 09       call            fa7e #00 -> local8
 fb6c:  e0 2f 7d 76 7f 05       call            faec g6f -> local4
 fb72:  42 07 00 48             jl              local6 #00 ~fb7c
 fb76:  0d 0b 03                store           local10 #03
 fb79:  8c 00 98                jump            fc12
 fb7c:  41 07 01 54             je              local6 #01 ~fb92
 fb80:  43 06 02 45             jg              local5 #02 ~fb87
 fb84:  0d 06 03                store           local5 #03
 fb87:  55 06 01 00             sub             local5 #01 -> sp
 fb8b:  6f 1a 00 0a             loadw           g0a sp -> local9
 fb8f:  8c 00 3d                jump            fbcd
 fb92:  41 07 02 54             je              local6 #02 ~fba8
 fb96:  43 06 03 45             jg              local5 #03 ~fb9d
 fb9a:  0d 06 04                store           local5 #04
 fb9d:  55 06 01 00             sub             local5 #01 -> sp
 fba1:  6f 19 00 0a             loadw           g09 sp -> local9
 fba5:  8c 00 27                jump            fbcd
 fba8:  43 07 02 63             jg              local6 #02 ~fbcd
 fbac:  75 06 07 06             sub             local5 local6 -> local5
 fbb0:  c2 8f 06 ff ff 4a       jl              local5 #ffff ~fbbe
 fbb6:  cd 4f 06 ff fe          store           local5 #fffe
 fbbb:  8c 00 09                jump            fbc5
 fbbe:  43 06 01 45             jg              local5 #01 ~fbc5
 fbc2:  0d 06 02                store           local5 #02
 fbc5:  54 06 02 00             add             local5 #02 -> sp
 fbc9:  6f 18 00 0a             loadw           g08 sp -> local9
 fbcd:  e7 7f 09 00             random          #09 -> sp
 fbd1:  55 00 01 00             sub             sp #01 -> sp
 fbd5:  6f 0a 00 0b             loadw           local9 sp -> local10
 fbd9:  a0 02 cf                jz              local1 fbe9
 fbdc:  41 0b 06 48             je              local10 #06 ~fbe6
 fbe0:  0d 0b 08                store           local10 #08
 fbe3:  8c 00 05                jump            fbe9
 fbe6:  0d 0b 09                store           local10 #09
 fbe9:  41 0b 06 51             je              local10 #06 ~fbfc
 fbed:  a0 05 ce                jz              local4 fbfc
 fbf0:  e0 1f 27 21 19 00       call            4e42 #19 -> sp
 fbf6:  a0 00 c5                jz              sp fbfc
 fbf9:  0d 0b 07                store           local10 #07
 fbfc:  55 0b 01 00             sub             local10 #01 -> sp
 fc00:  6f 04 00 00             loadw           local3 sp -> sp
 fc04:  e0 2f 27 2e 00 00       call            4e5c sp -> sp
 fc0a:  e0 2a 7d 24 00 7f 05 00 call            fa48 sp g6f local4 -> sp
 fc12:  41 0b 01 80 7e          je              local10 #01 fc93
 fc17:  41 0b 08 45             je              local10 #08 ~fc1e
 fc1b:  8c 00 77                jump            fc93
 fc1e:  41 0b 02 45             je              local10 #02 ~fc25
 fc22:  8c 00 70                jump            fc93
 fc25:  41 0b 03 c6             je              local10 #03 fc2d
 fc29:  41 0b 09 48             je              local10 #09 ~fc33
 fc2d:  0d 07 00                store           local6 #00
 fc30:  8c 00 62                jump            fc93
 fc33:  41 0b 04 57             je              local10 #04 ~fc4c
 fc37:  96 07                   dec             local6
 fc39:  42 07 00 45             jl              local6 #00 ~fc40
 fc3d:  0d 07 00                store           local6 #00
 fc40:  43 95 32 00 50          jg              g85 #32 ~fc93
 fc45:  55 95 0a 95             sub             g85 #0a -> g85
 fc49:  8c 00 49                jump            fc93
 fc4c:  41 0b 05 58             je              local10 #05 ~fc66
 fc50:  55 07 02 07             sub             local6 #02 -> local6
 fc54:  42 07 00 45             jl              local6 #00 ~fc5b
 fc58:  0d 07 00                store           local6 #00
 fc5b:  43 95 32 76             jg              g85 #32 ~fc93
 fc5f:  55 95 14 95             sub             g85 #14 -> g85
 fc63:  8c 00 2f                jump            fc93
 fc66:  41 0b 06 48             je              local10 #06 ~fc70
 fc6a:  4b 7f 01                set_attr        g6f #01
 fc6d:  8c 00 25                jump            fc93
 fc70:  41 0b 07 42             je              local10 #07 ~fc74
 fc74:  6e 05 10                insert_obj      local4 g00
 fc77:  e0 2f 7d 76 7f 0c       call            faec g6f -> local11
 fc7d:  a0 0c d5                jz              local11 fc93
 fc80:  b2 ...                  print           "Fortunately, you still have a "
 fc8d:  aa 0c                   print_obj       local11
 fc8f:  b2 ...                  print           "."
 fc92:  bb                      new_line        
 fc93:  e0 2a 7f 4d 07 0b 09 00 call            fe9a local6 local10 local8 -> sp
 fc9b:  b8                      ret_popped      

Routine fc9c, 13 locals (0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000)

 fcb7:  4f 13 00 0d             loadw           g03 #00 -> local12
 fcbb:  95 07                   inc             local6
 fcbd:  61 07 0d 45             je              local6 local12 ~fcc4
 fcc1:  8c 00 0f                jump            fcd1
 fcc4:  6f 13 07 01             loadw           g03 local6 -> local0
 fcc8:  4f 01 00 00             loadw           local0 #00 -> sp
 fccc:  61 00 86 3f ec          je              sp g76 ~fcbb
 fcd1:  4b 86 02                set_attr        g76 #02
 fcd4:  4a 7f 01 74             test_attr       g6f #01 ~fd0a
 fcd8:  b2 ...                  print           "You are still recovering from that last blow, so your attack is ineffective."
 fd05:  bb                      new_line        
 fd06:  4c 7f 01                clear_attr      g6f #01
 fd09:  b0                      rtrue           
 fd0a:  e0 3f 7d 3f 05          call            fa7e -> local4
 fd0f:  42 05 01 45             jl              local4 #01 ~fd16
 fd13:  0d 05 01                store           local4 #01
 fd16:  2d 08 05                store           local7 local4
 fd19:  4f 01 00 02             loadw           local0 #00 -> local1
 fd1d:  e0 2f 7d 51 01 00       call            faa2 local0 -> sp
 fd23:  2d 06 00                store           local5 sp
 fd26:  0d 09 01                store           local8 #01
 fd29:  a0 09 66                jz              local8 ~fd50
 fd2c:  61 86 7f 4a             je              g76 g6f ~fd38
 fd30:  e0 0f 83 33 9f ad 00    call            10666 s258 -> sp
 fd37:  b8                      ret_popped      
 fd38:  b2 ...                  print           "Attacking the "
 fd43:  aa 02                   print_obj       local1
 fd45:  b3 ...                  print_ret       " is pointless."
 fd50:  e0 2f 7d 76 02 04       call            faec local1 -> local3
 fd56:  a0 04 c6                jz              local3 fd5d
 fd59:  42 06 00 7c             jl              local5 #00 ~fd97
 fd5d:  b2 ...                  print           "The "
 fd60:  a0 04 4c                jz              local3 ~fd6d
 fd63:  b2 ...                  print           "unarmed"
 fd6a:  8c 00 0b                jump            fd76
 fd6d:  b2 ...                  print           "unconscious"
 fd76:  b2 ...                  print           " "
 fd79:  aa 02                   print_obj       local1
 fd7b:  b2 ...                  print           " cannot defend himself: He dies."
 fd90:  bb                      new_line        
 fd91:  0d 0b 03                store           local10 #03
 fd94:  8c 00 97                jump            fe2c
 fd97:  41 06 01 54             je              local5 #01 ~fdad
 fd9b:  43 05 02 45             jg              local4 #02 ~fda2
 fd9f:  0d 05 03                store           local4 #03
 fda2:  55 05 01 00             sub             local4 #01 -> sp
 fda6:  6f 1a 00 0a             loadw           g0a sp -> local9
 fdaa:  8c 00 3d                jump            fde8
 fdad:  41 06 02 54             je              local5 #02 ~fdc3
 fdb1:  43 05 03 45             jg              local4 #03 ~fdb8
 fdb5:  0d 05 04                store           local4 #04
 fdb8:  55 05 01 00             sub             local4 #01 -> sp
 fdbc:  6f 19 00 0a             loadw           g09 sp -> local9
 fdc0:  8c 00 27                jump            fde8
 fdc3:  43 06 02 63             jg              local5 #02 ~fde8
 fdc7:  75 05 06 05             sub             local4 local5 -> local4
 fdcb:  c2 8f 05 ff ff 4a       jl              local4 #ffff ~fdd9
 fdd1:  cd 4f 05 ff fe          store           local4 #fffe
 fdd6:  8c 00 09                jump            fde0
 fdd9:  43 05 01 45             jg              local4 #01 ~fde0
 fddd:  0d 05 02                store           local4 #02
 fde0:  54 05 02 00             add             local4 #02 -> sp
 fde4:  6f 18 00 0a             loadw           g08 sp -> local9
 fde8:  e7 7f 09 00             random          #09 -> sp
 fdec:  55 00 01 00             sub             sp #01 -> sp
 fdf0:  6f 0a 00 0b             loadw           local9 sp -> local10
 fdf4:  a0 03 cf                jz              local2 fe04
 fdf7:  41 0b 06 48             je              local10 #06 ~fe01
 fdfb:  0d 0b 08                store           local10 #08
 fdfe:  8c 00 05                jump            fe04
 fe01:  0d 0b 09                store           local10 #09
 fe04:  41 0b 06 50             je              local10 #06 ~fe16
 fe08:  a0 04 cd                jz              local3 fe16
 fe0b:  e7 7f 64 00             random          #64 -> sp
 fe0f:  23 19 00 45             jg              #19 sp ~fe16
 fe13:  0d 0b 07                store           local10 #07
 fe16:  55 0b 01 00             sub             local10 #01 -> sp
 fe1a:  6f 17 00 00             loadw           g07 sp -> sp
 fe1e:  e0 2f 27 2e 00 00       call            4e5c sp -> sp
 fe24:  e0 2a 7d 24 00 86 87 00 call            fa48 sp g76 g77 -> sp
 fe2c:  41 0b 01 80 61          je              local10 #01 fe90
 fe31:  41 0b 08 45             je              local10 #08 ~fe38
 fe35:  8c 00 5a                jump            fe90
 fe38:  41 0b 02 49             je              local10 #02 ~fe43
 fe3c:  35 00 06 06             sub             #00 local5 -> local5
 fe40:  8c 00 4f                jump            fe90
 fe43:  41 0b 03 c6             je              local10 #03 fe4b
 fe47:  41 0b 09 48             je              local10 #09 ~fe51
 fe4b:  0d 06 00                store           local5 #00
 fe4e:  8c 00 41                jump            fe90
 fe51:  41 0b 04 4e             je              local10 #04 ~fe61
 fe55:  96 06                   dec             local5
 fe57:  42 06 00 77             jl              local5 #00 ~fe90
 fe5b:  0d 06 00                store           local5 #00
 fe5e:  8c 00 31                jump            fe90
 fe61:  41 0b 05 50             je              local10 #05 ~fe73
 fe65:  55 06 02 06             sub             local5 #02 -> local5
 fe69:  42 06 00 65             jl              local5 #00 ~fe90
 fe6d:  0d 06 00                store           local5 #00
 fe70:  8c 00 1f                jump            fe90
 fe73:  41 0b 06 48             je              local10 #06 ~fe7d
 fe77:  4b 86 01                set_attr        g76 #01
 fe7a:  8c 00 15                jump            fe90
 fe7d:  41 0b 07 42             je              local10 #07 ~fe81
 fe81:  4c 04 0e                clear_attr      local3 #0e
 fe84:  4b 04 1d                set_attr        local3 #1d
 fe87:  6e 04 10                insert_obj      local3 g00
 fe8a:  e0 2f 4a 98 04 00       call            9530 local3 -> sp
 fe90:  e0 2a 7f 78 86 06 0b 00 call            fef0 g76 local5 local10 -> sp
 fe98:  b8                      ret_popped      

Routine fe9a, 3 locals (0000, 0000, 0000)

 fea1:  a0 01 49                jz              local0 ~feab
 fea4:  e8 3f d8 f0             push            #d8f0
 fea8:  8c 00 06                jump            feaf
 feab:  75 01 03 00             sub             local0 local2 -> sp
 feaf:  e3 9b 7f 07 00          put_prop        g6f #07 sp
 feb4:  75 01 03 00             sub             local0 local2 -> sp
 feb8:  42 00 00 4f             jl              sp #00 ~fec9
 febc:  e0 07 2a 39 7f ea 1e 00 call            5472 #7fea #1e -> sp
 fec4:  e1 97 00 00 01          storew          sp #00 #01
 fec9:  e0 3f 7d 3f 00          call            fa7e -> sp
 fece:  43 00 00 dd             jg              sp #00 feed
 fed2:  e0 1f 7d 3f 00 00       call            fa7e #00 -> sp
 fed8:  35 00 00 00             sub             #00 sp -> sp
 fedc:  34 01 00 00             add             #01 sp -> sp
 fee0:  e3 9b 7f 07 00          put_prop        g6f #07 sp
 fee5:  e0 0f 83 33 9f bf 00    call            10666 s259 -> sp
 feec:  b1                      rfalse          
 feed:  ab 02                   ret             local1

Routine fef0, 3 locals (0000, 0000, 0000)

 fef7:  e3 9b 01 07 02          put_prop        local0 #07 local1
 fefc:  a0 02 00 75             jz              local1 ~ff73
 ff00:  4c 01 02                clear_attr      local0 #02
 ff03:  b2 ...                  print           "Almost as soon as the "
 ff12:  aa 01                   print_obj       local0
 ff14:  b2 ...                  print           " breathes his last breath, a cloud of sinister black fog envelops him, and when the fog lifts, the carcass has disappeared."
 ff61:  bb                      new_line        
 ff62:  e0 2f 3c 5d 01 00       call            78ba local0 -> sp
 ff68:  51 01 11 00             get_prop        local0 #11 -> sp
 ff6c:  e0 9f 00 02 00          call            sp #02 -> sp
 ff71:  ab 03                   ret             local2
 ff73:  41 03 02 4d             je              local2 #02 ~ff82
 ff77:  51 01 11 00             get_prop        local0 #11 -> sp
 ff7b:  e0 9f 00 03 00          call            sp #03 -> sp
 ff80:  ab 03                   ret             local2
 ff82:  ab 03                   ret             local2

Routine ff84, 3 locals (0000, 0000, 0000)

 ff8b:  51 01 07 02             get_prop        local0 #07 -> local1
 ff8f:  e0 3f 7d 3f 00          call            fa7e -> sp
 ff94:  75 02 00 03             sub             local1 sp -> local2
 ff98:  43 03 03 4b             jg              local2 #03 ~ffa5
 ff9c:  e7 7f 64 00             random          #64 -> sp
 ffa0:  23 5a 00 c1             jg              #5a sp rtrue
 ffa4:  b1                      rfalse          
 ffa5:  43 03 00 4b             jg              local2 #00 ~ffb2
 ffa9:  e7 7f 64 00             random          #64 -> sp
 ffad:  23 4b 00 c1             jg              #4b sp rtrue
 ffb1:  b1                      rfalse          
 ffb2:  a0 03 4b                jz              local2 ~ffbe
 ffb5:  e7 7f 64 00             random          #64 -> sp
 ffb9:  23 32 00 c1             jg              #32 sp rtrue
 ffbd:  b1                      rfalse          
 ffbe:  43 02 01 4b             jg              local1 #01 ~ffcb
 ffc2:  e7 7f 64 00             random          #64 -> sp
 ffc6:  23 19 00 c1             jg              #19 sp rtrue
 ffca:  b1                      rfalse          
 ffcb:  e7 7f 64 00             random          #64 -> sp
 ffcf:  23 0a 00 c1             jg              #0a sp rtrue
 ffd3:  b1                      rfalse          

Routine ffd4, 1 local (0000)

 ffd7:  51 7f 07 01             get_prop        g6f #07 -> local0
 ffdb:  43 01 00 4d             jg              local0 #00 ~ffea
 ffdf:  0d 01 00                store           local0 #00
 ffe2:  e3 9b 7f 07 01          put_prop        g6f #07 local0
 ffe7:  8c 00 0d                jump            fff5
 ffea:  42 01 00 49             jl              local0 #00 ~fff5
 ffee:  95 01                   inc             local0
 fff0:  e3 9b 7f 07 01          put_prop        g6f #07 local0
 fff5:  42 01 00 58             jl              local0 #00 ~1000f
 fff9:  62 95 96 46             jl              g85 g86 ~10001
 fffd:  54 95 0a 95             add             g85 #0a -> g85
10001:  e0 07 2a 39 7f ea 1e 00 call            5472 #7fea #1e -> sp
10009:  e1 97 00 00 01          storew          sp #00 #01
1000e:  b0                      rtrue           
1000f:  2d 95 96                store           g85 g86
10012:  e0 0f 2a 43 7f ea 00    call            5486 #7fea -> sp
10019:  e1 97 00 00 00          storew          sp #00 #00
1001e:  b0                      rtrue           

Routine 10020, 6 locals (0000, 0000, 0000, 0000, 0000, 0000)

1002d:  4f 13 00 02             loadw           g03 #00 -> local1
10031:  a0 4e 40                jz              g3e ~rfalse
10034:  0d 03 00                store           local2 #00
10037:  95 03                   inc             local2
10039:  61 03 02 45             je              local2 local1 ~10040
1003d:  8c 00 8f                jump            100cd
10040:  6f 13 03 04             loadw           g03 local2 -> local3
10044:  4f 04 00 05             loadw           local3 #00 -> local4
10048:  66 05 10 00 5c          jin             local4 g00 ~100a7
1004d:  4a 05 07 80 57          test_attr       local4 #07 100a7
10052:  41 05 72 4b             je              local4 #72 ~1005f
10056:  a0 2e c8                jz              g1e 1005f
10059:  0d 2e 00                store           g1e #00
1005c:  8c ff da                jump            10037
1005f:  51 05 07 00             get_prop        local4 #07 -> sp
10063:  42 00 00 6b             jl              sp #00 ~10090
10067:  4f 04 03 06             loadw           local3 #03 -> local5
1006b:  a0 06 d8                jz              local5 10084
1006e:  e7 7f 64 00             random          #64 -> sp
10072:  63 06 00 50             jg              local5 sp ~10084
10076:  e1 97 04 03 00          storew          local3 #03 #00
1007b:  e0 2f 80 6c 05 00       call            100d8 local4 -> sp
10081:  8c ff b5                jump            10037
10084:  54 06 19 00             add             local5 #19 -> sp
10088:  e1 9b 04 03 00          storew          local3 #03 sp
1008d:  8c ff a9                jump            10037
10090:  4a 05 02 cf             test_attr       local4 #02 100a1
10094:  51 05 11 00             get_prop        local4 #11 -> sp
10098:  e0 9f 00 05 00          call            sp #05 -> sp
1009d:  a0 00 bf 98             jz              sp 10037
100a1:  0d 01 01                store           local0 #01
100a4:  8c ff 92                jump            10037
100a7:  4a 05 02 4b             test_attr       local4 #02 ~100b4
100ab:  51 05 11 00             get_prop        local4 #11 -> sp
100af:  e0 9f 00 01 00          call            sp #01 -> sp
100b4:  41 05 72 45             je              local4 #72 ~100bb
100b8:  0d 2e 00                store           g1e #00
100bb:  4c 7f 01                clear_attr      g6f #01
100be:  4c 05 01                clear_attr      local4 #01
100c1:  4c 05 02                clear_attr      local4 #02
100c4:  e0 2f 80 6c 05 00       call            100d8 local4 -> sp
100ca:  8c ff 6c                jump            10037
100cd:  a0 01 c0                jz              local0 rfalse
100d0:  e0 2f 7c f0 02 00       call            f9e0 local1 -> sp
100d6:  b8                      ret_popped      

Routine 100d8, 2 locals (0000, 0000)

100dd:  51 01 07 02             get_prop        local0 #07 -> local1
100e1:  42 02 00 41             jl              local1 #00 ~rtrue
100e5:  35 00 02 00             sub             #00 local1 -> sp
100e9:  e3 9b 01 07 00          put_prop        local0 #07 sp
100ee:  51 01 11 00             get_prop        local0 #11 -> sp
100f2:  e0 9f 00 04 00          call            sp #04 -> sp
100f7:  b0                      rtrue           

Routine 100f8, 6 locals (0000, 0000, 0000, 0000, 0000, 0000)

10105:  e0 0f 2a 43 80 7c 01    call            5486 #807c -> local0
1010c:  11 6e 0c 02             get_prop        "sword" #0c -> local1
10110:  06 6e 04 00 ac          jin             "sword" "cretin" ~101bf
10115:  e0 2f 80 e3 10 00       call            101c6 g00 -> sp
1011b:  a0 00 c8                jz              sp 10124
1011e:  0d 03 02                store           local2 #02
10121:  8c 00 34                jump            10156
10124:  0d 04 00                store           local3 #00
10127:  73 10 04 04             get_next_prop   g00 local3 -> local3
1012b:  a0 04 45                jz              local3 ~10131
1012e:  8c 00 27                jump            10156
10131:  62 04 a8 bf f3          jl              local3 g98 10127
10136:  72 10 04 05             get_prop_addr   g00 local3 -> local4
1013a:  a4 05 06                get_prop_len    local4 -> local5
1013d:  c1 95 06 01 04 05 3f e4 je              local5 #01 #04 #05 ~10127
10145:  50 05 00 00             loadb           local4 #00 -> sp
10149:  e0 2f 80 e3 00 00       call            101c6 sp -> sp
1014f:  a0 00 bf d6             jz              sp 10127
10153:  0d 03 01                store           local2 #01
10156:  61 03 02 c0             je              local2 local1 rfalse
1015a:  41 03 02 61             je              local2 #02 ~1017d
1015e:  b2 ...                  print           "Your sword has begun to glow very brightly."
10179:  bb                      new_line        
1017a:  8c 00 3e                jump            101b9
1017d:  41 03 01 61             je              local2 #01 ~101a0
10181:  b2 ...                  print           "Your sword is glowing with a faint blue glow."
1019c:  bb                      new_line        
1019d:  8c 00 1b                jump            101b9
101a0:  a0 03 58                jz              local2 ~101b9
101a3:  b2 ...                  print           "Your sword is no longer glowing."
101b8:  bb                      new_line        
101b9:  e3 5b 6e 0c 03          put_prop        "sword" #0c local2
101be:  b0                      rtrue           
101bf:  e1 97 01 00 00          storew          local0 #00 #00
101c4:  b1                      rfalse          

Routine 101c6, 2 locals (0000, 0000)

101cb:  a2 01 02 c2             get_child       local0 -> local1 101cf
101cf:  a0 02 c0                jz              local1 rfalse
101d2:  4a 02 1e 46             test_attr       local1 #1e ~101da
101d6:  4a 02 07 41             test_attr       local1 #07 ~rtrue
101da:  a1 02 02 bf f2          get_sibling     local1 -> local1 101cf
101df:  b1                      rfalse          

Routine 101e0, 5 locals (0000, 0000, 0000, 0000, 0000)

101eb:  93 72 01                get_parent      "thief" -> local0
101ee:  0a 72 07 c8             test_attr       "thief" #07 101f8
101f2:  e8 7f 01                push            #01
101f5:  8c 00 05                jump            101fb
101f8:  e8 7f 00                push            #00
101fb:  2d 03 00                store           local2 sp
101fe:  a0 03 c5                jz              local2 10204
10201:  93 72 01                get_parent      "thief" -> local0
10204:  41 01 be 5a             je              local0 #be ~10220
10208:  61 01 10 d6             je              local0 g00 10220
1020c:  a0 03 ca                jz              local2 10217
1020f:  e0 3f 69 69 00          call            d2d2 -> sp
10214:  0d 03 00                store           local2 #00
10217:  e0 1f 69 77 be 00       call            d2ee #be -> sp
1021d:  8c 00 56                jump            10274
10220:  61 01 10 5e             je              local0 g00 ~10240
10224:  4a 01 14 da             test_attr       local0 #14 10240
10228:  26 d9 10 d6             jin             "troll" g00 10240
1022c:  e0 2f 67 47 03 00       call            ce8e local2 -> sp
10232:  a0 00 41                jz              sp ~rtrue
10235:  0a 72 07 00 3c          test_attr       "thief" #07 ~10274
1023a:  0d 03 00                store           local2 #00
1023d:  8c 00 36                jump            10274
10240:  26 72 01 4c             jin             "thief" local0 ~1024e
10244:  0a 72 07 c8             test_attr       "thief" #07 1024e
10248:  0b 72 07                set_attr        "thief" #07
1024b:  0d 03 00                store           local2 #00
1024e:  4a 01 03 64             test_attr       local0 #03 ~10274
10252:  e0 25 81 dc 01 72 4b 00 call            103b8 local0 #72 #4b -> sp
1025a:  4a 01 05 4f             test_attr       local0 #05 ~1026b
1025e:  4a 10 05 4b             test_attr       g00 #05 ~1026b
10262:  e0 2f 69 96 01 00       call            d32c local0 -> sp
10268:  8c 00 08                jump            10271
1026b:  e0 2f 81 a6 01 00       call            1034c local0 -> sp
10271:  2d 05 00                store           local4 sp
10274:  a0 04 48                jz              local3 ~1027d
10277:  e8 7f 01                push            #01
1027a:  8c 00 05                jump            10280
1027d:  e8 7f 00                push            #00
10280:  2d 04 00                store           local3 sp
10283:  a0 04 f1                jz              local3 102b5
10286:  a0 03 6e                jz              local2 ~102b5
10289:  e0 3f 81 9e 00          call            1033c -> sp
1028e:  a0 01 c9                jz              local0 10298
10291:  a1 01 01 45             get_sibling     local0 -> local0 ~10298
10295:  8c 00 06                jump            1029c
10298:  92 52 01 c2             get_child       #52 -> local0 1029c
1029c:  4a 01 09 bf ef          test_attr       local0 #09 1028e
102a1:  4a 01 06 3f ea          test_attr       local0 #06 ~1028e
102a6:  2e 72 01                insert_obj      "thief" local0
102a9:  0c 72 02                clear_attr      "thief" #02
102ac:  0b 72 07                set_attr        "thief" #07
102af:  0d 2f 00                store           g1f #00
102b2:  8c ff 3b                jump            101ee
102b5:  41 01 be ca             je              local0 #be 102c1
102b9:  e0 2f 81 62 01 00       call            102c4 local0 -> sp
102bf:  ab 05                   ret             local4
102c1:  ab 05                   ret             local4

Routine 102c4, 4 locals (0000, 0000, 0000, 0000)

102cd:  92 72 02 c2             get_child       "thief" -> local1 102d1
102d1:  a0 02 44                jz              local1 ~102d6
102d4:  ab 04                   ret             local3
102d6:  a1 02 03 c2             get_sibling     local1 -> local2 102da
102da:  c1 97 02 71 73 45       je              local1 #71 #73 ~102e3
102e0:  8c 00 54                jump            10335
102e3:  51 02 0c 00             get_prop        local1 #0c -> sp
102e7:  a0 00 00 4c             jz              sp ~10335
102eb:  e0 1f 27 21 1e 00       call            4e42 #1e -> sp
102f1:  a0 00 80 42             jz              sp 10335
102f5:  4c 02 07                clear_attr      local1 #07
102f8:  6e 02 01                insert_obj      local1 local0
102fb:  a0 04 79                jz              local3 ~10335
102fe:  61 01 10 75             je              local0 g00 ~10335
10302:  b2 ...                  print           "The robber, rummaging through his bag, dropped a few items he found valueless."
10331:  bb                      new_line        
10332:  0d 04 01                store           local3 #01
10335:  2d 02 03                store           local1 local2
10338:  8c ff 98                jump            102d1

Routine 1033c, 0 locals ()

1033d:  93 72 00                get_parent      "thief" -> sp
10340:  26 71 00 40             jin             "stiletto" sp ~rfalse
10344:  0b 71 0e                set_attr        "stiletto" #0e
10347:  0e 71 72                insert_obj      "stiletto" "thief"
1034a:  b0                      rtrue           

Routine 1034c, 3 locals (0000, 0000, 0000)

10353:  a2 01 02 c2             get_child       local0 -> local1 10357
10357:  a0 02 c0                jz              local1 rfalse
1035a:  a1 02 03 c2             get_sibling     local1 -> local2 1035e
1035e:  51 02 0c 00             get_prop        local1 #0c -> sp
10362:  a0 00 00 4e             jz              sp ~103b2
10366:  4a 02 11 00 49          test_attr       local1 #11 ~103b2
1036b:  4a 02 09 80 44          test_attr       local1 #09 103b2
10370:  4a 02 07 80 3f          test_attr       local1 #07 103b2
10375:  41 02 71 cb             je              local1 #71 10382
10379:  e0 1f 27 21 0a 00       call            4e42 #0a -> sp
1037f:  a0 00 f2                jz              sp 103b2
10382:  4e 02 72                insert_obj      local1 "thief"
10385:  4b 02 03                set_attr        local1 #03
10388:  4b 02 07                set_attr        local1 #07
1038b:  41 02 81 45             je              local1 #81 ~10392
1038f:  0d a3 00                store           g93 #00
10392:  61 01 10 40             je              local0 g00 ~rfalse
10396:  b2 ...                  print           "You suddenly notice that the "
103a7:  aa 02                   print_obj       local1
103a9:  b3 ...                  print_ret       " vanished."
103b2:  2d 02 03                store           local1 local2
103b5:  8c ff a1                jump            10357

Routine 103b8, 6 locals (0000, 0000, 0000, 0000, 0000, 0000)

103c5:  a2 01 05 c2             get_child       local0 -> local4 103c9
103c9:  a0 05 44                jz              local4 ~103ce
103cc:  ab 06                   ret             local5
103ce:  a1 05 04 c2             get_sibling     local4 -> local3 103d2
103d2:  4a 05 07 e9             test_attr       local4 #07 103fd
103d6:  4a 05 09 e5             test_attr       local4 #09 103fd
103da:  51 05 0c 00             get_prop        local4 #0c -> sp
103de:  43 00 00 5d             jg              sp #00 ~103fd
103e2:  a0 03 ca                jz              local2 103ed
103e5:  e7 7f 64 00             random          #64 -> sp
103e9:  63 03 00 52             jg              local2 sp ~103fd
103ed:  6e 05 02                insert_obj      local4 local1
103f0:  4b 05 03                set_attr        local4 #03
103f3:  61 02 02 45             je              local1 local1 ~103fa
103f7:  4b 05 07                set_attr        local4 #07
103fa:  0d 06 01                store           local5 #01
103fd:  2d 05 04                store           local4 local3
10400:  8c ff c8                jump            103c9

Routine 10404, 4 locals (0000, 0000, 0000, 0000)
    Action routine for:
        "diagno"

1040d:  e0 1f 7d 3f 00 01       call            fa7e #00 -> local0
10413:  51 7f 07 02             get_prop        g6f #07 -> local1
10417:  74 01 02 03             add             local0 local1 -> local2
1041b:  e0 0f 2a 43 7f ea 00    call            5486 #7fea -> sp
10422:  4f 00 00 00             loadw           sp #00 -> sp
10426:  a0 00 48                jz              sp ~1042f
10429:  0d 02 00                store           local1 #00
1042c:  8c 00 06                jump            10433
1042f:  35 00 02 02             sub             #00 local1 -> local1
10433:  a0 02 56                jz              local1 ~1044a
10436:  b2 ...                  print           "You are in perfect health."
10447:  8c 00 52                jump            1049a
1044a:  b2 ...                  print           "You have "
1044f:  41 02 01 50             je              local1 #01 ~10461
10453:  b2 ...                  print           "a light wound,"
1045e:  8c 00 3b                jump            1049a
10461:  41 02 02 52             je              local1 #02 ~10475
10465:  b2 ...                  print           "a serious wound,"
10472:  8c 00 27                jump            1049a
10475:  41 02 03 52             je              local1 #03 ~10489
10479:  b2 ...                  print           "several wounds,"
10486:  8c 00 13                jump            1049a
10489:  43 02 03 4f             jg              local1 #03 ~1049a
1048d:  b2 ...                  print           "serious wounds,"
1049a:  a0 02 f4                jz              local1 104cf
1049d:  b2 ...                  print           " which will be cured after "
104ae:  55 02 01 00             sub             local1 #01 -> sp
104b2:  36 1e 00 04             mul             #1e sp -> local3
104b6:  e0 0f 2a 43 7f ea 00    call            5486 #7fea -> sp
104bd:  4f 00 01 00             loadw           sp #01 -> sp
104c1:  74 04 00 00             add             local3 sp -> sp
104c5:  e6 bf 00                print_num       sp
104c8:  b2 ...                  print           " moves."
104cf:  bb                      new_line        
104d0:  b2 ...                  print           "You can "
104d5:  a0 03 52                jz              local2 ~104e8
104d8:  b2 ...                  print           "expect death soon"
104e5:  8c 00 73                jump            10559
104e8:  41 03 01 5c             je              local2 #01 ~10506
104ec:  b2 ...                  print           "be killed by one more light wound"
10503:  8c 00 55                jump            10559
10506:  41 03 02 58             je              local2 #02 ~10520
1050a:  b2 ...                  print           "be killed by a serious wound"
1051d:  8c 00 3b                jump            10559
10520:  41 03 03 58             je              local2 #03 ~1053a
10524:  b2 ...                  print           "survive one serious wound"
10537:  8c 00 21                jump            10559
1053a:  43 03 03 5d             jg              local2 #03 ~10559
1053e:  b2 ...                  print           "strong enough to take several wounds."
10559:  b2 ...                  print           "."
1055c:  bb                      new_line        
1055d:  a0 4d c0                jz              g3d rfalse
10560:  b2 ...                  print           "You have been killed "
1056d:  41 4d 01 4a             je              g3d #01 ~10579
10571:  b2 ...                  print           "once"
10576:  8c 00 07                jump            1057e
10579:  b2 ...                  print           "twice"
1057e:  b3 ...                  print_ret       "."

Routine 10582, 1 local (0001)
    Action routine for:
        "score"

10585:  b2 ...                  print           "Your score is "
1058e:  e6 bf 11                print_num       g01
10591:  b2 ...                  print           " (total of 350 points), in "
105a6:  e6 bf 12                print_num       g02
105a9:  41 12 01 4c             je              g02 #01 ~105b7
105ad:  b2 ...                  print           " move."
105b4:  8c 00 09                jump            105be
105b7:  b2 ...                  print           " moves."
105be:  bb                      new_line        
105bf:  b2 ...                  print           "This gives you the rank of "
105ce:  c1 8f 11 01 5e 54       je              g01 #015e ~105e6
105d4:  b2 ...                  print           "Master Adventurer"
105e3:  8c 00 7b                jump            1065f
105e6:  c3 8f 11 01 4a 4c       jg              g01 #014a ~105f6
105ec:  b2 ...                  print           "Wizard"
105f3:  8c 00 6b                jump            1065f
105f6:  c3 8f 11 01 2c 4c       jg              g01 #012c ~10606
105fc:  b2 ...                  print           "Master"
10603:  8c 00 5b                jump            1065f
10606:  43 11 c8 4e             jg              g01 #c8 ~10616
1060a:  b2 ...                  print           "Adventurer"
10613:  8c 00 4b                jump            1065f
10616:  43 11 64 54             jg              g01 #64 ~1062c
1061a:  b2 ...                  print           "Junior Adventurer"
10629:  8c 00 35                jump            1065f
1062c:  43 11 32 54             jg              g01 #32 ~10642
10630:  b2 ...                  print           "Novice Adventurer"
1063f:  8c 00 1f                jump            1065f
10642:  43 11 19 54             jg              g01 #19 ~10658
10646:  b2 ...                  print           "Amateur Adventurer"
10655:  8c 00 09                jump            1065f
10658:  b2 ...                  print           "Beginner"
1065f:  b2 ...                  print           "."
10662:  bb                      new_line        
10663:  ab 11                   ret             g01

Routine 10666, 2 locals (0000, 0000)

1066b:  a0 4e 80 6d             jz              g3e 106da
1066f:  b2 ...                  print           "^It takes a talented person to be killed while already dead. YOU are such a talent. Unfortunately, it takes a talented person to deal with it. I am not such a talent. Sorry."
106d4:  bb                      new_line        
106d5:  e0 3f 48 6a 00          call            90d4 -> sp
106da:  ad 01                   print_paddr     local0
106dc:  bb                      new_line        
106dd:  a0 4c 50                jz              g3c ~106ee
106e0:  b2 ...                  print           "Bad luck, huh?"
106ed:  bb                      new_line        
106ee:  e0 0f 48 31 ff f6 00    call            9062 #fff6 -> sp
106f5:  b2 ...                  print           " ^   ****  You have died  **** ^^"
1071c:  a3 7f 00                get_parent      g6f -> sp
1071f:  4a 00 1b 45             test_attr       sp #1b ~10726
10723:  6e 7f 10                insert_obj      g6f g00
10726:  42 4d 02 80 8e          jl              g3d #02 107b7
1072b:  b2 ...                  print           "You clearly are a suicidal maniac. We don't allow psychotics in the cave, since they may harm other adventurers. Your remains will be installed in the Land of the Living Dead, where your fellow adventurers may gloat over them."
107b0:  bb                      new_line        
107b1:  e0 3f 48 6a 00          call            90d4 -> sp
107b6:  b8                      ret_popped      
107b7:  95 4d                   inc             g3d
107b9:  6e 7f 10                insert_obj      g6f g00
107bc:  0a d4 03 00 c2          test_attr       "Altar" #03 ~10881
107c1:  b2 ...                  print           "As you take your last breath, you feel relieved of your burdens. The feeling passes as you find yourself before the gates of Hell, where the spirits jeer at you and deny you entry. Your senses are disturbed. The objects in the dungeon appear indistinct, bleached of color, even unreal."
10864:  bb                      new_line        
10865:  bb                      new_line        
10866:  0d 4e 01                store           g3e #01
10869:  0d 9d 01                store           g8d #01
1086c:  0d 89 01                store           g79 #01
1086f:  0d 58 01                store           g48 #01
10872:  e3 93 7f 11 7a d5       put_prop        g6f #11 #7ad5
10878:  e0 1f 49 5b e8 00       call            92b6 #e8 -> sp
1087e:  8c 00 59                jump            108d8
10881:  b2 ...                  print           "Now, let's take a look here... Well, you probably deserve another chance. I can't quite fix you up completely, but you can't have everything."
108d0:  bb                      new_line        
108d1:  bb                      new_line        
108d2:  e0 1f 49 5b 4e 00       call            92b6 #4e -> sp
108d8:  0c b7 03                clear_attr      "trap door" #03
108db:  0d 7c 00                store           g6c #00
108de:  e0 3f 84 75 00          call            108ea -> sp
108e3:  e0 3f 84 a9 00          call            10952 -> sp
108e8:  b8                      ret_popped      

Routine 108ea, 4 locals (0000, 0000, 0000, 0000)

108f3:  26 a4 7f 45             jin             "brass lantern" g6f ~108fa
108f7:  0e a4 c1                insert_obj      "brass lantern" "Living Room"
108fa:  26 d0 7f 45             jin             "gold coffin" g6f ~10901
108fe:  0e d0 af                insert_obj      "gold coffin" "Egyptian Room"
10901:  e3 57 6e 0c 00          put_prop        "sword" #0c #00
10906:  a2 7f 03 c2             get_child       g6f -> local2 1090a
1090a:  4f 97 00 04             loadw           g87 #00 -> local3
1090e:  2d 02 03                store           local1 local2
10911:  a0 02 c1                jz              local1 rtrue
10914:  a1 02 03 c2             get_sibling     local1 -> local2 10918
10918:  51 02 0c 00             get_prop        local1 #0c -> sp
1091c:  43 00 00 66             jg              sp #00 ~10944
10920:  a0 01 46                jz              local0 ~10927
10923:  92 52 01 c2             get_child       #52 -> local0 10927
10927:  4a 01 06 54             test_attr       local0 #06 ~1093d
1092b:  4a 01 14 d0             test_attr       local0 #14 1093d
1092f:  e7 7f 64 00             random          #64 -> sp
10933:  23 32 00 48             jg              #32 sp ~1093d
10937:  6e 02 01                insert_obj      local1 local0
1093a:  8c ff d3                jump            1090e
1093d:  a1 01 01 c2             get_sibling     local0 -> local0 10941
10941:  8c ff de                jump            10920
10944:  e7 bf 04 00             random          local3 -> sp
10948:  6f 97 00 00             loadw           g87 sp -> sp
1094c:  6e 02 00                insert_obj      local1 sp
1094f:  8c ff be                jump            1090e

Routine 10952, 0 locals ()

10953:  e0 0f 2a 43 5c 3e 00    call            5486 #5c3e -> sp
1095a:  e1 97 00 00 00          storew          sp #00 #00
1095f:  e0 0f 2a 43 5c 6d 00    call            5486 #5c6d -> sp
10966:  e1 97 00 00 00          storew          sp #00 #00
1096b:  e0 0f 2a 43 64 9f 00    call            5486 #649f -> sp
10972:  e1 97 00 00 00          storew          sp #00 #00
10977:  e0 0f 2a 43 6f 55 00    call            5486 #6f55 -> sp
1097e:  e1 97 00 00 00          storew          sp #00 #00
10983:  e0 0f 2a 43 6f 6a 00    call            5486 #6f6a -> sp
1098a:  e1 97 00 00 00          storew          sp #00 #00
1098f:  e0 0f 2a 43 80 7c 00    call            5486 #807c -> sp
10996:  e1 97 00 00 00          storew          sp #00 #00
1099b:  e0 0f 2a 43 79 54 00    call            5486 #7954 -> sp
109a2:  e1 97 00 00 00          storew          sp #00 #00
109a7:  e0 0f 2a 43 6f 46 00    call            5486 #6f46 -> sp
109ae:  e1 97 00 00 00          storew          sp #00 #00
109b3:  0c 9b 14                clear_attr      "matchbook" #14
109b6:  b0                      rtrue           

Routine 109b8, 0 locals ()

109b9:  e0 13 84 e6 a5 a5 c2 00 call            109cc #a5 s384 -> sp
109c1:  b8                      ret_popped      

Routine 109c2, 0 locals ()

109c3:  e0 13 84 e6 65 a5 c4 00 call            109cc #65 s385 -> sp
109cb:  b8                      ret_popped      

Routine 109cc, 2 locals (0000, 0000)

109d1:  c1 97 88 23 2b 66       je              g78 #23 #2b ~109fb
109d7:  b2 ...                  print           "The "
109da:  ad 02                   print_paddr     local1
109dc:  b3 ...                  print_ret       " are safely inside; there's no need to do that."
109fb:  c1 97 88 38 39 54       je              g78 #38 #39 ~10a13
10a01:  b2 ...                  print           "There are lots of "
10a0a:  ad 02                   print_paddr     local1
10a0c:  b3 ...                  print_ret       " in there."
10a13:  41 88 12 40             je              g78 #12 ~rfalse
10a17:  61 87 01 40             je              g77 local0 ~rfalse
10a1b:  b2 ...                  print           "Don't be silly. It wouldn't be a "
10a32:  aa 01                   print_obj       local0
10a34:  b3 ...                  print_ret       " anymore."

Routine 10a3e, 0 locals ()

10a3f:  c1 95 88 39 23 2b 4b    je              g78 #39 #23 #2b ~10a4f
10a46:  b3 ...                  print_ret       "You can't do that."
10a4f:  41 88 38 40             je              g78 #38 ~rfalse
10a53:  b2 ...                  print           "It looks pretty much like a "
10a66:  aa 86                   print_obj       g76
10a68:  b3 ...                  print_ret       "."

Routine 10a6c, 0 locals ()

10a6d:  41 88 33 40             je              g78 #33 ~rfalse
10a71:  e0 2f 3c 5d 86 00       call            78ba g76 -> sp
10a77:  b3 ...                  print_ret       "What the heck! You won't make friends this way, but nobody around here is too friendly anyhow. Gulp!"

Routine 10ab2, 0 locals ()

10ab3:  c1 97 88 58 5d 4f       je              g78 #58 #5d ~10ac6
10ab9:  b3 ...                  print_ret       "The chain is secure."
10ac6:  c1 97 88 54 69 5b       je              g78 #54 #69 ~10ae5
10acc:  b3 ...                  print_ret       "Perhaps you should do that to the basket."
10ae5:  41 88 38 40             je              g78 #38 ~rfalse
10ae9:  b3 ...                  print_ret       "The chain secures a basket within the shaft."

Routine 10b04, 1 local (0000)

10b07:  41 01 02 40             je              local0 #02 ~rfalse
10b0b:  26 d9 10 40             jin             "troll" g00 ~rfalse
10b0f:  e0 1f 4a 98 d9 00       call            9530 #d9 -> sp
10b15:  b8                      ret_popped      

[End of code at 10b16]

[Start of text at 10b16]

10b16: S001 "Lying in one corner of the room is a beautifully carved crystal skull. It appears to be grinning at you rather nastily."
10b5c: S002 "From the chain is suspended a basket."
10b74: S003 "At the end of the chain is a basket."
10b8a: S004 "A hot pepper sandwich is here."
10b9e: S005 "On the ground is a red hot bell."
10bb0: S006 "On the altar is a large black book, open to page 569."
10bd2: S007 "Commandment #12592^^Oh ye who go about saying unto each:  ~Hello sailor~:^Dost thou know the magnitude of thy sin before the gods?^Yea, verily, thou shalt be ground between two stones.^Shall the angry gods cast thy body into the whirlpool?^Surely, thy eye shall be put out with a sharp stick!^Even unto the ends of the earth shalt thou wander and^Unto the land of the dead shalt thou be sent at last.^Surely thou shalt repent of thy cunning."
10cee: S008 "An ornamented sceptre, tapering to a sharp point, is here."
10d14: S009 "A sceptre, possibly that of ancient Egypt itself, is in the coffin. The sceptre is ornamented with colored enamel, and tapers to a sharp point."
10d6a: S010 "On the table is an elongated brown sack, smelling of hot peppers."
10d94: S011 "There is a silver chalice, intricately engraved, here."
10db4: S012 "On the shore lies Poseidon's own crystal trident."
10dd6: S013 "A bottle is sitting on the table."
10dea: S014 "The solid-gold coffin used for the burial of Ramses II is here."
10e10: S015 "There is an enormous diamond (perfectly cut) here."
10e2e: S016 "There is an exquisite jade figurine here."
10e46: S017 "On a table is a nasty-looking knife."
10e5c: S018 "The deceased adventurer's useless lantern is here."
10e7c: S019 "An old leather bag, bulging with coins, is here."
10e9a: S020 "A battery-powered brass lantern is on the trophy case."
10ebe: S021 "There is a brass lantern (battery-powered) here."
10edc: S022 "A small leaflet is on the ground."
10eee: S023 "~WELCOME TO ZORK!^^ZORK is a game of adventure, danger, and low cunning. In it you will explore some of the most amazing territory ever seen by mortals. No computer should be without one!~^"
10f76: S024 "There is a matchbook whose cover says ~Visit Beautiful FCD#3~ here."
10fa2: S025 "^(Close cover before striking)^^YOU too can make BIG MONEY in the exciting field of PAPER SHUFFLING!^^Mr. Anderson of Muddle, Mass. says: ~Before I took this course I was a lowly bit twiddler. Now with what I learned at GUE Tech I feel really important and can obfuscate and confuse with the best.~^^Dr. Blank had this to say: ~Ten short days ago all I could look forward to was a dead-end job as a doctor. Now I have a promising future and make really big Zorkmids.~^^GUE Tech can't promise these fantastic results to everyone. But when you earn your degree from GUE Tech, your future will be brighter.^"
1113c: S026 "Fortunately, there is still one chance for you to be a vandal, for on the far wall is a painting of unparalleled beauty."
1117a: S027 "A painting by a neglected genius is here."
11194: S028 "On the two ends of the altar are burning candles."
111b2: S029 "On the ground is a pile of leaves."
111c4: S030 "There is a folded pile of plastic here which has a small valve attached."
111ea: S031 "On the ground is a large platinum bar."
111fe: S032 "At the end of the rainbow is a pot of gold."
11218: S033 "The prayer is inscribed in an ancient script, rarely used today. It seems to be a philippic against small insects, absent-mindedness, and the picking up and dropping of small objects. The final verse consigns trespassers to the land of the dead. All evidence indicates that the beliefs of the ancient Zorkers were obscure."
112d4: S034 "There is a red buoy here (probably a warning)."
112ec: S035 "A large coil of rope is lying in the corner."
11304: S036 "Beside the skeleton is a rusty knife."
1131c: S037 "The engravings translate to ~This space intentionally left blank.~"
11346: S038 "Above the trophy case hangs an elvish sword of great antiquity."
11370: S039 "In the trophy case is an ancient parchment which appears to be a map."
11396: S040 "The map shows a forest with three clearings. The largest clearing contains a house. Three paths leave the large clearing. One of these paths, leading southwest, is marked ~To Stone Barrow~."
1140c: S041 "	  !!!! 	FROBOZZ MAGIC BOAT COMPANY  !!!!^^Hello, Sailor!^^Instructions for use:^^   To get into a body of water, say ~Launch~.^   To get to shore, say ~Land~ or the direction in which you want to maneuver the boat.^^Warranty:^^  This boat is guaranteed against all defects for a period of 76 milliseconds from date of purchase or until first used, whichever comes first.^^Warning:^   This boat is made of thin plastic.^   Good Luck!^"
1154a: S042 "There is a suspicious-looking individual, holding a large bag, leaning against one wall. He is armed with a deadly stiletto."
11592: S043 "Sitting on the pedestal is a flaming torch, made of ivory."
115b8: S044 "Some guidebooks entitled ~Flood Control Dam #3~ are on the reception desk."
115ec: S045 "~	Flood Control Dam #3^^FCD#3 was constructed in year 783 of the Great Underground Empire to harness the mighty Frigid River. This work was supported by a grant of 37 million zorkmids from your omnipotent local tyrant Lord Dimwit Flathead the Excessive. This impressive structure is composed of 370,000 cubic feet of concrete, is 256 feet tall at the center, and 193 feet wide at the top. The lake created behind the dam has a volume of 1.7 billion cubic feet, an area of 12 million square feet, and a shore line of 36 thousand feet.^^We will now point out some of the more interesting features of FCD#3 as we conduct you on a guided tour of the facilities:^        1) You start your tour here in the Dam Lobby. You will notice on your right that...."
117d0: S046 "A nasty-looking troll, brandishing a bloody axe, blocks all passages out of the room."
117fe: S047 "Lying half buried in the mud is an old trunk, bulging with jewels."
11826: S048 "There is an old trunk here, bulging with assorted jewels."
11846: S049 "There is an object which looks like a tube of toothpaste here."
11868: S050 "---> Frobozz Magic Gunk Company <---^	  All-Purpose Gunk"
1189e: S051 "There are old engravings on the walls here."
118b4: S052 "The engravings were incised in the living rock of the cave wall by an unknown hand. They depict, in symbolic form, the beliefs of the ancient Zorkers. Skillfully interwoven with the bas reliefs are excerpts illustrating the major religious tenets of that time. Unfortunately, a later age seems to have considered them blasphemous and just as skillfully excised them."
1198a: S053 "Loosely attached to a wall is a small piece of paper."
119a8: S054 "^Congratulations!^^You are the privileged owner of ZORK I: The Great Underground Empire, a self-contained and self-maintaining universe. If used and maintained in accordance with normal operating practices for small universes, ZORK will provide many months of trouble-free operation.^^"
11a64: S055 "Beside you on the branch is a small bird's nest."
11a80: S056 "In the bird's nest is a large egg encrusted with precious jewels, apparently scavenged by a childless songbird. The egg is covered with fine gold inlay, and ornamented in lapis lazuli and mother-of-pearl. Unlike most eggs, this one is hinged and closed with a delicate looking clasp. The egg appears extremely fragile."
11b38: S057 "There is a somewhat ruined egg here."
11b4c: S058 "There is a golden clockwork canary nestled in the egg. It has ruby eyes and a silver beak. Through a crystal window below its left wing you can see intricate machinery inside. It appears to have wound down."
11bc4: S059 "There is a golden clockwork canary nestled in the egg. It seems to have recently had a bad experience. The mountings for its jewel-like eyes are empty, and its silver beak is crumpled. Through a cracked crystal window below its left wing you can see the remains of intricate machinery. It is not clear what result winding it would have, as the mainspring seems sprung."
11c9c: S060 "The door is boarded and you can't remove the boards."
11cb6: S061 "You are standing in front of a massive barrow of stone. In the east face is a huge stone door which is open. You cannot see into the dark of the tomb."
11d04: S062 "You are facing the north side of a white house. There is no door here, and all the windows are boarded up. To the north a narrow path winds through the trees."
11d4e: S063 "The windows are all boarded."
11d60: S064 "You are facing the south side of a white house. There is no door here, and all the windows are boarded."
11d94: S065 "This is a forest, with trees in all directions. To the east, there appears to be sunlight."
11dc4: S066 "There is no tree here suitable for climbing."
11ddc: S067 "You would need a machete to go further west."
11df6: S068 "This is a dimly lit forest, with large trees all around."
11e14: S069 "The forest becomes impenetrable to the north."
11e30: S070 "The forest thins out, revealing impassable mountains."
11e54: S071 "The mountains are impassable."
11e66: S072 "The rank undergrowth prevents eastward movement."
11e86: S073 "Storm-tossed trees block your way."
11e9e: S074 "This is a path winding through a dimly lit forest. The path heads north-south here. One particularly large tree with some low branches stands at the edge of the path."
11ef6: S075 "You cannot climb any higher."
11f06: S076 "You are in a small clearing in a well marked forest path that extends to the east and west."
11f34: S077 "Only Santa Claus climbs down chimneys."
11f50: S078 "This is the attic. The only exit is a stairway leading down."
11f6e: S079 "The door is nailed shut."
11f7c: S080 "You try to ascend the ramp, but it is impossible, and you slide back down."
11fa6: S081 "This is a small room with passages to the east and south and a forbidding hole leading west. Bloodstains and deep scratches (perhaps made by an axe) mar the walls."
11ff8: S082 "The troll fends you off with a menacing gesture."
12012: S083 "You are on the east edge of a chasm, the bottom of which cannot be seen. A narrow passage goes north, and the path you are on continues to the east."
12054: S084 "The chasm probably leads straight to the infernal regions."
12074: S085 "This is an art gallery. Most of the paintings have been stolen by vandals with exceptional taste. The vandals left through either the north or west exits."
120c8: S086 "This appears to have been an artist's studio. The walls and floors are splattered with paints of 69 different colors. Strangely enough, nothing of value is hanging here. At the south end of the room is an open door (also covered with paint). A dark and narrow chimney leads up from a fireplace; although you might be able to get up it, it seems unlikely you could get back down."
1219a: S087 "This is part of a maze of twisty little passages, all alike."
121c0: S088 "You have come to a dead end in the maze."
121d6: S089 "This is part of a maze of twisty little passages, all alike. A skeleton, probably the remains of a luckless adventurer, lies here."
12222: S090 "The grating is closed."
1222a: S091 "The east wall is solid rock."
12238: S092 "The cyclops doesn't look like he'll let you past."
12250: S093 "This is a long passage. To the west is one entrance. On the east there is an old wooden door, with a large opening in it (about cyclops sized)."
12298: S094 "This is a large room, whose east wall is solid granite. A number of discarded bags, which crumble at your touch, are scattered about on the floor. There is an exit down a staircase."
122f6: S095 "You would drown."
122fe: S096 "The dam blocks your way."
1230c: S097 "You are standing on a path beside a gently flowing stream. The path follows the stream, which flows from west to east."
1234a: S098 "The stream emerges from a spot too small for you to enter."
12368: S099 "You are on the gently flowing stream. The upstream route is too narrow to navigate, and the downstream route is invisible due to twisting walls. There is a narrow beach to land on."
123c8: S100 "The channel is too narrow."
123d8: S101 "This is a tiny cave with entrances west and north, and a staircase leading down."
123fc: S102 "This is a tiny cave with entrances west and north, and a dark, forbidding staircase leading down."
1242c: S103 "This is a cold and damp corridor where a long east-west passageway turns into a southward path."
12464: S104 "This is a long and narrow corridor where a long north-south passageway briefly narrows even further."
1249e: S105 "This is a winding passage. It seems that there are only exits on the east and north."
124c6: S106 "This is an ancient room, long under water. There is an exit to the south and a staircase leading up."
124f2: S107 "This is a narrow east-west passageway. There is a narrow stairway leading down at the north end of the room."
12522: S108 "This is a circular stone room with passages in all directions. Several of them have unfortunately been blocked by cave-ins."
12568: S109 "This cave has exits to the west and east, and narrows to a crack toward the south. The earth is particularly damp here."
125aa: S110 "It is too narrow for most insects."
125ba: S111 "This is a high north-south passage, which forks to the northeast."
125de: S112 "A chasm runs southwest to northeast and the path follows it. You are on the south side of the chasm, where a crack opens into a passage."
12624: S113 "Are you out of your mind?"
12632: S114 "Some invisible force prevents you from passing through the gate."
12656: S115 "You have entered the Land of the Living Dead. Thousands of lost souls can be heard weeping and moaning. In the corner are stacked the remains of dozens of previous adventurers less fortunate than yourself. A passage exits to the north."
126e0: S116 "You have entered a low cave with passages leading northwest and east."
126fe: S117 "This is a room which looks like an Egyptian tomb. There is an ascending staircase to the west."
1272c: S118 "You cannot go down without fracturing many bones."
12748: S119 "You cannot reach the rope."
12754: S120 "This is the north end of a large temple. On the east wall is an ancient inscription, probably a prayer in a long-forgotten language. Below the prayer is a staircase leading down. The west wall is solid granite. The exit to the north end of the room is through huge marble pillars."
127dc: S121 "This is the south end of a large temple. In front of you is what appears to be an altar. In one corner is a small hole in the floor which leads into darkness. You probably could not get back up it."
1283e: S122 "You haven't a prayer of getting the coffin down there."
1285e: S123 "This room appears to have been the waiting room for groups touring the dam. There are open doorways here to the north and east marked ~Private~, and there is a path leading south over the top of the dam."
128ba: S124 "This is what appears to have been the maintenance room for Flood Control Dam #3. Apparently, this room has been ransacked recently, for most of the valuable equipment is gone. On the wall in front of you is a group of buttons colored blue, yellow, brown, and red. There are doorways to the west and south."
12964: S125 "You are at the base of Flood Control Dam #3, which looms above you and to the north. The river Frigid is flowing by here. Along the river are the White Cliffs which seem to form giant walls stretching from north to south along the shores of the river as it winds its way downstream."
129f8: S126 "You are on the Frigid River in the vicinity of the Dam. The river flows quietly here. There is a landing on the west shore."
12a34: S127 "You cannot go upstream due to strong currents."
12a4e: S128 "The White Cliffs prevent your landing here."
12a68: S129 "The river turns a corner here making it impossible to see the Dam. The White Cliffs loom on the east bank and large rocks prevent landing on the west."
12ab6: S130 "There is no safe landing spot here."
12aca: S131 "Just in time you steer away from the rocks."
12ae4: S132 "The river descends here into a valley. There is a narrow beach on the west shore below the cliffs. In the distance a faint rumbling can be heard."
12b30: S133 "You are on a narrow strip of beach which runs along the base of the White Cliffs. There is a narrow path heading south along the Cliffs and a tight passage leading west into the cliffs themselves."
12b8e: S134 "The path is too narrow."
12b9a: S135 "You are on a rocky, narrow strip of beach beside the Cliffs. A narrow path leads north along the shore."
12bce: S136 "The river is running faster here and the sound ahead appears to be that of rushing water. On the east shore is a sandy beach. A small area of beach can also be seen below the cliffs on the west shore."
12c36: S137 "You can land either to the east or the west."
12c4c: S138 "The sound of rushing water is nearly unbearable here. On the east shore is a large landing area."
12c80: S139 "You are on the east shore of the river. The water here seems somewhat treacherous. A path travels from north to south here, the south end quickly turning around a sharp corner."
12cd6: S140 "You are on a large sandy beach on the east shore of the river, which is flowing quickly by. A path runs beside the river to the south here, and a passage is partially buried in sand to the northeast."
12d36: S141 "This is a sand-filled cave whose exit is to the southwest."
12d58: S142 "It's a long way..."
12d64: S143 "You are on top of a rainbow (I bet you never thought you would walk on a rainbow), with a magnificent view of the Falls. The rainbow travels east-west here."
12dbe: S144 "You are on a small, rocky beach on the continuation of the Frigid River past the Falls. The beach is narrow due to the presence of the White Cliffs. The river canyon opens here and sunlight shines in from above. A rainbow crosses over the falls to the east and a narrow path continues to the southwest."
12e5c: S145 "You are beneath the walls of the river canyon which may be climbable here. The lesser part of the runoff of Aragain Falls flows by below. To the north is a narrow path."
12eb4: S146 "You are on a ledge about halfway up the wall of the river canyon. You can see from here that the main flow from Aragain Falls twists along a passage which it is impossible for you to enter. Below you is the canyon bottom. Above you is more cliff, which appears climbable."
12f34: S147 "You are at the top of the Great Canyon on its west wall. From here there is a marvelous view of the canyon and parts of the Frigid River upstream. Across the canyon, the walls of the White Cliffs join the mighty ramparts of the Flathead Mountains to the east. Following the Canyon upstream to the north, Aragain Falls may be seen, complete with rainbow. The mighty Frigid River flows out from a great dark cavern. To the west and south can be seen an immense forest, stretching for miles around. A path leads northwest. It is possible to climb down into the canyon from here."
13076: S148 "Nice view, lousy place to jump."
1308c: S149 "You are standing at the entrance of what might have been a coal mine. The shaft enters the west wall, and there is another exit on the south end of the room."
130da: S150 "You are in a small room. Strange squeaky sounds may be heard coming from the passage at the north end. You may also escape to the east."
13120: S151 "This is a large room, in the middle of which is a small shaft descending through the floor into darkness below. To the west and the north are exits from this room. Constructed over the top of the shaft is a metal framework to which a heavy iron chain is attached."
131a0: S152 "You wouldn't fit and would die if you could."
131b8: S153 "This is a small non-descript room. However, from the direction of a small descending staircase a foul odor can be detected. To the south is a narrow tunnel."
13206: S154 "This is a small room which smells strongly of coal gas. There is a short climb up some stairs and a narrow tunnel leading east."
13246: S155 "This is a very small room. In the corner is a rickety wooden ladder, leading downward. It might be safe to descend. There is also a staircase leading upward."
13296: S156 "This is a rather wide room. On one side is the bottom of a narrow wooden ladder. To the west and the south are passages leaving the room."
132d8: S157 "You have come to a dead end in the mine."
132ee: S158 "This is a long and narrow passage, which is cluttered with broken timbers. A wide passage comes from the east and turns at the west end of the room into a very narrow passageway. From the west comes a strong draft."
13358: S159 "You cannot fit through this passage with that load."
13368: S160 "This is a small drafty room in which is the bottom of a long shaft. To the south is a passageway and to the east a very narrow passage. In the shaft can be seen a heavy iron chain."
133c4: S161 "This is a non-descript part of a coal mine."
133e0: S162 "This is a small chamber, which appears to have been part of a coal mine. On the south wall of the chamber the letters ~Granite Wall~ are etched in the rock. To the east is a long passage, and there is a steep metal slide twisting downward. To the north is a small opening."
13470: S163 "F"
13472: S164 "If you insist.... Poof, you're dead!"
1348e: S165 " it at the time."
13498: S166 "Kicking the "
134a0: S167 "You should have looked before you leaped."
134b4: S168 "In the movies, your life would be passing before your eyes."
134d2: S169 "Geronimo..."
134dc: S170 "Playing in this way with the "
134ea: S171 "Pushing the "
134f2: S172 "Fiddling with the "
134fc: S173 "Very good. Now you can go to the second grade."
13518: S174 "Are you enjoying yourself?"
1352a: S175 "Wheeeeeeeeee!!!!!"
1353a: S176 "Do you expect me to applaud?"
1354c: S177 " hits you squarely in the head. Normally, this wouldn't do much damage, but by incredible mischance, you fall over backwards trying to duck, and break your neck, justice being swift and merciful in the Great Underground Empire."
135d4: S178 "Oh, no! You have walked into the slavering fangs of a lurking grue!"
135fc: S179 "Waving the "
13604: S180 "  "
13606: S181 "    "
1360a: S182 "      "
1360e: S183 "        "
13614: S184 "          "
1361c: S185 " doesn't seem to work."
13628: S186 " isn't notably helpful."
1363a: S187 " has no effect."
13644: S188 " and devoured you!"
13650: S189 "You can't swim in the dungeon."
13660: S190 "Hello."
13666: S191 "Good day."
1366e: S192 "Nice weather we've been having lately."
1368a: S193 "Goodbye."
13692: S194 "A valiant attempt."
136a0: S195 "You can't be serious."
136aa: S196 "An interesting idea..."
136bc: S197 "What a concept!"
136c8: S198 "Look around."
136d2: S199 "Too late for that."
136de: S200 "Have your eyes checked."
136ee: S201 "Well, you seem to have been brushing your teeth with some sort of glue. As a result, your mouth gets glued together (with your nose) and you die of respiratory failure."
13750: S202 "With great effort, you open the window far enough to allow entry."
1377a: S203 "The window closes (more easily than it opened)."
1379a: S204 "The door reluctantly opens to reveal a rickety staircase descending into darkness."
137c6: S205 "The door swings shut and closes."
137d8: S206 "A nasty-looking troll, brandishing a bloody axe, blocks all passages out of the room."
13806: S207 "A pathetically babbling troll is here."
1381c: S208 "An unconscious troll is sprawled on the floor. All passages out of the room are open."
13848: S209 "A nasty-looking troll, brandishing a bloody axe, blocks all passages out of the room."
13876: S210 "A troll is here."
1387e: S211 "The leaves burn, and so do you."
13892: S212 "The grating opens."
1389a: S213 "The grating opens to reveal trees above you."
138b2: S214 "As the knife approaches its victim, your mind is submerged by an overmastering will. Slowly, your hand turns, until the rusty blade is an inch from your neck. The knife seems to sing as it savagely slits your throat."
1392e: S215 "I'm afraid that the leap you attempted has done you in."
1394e: S216 "You are lifted up by the rising river! You try to swim, but the currents are too strong. You come closer, closer to the awesome structure of Flood Control Dam #3. The dam beckons to you. The roar of the water nearly deafens you, but you remain conscious as you tumble over the dam toward your certain doom among the rocks at its base."
13a0e: S217 "up to your ankles."
13a18: S218 "up to your shin."
13a22: S219 "up to your knees."
13a2c: S220 "up to your hips."
13a36: S221 "up to your waist."
13a40: S222 "up to your chest."
13a4a: S223 "up to your neck."
13a54: S224 "over your head."
13a5c: S225 "high in your lungs."
13a68: S226 "The room is full of water and cannot be entered."
13a7e: S227 "I'm afraid you have done drowned yourself."
13a9a: S228 "The rising water carries the boat over the dam, down the river, and over the falls. Tsk, tsk."
13acc: S229 "The cyclops, tired of all of your games and trickery, grabs you firmly. As he licks his chops, he says ~Mmm. Just like Mom used to make 'em.~ It's nice to be appreciated."
13b38: S230 "The cyclops seems somewhat agitated."
13b4a: S231 "The cyclops appears to be getting more agitated."
13b60: S232 "The cyclops is moving about the room, looking for something."
13b78: S233 "The cyclops was looking for salt and pepper. No doubt they are condiments for his upcoming snack."
13baa: S234 "The cyclops is moving toward you in an unfriendly manner."
13bc8: S235 "You have two choices: 1. Leave  2. Become dinner."
13bea: S236 "There is a suspicious-looking individual, holding a bag, leaning against one wall. He is armed with a vicious-looking stiletto."
13c34: S237 "There is a suspicious-looking individual lying unconscious on the ground."
13c5e: S238 "The voice of the guardian of the dungeon booms out from the darkness, ~Your disrespect costs you your life!~ and places your head on a sharp pole."
13cae: S239 "A booming voice says ~Wrong, cretin!~ and you notice that you have turned into a pile of dust. How, I can't imagine."
13cf4: S240 "There is a worthless piece of canvas here."
13d0c: S241 "The lamp appears a bit dimmer."
13d1c: S242 "The lamp is definitely dimmer now."
13d32: S243 "The lamp is nearly out."
13d40: S244 "The candles grow shorter."
13d4c: S245 "The candles are becoming quite short."
13d60: S246 "The candles won't last long now."
13d6e: S247 "^      ** BOOOOOOOOOOOM **"
13d92: S248 "The structural integrity of the rainbow is severely compromised, leaving you hanging in mid-air, supported only by water vapor. Bye."
13de4: S249 "You splash around for a while, fighting the current, then you drown."
13e0e: S250 "Unfortunately, the magic boat doesn't provide protection from the rocks and boulders one meets at the bottom of waterfalls. Including this one."
13e5a: S251 "Another pathetic sputter, this time from you, heralds your drowning."
13e80: S252 "In other words, fighting the fierce currents of the Frigid River. You manage to hold your own for a bit, but then you are carried over a waterfall and into some nasty rocks. Ouch!"
13ee2: S253 "The hole collapses, smothering you."
13efa: S254 "You seem to be digging a hole here."
13f0e: S255 "The hole is getting deeper, but that's about it."
13f28: S256 "You are surrounded by a wall of sand on all sides."
13f44: S257 "That was just a bit too far down."
13f5a: S258 "Well, you really did it that time. Is suicide painless?"
13f7e: S259 "It appears that that last blow was too much for you. I'm afraid you are dead."
13fa8: S260 "Your "
13faa: S261 " misses the "
13fb2: S262 " by an inch."
13fba: S263 "A good slash, but it misses the "
13fcc: S264 " by a mile."
13fd4: S265 "You charge, but the "
13fde: S266 " jumps nimbly aside."
13fec: S267 "Clang! Crash! The "
13ffa: S268 " parries."
14002: S269 "A quick stroke, but the "
14010: S270 " is on guard."
14018: S271 "A good stroke, but it's too slow; the "
14030: S272 " dodges."
14036: S273 " crashes down, knocking the "
14048: S274 " into dreamland."
14052: S275 "The "
14054: S276 " is battered into unconsciousness."
1406a: S277 "A furious exchange, and the "
1407a: S278 " is knocked out!"
14086: S279 "The haft of your "
1408e: S280 " knocks out the "
14094: S281 "."
14096: S282 "It's curtains for the "
140a0: S283 " as your "
140a4: S284 " removes his head."
140b0: S285 "The fatal blow strikes the "
140c0: S286 " square in the heart:  He dies."
140d4: S287 " takes a fatal blow and slumps to the floor dead."
140f2: S288 " is struck on the arm; blood begins to trickle down."
14114: S289 " pinks the "
1411a: S290 " on the wrist, but it's not serious."
14130: S291 "Your stroke lands, but it was only the flat of the blade."
14150: S292 "The blow lands, making a shallow gash in the "
1416c: S293 "'s arm!"
14172: S294 " receives a deep gash in his side."
14188: S295 "A savage blow on the thigh! The "
1419c: S296 " is stunned but can still fight!"
141b0: S297 "Slash! Your blow lands! That one hit an artery, it could be serious!"
141dc: S298 "Slash! Your stroke connects! This could be serious!"
141fc: S299 " is staggered, and drops to his knees."
14212: S300 " is momentarily disoriented and can't fight back."
14230: S301 "The force of your blow knocks the "
1423e: S302 " back, stunned."
1424a: S303 " is confused and can't fight back."
1425e: S304 "The quickness of your thrust knocks the "
14270: S305 "'s weapon is knocked to the floor, leaving him unarmed."
14294: S306 " is disarmed by a subtle feint past his guard."
142b2: S307 "The Cyclops misses, but the backwash almost knocks you over."
142ce: S308 "The Cyclops rushes you, but runs into the wall."
142e4: S309 "The Cyclops sends you crashing to the floor, unconscious."
14302: S310 "The Cyclops breaks your neck with a massive smash."
1431c: S311 "A quick punch, but it was only a glancing blow."
1433a: S312 "A glancing blow from the Cyclops' fist."
14354: S313 "The monster smashes his huge fist into your chest, breaking several ribs."
14380: S314 "The Cyclops almost knocks the wind out of you with a quick punch."
1439e: S315 "The Cyclops lands a punch that knocks the wind out of you."
143b8: S316 "Heedless of your weapons, the Cyclops tosses you against the rock wall of the room."
143e2: S317 "The Cyclops grabs your "
143ea: S318 ", tastes it, and throws it to the ground in disgust."
14406: S319 "The monster grabs you on the wrist, squeezes, and you drop your "
14428: S320 " in pain."
1442e: S321 "The Cyclops seems unable to decide whether to broil or stew his dinner."
14454: S322 "The Cyclops, no sportsman, dispatches his unconscious victim."
1447c: S323 "The troll swings his axe, but it misses."
14490: S324 "The troll's axe barely misses your ear."
144a4: S325 "The axe sweeps past as you jump aside."
144bc: S326 "The axe crashes against the rock, throwing sparks!"
144dc: S327 "The flat of the troll's axe hits you delicately on the head, knocking you out."
14506: S328 "The troll neatly removes your head."
14518: S329 "The troll's axe stroke cleaves you from the nave to the chops."
14536: S330 "The troll's axe removes your head."
14546: S331 "The axe gets you right in the side. Ouch!"
1455e: S332 "The flat of the troll's axe skins across your forearm."
1457a: S333 "The troll's swing almost knocks you over as you barely parry in time."
1459c: S334 "The troll swings his axe, and it nicks your arm as you dodge."
145bc: S335 "The troll charges, and his axe slashes you on your "
145d4: S336 " arm."
145d8: S337 "An axe stroke makes a deep wound in your leg."
145f6: S338 "The troll's axe swings down, gashing your shoulder."
14612: S339 "The troll hits you with a glancing blow, and you are momentarily stunned."
14638: S340 "The troll swings; the blade turns on your armor but crashes broadside into your head."
14666: S341 "You stagger back under a hail of axe strokes."
14684: S342 "The troll's mighty blow drops you to your knees."
1469c: S343 "The axe hits your "
146a6: S344 " and knocks it spinning."
146b2: S345 "The troll swings, you parry, but the force of his blow knocks your "
146d0: S346 " away."
146d6: S347 "The axe knocks your "
146de: S348 " out of your hand. It falls to the floor."
146f4: S349 "The troll hesitates, fingering his axe."
1470a: S350 "The troll scratches his head ruminatively:  Might you be magically protected, he wonders?"
14740: S351 "Conquering his fears, the troll puts you to death."
1475c: S352 "The thief stabs nonchalantly with his stiletto and misses."
1477a: S353 "You dodge as the thief comes in low."
1478e: S354 "You parry a lightning thrust, and the thief salutes you with a grim nod."
147b6: S355 "The thief tries to sneak past your guard, but you twist away."
147d6: S356 "Shifting in the midst of a thrust, the thief knocks you unconscious with the haft of his stiletto."
14808: S357 "The thief knocks you out."
14812: S358 "Finishing you off, the thief inserts his blade into your heart."
14834: S359 "The thief comes in from the side, feints, and inserts the blade into your ribs."
1485c: S360 "The thief bows formally, raises his stiletto, and with a wry grin, ends the battle and your life."
14890: S361 "A quick thrust pinks your left arm, and blood starts to trickle down."
148bc: S362 "The thief draws blood, raking his stiletto across your arm."
148dc: S363 "The stiletto flashes faster than you can follow, and blood wells from your leg."
14908: S364 "The thief slowly approaches, strikes like a snake, and leaves you wounded."
14934: S365 "The thief strikes like a snake! The resulting wound is serious."
1495a: S366 "The thief stabs a deep cut in your upper arm."
14972: S367 "The stiletto touches your forehead, and the blood obscures your vision."
1499a: S368 "The thief strikes at your wrist, and suddenly your grip is slippery with blood."
149c4: S369 "The butt of his stiletto cracks you on the skull, and you stagger back."
149ea: S370 "The thief rams the haft of his blade into your stomach, leaving you out of breath."
14a14: S371 "The thief attacks, and you fall back desperately."
14a30: S372 "A long, theatrical slash. You catch it on your "
14a4c: S373 ", but the thief twists his knife, and the "
14a60: S374 " goes flying."
14a6a: S375 "The thief neatly flips your "
14a78: S376 " out of your hands, and it drops to the floor."
14a90: S377 "You parry a low thrust, and your "
14aa2: S378 " slips out of your hand."
14ab0: S379 "The thief, a man of superior breeding, pauses for a moment to consider the propriety of finishing you off."
14af0: S380 "The thief amuses himself by searching your pockets."
14b0e: S381 "The thief entertains himself by rifling your pack."
14b2a: S382 "The thief, forgetting his essentially genteel upbringing, cuts your throat."
14b58: S383 "The thief, a pragmatist, dispatches you as a threat to his livelihood."
14b84: S384 "coins"
14b88: S385 "jewels"

[End of text at 14b8c]

[End of file]
