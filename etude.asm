Resident data ends at 61c, program starts at 61c, file ends at 4a0c

Starting analysis pass at address 61c

End of analysis pass, low address = 61c, high address = 20b6

[Start of code at 61c]

Main routine 61c, 0 locals

  61d:  e0 3f 05 6b ff          CALL_VS         15ac -> Gef
  622:  ba                      QUIT            

Routine 624, 2 locals

  625:  e0 17 07 a1 32 00 01    CALL_VS         1e84 (#32,#00) -> L00
  62c:  e0 17 07 a1 32 01 02    CALL_VS         1e84 (#32,#01) -> L01
  633:  a0 01 4b                JZ              L00 [FALSE] 63f
  636:  a0 02 48                JZ              L01 [FALSE] 63f
  639:  8d 08 46                PRINT_PADDR     S003
  63c:  8c 00 1f                JUMP            65c
  63f:  8d 08 55                PRINT_PADDR     S004
  642:  e6 bf 01                PRINT_NUM       L00
  645:  b2 ...                  PRINT           "."
  648:  e6 bf 02                PRINT_NUM       L01
  64b:  b2 ...                  PRINT           " of the Z-Spec.

"
  65c:  e0 17 07 a1 00 01 01    CALL_VS         1e84 (#00,#01) -> L00
  663:  49 01 01 00             AND             L00,#01 -> -(SP)
  667:  a0 00 c8                JZ              (SP)+ [TRUE] 670
  66a:  8d 08 5d                PRINT_PADDR     S005
  66d:  8c 00 05                JUMP            673
  670:  8d 08 67                PRINT_PADDR     S006
  673:  49 01 04 00             AND             L00,#04 -> -(SP)
  677:  a0 00 c8                JZ              (SP)+ [TRUE] 680
  67a:  8d 08 72                PRINT_PADDR     S007
  67d:  8c 00 05                JUMP            683
  680:  8d 08 7e                PRINT_PADDR     S008
  683:  49 01 08 00             AND             L00,#08 -> -(SP)
  687:  a0 00 c8                JZ              (SP)+ [TRUE] 690
  68a:  8d 08 8b                PRINT_PADDR     S009
  68d:  8c 00 05                JUMP            693
  690:  8d 08 98                PRINT_PADDR     S010
  693:  49 01 10 00             AND             L00,#10 -> -(SP)
  697:  a0 00 c8                JZ              (SP)+ [TRUE] 6a0
  69a:  8d 08 a6                PRINT_PADDR     S011
  69d:  8c 00 05                JUMP            6a3
  6a0:  8d 08 b1                PRINT_PADDR     S012
  6a3:  49 01 20 00             AND             L00,#20 -> -(SP)
  6a7:  a0 00 c8                JZ              (SP)+ [TRUE] 6b0
  6aa:  8d 08 bd                PRINT_PADDR     S013
  6ad:  8c 00 05                JUMP            6b3
  6b0:  8d 08 c7                PRINT_PADDR     S014
  6b3:  49 01 80 00             AND             L00,#80 -> -(SP)
  6b7:  a0 00 c8                JZ              (SP)+ [TRUE] 6c0
  6ba:  8d 08 d2                PRINT_PADDR     S015
  6bd:  8c 00 05                JUMP            6c3
  6c0:  8d 08 dc                PRINT_PADDR     S016
  6c3:  bb                      NEW_LINE        
  6c4:  e0 17 07 a1 10 01 01    CALL_VS         1e84 (#10,#01) -> L00
  6cb:  49 01 10 00             AND             L00,#10 -> -(SP)
  6cf:  a0 00 c8                JZ              (SP)+ [TRUE] 6d8
  6d2:  8d 08 e7                PRINT_PADDR     S017
  6d5:  8c 00 05                JUMP            6db
  6d8:  8d 08 f0                PRINT_PADDR     S018
  6db:  b0                      RTRUE           

Routine 6dc, 4 locals

  6dd:  e0 17 07 a1 00 01 01    CALL_VS         1e84 (#00,#01) -> L00
  6e4:  49 01 01 00             AND             L00,#01 -> -(SP)
  6e8:  a0 00 cb                JZ              (SP)+ [TRUE] 6f4
  6eb:  8d 09 06                PRINT_PADDR     S029
  6ee:  0d 04 01                STORE           L03,#01
  6f1:  8c 00 08                JUMP            6fa
  6f4:  8d 09 10                PRINT_PADDR     S030
  6f7:  0d 04 00                STORE           L03,#00
  6fa:  a0 04 c8                JZ              L03 [TRUE] 703
  6fd:  8d 09 1b                PRINT_PADDR     S031
  700:  8c 00 05                JUMP            706
  703:  8d 09 22                PRINT_PADDR     S032
  706:  8d 09 2b                PRINT_PADDR     S033
  709:  0f 00 08 ff             LOADW           #00,#08 -> Gef
  70d:  28 02 ff ff             OR              #02,Gef -> Gef
  711:  e1 5b 00 08 ff          STOREW          #00,#08,Gef
  716:  bb                      NEW_LINE        
  717:  b2 ...                  PRINT           "Bk Rd Gr Yl Bl Mg Cy Wh
"
  72e:  0d 02 02                STORE           L01,#02
  731:  42 02 0a 00 47          JL              L01,#0a [FALSE] 77b
  736:  0d 03 02                STORE           L02,#02
  739:  42 03 0a 4f             JL              L02,#0a [FALSE] 74a
  73d:  7b 02 03                SET_COLOUR      L01,L02
  740:  b2 ...                  PRINT           "## "
  745:  95 03                   INC             L02
  747:  8c ff f1                JUMP            739
  74a:  1b 01 01                SET_COLOUR      #01,#01
  74d:  b2 ...                  PRINT           ": "
  750:  42 02 00 c6             JL              L01,#00 [TRUE] 758
  754:  42 02 0a d2             JL              L01,#0a [TRUE] 768
  758:  fa 19 5f 06 55 1d 02 09 01 00 
                               CALL_VN2        1954 (#1d,L01,#09,#01,#00)
  762:  e8 7f 00                PUSH            #00
  765:  8c 00 08                JUMP            76e
  768:  cf 2f 04 e8 02 00       LOADW           #04e8,L01 -> -(SP)
  76e:  da 2f 07 dd 00          CALL_2N         1f74 ((SP)+)
  773:  b2 ...                  PRINT           "
"
  776:  95 02                   INC             L01
  778:  8c ff b8                JUMP            731
  77b:  0f 00 08 ff             LOADW           #00,#08 -> Gef
  77f:  c9 2f ff fd ff ff       AND             #fffd,Gef -> Gef
  785:  e1 5b 00 08 ff          STOREW          #00,#08,Gef
  78a:  b0                      RTRUE           

Routine 78c, 1 local

  78d:  e0 17 07 a1 00 01 01    CALL_VS         1e84 (#00,#01) -> L00
  794:  49 01 04 00             AND             L00,#04 -> -(SP)
  798:  a0 00 c8                JZ              (SP)+ [TRUE] 7a1
  79b:  8d 09 47                PRINT_PADDR     S034
  79e:  8c 00 05                JUMP            7a4
  7a1:  8d 09 53                PRINT_PADDR     S035
  7a4:  49 01 08 00             AND             L00,#08 -> -(SP)
  7a8:  a0 00 c8                JZ              (SP)+ [TRUE] 7b1
  7ab:  8d 09 60                PRINT_PADDR     S036
  7ae:  8c 00 05                JUMP            7b4
  7b1:  8d 09 6d                PRINT_PADDR     S037
  7b4:  49 01 10 00             AND             L00,#10 -> -(SP)
  7b8:  a0 00 c8                JZ              (SP)+ [TRUE] 7c1
  7bb:  8d 09 7b                PRINT_PADDR     S038
  7be:  8c 00 05                JUMP            7c4
  7c1:  8d 09 86                PRINT_PADDR     S039
  7c4:  bb                      NEW_LINE        
  7c5:  f1 7f 02                SET_TEXT_STYLE  BOLDFACE
  7c8:  b2 ...                  PRINT           "Test of emphasized (bold)
text."
  7e1:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  7e4:  b2 ...                  PRINT           "
...normal font...
"
  7f7:  f1 7f 04                SET_TEXT_STYLE  EMPHASIS
  7fa:  8d 09 92                PRINT_PADDR     S040
  7fd:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  800:  b2 ...                  PRINT           "
...normal font...
"
  813:  f1 7f 01                SET_TEXT_STYLE  REVERSE
  816:  b2 ...                  PRINT           "Test of reverse-video text."
  82b:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  82e:  b2 ...                  PRINT           "
...normal font...
"
  841:  0f 00 08 ff             LOADW           #00,#08 -> Gef
  845:  28 02 ff ff             OR              #02,Gef -> Gef
  849:  e1 5b 00 08 ff          STOREW          #00,#08,Gef
  84e:  8d 09 99                PRINT_PADDR     S041
  851:  0f 00 08 ff             LOADW           #00,#08 -> Gef
  855:  c9 2f ff fd ff ff       AND             #fffd,Gef -> Gef
  85b:  e1 5b 00 08 ff          STOREW          #00,#08,Gef
  860:  b2 ...                  PRINT           "
...normal font...
"
  873:  f1 7f 08                SET_TEXT_STYLE  FIXED_FONT
  876:  8d 09 a6                PRINT_PADDR     S042
  879:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  87c:  bb                      NEW_LINE        
  87d:  8d 09 b1                PRINT_PADDR     S043
  880:  f1 7f 02                SET_TEXT_STYLE  BOLDFACE
  883:  f1 7f 04                SET_TEXT_STYLE  EMPHASIS
  886:  b2 ...                  PRINT           "Test of bold, italic text."
  89b:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  89e:  bb                      NEW_LINE        
  89f:  f1 7f 02                SET_TEXT_STYLE  BOLDFACE
  8a2:  f1 7f 01                SET_TEXT_STYLE  REVERSE
  8a5:  b2 ...                  PRINT           "Test of bold, reverse text."
  8ba:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  8bd:  bb                      NEW_LINE        
  8be:  f1 7f 04                SET_TEXT_STYLE  EMPHASIS
  8c1:  f1 7f 01                SET_TEXT_STYLE  REVERSE
  8c4:  b2 ...                  PRINT           "Test of italic, reverse text."
  8db:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  8de:  bb                      NEW_LINE        
  8df:  f1 7f 02                SET_TEXT_STYLE  BOLDFACE
  8e2:  f1 7f 04                SET_TEXT_STYLE  EMPHASIS
  8e5:  f1 7f 01                SET_TEXT_STYLE  REVERSE
  8e8:  8d 09 d0                PRINT_PADDR     S044
  8eb:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  8ee:  bb                      NEW_LINE        
  8ef:  8d 09 d7                PRINT_PADDR     S045
  8f2:  0f 00 08 ff             LOADW           #00,#08 -> Gef
  8f6:  28 02 ff ff             OR              #02,Gef -> Gef
  8fa:  e1 5b 00 08 ff          STOREW          #00,#08,Gef
  8ff:  f1 7f 02                SET_TEXT_STYLE  BOLDFACE
  902:  b2 ...                  PRINT           "Test of fixed, bold text."
  917:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  91a:  bb                      NEW_LINE        
  91b:  f1 7f 04                SET_TEXT_STYLE  EMPHASIS
  91e:  b2 ...                  PRINT           "Test of fixed, italic text."
  933:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  936:  bb                      NEW_LINE        
  937:  f1 7f 01                SET_TEXT_STYLE  REVERSE
  93a:  b2 ...                  PRINT           "Test of fixed, reverse text."
  951:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  954:  bb                      NEW_LINE        
  955:  f1 7f 02                SET_TEXT_STYLE  BOLDFACE
  958:  f1 7f 04                SET_TEXT_STYLE  EMPHASIS
  95b:  8d 09 ef                PRINT_PADDR     S046
  95e:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  961:  bb                      NEW_LINE        
  962:  f1 7f 02                SET_TEXT_STYLE  BOLDFACE
  965:  f1 7f 01                SET_TEXT_STYLE  REVERSE
  968:  8d 09 f6                PRINT_PADDR     S047
  96b:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  96e:  bb                      NEW_LINE        
  96f:  f1 7f 04                SET_TEXT_STYLE  EMPHASIS
  972:  f1 7f 01                SET_TEXT_STYLE  REVERSE
  975:  8d 09 fd                PRINT_PADDR     S048
  978:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  97b:  bb                      NEW_LINE        
  97c:  f1 7f 02                SET_TEXT_STYLE  BOLDFACE
  97f:  f1 7f 04                SET_TEXT_STYLE  EMPHASIS
  982:  f1 7f 01                SET_TEXT_STYLE  REVERSE
  985:  8d 0a 04                PRINT_PADDR     S049
  988:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  98b:  bb                      NEW_LINE        
  98c:  0f 00 08 ff             LOADW           #00,#08 -> Gef
  990:  c9 2f ff fd ff ff       AND             #fffd,Gef -> Gef
  996:  e1 5b 00 08 ff          STOREW          #00,#08,Gef
  99b:  b2 ...                  PRINT           "
End of styles test.
"
  9ae:  b0                      RTRUE           

Routine 9b0, 3 locals

  9b1:  da 2f 07 dd 01          CALL_2N         1f74 (L00)
  9b6:  b2 ...                  PRINT           " = "
  9bb:  e6 bf 02                PRINT_NUM       L01
  9be:  61 02 03 4c             JE              L01,L02 [FALSE] 9cc
  9c2:  b2 ...                  PRINT           " (ok)
"
  9c9:  8c 00 20                JUMP            9ea
  9cc:  b2 ...                  PRINT           " (ERROR, should be "
  9df:  e6 bf 03                PRINT_NUM       L02
  9e2:  b2 ...                  PRINT           "!)
"
  9e7:  0d 10 01                STORE           G00,#01
  9ea:  b0                      RTRUE           

Routine 9ec, 3 locals

  9ed:  8d 0a 0c                PRINT_PADDR     S050
  9f0:  8d 0a 31                PRINT_PADDR     S051
  9f3:  0d 10 00                STORE           G00,#00
  9f6:  0d 01 0d                STORE           L00,#0d
  9f9:  0d 02 05                STORE           L01,#05
  9fc:  76 01 02 03             MUL             L00,L01 -> L02
  a00:  f9 09 02 6c 0a 81 03 41 CALL_VN         9b0 (S052,L02,#41)
  a08:  0d 01 0d                STORE           L00,#0d
  a0b:  cd 4f 02 ff fb          STORE           L01,#fffb
  a10:  76 01 02 03             MUL             L00,L01 -> L02
  a14:  f9 08 02 6c 0a 83 03 ff bf 
                               CALL_VN         9b0 (S053,L02,#ffbf)
  a1d:  cd 4f 01 ff f3          STORE           L00,#fff3
  a22:  0d 02 05                STORE           L01,#05
  a25:  76 01 02 03             MUL             L00,L01 -> L02
  a29:  f9 08 02 6c 0a 86 03 ff bf 
                               CALL_VN         9b0 (S054,L02,#ffbf)
  a32:  cd 4f 01 ff f3          STORE           L00,#fff3
  a37:  cd 4f 02 ff fb          STORE           L01,#fffb
  a3c:  76 01 02 03             MUL             L00,L01 -> L02
  a40:  f9 09 02 6c 0a 89 03 41 CALL_VN         9b0 (S055,L02,#41)
  a48:  0d 01 0d                STORE           L00,#0d
  a4b:  0d 02 05                STORE           L01,#05
  a4e:  2d ff 01                STORE           Gef,L00
  a51:  2d fe 02                STORE           Gee,L01
  a54:  a0 fe 49                JZ              Gee [FALSE] a5e
  a57:  f9 1f 06 55 14          CALL_VN         1954 (#14)
  a5c:  95 fe                   INC             Gee
  a5e:  77 ff fe 03             DIV             Gef,Gee -> L02
  a62:  f9 09 02 6c 0a 8c 03 02 CALL_VN         9b0 (S056,L02,#02)
  a6a:  0d 01 0d                STORE           L00,#0d
  a6d:  cd 4f 02 ff fb          STORE           L01,#fffb
  a72:  2d ff 01                STORE           Gef,L00
  a75:  2d fe 02                STORE           Gee,L01
  a78:  a0 fe 49                JZ              Gee [FALSE] a82
  a7b:  f9 1f 06 55 14          CALL_VN         1954 (#14)
  a80:  95 fe                   INC             Gee
  a82:  77 ff fe 03             DIV             Gef,Gee -> L02
  a86:  f9 08 02 6c 0a 8e 03 ff fe 
                               CALL_VN         9b0 (S057,L02,#fffe)
  a8f:  cd 4f 01 ff f3          STORE           L00,#fff3
  a94:  0d 02 05                STORE           L01,#05
  a97:  2d ff 01                STORE           Gef,L00
  a9a:  2d fe 02                STORE           Gee,L01
  a9d:  a0 fe 49                JZ              Gee [FALSE] aa7
  aa0:  f9 1f 06 55 14          CALL_VN         1954 (#14)
  aa5:  95 fe                   INC             Gee
  aa7:  77 ff fe 03             DIV             Gef,Gee -> L02
  aab:  f9 08 02 6c 0a 90 03 ff fe 
                               CALL_VN         9b0 (S058,L02,#fffe)
  ab4:  cd 4f 01 ff f3          STORE           L00,#fff3
  ab9:  cd 4f 02 ff fb          STORE           L01,#fffb
  abe:  2d ff 01                STORE           Gef,L00
  ac1:  2d fe 02                STORE           Gee,L01
  ac4:  a0 fe 49                JZ              Gee [FALSE] ace
  ac7:  f9 1f 06 55 14          CALL_VN         1954 (#14)
  acc:  95 fe                   INC             Gee
  ace:  77 ff fe 03             DIV             Gef,Gee -> L02
  ad2:  f9 09 02 6c 0a 92 03 02 CALL_VN         9b0 (S059,L02,#02)
  ada:  0d 01 0d                STORE           L00,#0d
  add:  0d 02 05                STORE           L01,#05
  ae0:  2d ff 01                STORE           Gef,L00
  ae3:  2d fe 02                STORE           Gee,L01
  ae6:  a0 fe 49                JZ              Gee [FALSE] af0
  ae9:  f9 1f 06 55 14          CALL_VN         1954 (#14)
  aee:  95 fe                   INC             Gee
  af0:  78 ff fe 03             MOD             Gef,Gee -> L02
  af4:  f9 09 02 6c 0a 95 03 03 CALL_VN         9b0 (S060,L02,#03)
  afc:  0d 01 0d                STORE           L00,#0d
  aff:  cd 4f 02 ff fb          STORE           L01,#fffb
  b04:  2d ff 01                STORE           Gef,L00
  b07:  2d fe 02                STORE           Gee,L01
  b0a:  a0 fe 49                JZ              Gee [FALSE] b14
  b0d:  f9 1f 06 55 14          CALL_VN         1954 (#14)
  b12:  95 fe                   INC             Gee
  b14:  78 ff fe 03             MOD             Gef,Gee -> L02
  b18:  f9 09 02 6c 0a 97 03 03 CALL_VN         9b0 (S061,L02,#03)
  b20:  cd 4f 01 ff f3          STORE           L00,#fff3
  b25:  0d 02 05                STORE           L01,#05
  b28:  2d ff 01                STORE           Gef,L00
  b2b:  2d fe 02                STORE           Gee,L01
  b2e:  a0 fe 49                JZ              Gee [FALSE] b38
  b31:  f9 1f 06 55 14          CALL_VN         1954 (#14)
  b36:  95 fe                   INC             Gee
  b38:  78 ff fe 03             MOD             Gef,Gee -> L02
  b3c:  f9 08 02 6c 0a 9a 03 ff fd 
                               CALL_VN         9b0 (S062,L02,#fffd)
  b45:  cd 4f 01 ff f3          STORE           L00,#fff3
  b4a:  cd 4f 02 ff fb          STORE           L01,#fffb
  b4f:  2d ff 01                STORE           Gef,L00
  b52:  2d fe 02                STORE           Gee,L01
  b55:  a0 fe 49                JZ              Gee [FALSE] b5f
  b58:  f9 1f 06 55 14          CALL_VN         1954 (#14)
  b5d:  95 fe                   INC             Gee
  b5f:  78 ff fe 03             MOD             Gef,Gee -> L02
  b63:  f9 08 02 6c 0a 9d 03 ff fd 
                               CALL_VN         9b0 (S063,L02,#fffd)
  b6c:  a0 10 4e                JZ              G00 [FALSE] b7b
  b6f:  b2 ...                  PRINT           "
"
  b72:  da 0f 07 dd 08 2f       CALL_2N         1f74 (S001)
  b78:  8c 00 0b                JUMP            b84
  b7b:  b2 ...                  PRINT           "
"
  b7e:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
  b84:  b0                      RTRUE           

Routine b88, 2 locals

  b89:  8d 0b 7a                PRINT_PADDR     S133
  b8c:  8d 0b 98                PRINT_PADDR     S134
  b8f:  8d 0b e2                PRINT_PADDR     S135
  b92:  0d 02 00                STORE           L01,#00
  b95:  90 01 80 df             JZ              #01 [TRUE] c76
  b99:  42 02 00 80 a7          JL              L01,#00 [TRUE] c43
  b9e:  49 02 04 00             AND             L01,#04 -> -(SP)
  ba2:  a0 00 cf                JZ              (SP)+ [TRUE] bb2
  ba5:  0f 00 08 ff             LOADW           #00,#08 -> Gef
  ba9:  28 02 ff ff             OR              #02,Gef -> Gef
  bad:  e1 5b 00 08 ff          STOREW          #00,#08,Gef
  bb2:  49 02 02 00             AND             L01,#02 -> -(SP)
  bb6:  a0 00 c5                JZ              (SP)+ [TRUE] bbc
  bb9:  f1 7f 04                SET_TEXT_STYLE  EMPHASIS
  bbc:  49 02 01 00             AND             L01,#01 -> -(SP)
  bc0:  a0 00 c5                JZ              (SP)+ [TRUE] bc6
  bc3:  f1 7f 02                SET_TEXT_STYLE  BOLDFACE
  bc6:  0d 01 01                STORE           L00,#01
  bc9:  02 00 00 c6             JL              #00,#00 [TRUE] bd1
  bcd:  02 00 46 d2             JL              #00,#46 [TRUE] be1
  bd1:  fa 15 5f 06 55 1d 00 45 03 01 
                               CALL_VN2        1954 (#1d,#00,#45,#03,#01)
  bdb:  e8 7f 00                PUSH            #00
  bde:  8c 00 08                JUMP            be7
  be1:  cf 1f 04 fc 00 00       LOADW           #04fc,#00 -> -(SP)
  be7:  63 01 00 f8             JG              L00,(SP)+ [TRUE] c21
  beb:  42 01 00 c6             JL              L00,#00 [TRUE] bf3
  bef:  42 01 46 d2             JL              L00,#46 [TRUE] c03
  bf3:  fa 19 5f 06 55 1d 01 45 03 01 
                               CALL_VN2        1954 (#1d,L00,#45,#03,#01)
  bfd:  e8 7f 00                PUSH            #00
  c00:  8c 00 08                JUMP            c09
  c03:  cf 2f 04 fc 01 00       LOADW           #04fc,L00 -> -(SP)
  c09:  da 2f 07 dd 00          CALL_2N         1f74 ((SP)+)
  c0e:  58 01 04 00             MOD             L00,#04 -> -(SP)
  c12:  a0 00 46                JZ              (SP)+ [FALSE] c19
  c15:  bb                      NEW_LINE        
  c16:  8c 00 05                JUMP            c1c
  c19:  b2 ...                  PRINT           "   "
  c1c:  95 01                   INC             L00
  c1e:  8c ff aa                JUMP            bc9
  c21:  49 02 04 00             AND             L01,#04 -> -(SP)
  c25:  a0 00 d1                JZ              (SP)+ [TRUE] c37
  c28:  0f 00 08 ff             LOADW           #00,#08 -> Gef
  c2c:  c9 2f ff fd ff ff       AND             #fffd,Gef -> Gef
  c32:  e1 5b 00 08 ff          STOREW          #00,#08,Gef
  c37:  49 02 03 00             AND             L01,#03 -> -(SP)
  c3b:  a0 00 c5                JZ              (SP)+ [TRUE] c41
  c3e:  f1 7f 00                SET_TEXT_STYLE  ROMAN
  c41:  bb                      NEW_LINE        
  c42:  bb                      NEW_LINE        
  c43:  8d 0c 3c                PRINT_PADDR     S136
  c46:  8d 0c 4e                PRINT_PADDR     S137
  c49:  b2 ...                  PRINT           "
Accents> "
  c54:  f6 7f 01 01             READ_CHAR       #01 -> L00
  c58:  bb                      NEW_LINE        
  c59:  41 01 2e 43             JE              L00,#2e [FALSE] c5e
  c5d:  b0                      RTRUE           
  c5e:  bb                      NEW_LINE        
  c5f:  42 01 30 cd             JL              L00,#30 [TRUE] c6e
  c63:  43 01 37 c9             JG              L00,#37 [TRUE] c6e
  c67:  55 01 30 02             SUB             L00,#30 -> L01
  c6b:  8c 00 07                JUMP            c73
  c6e:  cd 4f 02 ff ff          STORE           L01,#ffff
  c73:  8c ff 21                JUMP            b95
  c76:  b0                      RTRUE           

Routine c78, 3 locals

  c79:  0d 03 00                STORE           L02,#00
  c7c:  41 01 08 4b             JE              L00,#08 [FALSE] c89
  c80:  8d 0c 6a                PRINT_PADDR     S138
  c83:  0d 03 02                STORE           L02,#02
  c86:  8c 01 fa                JUMP            e81
  c89:  41 01 0d 4b             JE              L00,#0d [FALSE] c96
  c8d:  8d 0c 74                PRINT_PADDR     S139
  c90:  0d 03 02                STORE           L02,#02
  c93:  8c 01 ed                JUMP            e81
  c96:  41 01 1b 4b             JE              L00,#1b [FALSE] ca3
  c9a:  8d 0c 7e                PRINT_PADDR     S140
  c9d:  0d 03 02                STORE           L02,#02
  ca0:  8c 01 e0                JUMP            e81
  ca3:  42 01 20 69             JL              L00,#20 [FALSE] cce
  ca7:  b2 ...                  PRINT           "control character 'ctrl-"
  cba:  54 01 40 00             ADD             L00,#40 -> -(SP)
  cbe:  da 2f 07 d0 00          CALL_2N         1f40 ((SP)+)
  cc3:  b2 ...                  PRINT           "'"
  cc6:  cd 4f 03 ff ff          STORE           L02,#ffff
  ccb:  8c 01 b5                JUMP            e81
  cce:  41 01 7f 5f             JE              L00,#7f [FALSE] cef
  cd2:  b2 ...                  PRINT           "control character 'delete'"
  ce7:  cd 4f 03 ff ff          STORE           L02,#ffff
  cec:  8c 01 94                JUMP            e81
  cef:  41 01 80 59             JE              L00,#80 [FALSE] d0a
  cf3:  b2 ...                  PRINT           "undefined character"
  d02:  cd 4f 03 ff ff          STORE           L02,#ffff
  d07:  8c 01 79                JUMP            e81
  d0a:  42 01 80 5e             JL              L00,#80 [FALSE] d2a
  d0e:  b2 ...                  PRINT           "ASCII character '"
  d1f:  da 2f 07 d0 01          CALL_2N         1f40 (L00)
  d24:  b2 ...                  PRINT           "'"
  d27:  8c 01 59                JUMP            e81
  d2a:  42 01 9b 00 a3          JL              L00,#9b [FALSE] dd0
  d2f:  0d 03 02                STORE           L02,#02
  d32:  2d ff 01                STORE           Gef,L00
  d35:  41 ff 81 4c             JE              Gef,#81 [FALSE] d43
  d39:  b2 ...                  PRINT           "cursor up"
  d40:  8c 00 8c                JUMP            dcd
  d43:  41 ff 82 4e             JE              Gef,#82 [FALSE] d53
  d47:  b2 ...                  PRINT           "cursor down"
  d50:  8c 00 7c                JUMP            dcd
  d53:  41 ff 83 4e             JE              Gef,#83 [FALSE] d63
  d57:  b2 ...                  PRINT           "cursor left"
  d60:  8c 00 6c                JUMP            dcd
  d63:  41 ff 84 4e             JE              Gef,#84 [FALSE] d73
  d67:  b2 ...                  PRINT           "cursor right"
  d70:  8c 00 5c                JUMP            dcd
  d73:  c1 95 ff 85 86 87 d7    JE              Gef,#85,#86,#87 [TRUE] d8f
  d7a:  c1 95 ff 88 89 8a d0    JE              Gef,#88,#89,#8a [TRUE] d8f
  d81:  c1 95 ff 8b 8c 8d c9    JE              Gef,#8b,#8c,#8d [TRUE] d8f
  d88:  c1 95 ff 8e 8f 90 57    JE              Gef,#8e,#8f,#90 [FALSE] da4
  d8f:  b2 ...                  PRINT           "function key "
  d9a:  55 01 84 00             SUB             L00,#84 -> -(SP)
  d9e:  e6 bf 00                PRINT_NUM       (SP)+
  da1:  8c 00 2b                JUMP            dcd
  da4:  c1 95 ff 91 92 93 d4    JE              Gef,#91,#92,#93 [TRUE] dbd
  dab:  c1 95 ff 94 95 96 cd    JE              Gef,#94,#95,#96 [TRUE] dbd
  db2:  c1 95 ff 97 98 99 c6    JE              Gef,#97,#98,#99 [TRUE] dbd
  db9:  41 ff 9a 52             JE              Gef,#9a [FALSE] dcd
  dbd:  b2 ...                  PRINT           "keypad key "
  dc6:  55 01 91 00             SUB             L00,#91 -> -(SP)
  dca:  e6 bf 00                PRINT_NUM       (SP)+
  dcd:  8c 00 b3                JUMP            e81
  dd0:  42 01 e0 79             JL              L00,#e0 [FALSE] e0b
  dd4:  55 01 9b 00             SUB             L00,#9b -> -(SP)
  dd8:  54 00 01 00             ADD             (SP)+,#01 -> -(SP)
  ddc:  e9 7f fe                PULL            Gee
  ddf:  e8 bf fe                PUSH            Gee
  de2:  42 fe 00 c6             JL              Gee,#00 [TRUE] dea
  de6:  42 fe 46 d5             JL              Gee,#46 [TRUE] dfd
  dea:  fa 19 5f 06 55 1d fe 45 03 01 
                               CALL_VN2        1954 (#1d,Gee,#45,#03,#01)
  df4:  a0 00 42                JZ              (SP)+ [FALSE] df7
  df7:  e8 7f 00                PUSH            #00
  dfa:  8c 00 08                JUMP            e03
  dfd:  cf 2f 04 fc 00 00       LOADW           #04fc,(SP)+ -> -(SP)
  e03:  da 2f 07 dd 00          CALL_2N         1f74 ((SP)+)
  e08:  8c 00 78                JUMP            e81
  e0b:  42 01 fc 59             JL              L00,#fc [FALSE] e26
  e0f:  b2 ...                  PRINT           "undefined character"
  e1e:  cd 4f 03 ff ff          STORE           L02,#ffff
  e23:  8c 00 5d                JUMP            e81
  e26:  42 01 ff 00 44          JL              L00,#ff [FALSE] e6d
  e2b:  0d 03 02                STORE           L02,#02
  e2e:  2d ff 01                STORE           Gef,L00
  e31:  41 ff fc 4e             JE              Gef,#fc [FALSE] e41
  e35:  b2 ...                  PRINT           "menu click"
  e3e:  8c 00 2b                JUMP            e6a
  e41:  41 ff fd 54             JE              Gef,#fd [FALSE] e57
  e45:  b2 ...                  PRINT           "mouse double-click"
  e54:  8c 00 15                JUMP            e6a
  e57:  41 ff fe 51             JE              Gef,#fe [FALSE] e6a
  e5b:  b2 ...                  PRINT           "mouse single-click"
  e6a:  8c 00 16                JUMP            e81
  e6d:  cd 4f 03 ff ff          STORE           L02,#ffff
  e72:  b2 ...                  PRINT           "undefined character"
  e81:  41 02 01 69             JE              L01,#01 [FALSE] eac
  e85:  2d ff 03                STORE           Gef,L02
  e88:  c1 8f ff ff ff 56       JE              Gef,#ffff [FALSE] ea2
  e8e:  b2 ...                  PRINT           " (should NOT occur)"
  e9f:  8c 00 09                JUMP            ea9
  ea2:  41 ff 02 45             JE              Gef,#02 [FALSE] ea9
  ea6:  8d 0c 88                PRINT_PADDR     S141
  ea9:  8c 00 20                JUMP            eca
  eac:  41 02 02 5c             JE              L01,#02 [FALSE] eca
  eb0:  2d ff 03                STORE           Gef,L02
  eb3:  c1 8f ff ff ff 53       JE              Gef,#ffff [FALSE] eca
  eb9:  b2 ...                  PRINT           " (should NOT occur)"
  eca:  b0                      RTRUE           

Routine ecc, 4 locals

  ecd:  8d 0c 90                PRINT_PADDR     S142
  ed0:  8d 0c bf                PRINT_PADDR     S143
  ed3:  90 01 80 71             JZ              #01 [TRUE] f46
  ed7:  b2 ...                  PRINT           "
AccentedInput> "
  ee8:  d5 1f 00 50 03 00       SUB             #0050,#03 -> -(SP)
  eee:  f9 06 07 b2 05 c2 00 00 CALL_VN         1ec8 (#05c2,#00,(SP)+)
  ef6:  f9 05 07 b2 05 c2 01 00 CALL_VN         1ec8 (#05c2,#01,#00)
  efe:  cd 4f 01 05 c2          STORE           L00,#05c2
  f03:  0d 02 00                STORE           L01,#00
  f06:  e4 bf 01 02             READ            L00 -> L01
  f0a:  bb                      NEW_LINE        
  f0b:  e0 07 07 a1 05 c2 01 04 CALL_VS         1e84 (#05c2,#01) -> L03
  f13:  a0 04 43                JZ              L03 [FALSE] f17
  f16:  b0                      RTRUE           
  f17:  0d 02 00                STORE           L01,#00
  f1a:  62 02 04 67             JL              L01,L03 [FALSE] f43
  f1e:  34 02 02 00             ADD             #02,L01 -> -(SP)
  f22:  e0 0b 07 a1 05 c2 00 03 CALL_VS         1e84 (#05c2,(SP)+) -> L02
  f2a:  b2 ...                  PRINT           "code="
  f31:  e6 bf 03                PRINT_NUM       L02
  f34:  b2 ...                  PRINT           ": "
  f37:  f9 27 03 1e 03 01       CALL_VN         c78 (L02,#01)
  f3d:  bb                      NEW_LINE        
  f3e:  95 02                   INC             L01
  f40:  8c ff d9                JUMP            f1a
  f43:  8c ff 8f                JUMP            ed3
  f46:  b0                      RTRUE           

Routine f48, 1 local

  f49:  8d 0c c8                PRINT_PADDR     S144
  f4c:  90 01 80 44             JZ              #01 [TRUE] f92
  f50:  b2 ...                  PRINT           "AccentedInput> "
  f5f:  88 06 29 01             CALL_1S         18a4 -> L00
  f63:  41 01 2e 54             JE              L00,#2e [FALSE] f79
  f67:  b2 ...                  PRINT           "

Test finished.
"
  f78:  b0                      RTRUE           
  f79:  b2 ...                  PRINT           "
code="
  f82:  e6 bf 01                PRINT_NUM       L00
  f85:  b2 ...                  PRINT           ": "
  f88:  f9 27 03 1e 01 02       CALL_VN         c78 (L00,#02)
  f8e:  bb                      NEW_LINE        
  f8f:  8c ff bc                JUMP            f4c
  f92:  b0                      RTRUE           

Routine f94, 2 locals

  f95:  e0 17 07 a1 00 01 02    CALL_VS         1e84 (#00,#01) -> L01
  f9c:  49 02 80 00             AND             L01,#80 -> -(SP)
  fa0:  a0 00 cb                JZ              (SP)+ [TRUE] fac
  fa3:  0d 01 01                STORE           L00,#01
  fa6:  8d 0c e9                PRINT_PADDR     S145
  fa9:  8c 00 08                JUMP            fb2
  fac:  0d 01 00                STORE           L00,#00
  faf:  8d 0c f8                PRINT_PADDR     S146
  fb2:  8d 0d 08                PRINT_PADDR     S147
  fb5:  90 01 80 79             JZ              #01 [TRUE] 1030
  fb9:  8d 0d 44                PRINT_PADDR     S148
  fbc:  b2 ...                  PRINT           "TimedKey> "
  fc7:  88 06 29 02             CALL_1S         18a4 -> L01
  fcb:  41 02 2e 43             JE              L01,#2e [FALSE] fd0
  fcf:  b0                      RTRUE           
  fd0:  bb                      NEW_LINE        
  fd1:  0d 12 00                STORE           G02,#00
  fd4:  cd 4f 11 ff a3          STORE           G01,#ffa3
  fd9:  f6 53 01 0a 04 0d 02    READ_CHAR       #01,#0a,1034 -> L01
  fe0:  bb                      NEW_LINE        
  fe1:  c1 8f 11 ff a3 60       JE              G01,#ffa3 [FALSE] 1005
  fe7:  8d 0d 5b                PRINT_PADDR     S149
  fea:  a0 01 4e                JZ              L00 [FALSE] ff9
  fed:  8d 0d 89                PRINT_PADDR     S150
  ff0:  da 0f 07 dd 08 2f       CALL_2N         1f74 (S001)
  ff6:  8c 00 0b                JUMP            1002
  ff9:  8d 0d 92                PRINT_PADDR     S151
  ffc:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 1002:  8c 00 29                JUMP            102c
 1005:  a0 11 5d                JZ              G01 [FALSE] 1023
 1008:  8d 0d 9b                PRINT_PADDR     S152
 100b:  a0 01 4e                JZ              L00 [FALSE] 101a
 100e:  8d 0d a8                PRINT_PADDR     S153
 1011:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 1017:  8c 00 08                JUMP            1020
 101a:  da 0f 07 dd 08 2f       CALL_2N         1f74 (S001)
 1020:  8c 00 0b                JUMP            102c
 1023:  8d 0d b8                PRINT_PADDR     S154
 1026:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 102c:  bb                      NEW_LINE        
 102d:  8c ff 87                JUMP            fb5
 1030:  b0                      RTRUE           

Routine 1034, 1 local

 1035:  2d 11 01                STORE           G01,L00
 1038:  b2 ...                  PRINT           "* "
 103d:  95 12                   INC             G02
 103f:  41 12 0a 46             JE              G02,#0a [FALSE] 1047
 1043:  bb                      NEW_LINE        
 1044:  0d 12 00                STORE           G02,#00
 1047:  b1                      RFALSE          

Routine 1048, 3 locals

 1049:  e0 17 07 a1 00 01 03    CALL_VS         1e84 (#00,#01) -> L02
 1050:  49 03 80 00             AND             L02,#80 -> -(SP)
 1054:  a0 00 cb                JZ              (SP)+ [TRUE] 1060
 1057:  0d 01 01                STORE           L00,#01
 105a:  8d 0d c5                PRINT_PADDR     S155
 105d:  8c 00 08                JUMP            1066
 1060:  0d 01 00                STORE           L00,#00
 1063:  8d 0d d4                PRINT_PADDR     S156
 1066:  8d 0d e4                PRINT_PADDR     S157
 1069:  8d 0e 17                PRINT_PADDR     S158
 106c:  8d 0e 40                PRINT_PADDR     S159
 106f:  b2 ...                  PRINT           "TimedString> "
 107c:  88 06 29 03             CALL_1S         18a4 -> L02
 1080:  41 03 2e 43             JE              L02,#2e [FALSE] 1085
 1084:  b0                      RTRUE           
 1085:  bb                      NEW_LINE        
 1086:  b2 ...                  PRINT           "Beginning test...

"
 1099:  cd 4f 11 ff a3          STORE           G01,#ffa3
 109e:  0d 12 00                STORE           G02,#00
 10a1:  90 01 80 9e             JZ              #01 [TRUE] 1141
 10a5:  b2 ...                  PRINT           "TimedString> "
 10b2:  d5 1f 00 50 03 00       SUB             #0050,#03 -> -(SP)
 10b8:  f9 06 07 b2 05 c2 00 00 CALL_VN         1ec8 (#05c2,#00,(SP)+)
 10c0:  f9 05 07 b2 05 c2 01 00 CALL_VN         1ec8 (#05c2,#01,#00)
 10c8:  cd 4f 02 05 c2          STORE           L01,#05c2
 10cd:  0d 03 00                STORE           L02,#00
 10d0:  e4 94 02 00 0a 04 67 03 READ            L01,#00,#0a,119c -> L02
 10d8:  bb                      NEW_LINE        
 10d9:  e0 07 07 a1 05 c2 01 00 CALL_VS         1e84 (#05c2,#01) -> -(SP)
 10e1:  a0 00 48                JZ              (SP)+ [FALSE] 10ea
 10e4:  8d 0e 57                PRINT_PADDR     S160
 10e7:  8c 00 3b                JUMP            1123
 10ea:  b2 ...                  PRINT           "You just typed ""
 10f7:  0d 03 00                STORE           L02,#00
 10fa:  e0 07 07 a1 05 c2 01 00 CALL_VS         1e84 (#05c2,#01) -> -(SP)
 1102:  62 03 00 58             JL              L02,(SP)+ [FALSE] 111c
 1106:  34 02 03 00             ADD             #02,L02 -> -(SP)
 110a:  e0 0b 07 a1 05 c2 00 00 CALL_VS         1e84 (#05c2,(SP)+) -> -(SP)
 1112:  da 2f 07 d0 00          CALL_2N         1f40 ((SP)+)
 1117:  95 03                   INC             L02
 1119:  8c ff e0                JUMP            10fa
 111c:  b2 ...                  PRINT           "".

"
 1123:  e0 07 07 a1 05 c2 01 00 CALL_VS         1e84 (#05c2,#01) -> -(SP)
 112b:  41 00 01 51             JE              (SP)+,#01 [FALSE] 113e
 112f:  e0 07 07 a1 05 c2 02 00 CALL_VS         1e84 (#05c2,#02) -> -(SP)
 1137:  41 00 2e 45             JE              (SP)+,#2e [FALSE] 113e
 113b:  8c 00 05                JUMP            1141
 113e:  8c ff 62                JUMP            10a1
 1141:  b2 ...                  PRINT           "Test terminated.
"
 1150:  c1 8f 11 ff a3 60       JE              G01,#ffa3 [FALSE] 1174
 1156:  8d 0e 63                PRINT_PADDR     S161
 1159:  a0 01 4e                JZ              L00 [FALSE] 1168
 115c:  8d 0e 91                PRINT_PADDR     S162
 115f:  da 0f 07 dd 08 2f       CALL_2N         1f74 (S001)
 1165:  8c 00 0b                JUMP            1171
 1168:  8d 0e 9a                PRINT_PADDR     S163
 116b:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 1171:  8c 00 29                JUMP            119b
 1174:  a0 11 5d                JZ              G01 [FALSE] 1192
 1177:  8d 0e a3                PRINT_PADDR     S164
 117a:  a0 01 4e                JZ              L00 [FALSE] 1189
 117d:  8d 0e b0                PRINT_PADDR     S165
 1180:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 1186:  8c 00 08                JUMP            118f
 1189:  da 0f 07 dd 08 2f       CALL_2N         1f74 (S001)
 118f:  8c 00 0b                JUMP            119b
 1192:  8d 0e c0                PRINT_PADDR     S166
 1195:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 119b:  b0                      RTRUE           

Routine 119c, 1 local

 119d:  2d 11 01                STORE           G01,L00
 11a0:  95 12                   INC             G02
 11a2:  41 12 03 48             JE              G02,#03 [FALSE] 11ac
 11a6:  0d 12 00                STORE           G02,#00
 11a9:  8d 0e cd                PRINT_PADDR     S167
 11ac:  b1                      RFALSE          

Routine 11b0, 2 locals

 11b1:  8d 0e d7                PRINT_PADDR     S168
 11b4:  8d 0f 08                PRINT_PADDR     S169
 11b7:  8d 0f 2d                PRINT_PADDR     S170
 11ba:  b2 ...                  PRINT           "Preload> Given"
 11c9:  d5 1f 00 50 03 00       SUB             #0050,#03 -> -(SP)
 11cf:  f9 06 07 b2 05 c2 00 00 CALL_VN         1ec8 (#05c2,#00,(SP)+)
 11d7:  f9 05 07 b2 05 c2 01 05 CALL_VN         1ec8 (#05c2,#01,#05)
 11df:  f9 05 07 b2 05 c2 02 47 CALL_VN         1ec8 (#05c2,#02,#47)
 11e7:  f9 05 07 b2 05 c2 03 69 CALL_VN         1ec8 (#05c2,#03,#69)
 11ef:  f9 05 07 b2 05 c2 04 76 CALL_VN         1ec8 (#05c2,#04,#76)
 11f7:  f9 05 07 b2 05 c2 05 65 CALL_VN         1ec8 (#05c2,#05,#65)
 11ff:  f9 05 07 b2 05 c2 06 6e CALL_VN         1ec8 (#05c2,#06,#6e)
 1207:  cd 4f 02 05 c2          STORE           L01,#05c2
 120c:  0d 01 00                STORE           L00,#00
 120f:  e4 bf 02 01             READ            L01 -> L00
 1213:  e0 07 07 a1 05 c2 01 00 CALL_VS         1e84 (#05c2,#01) -> -(SP)
 121b:  a0 00 5c                JZ              (SP)+ [FALSE] 1238
 121e:  b2 ...                  PRINT           "You just typed a blank line.
"
 1235:  8c 00 39                JUMP            126f
 1238:  b2 ...                  PRINT           "You just typed ""
 1245:  0d 01 00                STORE           L00,#00
 1248:  e0 07 07 a1 05 c2 01 00 CALL_VS         1e84 (#05c2,#01) -> -(SP)
 1250:  62 01 00 58             JL              L00,(SP)+ [FALSE] 126a
 1254:  34 02 01 00             ADD             #02,L00 -> -(SP)
 1258:  e0 0b 07 a1 05 c2 00 00 CALL_VS         1e84 (#05c2,(SP)+) -> -(SP)
 1260:  da 2f 07 d0 00          CALL_2N         1f40 ((SP)+)
 1265:  95 01                   INC             L00
 1267:  8c ff e0                JUMP            1248
 126a:  b2 ...                  PRINT           "".
"
 126f:  b0                      RTRUE           

Routine 1270, 4 locals

 1271:  8d 0f 49                PRINT_PADDR     S171
 1274:  e0 17 07 a1 10 01 02    CALL_VS         1e84 (#10,#01) -> L01
 127b:  49 02 10 00             AND             L01,#10 -> -(SP)
 127f:  a0 00 c8                JZ              (SP)+ [TRUE] 1288
 1282:  0d 01 01                STORE           L00,#01
 1285:  8c 00 05                JUMP            128b
 1288:  0d 01 00                STORE           L00,#00
 128b:  a0 01 c8                JZ              L00 [TRUE] 1294
 128e:  8d 0f 58                PRINT_PADDR     S172
 1291:  8c 00 05                JUMP            1297
 1294:  8d 0f 66                PRINT_PADDR     S173
 1297:  0d 03 01                STORE           L02,#01
 129a:  0d 04 00                STORE           L03,#00
 129d:  b2 ...                  PRINT           "Simulating first move...
"
 12b2:  be 09 ff 02             SAVE_UNDO       -> L01
 12b6:  2d ff 02                STORE           Gef,L01
 12b9:  c1 8f ff ff ff 50       JE              Gef,#ffff [FALSE] 12cd
 12bf:  8d 0f 75                PRINT_PADDR     S174
 12c2:  0d 03 00                STORE           L02,#00
 12c5:  cd 4f 04 ff ff          STORE           L03,#ffff
 12ca:  8c 00 71                JUMP            133c
 12cd:  41 ff 00 58             JE              Gef,#00 [FALSE] 12e7
 12d1:  b2 ...                  PRINT           "Save failed.
"
 12de:  0d 03 00                STORE           L02,#00
 12e1:  0d 04 00                STORE           L03,#00
 12e4:  8c 00 57                JUMP            133c
 12e7:  41 ff 01 54             JE              Gef,#01 [FALSE] 12fd
 12eb:  b2 ...                  PRINT           "Save succeeded.
"
 12fa:  8c 00 41                JUMP            133c
 12fd:  41 ff 02 4e             JE              Gef,#02 [FALSE] 130d
 1301:  8d 0f 82                PRINT_PADDR     S175
 1304:  0d 03 00                STORE           L02,#00
 1307:  0d 04 02                STORE           L03,#02
 130a:  8c 00 31                JUMP            133c
 130d:  b2 ...                  PRINT           "Save gave unknown result code
"
 1324:  e6 bf 02                PRINT_NUM       L01
 1327:  b2 ...                  PRINT           " -- ERROR.
"
 1336:  0d 03 00                STORE           L02,#00
 1339:  0d 04 00                STORE           L03,#00
 133c:  a0 03 81 1d             JZ              L02 [TRUE] 145b
 1340:  b2 ...                  PRINT           "
Simulating second move...
"
 1357:  be 09 ff 02             SAVE_UNDO       -> L01
 135b:  2d ff 02                STORE           Gef,L01
 135e:  c1 8f ff ff ff 50       JE              Gef,#ffff [FALSE] 1372
 1364:  8d 0f 89                PRINT_PADDR     S176
 1367:  0d 03 00                STORE           L02,#00
 136a:  cd 4f 04 ff ff          STORE           L03,#ffff
 136f:  8c 00 eb                JUMP            145b
 1372:  41 ff 00 58             JE              Gef,#00 [FALSE] 138c
 1376:  b2 ...                  PRINT           "Save failed.
"
 1383:  0d 03 00                STORE           L02,#00
 1386:  0d 04 00                STORE           L03,#00
 1389:  8c 00 d1                JUMP            145b
 138c:  41 ff 01 54             JE              Gef,#01 [FALSE] 13a2
 1390:  b2 ...                  PRINT           "Save succeeded.
"
 139f:  8c 00 bb                JUMP            145b
 13a2:  41 ff 02 00 87          JE              Gef,#02 [FALSE] 142c
 13a7:  8d 0f 96                PRINT_PADDR     S177
 13aa:  8d 0f 9d                PRINT_PADDR     S178
 13ad:  b2 ...                  PRINT           "MultipleUndo> "
 13bc:  88 06 29 02             CALL_1S         18a4 -> L01
 13c0:  bb                      NEW_LINE        
 13c1:  41 02 2e 4b             JE              L01,#2e [FALSE] 13ce
 13c5:  0d 03 00                STORE           L02,#00
 13c8:  0d 04 01                STORE           L03,#01
 13cb:  8c 00 8f                JUMP            145b
 13ce:  b2 ...                  PRINT           "
Second undo...
"
 13df:  be 0a ff 02             RESTORE_UNDO    -> L01
 13e3:  2d ff 02                STORE           Gef,L01
 13e6:  41 ff 00 52             JE              Gef,#00 [FALSE] 13fa
 13ea:  b2 ...                  PRINT           "Undo failed.
"
 13f7:  8c 00 2b                JUMP            1423
 13fa:  b2 ...                  PRINT           "Undo gave unknown result code
"
 1411:  e6 bf 02                PRINT_NUM       L01
 1414:  b2 ...                  PRINT           " -- ERROR.
"
 1423:  0d 04 00                STORE           L03,#00
 1426:  0d 03 00                STORE           L02,#00
 1429:  8c 00 31                JUMP            145b
 142c:  b2 ...                  PRINT           "Save gave unknown result code
"
 1443:  e6 bf 02                PRINT_NUM       L01
 1446:  b2 ...                  PRINT           " -- ERROR.
"
 1455:  0d 03 00                STORE           L02,#00
 1458:  0d 04 00                STORE           L03,#00
 145b:  a0 03 80 85             JZ              L02 [TRUE] 14e2
 145f:  8d 0f d2                PRINT_PADDR     S179
 1462:  b2 ...                  PRINT           "SingleUndo> "
 146f:  88 06 29 02             CALL_1S         18a4 -> L01
 1473:  bb                      NEW_LINE        
 1474:  41 02 2e 4d             JE              L01,#2e [FALSE] 1483
 1478:  0d 03 00                STORE           L02,#00
 147b:  cd 4f 04 ff fe          STORE           L03,#fffe
 1480:  8c 00 61                JUMP            14e2
 1483:  b2 ...                  PRINT           "
First undo...
"
 1492:  be 0a ff 02             RESTORE_UNDO    -> L01
 1496:  2d ff 02                STORE           Gef,L01
 1499:  41 ff 00 58             JE              Gef,#00 [FALSE] 14b3
 149d:  b2 ...                  PRINT           "Undo failed.
"
 14aa:  0d 03 00                STORE           L02,#00
 14ad:  0d 04 00                STORE           L03,#00
 14b0:  8c 00 31                JUMP            14e2
 14b3:  b2 ...                  PRINT           "Undo gave unknown result code
"
 14ca:  e6 bf 02                PRINT_NUM       L01
 14cd:  b2 ...                  PRINT           " -- ERROR.
"
 14dc:  0d 03 00                STORE           L02,#00
 14df:  0d 04 00                STORE           L03,#00
 14e2:  bb                      NEW_LINE        
 14e3:  2d ff 04                STORE           Gef,L03
 14e6:  c1 8f ff ff fe 54       JE              Gef,#fffe [FALSE] 14fe
 14ec:  b2 ...                  PRINT           "Test cancelled.
"
 14fb:  8c 00 7d                JUMP            1579
 14fe:  c1 8f ff ff ff 5d       JE              Gef,#ffff [FALSE] 151f
 1504:  a0 01 ce                JZ              L00 [TRUE] 1513
 1507:  8d 0f de                PRINT_PADDR     S180
 150a:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 1510:  8c 00 0b                JUMP            151c
 1513:  8d 0f f8                PRINT_PADDR     S181
 1516:  da 0f 07 dd 08 2f       CALL_2N         1f74 (S001)
 151c:  8c 00 5c                JUMP            1579
 151f:  41 ff 00 5d             JE              Gef,#00 [FALSE] 153e
 1523:  a0 01 ce                JZ              L00 [TRUE] 1532
 1526:  8d 10 0c                PRINT_PADDR     S182
 1529:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 152f:  8c 00 0b                JUMP            153b
 1532:  8d 10 18                PRINT_PADDR     S183
 1535:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 153b:  8c 00 3d                JUMP            1579
 153e:  41 ff 01 5d             JE              Gef,#01 [FALSE] 155d
 1542:  a0 01 ce                JZ              L00 [TRUE] 1551
 1545:  8d 10 34                PRINT_PADDR     S184
 1548:  da 0f 07 dd 08 2f       CALL_2N         1f74 (S001)
 154e:  8c 00 0b                JUMP            155a
 1551:  8d 10 3f                PRINT_PADDR     S185
 1554:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 155a:  8c 00 1e                JUMP            1579
 155d:  41 ff 02 5a             JE              Gef,#02 [FALSE] 1579
 1561:  a0 01 ce                JZ              L00 [TRUE] 1570
 1564:  8d 10 4d                PRINT_PADDR     S186
 1567:  da 0f 07 dd 08 2f       CALL_2N         1f74 (S001)
 156d:  8c 00 0b                JUMP            1579
 1570:  8d 10 5f                PRINT_PADDR     S187
 1573:  da 0f 07 dd 08 3b       CALL_2N         1f74 (S002)
 1579:  b0                      RTRUE           

Routine 157c, 1 local

 157d:  8d 10 74                PRINT_PADDR     S188
 1580:  8d 10 a4                PRINT_PADDR     S189
 1583:  b2 ...                  PRINT           "ClosingText> "
 1590:  88 06 29 01             CALL_1S         18a4 -> L00
 1594:  41 01 2e 52             JE              L00,#2e [FALSE] 15a8
 1598:  b2 ...                  PRINT           "
Test aborted.
"
 15a7:  b0                      RTRUE           
 15a8:  8d 10 cc                PRINT_PADDR     S190
 15ab:  ba                      QUIT            

Routine 15ac, 0 locals

 15ad:  bb                      NEW_LINE        
 15ae:  8f 06 2b                CALL_1N         18ac
 15b1:  bb                      NEW_LINE        
 15b2:  8f 05 70                CALL_1N         15c0
 15b5:  b2 ...                  PRINT           "Goodbye.
"
 15be:  ba                      QUIT            

Routine 15c0, 7 locals

 15c1:  02 00 00 c6             JL              #00,#00 [TRUE] 15c9
 15c5:  02 00 1d d2             JL              #00,#1d [TRUE] 15d9
 15c9:  fa 15 5f 06 55 1d 00 1c 03 02 
                               CALL_VN2        1954 (#1d,#00,#1c,#03,#02)
 15d3:  e8 7f 00                PUSH            #00
 15d6:  8c 00 08                JUMP            15df
 15d9:  cf 1f 05 88 00 00       LOADW           #0588,#00 -> -(SP)
 15df:  57 00 02 03             DIV             (SP)+,#02 -> L02
 15e3:  0d 01 01                STORE           L00,#01
 15e6:  90 01 82 b9             JZ              #01 [TRUE] 18a1
 15ea:  a0 01 80 74             JZ              L00 [TRUE] 1660
 15ee:  8d 11 0b                PRINT_PADDR     S205
 15f1:  b2 ...                  PRINT           "  . (period): Exit TerpEtude
"
 160c:  0d 04 00                STORE           L03,#00
 160f:  62 04 03 00 4b          JL              L03,L02 [FALSE] 165d
 1614:  b2 ...                  PRINT           "  "
 1617:  54 04 01 00             ADD             L03,#01 -> -(SP)
 161b:  e6 bf 00                PRINT_NUM       (SP)+
 161e:  b2 ...                  PRINT           ": "
 1621:  56 04 02 00             MUL             L03,#02 -> -(SP)
 1625:  54 00 01 00             ADD             (SP)+,#01 -> -(SP)
 1629:  e9 7f fe                PULL            Gee
 162c:  e8 bf fe                PUSH            Gee
 162f:  42 fe 00 c6             JL              Gee,#00 [TRUE] 1637
 1633:  42 fe 1d d5             JL              Gee,#1d [TRUE] 164a
 1637:  fa 19 5f 06 55 1d fe 1c 03 02 
                               CALL_VN2        1954 (#1d,Gee,#1c,#03,#02)
 1641:  a0 00 42                JZ              (SP)+ [FALSE] 1644
 1644:  e8 7f 00                PUSH            #00
 1647:  8c 00 08                JUMP            1650
 164a:  cf 2f 05 88 00 00       LOADW           #0588,(SP)+ -> -(SP)
 1650:  da 2f 07 dd 00          CALL_2N         1f74 ((SP)+)
 1655:  b2 ...                  PRINT           "
"
 1658:  95 04                   INC             L03
 165a:  8c ff b4                JUMP            160f
 165d:  0d 01 00                STORE           L00,#00
 1660:  b2 ...                  PRINT           "
> "
 1667:  02 00 00 c6             JL              #00,#00 [TRUE] 166f
 166b:  02 00 50 cf             JL              #00,#50 [TRUE] 167c
 166f:  fa 15 5f 06 55 1e 00 4f 00 03 
                               CALL_VN2        1954 (#1e,#00,#4f,#00,#03)
 1679:  8c 00 08                JUMP            1682
 167c:  e2 17 05 c2 00 4d       STOREB          #05c2,#00,#4d
 1682:  02 01 00 c6             JL              #01,#00 [TRUE] 168a
 1686:  02 01 50 cf             JL              #01,#50 [TRUE] 1697
 168a:  fa 15 5f 06 55 1e 01 4f 00 03 
                               CALL_VN2        1954 (#1e,#01,#4f,#00,#03)
 1694:  8c 00 08                JUMP            169d
 1697:  e2 17 05 c2 01 00       STOREB          #05c2,#01,#00
 169d:  cd 4f 02 05 c2          STORE           L01,#05c2
 16a2:  0d 04 00                STORE           L03,#00
 16a5:  e4 bf 02 04             READ            L01 -> L03
 16a9:  bb                      NEW_LINE        
 16aa:  02 01 00 c6             JL              #01,#00 [TRUE] 16b2
 16ae:  02 01 50 cf             JL              #01,#50 [TRUE] 16bf
 16b2:  fa 15 5f 06 55 1c 01 4f 00 03 
                               CALL_VN2        1954 (#1c,#01,#4f,#00,#03)
 16bc:  8c 00 08                JUMP            16c5
 16bf:  d0 1f 05 c2 01 06       LOADB           #05c2,#01 -> L05
 16c5:  0d 05 00                STORE           L04,#00
 16c8:  62 05 06 76             JL              L04,L05 [FALSE] 1700
 16cc:  34 02 05 00             ADD             #02,L04 -> -(SP)
 16d0:  e9 7f fe                PULL            Gee
 16d3:  e8 bf fe                PUSH            Gee
 16d6:  42 fe 00 c6             JL              Gee,#00 [TRUE] 16de
 16da:  42 fe 50 d5             JL              Gee,#50 [TRUE] 16f1
 16de:  fa 19 5f 06 55 1c fe 4f 00 03 
                               CALL_VN2        1954 (#1c,Gee,#4f,#00,#03)
 16e8:  a0 00 42                JZ              (SP)+ [FALSE] 16eb
 16eb:  e8 7f 00                PUSH            #00
 16ee:  8c 00 08                JUMP            16f7
 16f1:  d0 2f 05 c2 00 00       LOADB           #05c2,(SP)+ -> -(SP)
 16f7:  41 00 20 47             JE              (SP)+,#20 [FALSE] 1700
 16fb:  95 05                   INC             L04
 16fd:  8c ff ca                JUMP            16c8
 1700:  62 05 06 74             JL              L04,L05 [FALSE] 1736
 1704:  34 02 05 00             ADD             #02,L04 -> -(SP)
 1708:  e9 7f fe                PULL            Gee
 170b:  e8 bf fe                PUSH            Gee
 170e:  42 fe 00 c6             JL              Gee,#00 [TRUE] 1716
 1712:  42 fe 50 d5             JL              Gee,#50 [TRUE] 1729
 1716:  fa 19 5f 06 55 1c fe 4f 00 03 
                               CALL_VN2        1954 (#1c,Gee,#4f,#00,#03)
 1720:  a0 00 42                JZ              (SP)+ [FALSE] 1723
 1723:  e8 7f 00                PUSH            #00
 1726:  8c 00 08                JUMP            172f
 1729:  d0 2f 05 c2 00 00       LOADB           #05c2,(SP)+ -> -(SP)
 172f:  41 00 2e 45             JE              (SP)+,#2e [FALSE] 1736
 1733:  8c 01 6d                JUMP            18a1
 1736:  61 05 06 80 60          JE              L04,L05 [TRUE] 1799
 173b:  34 02 05 00             ADD             #02,L04 -> -(SP)
 173f:  e9 7f fe                PULL            Gee
 1742:  e8 bf fe                PUSH            Gee
 1745:  42 fe 00 c6             JL              Gee,#00 [TRUE] 174d
 1749:  42 fe 50 d5             JL              Gee,#50 [TRUE] 1760
 174d:  fa 19 5f 06 55 1c fe 4f 00 03 
                               CALL_VN2        1954 (#1c,Gee,#4f,#00,#03)
 1757:  a0 00 42                JZ              (SP)+ [FALSE] 175a
 175a:  e8 7f 00                PUSH            #00
 175d:  8c 00 08                JUMP            1766
 1760:  d0 2f 05 c2 00 00       LOADB           #05c2,(SP)+ -> -(SP)
 1766:  42 00 30 f1             JL              (SP)+,#30 [TRUE] 1799
 176a:  34 02 05 00             ADD             #02,L04 -> -(SP)
 176e:  e9 7f fe                PULL            Gee
 1771:  e8 bf fe                PUSH            Gee
 1774:  42 fe 00 c6             JL              Gee,#00 [TRUE] 177c
 1778:  42 fe 50 d5             JL              Gee,#50 [TRUE] 178f
 177c:  fa 19 5f 06 55 1c fe 4f 00 03 
                               CALL_VN2        1954 (#1c,Gee,#4f,#00,#03)
 1786:  a0 00 42                JZ              (SP)+ [FALSE] 1789
 1789:  e8 7f 00                PUSH            #00
 178c:  8c 00 08                JUMP            1795
 178f:  d0 2f 05 c2 00 00       LOADB           #05c2,(SP)+ -> -(SP)
 1795:  43 00 39 48             JG              (SP)+,#39 [FALSE] 179f
 1799:  0d 01 01                STORE           L00,#01
 179c:  8c fe 49                JUMP            15e6
 179f:  0d 07 00                STORE           L06,#00
 17a2:  62 05 06 00 9e          JL              L04,L05 [FALSE] 1843
 17a7:  34 02 05 00             ADD             #02,L04 -> -(SP)
 17ab:  e9 7f fe                PULL            Gee
 17ae:  e8 bf fe                PUSH            Gee
 17b1:  42 fe 00 c6             JL              Gee,#00 [TRUE] 17b9
 17b5:  42 fe 50 d5             JL              Gee,#50 [TRUE] 17cc
 17b9:  fa 19 5f 06 55 1c fe 4f 00 03 
                               CALL_VN2        1954 (#1c,Gee,#4f,#00,#03)
 17c3:  a0 00 42                JZ              (SP)+ [FALSE] 17c6
 17c6:  e8 7f 00                PUSH            #00
 17c9:  8c 00 08                JUMP            17d2
 17cc:  d0 2f 05 c2 00 00       LOADB           #05c2,(SP)+ -> -(SP)
 17d2:  42 00 30 80 6e          JL              (SP)+,#30 [TRUE] 1843
 17d7:  34 02 05 00             ADD             #02,L04 -> -(SP)
 17db:  e9 7f fe                PULL            Gee
 17de:  e8 bf fe                PUSH            Gee
 17e1:  42 fe 00 c6             JL              Gee,#00 [TRUE] 17e9
 17e5:  42 fe 50 d5             JL              Gee,#50 [TRUE] 17fc
 17e9:  fa 19 5f 06 55 1c fe 4f 00 03 
                               CALL_VN2        1954 (#1c,Gee,#4f,#00,#03)
 17f3:  a0 00 42                JZ              (SP)+ [FALSE] 17f6
 17f6:  e8 7f 00                PUSH            #00
 17f9:  8c 00 08                JUMP            1802
 17fc:  d0 2f 05 c2 00 00       LOADB           #05c2,(SP)+ -> -(SP)
 1802:  43 00 39 80 3e          JG              (SP)+,#39 [TRUE] 1843
 1807:  34 02 05 00             ADD             #02,L04 -> -(SP)
 180b:  e9 7f fe                PULL            Gee
 180e:  e8 bf fe                PUSH            Gee
 1811:  42 fe 00 c6             JL              Gee,#00 [TRUE] 1819
 1815:  42 fe 50 d5             JL              Gee,#50 [TRUE] 182c
 1819:  fa 19 5f 06 55 1c fe 4f 00 03 
                               CALL_VN2        1954 (#1c,Gee,#4f,#00,#03)
 1823:  a0 00 42                JZ              (SP)+ [FALSE] 1826
 1826:  e8 7f 00                PUSH            #00
 1829:  8c 00 08                JUMP            1832
 182c:  d0 2f 05 c2 00 00       LOADB           #05c2,(SP)+ -> -(SP)
 1832:  55 00 30 00             SUB             (SP)+,#30 -> -(SP)
 1836:  56 07 0a 00             MUL             L06,#0a -> -(SP)
 183a:  74 00 00 07             ADD             (SP)+,(SP)+ -> L06
 183e:  95 05                   INC             L04
 1840:  8c ff 61                JUMP            17a2
 1843:  42 07 01 c6             JL              L06,#01 [TRUE] 184b
 1847:  63 07 03 62             JG              L06,L02 [FALSE] 186b
 184b:  b2 ...                  PRINT           "Please enter a value from 1 to
"
 1862:  e6 bf 03                PRINT_NUM       L02
 1865:  8d 11 15                PRINT_PADDR     S206
 1868:  8c fd 7d                JUMP            15e6
 186b:  56 07 02 00             MUL             L06,#02 -> -(SP)
 186f:  e9 7f fe                PULL            Gee
 1872:  e8 bf fe                PUSH            Gee
 1875:  42 fe 00 c6             JL              Gee,#00 [TRUE] 187d
 1879:  42 fe 1d d2             JL              Gee,#1d [TRUE] 188d
 187d:  fa 19 5f 06 55 1d fe 1c 03 02 
                               CALL_VN2        1954 (#1d,Gee,#1c,#03,#02)
 1887:  a0 00 42                JZ              (SP)+ [FALSE] 188a
 188a:  8c 00 08                JUMP            1893
 188d:  cf 2f 05 88 00 04       LOADW           #0588,(SP)+ -> L03
 1893:  a0 04 48                JZ              L03 [FALSE] 189c
 1896:  8d 11 23                PRINT_PADDR     S207
 1899:  8c fd 4c                JUMP            15e6
 189c:  af 04                   CALL_1N         L03
 189e:  8c fd 47                JUMP            15e6
 18a1:  b0                      RTRUE           

Routine 18a4, 1 local

 18a5:  f6 7f 01 01             READ_CHAR       #01 -> L00
 18a9:  ab 01                   RET             L00

Routine 18ac, 0 locals

 18ad:  8d 11 2a                PRINT_PADDR     S208
 18b0:  8d 11 33                PRINT_PADDR     S209
 18b3:  b2 ...                  PRINT           "Release "
 18ba:  e0 17 07 a9 00 01 00    CALL_VS         1ea4 (#00,#01) -> -(SP)
 18c1:  c9 8f 00 03 ff 00       AND             (SP)+,#03ff -> -(SP)
 18c7:  e6 bf 00                PRINT_NUM       (SP)+
 18ca:  b2 ...                  PRINT           " / built with Inform v"
 18db:  10 00 3c ff             LOADB           #00,#3c -> Gef
 18df:  e5 bf ff                PRINT_CHAR      Gef
 18e2:  10 00 3d ff             LOADB           #00,#3d -> Gef
 18e6:  e5 bf ff                PRINT_CHAR      Gef
 18e9:  10 00 3e ff             LOADB           #00,#3e -> Gef
 18ed:  e5 bf ff                PRINT_CHAR      Gef
 18f0:  10 00 3f ff             LOADB           #00,#3f -> Gef
 18f4:  e5 bf ff                PRINT_CHAR      Gef
 18f7:  bb                      NEW_LINE        
 18f8:  8d 11 3c                PRINT_PADDR     S210
 18fb:  bb                      NEW_LINE        
 18fc:  8d 11 48                PRINT_PADDR     S211
 18ff:  8d 11 67                PRINT_PADDR     S212
 1902:  b0                      RTRUE           

Routine 1904, 0 locals

 1905:  8d 11 9d                PRINT_PADDR     S213
 1908:  8d 11 ab                PRINT_PADDR     S214
 190b:  8d 11 c0                PRINT_PADDR     S215
 190e:  8d 11 d0                PRINT_PADDR     S216
 1911:  8d 11 e5                PRINT_PADDR     S217
 1914:  b2 ...                  PRINT           "
   Upcoming Test Features:
"
 192d:  8d 11 fd                PRINT_PADDR     S218
 1930:  b2 ...                  PRINT           "
   Credits:
"
 193d:  b2 ...                  PRINT           "Title: Jon Ferro
"
 194e:  8d 12 08                PRINT_PADDR     S219
 1951:  b0                      RTRUE           

Routine 1954, 6 locals

 1955:  b2 ...                  PRINT           "
[** Programming error: "
 196e:  42 01 00 45             JL              L00,#00 [FALSE] 1975
 1972:  8c 03 d2                JUMP            1d45
 1975:  41 01 01 4e             JE              L00,#01 [FALSE] 1985
 1979:  b2 ...                  PRINT           "class "
 197e:  aa 02                   PRINT_OBJ       L01
 1980:  8d 12 13                PRINT_PADDR     S220
 1983:  bb                      NEW_LINE        
 1984:  b0                      RTRUE           
 1985:  41 01 20 4f             JE              L00,#20 [FALSE] 1996
 1989:  8d 12 1d                PRINT_PADDR     S221
 198c:  da 2f 07 e3 02          CALL_2N         1f8c (L01)
 1991:  8d 12 24                PRINT_PADDR     S222
 1994:  bb                      NEW_LINE        
 1995:  b0                      RTRUE           
 1996:  41 01 21 5b             JE              L00,#21 [FALSE] 19b3
 199a:  b2 ...                  PRINT           "tried to print (char) "
 19ab:  e6 bf 02                PRINT_NUM       L01
 19ae:  8d 12 2e                PRINT_PADDR     S223
 19b1:  bb                      NEW_LINE        
 19b2:  b0                      RTRUE           
 19b3:  41 01 22 60             JE              L00,#22 [FALSE] 19d5
 19b7:  8d 12 3b                PRINT_PADDR     S224
 19ba:  b3 ...                  PRINT_RET       "byte address of a string **]"
 19d5:  41 01 23 54             JE              L00,#23 [FALSE] 19eb
 19d9:  8d 12 43                PRINT_PADDR     S225
 19dc:  b3 ...                  PRINT_RET       "string **]"
 19eb:  41 01 24 5a             JE              L00,#24 [FALSE] 1a07
 19ef:  8d 12 4b                PRINT_PADDR     S226
 19f2:  b3 ...                  PRINT_RET       "object or class **]"
 1a07:  42 01 20 03 3b          JL              L00,#20 [FALSE] 1d45
 1a0c:  b2 ...                  PRINT           "tried to "
 1a13:  42 01 1c 80 d1          JL              L00,#1c [TRUE] 1ae7
 1a18:  c1 97 01 1c 1d 4e       JE              L00,#1c,#1d [FALSE] 1a2a
 1a1e:  b2 ...                  PRINT           "read from "
 1a27:  8c 00 09                JUMP            1a31
 1a2a:  b2 ...                  PRINT           "write to "
 1a31:  c1 97 01 1d 1f 45       JE              L00,#1d,#1f [FALSE] 1a3a
 1a37:  b2 ...                  PRINT           "-"
 1a3a:  b2 ...                  PRINT           "->"
 1a3f:  e6 bf 02                PRINT_NUM       L01
 1a42:  b2 ...                  PRINT           " in the"
 1a49:  49 04 07 00             AND             L03,#07 -> -(SP)
 1a4d:  e9 7f ff                PULL            Gef
 1a50:  c1 97 ff 00 01 48       JE              Gef,#00,#01 [FALSE] 1a5c
 1a56:  0d 06 00                STORE           L05,#00
 1a59:  8c 00 30                JUMP            1a8a
 1a5c:  41 ff 02 4f             JE              Gef,#02 [FALSE] 1a6d
 1a60:  b2 ...                  PRINT           " string"
 1a67:  0d 06 01                STORE           L05,#01
 1a6a:  8c 00 1f                JUMP            1a8a
 1a6d:  41 ff 03 4d             JE              Gef,#03 [FALSE] 1a7c
 1a71:  b2 ...                  PRINT           " table"
 1a76:  0d 06 01                STORE           L05,#01
 1a79:  8c 00 10                JUMP            1a8a
 1a7c:  41 ff 04 4c             JE              Gef,#04 [FALSE] 1a8a
 1a80:  b2 ...                  PRINT           " buffer"
 1a87:  0d 06 02                STORE           L05,#02
 1a8a:  49 04 10 00             AND             L03,#10 -> -(SP)
 1a8e:  a0 00 cb                JZ              (SP)+ [TRUE] 1a9a
 1a91:  b2 ...                  PRINT           " (->)"
 1a9a:  49 04 08 00             AND             L03,#08 -> -(SP)
 1a9e:  a0 00 cd                JZ              (SP)+ [TRUE] 1aac
 1aa1:  b2 ...                  PRINT           " (-->)"
 1aac:  b2 ...                  PRINT           " array ""
 1ab3:  cf 2f 03 00 05 00       LOADW           #0300,L04 -> -(SP)
 1ab9:  da 2f 07 dd 00          CALL_2N         1f74 ((SP)+)
 1abe:  b2 ...                  PRINT           "", which has entries "
 1acf:  e6 bf 06                PRINT_NUM       L05
 1ad2:  b2 ...                  PRINT           " up to "
 1ad9:  e6 bf 03                PRINT_NUM       L02
 1adc:  b3 ...                  PRINT_RET       " **]"
 1ae7:  42 01 18 80 56          JL              L00,#18 [TRUE] 1b40
 1aec:  43 01 1b 80 51          JG              L00,#1b [TRUE] 1b40
 1af1:  43 01 19 ca             JG              L00,#19 [TRUE] 1afd
 1af5:  b2 ...                  PRINT           "read"
 1afa:  8c 00 07                JUMP            1b02
 1afd:  b2 ...                  PRINT           "write"
 1b02:  b2 ...                  PRINT           " outside memory using "
 1b13:  2d ff 01                STORE           Gef,L00
 1b16:  c1 97 ff 18 1a 51       JE              Gef,#18,#1a [FALSE] 1b2b
 1b1c:  b3 ...                  PRINT_RET       "-> **]"
 1b2b:  c1 97 ff 19 1b 51       JE              Gef,#19,#1b [FALSE] 1b40
 1b31:  b3 ...                  PRINT_RET       "--> **]"
 1b40:  42 01 04 4a             JL              L00,#04 [FALSE] 1b4c
 1b44:  b2 ...                  PRINT           "test "
 1b49:  8c 00 1d                JUMP            1b67
 1b4c:  42 01 0c c6             JL              L00,#0c [TRUE] 1b54
 1b50:  43 01 14 4c             JG              L00,#14 [FALSE] 1b5e
 1b54:  b2 ...                  PRINT           "find the "
 1b5b:  8c 00 0b                JUMP            1b67
 1b5e:  42 01 0e 47             JL              L00,#0e [FALSE] 1b67
 1b62:  b2 ...                  PRINT           "use "
 1b67:  41 01 14 55             JE              L00,#14 [FALSE] 1b7e
 1b6b:  b3 ...                  PRINT_RET       "divide by zero **]"
 1b7e:  b2 ...                  PRINT           """
 1b81:  2d ff 01                STORE           Gef,L00
 1b84:  41 ff 02 50             JE              Gef,#02 [FALSE] 1b96
 1b88:  b2 ...                  PRINT           "in" or "notin"
 1b93:  8c 01 9c                JUMP            1d30
 1b96:  41 ff 03 52             JE              Gef,#03 [FALSE] 1baa
 1b9a:  b2 ...                  PRINT           "has" or "hasnt"
 1ba7:  8c 01 88                JUMP            1d30
 1baa:  41 ff 04 4a             JE              Gef,#04 [FALSE] 1bb6
 1bae:  b2 ...                  PRINT           "parent"
 1bb3:  8c 01 7c                JUMP            1d30
 1bb6:  41 ff 05 4a             JE              Gef,#05 [FALSE] 1bc2
 1bba:  b2 ...                  PRINT           "eldest"
 1bbf:  8c 01 70                JUMP            1d30
 1bc2:  41 ff 06 4a             JE              Gef,#06 [FALSE] 1bce
 1bc6:  b2 ...                  PRINT           "child"
 1bcb:  8c 01 64                JUMP            1d30
 1bce:  41 ff 07 4c             JE              Gef,#07 [FALSE] 1bdc
 1bd2:  b2 ...                  PRINT           "younger"
 1bd9:  8c 01 56                JUMP            1d30
 1bdc:  41 ff 08 4c             JE              Gef,#08 [FALSE] 1bea
 1be0:  b2 ...                  PRINT           "sibling"
 1be7:  8c 01 48                JUMP            1d30
 1bea:  41 ff 09 4c             JE              Gef,#09 [FALSE] 1bf8
 1bee:  b2 ...                  PRINT           "children"
 1bf5:  8c 01 3a                JUMP            1d30
 1bf8:  41 ff 0a 4c             JE              Gef,#0a [FALSE] 1c06
 1bfc:  b2 ...                  PRINT           "youngest"
 1c03:  8c 01 2c                JUMP            1d30
 1c06:  41 ff 0b 4a             JE              Gef,#0b [FALSE] 1c12
 1c0a:  b2 ...                  PRINT           "elder"
 1c0f:  8c 01 20                JUMP            1d30
 1c12:  41 ff 0c 4e             JE              Gef,#0c [FALSE] 1c22
 1c16:  b2 ...                  PRINT           "objectloop"
 1c1f:  8c 01 10                JUMP            1d30
 1c22:  41 ff 0d 5a             JE              Gef,#0d [FALSE] 1c3e
 1c26:  b2 ...                  PRINT           "}" at end of "objectloop"
 1c3b:  8c 00 f4                JUMP            1d30
 1c3e:  41 ff 0e 63             JE              Gef,#0e [FALSE] 1c63
 1c42:  b2 ...                  PRINT           "give" an attribute to "
 1c53:  da 2f 07 e3 02          CALL_2N         1f8c (L01)
 1c58:  b3 ...                  PRINT_RET       " **]"
 1c63:  41 ff 0f 59             JE              Gef,#0f [FALSE] 1c7e
 1c67:  b2 ...                  PRINT           "remove" "
 1c6e:  da 2f 07 e3 02          CALL_2N         1f8c (L01)
 1c73:  b3 ...                  PRINT_RET       " **]"
 1c7e:  c1 95 ff 10 11 12 00 76 JE              Gef,#10,#11,#12 [FALSE] 1cfa
 1c86:  b2 ...                  PRINT           "move" "
 1c8d:  da 2f 07 e3 02          CALL_2N         1f8c (L01)
 1c92:  b2 ...                  PRINT           " to "
 1c97:  da 2f 07 e3 03          CALL_2N         1f8c (L02)
 1c9c:  41 01 12 00 50          JE              L00,#12 [FALSE] 1cef
 1ca1:  b2 ...                  PRINT           ", which would make a loop: "
 1cb6:  da 2f 07 e3 02          CALL_2N         1f8c (L01)
 1cbb:  2d 05 03                STORE           L04,L02
 1cbe:  61 05 02 48             JE              L04,L01 [FALSE] 1cc8
 1cc2:  2d 05 02                STORE           L04,L01
 1cc5:  8c 00 14                JUMP            1cda
 1cc8:  b2 ...                  PRINT           " in "
 1ccd:  da 2f 07 e3 05          CALL_2N         1f8c (L04)
 1cd2:  a3 05 05                GET_PARENT      L04 -> L04
 1cd5:  61 05 02 3f f0          JE              L04,L01 [FALSE] 1cc8
 1cda:  b2 ...                  PRINT           " in "
 1cdf:  da 2f 07 e3 05          CALL_2N         1f8c (L04)
 1ce4:  b3 ...                  PRINT_RET       " **]"
 1cef:  b3 ...                  PRINT_RET       " **]"
 1cfa:  41 ff 13 55             JE              Gef,#13 [FALSE] 1d11
 1cfe:  8d 12 53                PRINT_PADDR     S227
 1d01:  da 2f 07 e3 02          CALL_2N         1f8c (L01)
 1d06:  b3 ...                  PRINT_RET       " **]"
 1d11:  41 ff 15 4a             JE              Gef,#15 [FALSE] 1d1d
 1d15:  b2 ...                  PRINT           ".&"
 1d1a:  8c 00 15                JUMP            1d30
 1d1d:  41 ff 16 4a             JE              Gef,#16 [FALSE] 1d29
 1d21:  b2 ...                  PRINT           ".#"
 1d26:  8c 00 09                JUMP            1d30
 1d29:  41 ff 17 45             JE              Gef,#17 [FALSE] 1d30
 1d2d:  b2 ...                  PRINT           "."
 1d30:  b2 ...                  PRINT           "" of "
 1d35:  da 2f 07 e3 02          CALL_2N         1f8c (L01)
 1d3a:  b3 ...                  PRINT_RET       " **]"
 1d45:  42 02 00 ea             JL              L01,#00 [TRUE] 1d71
 1d49:  d5 1f 01 03 ff 00       SUB             #0103,#ff -> -(SP)
 1d4f:  63 02 00 e0             JG              L01,(SP)+ [TRUE] 1d71
 1d53:  a0 02 cb                JZ              L01 [TRUE] 1d5f
 1d56:  46 02 01 47             JIN             L01,"Class" [FALSE] 1d5f
 1d5a:  b2 ...                  PRINT           "class "
 1d5f:  a0 02 c7                JZ              L01 [TRUE] 1d67
 1d62:  aa 02                   PRINT_OBJ       L01
 1d64:  8c 00 09                JUMP            1d6e
 1d67:  b2 ...                  PRINT           "nothing"
 1d6e:  b2 ...                  PRINT           " "
 1d71:  b2 ...                  PRINT           "(object number "
 1d7e:  e6 bf 02                PRINT_NUM       L01
 1d81:  b2 ...                  PRINT           ") "
 1d84:  42 03 00 5b             JL              L02,#00 [FALSE] 1da1
 1d88:  b2 ...                  PRINT           "is not of class "
 1d95:  35 00 03 00             SUB             #00,L02 -> -(SP)
 1d99:  da 2f 07 e3 00          CALL_2N         1f8c ((SP)+)
 1d9e:  8c 00 55                JUMP            1df4
 1da1:  a0 04 d8                JZ              L03 [TRUE] 1dba
 1da4:  b2 ...                  PRINT           "has a property "
 1daf:  da 2f 07 fa 03          CALL_2N         1fe8 (L02)
 1db4:  8d 12 5f                PRINT_PADDR     S228
 1db7:  8c 00 3c                JUMP            1df4
 1dba:  b2 ...                  PRINT           " has no property "
 1dc7:  da 2f 07 fa 03          CALL_2N         1fe8 (L02)
 1dcc:  cd 4f 05 02 10          STORE           L04,#0210
 1dd1:  4f 05 00 04             LOADW           L04,#00 -> L03
 1dd5:  42 03 00 c6             JL              L02,#00 [TRUE] 1ddd
 1dd9:  62 03 04 d9             JL              L02,L03 [TRUE] 1df4
 1ddd:  b2 ...                  PRINT           " (and nor has any other
object)"
 1df4:  b2 ...                  PRINT           " to "
 1df9:  da 2f 07 dd 01          CALL_2N         1f74 (L00)
 1dfe:  b2 ...                  PRINT           " **]
"
 1e09:  b0                      RTRUE           

Routine 1e0c, 2 locals

 1e0d:  c1 93 01 00 ff ff c0    JE              L00,#00,#ffff [TRUE] RFALSE
 1e14:  2d 02 01                STORE           L01,L00
 1e17:  0f 1a 00 00             LOADW           #1a,#00 -> -(SP)
 1e1b:  e0 2b 07 95 02 00 00    CALL_VS         1e54 (L01,(SP)+) -> -(SP)
 1e22:  42 00 00 40             JL              (SP)+,#00 [FALSE] RFALSE
 1e26:  42 01 01 cc             JL              L00,#01 [TRUE] 1e34
 1e2a:  d5 1f 01 03 ff 00       SUB             #0103,#ff -> -(SP)
 1e30:  63 01 00 41             JG              L00,(SP)+ [FALSE] RTRUE
 1e34:  e0 23 07 95 01 08 2f 00 CALL_VS         1e54 (L00,S001) -> -(SP)
 1e3c:  42 00 00 c4             JL              (SP)+,#00 [TRUE] 1e42
 1e40:  9b 03                   RET             #03
 1e42:  e0 23 07 95 01 01 87 00 CALL_VS         1e54 (L00,#0187) -> -(SP)
 1e4a:  42 00 00 c4             JL              (SP)+,#00 [TRUE] 1e50
 1e4e:  9b 02                   RET             #02
 1e50:  b1                      RFALSE          

Routine 1e54, 4 locals

 1e55:  61 01 02 43             JE              L00,L01 [FALSE] 1e5a
 1e59:  b1                      RFALSE          
 1e5a:  42 01 00 47             JL              L00,#00 [FALSE] 1e63
 1e5e:  42 02 00 c3             JL              L01,#00 [TRUE] 1e63
 1e62:  b0                      RTRUE           
 1e63:  42 01 00 c9             JL              L00,#00 [TRUE] 1e6e
 1e67:  42 02 00 45             JL              L01,#00 [FALSE] 1e6e
 1e6b:  8b ff ff                RET             #ffff
 1e6e:  c9 8f 01 7f ff 03       AND             L00,#7fff -> L02
 1e74:  c9 8f 02 7f ff 04       AND             L01,#7fff -> L03
 1e7a:  63 03 04 43             JG              L02,L03 [FALSE] 1e7f
 1e7e:  b0                      RTRUE           
 1e7f:  8b ff ff                RET             #ffff

Routine 1e84, 4 locals

 1e85:  74 01 02 03             ADD             L00,L01 -> L02
 1e89:  e0 23 07 95 03 06 1c 00 CALL_VS         1e54 (L02," b js/zzik ") ->
-(SP)
 1e91:  42 00 00 c9             JL              (SP)+,#00 [TRUE] 1e9c
 1e95:  d9 1f 06 55 18 00       CALL_2S         1954 (#18) -> -(SP)
 1e9b:  b8                      RET_POPPED      
 1e9c:  70 01 02 04             LOADB           L00,L01 -> L03
 1ea0:  ab 04                   RET             L03

Routine 1ea4, 4 locals

 1ea5:  36 02 02 00             MUL             #02,L01 -> -(SP)
 1ea9:  74 01 00 03             ADD             L00,(SP)+ -> L02
 1ead:  e0 23 07 95 03 06 1c 00 CALL_VS         1e54 (L02," b js/zzik ") ->
-(SP)
 1eb5:  42 00 00 c9             JL              (SP)+,#00 [TRUE] 1ec0
 1eb9:  d9 1f 06 55 19 00       CALL_2S         1954 (#19) -> -(SP)
 1ebf:  b8                      RET_POPPED      
 1ec0:  6f 01 02 04             LOADW           L00,L01 -> L03
 1ec4:  ab 04                   RET             L03

Routine 1ec8, 5 locals

 1ec9:  74 01 02 04             ADD             L00,L01 -> L03
 1ecd:  e0 23 07 95 04 04 e8 00 CALL_VS         1e54 (L03,#04e8) -> -(SP)
 1ed5:  42 00 00 d4             JL              (SP)+,#00 [TRUE] 1eeb
 1ed9:  e0 23 07 95 04 06 13 00 CALL_VS         1e54 (L03,#0613) -> -(SP)
 1ee1:  42 00 00 48             JL              (SP)+,#00 [FALSE] 1eeb
 1ee5:  0d 05 01                STORE           L04,#01
 1ee8:  8c 00 45                JUMP            1f2e
 1eeb:  e0 23 07 95 04 01 c0 00 CALL_VS         1e54 (L03,#01c0) -> -(SP)
 1ef3:  42 00 00 d4             JL              (SP)+,#00 [TRUE] 1f09
 1ef7:  e0 23 07 95 04 02 06 00 CALL_VS         1e54 (L03,#0206) -> -(SP)
 1eff:  42 00 00 48             JL              (SP)+,#00 [FALSE] 1f09
 1f03:  0d 05 01                STORE           L04,#01
 1f06:  8c 00 27                JUMP            1f2e
 1f09:  e0 23 07 95 04 03 08 00 CALL_VS         1e54 (L03,#0308) -> -(SP)
 1f11:  42 00 00 d4             JL              (SP)+,#00 [TRUE] 1f27
 1f15:  e0 23 07 95 04 03 08 00 CALL_VS         1e54 (L03,#0308) -> -(SP)
 1f1d:  42 00 00 48             JL              (SP)+,#00 [FALSE] 1f27
 1f21:  0d 05 01                STORE           L04,#01
 1f24:  8c 00 09                JUMP            1f2e
 1f27:  41 04 11 45             JE              L03,#11 [FALSE] 1f2e
 1f2b:  0d 05 01                STORE           L04,#01
 1f2e:  a0 05 49                JZ              L04 [FALSE] 1f38
 1f31:  d9 1f 06 55 1a 00       CALL_2S         1954 (#1a) -> -(SP)
 1f37:  b8                      RET_POPPED      
 1f38:  e2 ab 01 02 03          STOREB          L00,L01,L02
 1f3d:  b0                      RTRUE           

Routine 1f40, 2 locals

 1f41:  c1 95 01 00 09 0b c6    JE              L00,#00,#09,#0b [TRUE] 1f4c
 1f48:  41 01 0d 45             JE              L00,#0d [FALSE] 1f4f
 1f4c:  0d 02 01                STORE           L01,#01
 1f4f:  42 01 20 c9             JL              L00,#20 [TRUE] 1f5a
 1f53:  43 01 7e c5             JG              L00,#7e [TRUE] 1f5a
 1f57:  0d 02 01                STORE           L01,#01
 1f5a:  42 01 9b c9             JL              L00,#9b [TRUE] 1f65
 1f5e:  43 01 fb c5             JG              L00,#fb [TRUE] 1f65
 1f62:  0d 02 01                STORE           L01,#01
 1f65:  a0 02 4a                JZ              L01 [FALSE] 1f70
 1f68:  e0 1b 06 55 21 01 00    CALL_VS         1954 (#21,L00) -> -(SP)
 1f6f:  b8                      RET_POPPED      
 1f70:  e5 bf 01                PRINT_CHAR      L00
 1f73:  b0                      RTRUE           

Routine 1f74, 1 local

 1f75:  d9 2f 07 83 01 00       CALL_2S         1e0c (L00) -> -(SP)
 1f7b:  41 00 03 c9             JE              (SP)+,#03 [TRUE] 1f86
 1f7f:  d9 1f 06 55 23 00       CALL_2S         1954 (#23) -> -(SP)
 1f85:  b8                      RET_POPPED      
 1f86:  ad 01                   PRINT_PADDR     L00
 1f88:  b0                      RTRUE           

Routine 1f8c, 1 local

 1f8d:  e0 2f 08 24 01 00       CALL_VS         2090 (L00) -> -(SP)
 1f93:  e9 7f ff                PULL            Gef
 1f96:  41 ff 00 4c             JE              Gef,#00 [FALSE] 1fa4
 1f9a:  b2 ...                  PRINT           "nothing"
 1fa1:  8c 00 44                JUMP            1fe6
 1fa4:  41 ff 02 47             JE              Gef,#02 [FALSE] 1fad
 1fa8:  aa 01                   PRINT_OBJ       L00
 1faa:  8c 00 3b                JUMP            1fe6
 1fad:  41 ff 01 4c             JE              Gef,#01 [FALSE] 1fbb
 1fb1:  b2 ...                  PRINT           "class "
 1fb6:  aa 01                   PRINT_OBJ       L00
 1fb8:  8c 00 2d                JUMP            1fe6
 1fbb:  41 ff 03 56             JE              Gef,#03 [FALSE] 1fd3
 1fbf:  b2 ...                  PRINT           "(routine at "
 1fca:  e6 bf 01                PRINT_NUM       L00
 1fcd:  b2 ...                  PRINT           ")"
 1fd0:  8c 00 15                JUMP            1fe6
 1fd3:  41 ff 04 51             JE              Gef,#04 [FALSE] 1fe6
 1fd7:  b2 ...                  PRINT           "(string at "
 1fe0:  e6 bf 01                PRINT_NUM       L00
 1fe3:  b2 ...                  PRINT           ")"
 1fe6:  b0                      RTRUE           

Routine 1fe8, 5 locals

 1fe9:  c9 8f 01 c0 00 00       AND             L00,#c000 -> -(SP)
 1fef:  a0 00 80 67             JZ              (SP)+ [TRUE] 2058
 1ff3:  49 01 ff 00             AND             L00,#ff -> -(SP)
 1ff7:  cf 2f 02 06 00 04       LOADW           #0206,(SP)+ -> L03
 1ffd:  da 2f 07 e3 04          CALL_2N         1f8c (L03)
 2002:  b2 ...                  PRINT           "::"
 2007:  c9 8f 01 80 00 00       AND             L00,#8000 -> -(SP)
 200d:  a0 00 51                JZ              (SP)+ [FALSE] 201f
 2010:  c9 8f 01 3f 00 00       AND             L00,#3f00 -> -(SP)
 2016:  d7 8f 00 01 00 01       DIV             (SP)+,#0100 -> L00
 201c:  8c 00 3b                JUMP            2058
 201f:  c9 8f 01 7f 00 00       AND             L00,#7f00 -> -(SP)
 2025:  d7 8f 00 01 00 01       DIV             (SP)+,#0100 -> L00
 202b:  51 04 03 ff             GET_PROP        L03,#03 -> Gef
 202f:  2d 05 ff                STORE           L04,Gef
 2032:  4f 05 00 00             LOADW           L04,#00 -> -(SP)
 2036:  a0 00 d7                JZ              (SP)+ [TRUE] 204e
 2039:  43 01 00 53             JG              L00,#00 [FALSE] 204e
 203d:  50 05 02 00             LOADB           L04,#02 -> -(SP)
 2041:  74 05 00 00             ADD             L04,(SP)+ -> -(SP)
 2045:  54 00 03 05             ADD             (SP)+,#03 -> L04
 2049:  96 01                   DEC             L00
 204b:  8c ff e6                JUMP            2032
 204e:  4f 05 00 00             LOADW           L04,#00 -> -(SP)
 2052:  c9 8f 00 7f ff 01       AND             (SP)+,#7fff -> L00
 2058:  cd 4f 02 02 10          STORE           L01,#0210
 205d:  4f 02 00 03             LOADW           L01,#00 -> L02
 2061:  43 01 00 4d             JG              L00,#00 [FALSE] 2070
 2065:  62 01 03 49             JL              L00,L02 [FALSE] 2070
 2069:  6f 02 01 00             LOADW           L01,L00 -> -(SP)
 206d:  a0 00 56                JZ              (SP)+ [FALSE] 2084
 2070:  b2 ...                  PRINT           "<number "
 2079:  e6 bf 01                PRINT_NUM       L00
 207c:  b2 ...                  PRINT           ">"
 2081:  8c 00 0b                JUMP            208d
 2084:  6f 02 01 00             LOADW           L01,L00 -> -(SP)
 2088:  da 2f 07 dd 00          CALL_2N         1f74 ((SP)+)
 208d:  b0                      RTRUE           

Routine 2090, 1 local

 2091:  d9 2f 07 83 01 00       CALL_2S         1e0c (L00) -> -(SP)
 2097:  e9 7f ff                PULL            Gef
 209a:  41 ff 02 44             JE              Gef,#02 [FALSE] 20a0
 209e:  9b 03                   RET             #03
 20a0:  41 ff 03 44             JE              Gef,#03 [FALSE] 20a6
 20a4:  9b 04                   RET             #04
 20a6:  41 ff 01 4d             JE              Gef,#01 [FALSE] 20b5
 20aa:  46 01 01 c6             JIN             L00,"Class" [TRUE] 20b2
 20ae:  43 01 04 c3             JG              L00,#04 [TRUE] 20b3
 20b2:  b0                      RTRUE           
 20b3:  9b 02                   RET             #02
 20b5:  b1                      RFALSE          

Routine 20b8, 2 locals

 20b9:  b1                      RFALSE          

[End of code at 20ba]

[Start of text at 20bc]

 20bc: S001 "This aspect of your interpreter appears to behave according to
spec.
"
 20ec: S002 "This aspect of your interpreter appears to behave WRONG.
"
 2118: S003 "Your interpreter does not claim to follow any particular version
of the Z-Spec.

"
 2154: S004 "Your interpreter claims to follow revision "
 2174: S005 "Interpreter claims that colored text IS available.
"
 219c: S006 "Interpreter claims that colored text IS NOT available.
"
 21c8: S007 "Interpreter claims that emphasized (bold) text IS available.
"
 21f8: S008 "Interpreter claims that emphasized (bold) text IS NOT available.
"
 222c: S009 "Interpreter claims that italic (or underlined) text IS available.
"
 2260: S010 "Interpreter claims that italic (or underlined) text IS NOT
available.
"
 2298: S011 "Interpreter claims that fixed-width text IS available.
"
 22c4: S012 "Interpreter claims that fixed-width text IS NOT available.
"
 22f4: S013 "Interpreter claims that sound effects ARE available.
"
 231c: S014 "Interpreter claims that sound effects ARE NOT available.
"
 2348: S015 "Interpreter claims that timed input IS available.
"
 2370: S016 "Interpreter claims that timed input IS NOT available.
"
 239c: S017 "Interpreter claims that "undo" IS available.
"
 23c0: S018 "Interpreter claims that "undo" IS NOT available.
"
 23e8: S019 ""
 23ec: S020 ""
 23f0: S021 "Black"
 23f4: S022 "Red"
 23f8: S023 "Green"
 23fc: S024 "Yellow"
 2404: S025 "Blue"
 2408: S026 "Magenta"
 2410: S027 "Cyan"
 2414: S028 "White"
 2418: S029 "Interpreter claims that colored text IS available.
"
 2440: S030 "Interpreter claims that colored text IS NOT available.
"
 246c: S031 "
In the square below, you should see"
 2488: S032 "
If it was, in the square below, you would see"
 24ac: S033 " vertical stripes of background color (matching the column
headers) and horizontal rows of foreground color (that is, all # marks in a row
the same color.)
"
 251c: S034 "Interpreter claims that emphasized (bold) text IS available.
"
 254c: S035 "Interpreter claims that emphasized (bold) text IS NOT available.
"
 2580: S036 "Interpreter claims that italic (or underlined) text IS available.
"
 25b4: S037 "Interpreter claims that italic (or underlined) text IS NOT
available.
"
 25ec: S038 "Interpreter claims that fixed-width text IS available.
"
 2618: S039 "Interpreter claims that fixed-width text IS NOT available.
"
 2648: S040 "Test of italic (or underlined) text."
 2664: S041 "Test of fixed-width text (using "font off", which sets a header
bit)."
 2698: S042 "Test of fixed-width text (using "@set_text_style 8")."
 26c4: S043 "
Now we will try combining styles. The Z-Spec does not require interpreters to
display combined styles, so the lines below may not have all the styles they
say they do.

"
 2740: S044 "Test of bold, italic, reverse text."
 275c: S045 "
The following are all printed with "font off" (that is, the header bit remains
set, even though "style roman" statements occur.)
"
 27bc: S046 "Test of fixed, bold, italic text."
 27d8: S047 "Test of fixed, bold, reverse text."
 27f4: S048 "Test of fixed, italic, reverse text."
 2810: S049 "Test of fixed, bold, italic, reverse text."
 2830: S050 "This tests signed multiplication, division, and modulo operations.
All these operations are supposed to be signed. (The Z-Spec 0.2 erroneously
says they are unsigned; this is corrected in 0.99.)

"
 28c4: S051 "I am assuming the convention that division always rounds towards
zero (not towards negative infinity), and (A % B) always has the same sign as
A. These conventions seem to be common among existing C/C++ compilers. The
Infocom interpreters also follow these conventions. (But they are not
guaranteed by the C and C++ standards. Those only require that (A/B)*B + (A%B)
== A, for all A and all nonzero B.)

"
 2a04: S052 "13 * 5"
 2a0c: S053 "13 * -5"
 2a18: S054 "-13 * 5"
 2a24: S055 "-13 * -5"
 2a30: S056 "13 / 5"
 2a38: S057 "13 / -5"
 2a40: S058 "-13 / 5"
 2a48: S059 "-13 / -5"
 2a54: S060 "13 % 5"
 2a5c: S061 "13 % -5"
 2a68: S062 "-13 % 5"
 2a74: S063 "-13 % -5"
 2a80: S064 "a-umlaut:ae"
 2a8c: S065 "o-umlaut:oe"
 2a98: S066 "u-umlaut:ue"
 2aa4: S067 "A-umlaut:Ae"
 2ab0: S068 "O-umlaut:Oe"
 2abc: S069 "U-umlaut:Ue"
 2ac8: S070 "sz-ligature:ss"
 2ad4: S071 ">>-quotes:>>"
 2ae4: S072 "<<-quotes:<<"
 2af4: S073 "e-umlaut:e"
 2b00: S074 "i-umlaut:i"
 2b0c: S075 "y-umlaut:y"
 2b18: S076 "E-umlaut:E"
 2b24: S077 "I-umlaut:I"
 2b30: S078 "a-acute:a"
 2b3c: S079 "e-acute:e"
 2b48: S080 "i-acute:i"
 2b54: S081 "o-acute:o"
 2b60: S082 "u-acute:u"
 2b6c: S083 "y-acute:y"
 2b78: S084 "A-acute:A"
 2b84: S085 "E-acute:E"
 2b90: S086 "I-acute:I"
 2b9c: S087 "O-acute:O"
 2ba8: S088 "U-acute:U"
 2bb4: S089 "Y-acute:Y"
 2bc0: S090 "a-grave:a"
 2bcc: S091 "e-grave:e"
 2bd8: S092 "i-grave:i"
 2be4: S093 "o-grave:o"
 2bf0: S094 "u-grave:u"
 2bfc: S095 "A-grave:A"
 2c08: S096 "E-grave:E"
 2c14: S097 "I-grave:I"
 2c20: S098 "O-grave:O"
 2c2c: S099 "U-grave:U"
 2c38: S100 "a-circumflex:a"
 2c48: S101 "e-circumflex:e"
 2c58: S102 "i-circumflex:i"
 2c68: S103 "o-circumflex:o"
 2c78: S104 "u-circumflex:u"
 2c88: S105 "A-circumflex:A"
 2c98: S106 "E-circumflex:E"
 2ca8: S107 "I-circumflex:I"
 2cb8: S108 "O-circumflex:O"
 2cc8: S109 "U-circumflex:U"
 2cd8: S110 "a-ring:a"
 2ce4: S111 "A-ring:A"
 2cf0: S112 "o-slash:o"
 2cfc: S113 "O-slash:O"
 2d08: S114 "a-tilde:a"
 2d14: S115 "n-tilde:n"
 2d20: S116 "o-tilde:o"
 2d2c: S117 "A-tilde:A"
 2d38: S118 "N-tilde:N"
 2d44: S119 "O-tilde:O"
 2d50: S120 "ae-ligature:ae"
 2d5c: S121 "AE-ligature:AE"
 2d6c: S122 "c-cedilla:c"
 2d78: S123 "C-cedilla:C"
 2d84: S124 "thorn:th"
 2d8c: S125 "eth:th"
 2d94: S126 "Thorn:Th"
 2d9c: S127 "Eth:Th"
 2da4: S128 "pound-symbol:L"
 2db4: S129 "oe-ligature:oe"
 2dc0: S130 "OE-ligature:OE"
 2dd0: S131 "inverse-!:!"
 2ddc: S132 "inverse-?:?"
 2de8: S133 "This displays all the accented characters (encoding values 155 to
223). You will have to inspect your interpreter's display to make sure they
appear correctly.

"
 2e60: S134 "For the record, an umlaut is two dots; an acute accent is the one
that slants up to the right; a grave accent is the one that slants down to the
right; a circumflex is a pointy hat; a tilde is a squiggly hat; a ring is a
ring; a cedilla is the little hook that hangs down below the C. Thorn looks
like a capital D whose vertical bar extends both up and down, and Eth looks
like a D with a little cross-stroke.

"
 2f88: S135 "NOTE: Inform 6.11 contradicts the Z-Spec 0.99 document, on the
subject of the European angle-quotes (the ones that look like '>>' and '<<').
The Z-Spec says that the character '>>' is code 162, and '<<' is 163. However,
Inform 6.11 (following the Z-Spec 0.2) compiles '@>>' as 163, and '@<<' as 162.
The concensus is that the Z-Spec 0.2 and Inform 6.11 are wrong, and Z-Spec 0.99
and later are correct.

"
 30f0: S136 "Type a digit (0..7) to repeat this list in a different text style,
or "." to end this test.
"
 3138: S137 "Options: 0: normal; 1: bold; 2: italic; 3: bold italic; 4:
fixed-width; 5: fixed bold; 6: fixed italic; 7: fixed bold italic.
"
 31a8: S138 "control character 'ctrl-H' (z-machine 'delete')"
 31d0: S139 "control character 'ctrl-M' (z-machine 'newline')"
 31f8: S140 "control character 'ctrl-[' (z-machine 'escape')"
 3220: S141 " (should NOT occur in full-line input)"
 3240: S142 "This tests input of accented (actually, all) characters. Enter a
line of text; it will be broken down, and you will see a list of what
characters your interpreter thought you typed. Remember that the interpreter is
supposed to reduce everything to lower-case.

"
 32fc: S143 "Hit Enter by itself to return to the main menu.
"
 3320: S144 "This tests input of accented (actually, all) characters. Type
characters; you will see what characters your interpreter thought you typed.
Hit "." to return to the main menu.

"
 33a4: S145 "Your interpreter claims (by its header bit) that it DOES support
timed input.

"
 33e0: S146 "Your interpreter claims (by its header bit) that it DOES NOT
support timed input.

"
 3420: S147 "When you begin this test, asterisks should appear at the rate of
one per second. If they appear at the rate of one every ten seconds, your
interpreter is using the incorrect timing rate caused by an old bug in ZIP. If
an entire line of ten asterisks appears all at once every ten seconds, your
interpreter is not properly flushing its buffer.

"
 3510: S148 "Hit "." to return to the main menu, or any other key to begin the
test. Hit any key to stop the test while it is running.

"
 356c: S149 "The timing interrupt function was not called at all. Either your
interpreter does not support timed input, or you terminated the test before one
second elapsed. (Or your interpreter has the "slow" bug and you terminated the
test before ten seconds elapsed.)

"
 3624: S150 "Your interpreter claims to not support timed input. "
 3648: S151 "Your interpreter claims to support timed input. "
 366c: S152 "Your interpreter calls the timing interrupt function with no
arguments. "
 36a0: S153 "This is correct, except that your interpreter claims not to
support timed input at all. "
 36e0: S154 "Your interpreter calls the timing interrupt function with an
argument. "
 3714: S155 "Your interpreter claims (by its header bit) that it DOES support
timed input.

"
 3750: S156 "Your interpreter claims (by its header bit) that it DOES NOT
support timed input.

"
 3790: S157 "When you begin this test, you should be able to enter a line of
input in the usual fashion. Every three seconds, a line of text will appear.
(If the lines appear at the rate of one every thirty seconds, your interpreter
is using the incorrect timing rate caused by an old bug in ZIP.)

"
 385c: S158 "Interrupts actually are occuring once per second; every third
interrupt prints a line of text, and the other two have no visible effect.
After each line, your input should be redrawn so that you can continue typing
and editing it.

"
 3900: S159 "Hit "." to return to the main menu, or any other key to begin the
test. Type "." on a line by itself to stop the test.

"
 395c: S160 "You just typed a blank line. (Type "." to stop this test.)

"
 398c: S161 "The timing interrupt function was not called at all. Either your
interpreter does not support timed input, or you terminated the test before one
second elapsed. (Or your interpreter has the "slow" bug and you terminated the
test before ten seconds elapsed.)

"
 3a44: S162 "Your interpreter claims to not support timed input. "
 3a68: S163 "Your interpreter claims to support timed input. "
 3a8c: S164 "Your interpreter calls the timing interrupt function with no
arguments. "
 3ac0: S165 "This is correct, except that your interpreter claims not to
support timed input at all. "
 3b00: S166 "Your interpreter calls the timing interrupt function with an
argument. "
 3b34: S167 "
[Every three seconds....]
TimedString> "
 3b5c: S168 "This tests whether your interpreter supports being handed input by
the game file. (For example, after a function key is hit in Beyond Zork, the
command prompt appears with text already in place -- whatever text you had
typed before you interrupted it with the function key.)

"
 3c20: S169 "The command prompt below should appear with the word "Given"
already visible after it. You should be able to type more characters, or go
back and edit the given character as if you had typed them yourself.

"
 3cb4: S170 "If you see the word "Given" twice, your interpreter is printing
the given characters, which it shouldn't (that's the responsibility of the game
file.)

"
 3d24: S171 "This tests the interpreter's ability to do single and multiple
"undo" commands.

"
 3d60: S172 "Your interpreter claims (by its header bit) that it DOES support
undo.

"
 3d98: S173 "Your interpreter claims (by its header bit) that it DOES NOT
support undo.

"
 3dd4: S174 "Save failed -- interpreter claims that it does not support "undo".
"
 3e08: S175 "Undo succeeded (undid first move).
"
 3e24: S176 "Save failed -- interpreter claims that it does not support "undo".
"
 3e58: S177 "Undo succeeded (undid second move).
"
 3e74: S178 "
Hit "." to abort this test, or any other key to try a second "undo". (In many
interpreters, executing the second "undo" will return to exactly the same point
as the first one. If this occurs, and you see this message a second time (or
more), your interpreter only supports single-move undo.)
"
 3f48: S179 "
Hit "." to abort this test, or any other key to try "undo".
"
 3f78: S180 "Your interpreter claims to support "undo", but the @save_undo
opcode returned -1, indicating that the interpreter does not support "undo". "
 3fe0: S181 "Your interpreter claims to not support "undo", and the @save_undo
opcode returned -1, corroborating this. "
 4030: S182 "Your interpreter claims to support "undo", but it didn't work. "
 4060: S183 "Your interpreter claims to not support "undo", and in fact "undo"
failed. However, it did not return -1 from the @save_undo opcode, which it
should. "
 40d0: S184 "Your interpreter claims to support "undo", and it does. "
 40fc: S185 "Your interpreter claims to not support "undo", but in fact it does
anyway. "
 4134: S186 "Your interpreter claims to support "undo", and it does. In fact,
it supports multiple "undo". "
 417c: S187 "Your interpreter claims to not support "undo", but in fact it does
anyway. In fact, it supports multiple "undo". "
 41d0: S188 "This tests if you can read text which is displayed immediately
before the program quits. (It is not clear whether this is covered by the
Z-Spec. However, some games -- including some original Infocom games -- display
important closing text and then immediately quit.)

"
 4290: S189 "Hit "." to return to the main menu, or any other key to print a
line of text and then quit. If the line of text does not appear, or appears and
vanishes too quickly to read, your interpreter will have trouble with those
games.

"
 4330: S190 "

This is a final line of text. Goodbye.
"
 4350: S191 "Version"
 4358: S192 "Recent changes to TerpEtude"
 436c: S193 "Header flags analysis"
 437c: S194 "Styled text"
 4384: S195 "Colored text"
 4390: S196 "Multiplication, division, remainder"
 43ac: S197 "Accented character output"
 43c0: S198 "Single-key input"
 43cc: S199 "Full-line input"
 43d8: S200 "Timed single-key input"
 43e8: S201 "Timed full-line input"
 43f8: S202 "Pre-loading of input line"
 440c: S203 "Undo capability"
 4418: S204 "Printing before quitting"
 442c: S205 "Options: (hit Enter by itself to display this menu)
"
 4454: S206 ", or "." to exit, or hit Enter by itself to display the menu of
options.
"
 448c: S207 "That option is not yet implemented.
"
 44a8: S208 "TerpEtude: A Z-machine Interpreter Exerciser
"
 44cc: S209 "By Andrew Plotkin (erkyrath@netcom.com)
"
 44f0: S210 "Tests compliance with Z-Machine Standards Document 0.99.
"
 4520: S211 "NOTE: This program does not test everything in the Z-Spec. Passing
all the tests in this program does NOT guarantee that your interpreter is
Z-Spec-compliant.

"
 459c: S212 "For that matter, this program may have mistakes in it. I don't
think it does, but you should not assume it is the Fount of All Z-Machineness.
If you find something strange, check the Z-Spec, check existing interpreters,
check Infocom's interpreters, and then send me mail if you're still confused.
"
 4674: S213 "In the beginning, TerpEtude was written. That was release DRAFT-1.

"
 46ac: S214 "   Release 2:
Accented-out test: Added ability to display characters in bold, underline, and
fixed-width styles.
"
 4700: S215 "Accented-out test: Noted that >> and << are, in fact, tested
correctly.
"
 4740: S216 "Given-text test: It's the game file's job to print the given text
before it calls @read. Fixed test to do this.
"
 4794: S217 "Timed-string test: Changed test to do both "invisible" and
"visible" interrupts (only one interrupt in three actually prints text.)
"
 47f4: S218 "List of terminating characters
Fonts
Stream 3 nesting
"
 4820: S219 "Spec Aid: Graham, SJ, PDD, and the rest of the crowd
"
 484c: S220 ": 'create' can have 0 to 3 parameters only **]"
 4874: S221 "objectloop broken because the object "
 4890: S222 " was moved while the loop passed through it **]"
 48b8: S223 ", which is not a valid ZSCII character code for output **]"
 48ec: S224 "tried to print (address) on something not the "
 490c: S225 "tried to print (string) on something not a "
 492c: S226 "tried to print (object) on something not an "
 494c: S227 "give" or test "has" or "hasnt" with a non-attribute on the object
"
 497c: S228 ", but it is longer than 2 bytes so you cannot use ".""
 49a4: S229 "<unknown attribute>"
 49b8: S230 "name"
 49bc: S231 "create"
 49c0: S232 "recreate"
 49c8: S233 "destroy"
 49d0: S234 "remaining"
 49d8: S235 "copy"
 49dc: S236 "call"
 49e0: S237 "print"
 49e4: S238 "print_to_array"
 49f0: S239 "colortab"
 49f8: S240 "AccentList"
 4a00: S241 "optionlist"
 4a08: S242 "inbuf"

[End of text at 4a0c]

[End of file]
