!-- ****************************************
!-- *     BLUE MEANIES - SETUP SECTION    
!-- ****************************************
!-- *
!-- * 
!--

!--
!-- Load the Custom character and adjust end of BASIC to $3000 - protect chars
8000 REM POKE 56,48

!-- Display the loading screen
8010 GOSUB 1000
!-- Print Loading....
8030 POKE214,18:PRINT:POKE211,N-6:PRINT "{blue}loading..........]"

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

!-- delay 
8500 GOSUB 5000


!-- get any key to continue
8510 POKE214,18:PRINT:POKE211,N-6:PRINT "press any key"
8520 GET A$
8530 IF A$="" THEN GOTO 8520
