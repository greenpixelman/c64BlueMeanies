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

!-- Build the game screen
9000 gosub 2000

!-- Set the flags for the lasers to be active
9010 FOR LL=1 TO 12: L1(LL)=1:L2(LL)=1: NEXT

!-- Setup the Sound Var
9016 VV=54272
9017 POKE 54296,15: POKE 54295,0

!-- Update the Level for the hold time per cycle to display the movement
9020 IF ML=1 THEN HVIEW = 3:REM NORMAL
9025 IF ML>1 THEN HVIEW = 2:REM FAST
9026 IF ML>2 THEN HVIEW = 1:REM VERY FAST

!-- Set the Loop
9030 HLOOP =0

!-- reset the total Meanie hits
9035 MH =0

!-- TODO Set the total number of Meanies to hit before Winning
9036 WG = 1

!-- Force the ship to refuel
!-- 9037 EG=0 


!-- ***************************************************************************
!-- Game Play Logic...
!-- ***************************** LOOP
9040 FOR C= -1 to 0
9042 HLOOP = HLOOP +1

#region "Update var for new game cycle"
!-- ##################################
!-- add time check for speed
9051 TI$="000000"
9052 IF O4<>0 THEN LP=LP+1
!-- Clear the message
9053 MS$="           "

!-- clear the flag for the Hit of the Meanie 1 and 2
9055 T1=0:T2=0:IF R3>0 THEN DR=1

!-- if drop ship is not active and out of energy, drop another one
9070 IF DR=0 AND EG<=0 THEN DR=1
#endregion

#region "Clear last position"
!--- Erase the Last Monster on the Screen and turn off the sound
9105 POKE VV+4,0

!-- Clear the last position
9110 IF HLOOP = HVIEW THEN PRINT h$;left$(x$,C1);left$(y$,R1);" ";
9115 IF HLOOP = HVIEW THEN PRINT h$;left$(x$,C2);left$(y$,R2);" ";
!-- Clear the last position
9116 IF DR=1  THEN PRINT h$;left$(x$,C3);left$(y$,R3);" ";
9117 IF O4<>0 THEN PRINT h$;left$(x$,C4);left$(y$,R4);" ";
#endregion

#region "Check for a Hit"
!-- If we made a hit with a bit of offset
9120 IF (C4=C1 OR C4=C1-1) AND (R4=R1 OR R4=R1-1) THEN PRINTh$;left$(x$,C3);left$(y$,R3);" ";h$;left$(x$,C4);left$(y$,R4);"{yellow}";CHR$(42);:R1=0:O4=9:SK=SK+100:MH=MH+1
9125 IF (C4=C2 OR C4=C2-1) AND (R4=R2 OR R4=R2-1) THEN PRINTh$;left$(x$,C4);left$(y$,R4);" ";h$;left$(x$,C4);left$(y$,R4);"{yellow}";CHR$(42);:R2=0:O4=9:SK=SK+100:MH=MH+1

!--- Check if Laser cannon has been hit!
9201 IF (R1=K1 OR R1=K2 OR R1=K3) AND (C1>3 AND C1<6) THEN L1(R1-3)=0:T1=TH:PRINT h$;left$(x$,4);left$(y$,R1);"   ";
9202 IF (R2=K1 OR R2=K2 OR R2=K3) AND (C2>32 AND C2<36) THEN L2(R2-3)=0:T2=TH:PRINT h$;left$(x$,33);left$(y$,R2);"   ";

!--- If out of range - force a restart of Meanie
9205 IF (C1<BL) AND T1=TG AND HLOOP=HVIEW THEN T1=TH
9206 IF (C2>BR) AND T2=TG AND HLOOP=HVIEW THEN T2=TH

!--- Damage message
9210 IF T1=1 THEN MS$="{red}base hit!":PRINT"{left}{left}{left}   "
9211 IF T2=1 THEN MS$="{red}base hit!":PRINT"{left}{left}{left}   "

!-- Clear the hit character
9212 IF O4=9 THEN PRINTh$;left$(x$,C4);left$(y$,R4);" ":O4=0
#endregion

#region "Move the characters in the game"
!-- Increase the Loop before we move

!--- Move the Monster down - Random between 1 and 2 and shift the column 1 to -2
9215 IF HLOOP = HVIEW THEN TM = INT((2 - 1 + 1) * RND(1)) + 1
9216 IF HLOOP = HVIEW THEN R1 = R1 + TM:TT= INT(3 * RND(1) - 2)
9220 IF C1>BL AND C1<BR AND HLOOP = HVIEW THEN C1=C1 + TT
!--- Move the Monster down - Random between 1 and 2 and shift the column 0-1
9230 IF HLOOP = HVIEW THEN R2 = R2 + TM:TT= INT(2 * RND(1) +1 )
9240 IF C2>BL AND C2<BR AND HLOOP = HVIEW THEN C2=C2 + TT
9241 REM POKE 781,23:POKE 782,22:POKE 783,0:SYS 65520:PRINT chr$(158);MS$

!-- Refuel ship position 
9250 IF DR=1 THEN R3 = R3 + 1

