!-- ****************************************
!-- *     BLUE MEANIES - SETUP SECTION    
!-- ****************************************
!-- *
!-- * 
!--
!-- Display the loading screen
8000 GOSUB 1000
!-- Print Loading....
8030 POKE214,18:PRINT:POKE211,N-6:PRINT "{blue}loading..........]"


!-- Vars to setup 
8100 H1=53248:H2=57343:H3=40960

!-- turn keyboard interrups off
8150 POKE 56334, PEEK(56334) AND 254
!-- switch out IO and move Char rom in 53248-57343
8160 POKE 1, PEEK(1) AND 251

!-- The VIC-II chip needs to be configured to look at memory bank 2, 
!-- which occupies addresses $8000–$BFFF (32768–49151).
8200 FOR I=0 TO 2047
8290 POKE 32768+I, PEEK(53248+I)
8300 NEXT I
!-- SET INTERRUPT ON
8302 POKE 1, PEEK(1) OR 4
8304 POKE 56334, PEEK(56334) OR 1

!-
!--- MOVE VIC-II TO BANK 2 AND SCREEN TO 34816 and Char to 32768
!-- Set to Bank 2
8320 POKE 56576, (PEEK(56576) AND 252) OR 1

!-- From the Books:
!-- 'Your Commodore 64' - pages 194-199
!-- 'Programmers Reference Guide', Page 101-103

!-- Set the Char location $8000 and screen locations $8800
!-- Screen is upper 4 of 53272
!-- 0010xxxx
!-- Char location is a bits 3,2,1  (bit 0 is ignored)q
!-- xxxx000x
!-- so all the bits together make:
!-- 00100000 = 32 (dec)
8325 POKE 53272, 32
!-- Change the Kernals Screen 34816/256 = 136
8330 POKE 648, 136

!-- Make sure to clear the screen, because the screen is on a new bank.
8355 PRINT CHR$(147) 

!--- Load the Custom Chars
8450 FOR X=32768+(122*8) TO (32768+7)+(122*8): READ A: POKE X,A: NEXT:REM Load Meanie
8455 FOR X=32768+(123*8) TO (32768+7)+(123*8): READ A: POKE X,A: NEXT:REM load Ship
8465 FOR X=32768+(124*8) TO (32768+7)+(124*8): READ A: POKE X,A: NEXT:REM load Hit Char

!-- Display the Instructions
8500 GOSUB 1500
