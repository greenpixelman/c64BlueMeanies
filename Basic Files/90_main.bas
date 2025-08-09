!-- ****************************************
!-- * BLUE MEANIES FROM OUTER SPACE (C64) 
!-- * A BASIC PORT OF THE VIC-20 CLASSIC
!-- * IN AN ALTERNATE UNIVERSE, WE'VE   
!-- * BEEN TASKED TO BRING THIS GAME TO 
!-- * THE COMMODORE 64                 
!-- *
!-- * BY GREEN PIXEL MAN
!-- * JULY 2025
!-- ****************************************
!-- 
9000 gosub 2000: REM *** Build game screen
9020 GET A$
9040 IF A$="" THEN GOTO 9020

!-- Game Play Logic...
9050 REM ***
9060 REM ***
9070 REM ***
9080 REM ***
9090 REM ***

!-- End Game ....
9500 REM *************************
9545 w=1: REM Set flag to WIN
9550 gosub 3000 : REM ** End Screen
9560 GOSUB 5000 : REM delay
9565 w=0: REM reset
9570 GOTO 9000