!-- Laser increase position 
9251 IF O4<>0 THEN C4 = C4 + O4
!-- turn off if out ofbounds
9252 IF O4<>0 AND C4<7 OR C4 > 32 THEN O4=0
!-- Max distance for the laser 
9253 IF O4<>0 AND LP>8 THEN O4=0:LP=0

!-- If Hit, then restart 
9260 IF T1=TH OR R1>19 AND HLOOP = HVIEW THEN R1 = 0:C1=INT((20 - 9 + 1) * RND(1)) + 9
9262 IF T2=TH OR R2>19 AND HLOOP = HVIEW THEN R2 = 0:C2=INT((32 - 22 + 1) * RND(1)) + 22
9263 IF R3>18 THEN R3=0:F1=F1+200:MS$="{yellow}refueled!":DR=0:EG=EG+150
#endregion

#region "display feedback"
!--- Display Energy, Score and Message
9275 IF MS$<>"" THEN PRINT h$;left$(x$,22);left$(y$,23);MS$;
9277 IF MS$<>"" THEN PRINT h$;left$(x$,12);left$(y$,22);"{light blue}     {left}{left}{left}{left}{left}";EG;
9278 IF MS$<>"" THEN PRINT h$;left$(x$,12);left$(y$,24);"{purple}";SK;"  ";

!-- Testing to show speed difference between print and sys
!-- **************** from Compute's "Mapping the 64
9285 REM IF MS$<>"" THEN POKE 782,22:POKE 781,23:POKE 783,0:SYS 65520:PRINT MS$;
9287 REM IF MS$<>"" THEN POKE 782,12:POKE 781,22:POKE 783,0:SYS 65520:PRINT "{light blue}     {left}{left}{left}{left}{left}";EG;
9288 REM IF MS$<>"" THEN POKE 782,12:POKE 781,24:POKE 783,0:SYS 65520:PRINT "{purple}";SK;"  ";

!-- ###################################################
!-- Show how long it takes to cycle the game loop
!-- Debug testing only - display the jiffy
9295 PRINT h$;left$(x$,22);left$(y$,24);"{cyan}[debug]        {left}{left}{left}{left}{left}{left}{left}{left}";TI;"jifs";

#endregion

#region "Sound and Update the characters on screen"
!-- Make the Sound *******************
9300 IF HLOOP = HVIEW THEN POKE VV+6,0:POKE VV+5,31:POKE VV+1,180:POKE VV+4,33
!--- draw the Monster at the position
9320 IF HLOOP = HVIEW THEN PRINT h$;left$(x$,C1);left$(y$,R1);"{light blue}";CHR$(18);CHR$(MC);CHR$(146);
9325 IF HLOOP = HVIEW THEN PRINT h$;left$(x$,C2);left$(y$,R2);"{light blue}";CHR$(18);CHR$(MC);CHR$(146);
!-- Refuel ship
9326 IF DR=1 THEN PRINT h$;left$(x$,C3);left$(y$,R3);"{green}";CHR$(18);CHR$(SC);CHR$(146);
!-- Laser
9327 IF O4<>0 THEN PRINTh$;left$(x$,C4);left$(y$,R4);"{yellow}";CHR$(LC);

#endregion

#region "Prompt for the key"
!-- Prompt for the key to activate laser..
9500 GET A$
9510 IF A$="q" and EG> 0 AND O4=0 AND L1(1)=1 THEN R4=4:C4=8:O4=1:EG=EG-50
9520 IF A$="a" and EG> 0 AND O4=0 AND L1(6)=1 THEN R4=9:C4=8:O4=1:EG=EG-50
9530 IF A$="z" and EG> 0 AND O4=0 AND L1(11)=1 THEN R4=14:C4=8:O4=1:EG=EG-50
9540 IF A$="e" and EG> 0 AND O4=0 AND L2(1)=1 THEN R4=4:C4=31:O4=-1:EG=EG-50
9550 IF A$="d" and EG> 0 AND O4=0 AND L2(6)=1 THEN R4=9:C4=31:O4=-1:EG=EG-50
9560 IF A$="c" and EG> 0 AND O4=0 AND L2(11)=1 THEN R4=14:C4=31:O4=-1:EG=EG-50
9570 IF A$<>"" and EG<=0 THEN MS$="{red}no energy"
9580 IF MS$<>"" THEN PRINT h$;left$(x$,22);left$(y$,23);MS$;
#endregion

#region "Check if its end of game..."
!-- END OF GAME
9600 IF L1(1)+L1(6)+L1(11)+L2(1)+L2(6)+L2(11)=0 THEN POKE VV+4,0:w=0:GOTO 9800

!-- If found total hit - we WIN!
9650 IF MH>WG THEN W=1:POKE VV+4,0:GOTO 9800

!-- Reset the Hold view loop counter
9680 IF HLOOP=HVIEW THEN HLOOP=0
#endregion

!-- Check if the need to exit the loop
!-- always set to -1 until equals 999 and loop ends
9780 C=(R1<>999)

9790 NEXT
!-- **************************************** LOOP
!-- ***************************************************************************


!-- Display end screen
9800 gosub 3000

!-- delay
9860 GOSUB 5000
!-- get space key to continue
9870 GET A$
9875 IF A$<>" " THEN GOTO 9870

!-- reset the Win flag
9890 W=0:EG=1000
9895 GOTO 9000



