

!-- TODO *****************************************
!-- TODO *****************************************
!-- TODO *****************************************
!--
!-- This slow BASIC routine copies the char set ROM into the RAM (12288 - 16383) for manipulating. C64-Wiki
8250 REM POKE 56334, PEEK(56334) AND 254:                      rem (Interrupts deactivate)
8260 REM POKE 1, PEEK(1) AND 251 :                             rem (E/A area deactivate, char set ROM online)
8270 REM FOR A=H1 TO H2:
8280 REM POKE A-H3, PEEK(A):                                rem (copy routine)
8290 REM IF A/500 = INT(A/500) THEN N=N+1:POKE214,18:PRINT:POKE211,N:PRINT "*"
8295 REM NEXT
!-- Update the Loading Screen
8300 REM POKE 1, PEEK(1) OR 4 :                                rem (E/A area activate)
8310 REM POKE 56334, PEEK(56334) OR 1   :                      rem (Interrupts activate)
8320 REM POKE 53272,PEEK(53272) AND 240 OR 12 : REM CHAR SET RAM AT $3000 (Sets soft character base address)
!-- Load the Custom Chars
8350 REM FOR X=12288+(122*8) TO 12295+(122*8): READ A: POKE X,A: NEXT:REM Load Meanie
8355 REM FOR X=12288+(123*8) TO 12295+(123*8): READ A: POKE X,A: NEXT:REM load Ship
!-- TODO *****************************************
!-- TODO *****************************************




!-- Character start,end and offset
535 ti$="000000"
815 DATA 255,189,153,255,255,195,189,255 : REM CHARACTER 122 - Meanie
816 DATA 60,126,255,219,255,126,36,36 : REM CHARACTER 123 - Ship
826 PRINT "loading chars into ram"

8050 REM POKE 52,128: POKE 56,128: CLR
8100 H1=53248:H2=57343:H3=40960

!-- turn keyboard interrups off
8150 POKE 56334, PEEK(56334) AND 254
!-- switch out IO and move Char rom in 53248-57343
8160 POKE 1, PEEK(1) AND 251

!--  The VIC-II chip needs to be configured to look at memory bank 2, which occupies addresses $8000–$BFFF (32768–49151).
8260 REM --- YOUR CHARACTER DATA COPY ROUTINE GOES HERE
8270 REM --- EXAMPLE: COPY FROM ROM CHARACTER SET 2 TO $9000
8280 FOR I=0 TO 2047
8290 POKE 32768+I, PEEK(53248+I)
8300 NEXT I
!-- SET INTERRUPT ON
8302 POKE 1, PEEK(1) OR 4
8304 POKE 56334, PEEK(56334) OR 1

!-
!--- MOVE VIC-II TO BANK 2 AND SCREEN TO 34816 and Char to 32768
!-- Set to Bank 2
8320 POKE 56576, (PEEK(56576) AND 252) OR 1
!-- Your Commodore 64 - pages 194-199
!-- Programmers Reference Guide, Page 101-103
!-- Set the Char location $8000 and screen locations $8800
!-- Screen is upper 4 of 53272
!-- 0010xxxx
!-- Char location is a bits 3,2,1  (bit 0 is ignored)
!-- xxxx000x
!-- so all the bits together make:
!-- 00100000 = 32 (dec)
8325 POKE 53272, 32
!-- Change the Kernals Screen 34816/256 = 136
8330 POKE 648, 136
!-- Make sure to clear the screen, because the screen is on a new bank.
8355 PRINT CHR$(147) 
8356 PRINT "change to bank 2, screen 34816, char 32768"
8358 PRINT "completed...load custom chars"

!--- Load the Custom Chars
8450 FOR X=32768+(122*8) TO (32768+7)+(122*8): READ A: POKE X,A: NEXT:REM Load Meanie
8455 FOR X=32768+(123*8) TO (32768+7)+(123*8): READ A: POKE X,A: NEXT:REM load Ship



8660 PRINT CHR$(250);CHR$(251)
8670 print ti;"jiffys"
