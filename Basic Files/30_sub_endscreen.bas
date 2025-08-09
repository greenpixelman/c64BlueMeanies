!-- ****************************************
!-- *      BLUE MEANIES - GAME SCREEN
!-- *  displays the end screen
!-- ****************************************
!--
3000 PRINT CHR$(147): REM CLEAR SCREEN
3010 POKE 53280,0: POKE 53281,0  : REM Set border=green, background=black
3015 if w=0 THEN 3100
3018 PRINT CHR$(5)
3020 PRINT "we're"
3030 PRINT "gonna"
3040 PRINT "be"
3060 PRINT "meaner"
3070 PRINT "now"
3080 REM update mean level
3090 ml = ml + 1
3100 return
3200 rem End
3210 PRINT "" 
3215 PRINT CHR$(5)
3220 PRINT "overun!"
3230 end
