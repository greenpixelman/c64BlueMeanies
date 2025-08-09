
## BASIC (CBM prg Studo) project file:
setup.bas
sub_[name].bas
sub_[name].bas
sub_[name].bas
sub_[name].bas
main.bas



## *** Game Play ***
Start with 1000 energy for laser shots.
Laser shot -50 energy.
if < -150 energy to message 'NO ENERGY'
End game after 20 meanies shot and increase meanie level


## *** Modules ***
BASIC Modules and what they do:

#Title Screen
Title Screen with press key to continue

#Game Screen
3x3 border with 2 rows at bottom for score and message
6 lasers (3 on each side)
*Laser requires 50 enery to shot, start

#Update Score
2 rows at bottom of screen
 ENERGY = ? (blue)      [message]
 SCORE - ?  (purple)

[message] = 
GOOD HIT (yellow)   when laser shot hits meanie, add 10 points
SHIP HIT (blue)     when laser shot hits refuel ship, minus 80 points
REFUELED (lt blue)  when refuel ship lands - Add Energy +?? points
NO ENERGY (red)     when no energy to shot laser.

#End Screen
win:  
display:
WE'RE
GONNA
BE MEANER
NOW

lose:
OVER RUN!




