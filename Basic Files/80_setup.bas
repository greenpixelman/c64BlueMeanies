!-- ****************************************
!-- *     BLUE MEANIES - SETUP SECTION    
!-- ****************************************
!-- *
!-- * 
!--
8000 REM ** Setup Vars, and arrays last
8005 W=0: REM win flag
8010 MN=1: REM Meanie level
8020 C1=53248: REM Char Start
8025 C2=57343: REM Char End
8028 C3=40960: REM Offset location
8030 N=19 : REM Loading text Y location
8100 DIM row$(26)
8110 DIM r2$(26)
8150 DATA 255,189,153,255,255,195,189,255 : REM CHARACTER 122 - Meanie
8160 DATA 60,126,255,219,255,126,36,36 : REM CHARACTER 123 - Robot
8170 DATA 015,015,015,015,000,000,000,000 : REM CHARACTER 124 - Ship (TODO)
!--
!-- Load the Custom character and adjust end of BASIC to $3000 - protect chars
8200 POKE 56,48
8210 GOSUB 1000 : REM display the Loading screen
8220 PRINT CHR$(31);
8230 POKE214,18:PRINT:POKE211,N-6:PRINT "loading..........]"
!--
!-- This slow BASIC routine copies the char set ROM into the RAM (12288 - 16383) for manipulating. C64-Wiki
8250 POKE 56334, PEEK(56334) AND 254:                      rem (Interrupts deactivate)
8260 POKE 1, PEEK(1) AND 251 :                             rem (E/A area deactivate, char set ROM online)
8270 FOR A=C1 TO C2: 
8280 POKE A-C3, PEEK(A):                                rem (copy routine)
8290 IF A/500 = INT(A/500) THEN GOSUB 6000
8295 NEXT
!--
!-- Update the Loading Screen
8300 POKE 1, PEEK(1) OR 4 :                                rem (E/A area activate)
8310 POKE 56334, PEEK(56334) OR 1   :                      rem (Interrupts activate)
8320 POKE 53272,PEEK(53272) AND 240 OR 12 : REM CHAR SET RAM AT $3000 (Sets soft character base address)
!--
!-- Load the Custom Chars
8350 FOR X=12288+(122*8) TO 12295+(122*8): READ A: POKE X,A: NEXT:REM Load Meanie
8355 FOR X=12288+(123*8) TO 12295+(123*8): READ A: POKE X,A: NEXT:REM load Robot
!--
!-- TODO * refuel ship 
8357 REM FOR X=12288+(124*8) TO 12295+(124*8): READ A: POKE X,A: NEXT:REM load Ship
8360 REM PRINT CHR$(156);CHR$(186);CHR$(5)
8365 REM PRINT CHR$(30);CHR$(187);CHR$(5)
8400 REM GET A$
8431 REM IF A$="" THEN GOTO 8430
8990 REM *******************

