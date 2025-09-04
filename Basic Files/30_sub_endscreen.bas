!-- ****************************************
!-- *      BLUE MEANIES - GAME SCREEN
!-- *  displays the end screen
!-- ****************************************
!--

!-- Clear screen
3000 PRINT CHR$(147)

!-- Set border=green, background=black
3010 POKE 53280,0: POKE 53281,0

!-- Check if w set (win game)
3015 if W=0 THEN 3200

!-- We WON! move to next level with meaner Blue's'
3018 PRINT CHR$(5)
3020 PRINT "we're"
3030 PRINT "gonna"
3040 PRINT "be"
3060 PRINT "meaner"
3070 PRINT "now"

!-- update the meaner level
3080 ML = ML + 1
3085 return

!-- End the game!
3200 PRINT ""
3210 PRINT "" 
3215 PRINT CHR$(5)
3220 PRINT "overun!"
3230 END


