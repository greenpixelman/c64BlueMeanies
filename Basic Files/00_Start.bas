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


#region "Setup the variables"
!-- Screen Characters -- TODO update for custom characters
100 MC=77:REM 186
105 SC=83:REM 187
106 LC=195:

!-- Energy Level -
110 EG=1000
!-- SCORE 
115 SK=0
!-- Meanies hit
120 MH=0
!-- Set the total number of Meanies to hit before Winning
130 WG = 5
!-- win flag
205 W=0
!-- Meanie level
210 ML=1

!-- Seed the random number
217 RN=RND(-TI)

!-- print the x,y to screen instead of POKE
318 X$="{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}"
319 Y$="{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
320 H$="{home}"

!-- C1 and C2 are the Columns for the Monster
325 C1=INT((20 - 8 + 1) * RND(1)) + 8
326 C2=INT((32 - 24 + 1) * RND(1)) + 24
!-- C3 - refuel ship column
327 C3=INT((22 - 14 + 1) * RND(1)) + 14:
!-- C4 = laser column
328 C4=0

!--- Row of the Dropping Monsters
331 R1=0
332 R2=0
!-- Row for refuel ship
333 R3=0:DR=0
!-- Row for laser
334 R4=0

!--- Setup the border for the sides of the game border left and border right
335 BL=5:BR=34
336 O1=1:O2=-1:O4=0

!--- Keyboard laser rows 
337 K1=4:K2=9:K3=14

!--- Hit was triggered in the cycle
438 TH=1:TG=0

!-- Character start,end and offset
525 H1=53248:H2=57343:H3=40960

!-- Loading text Y location
530 N=19

!-- Hold view for moving the characters
600 HVIEW=2
610 HLOOP=1

!-- Setup DIM Array Last...
810 DIM row$(26)
811 DIM r2$(26)
812 DIM L1(12): DIM L2(12)

815 DATA 255,189,153,255,255,195,189,255 : REM CHARACTER 122 - Meanie
816 DATA 60,126,255,219,255,126,36,36 : REM CHARACTER 123 - Ship

#endregion


900 GOTO 8000: REM *** Jump to the SETUP