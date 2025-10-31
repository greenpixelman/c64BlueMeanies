## Commodore 64 - Blue Meanies from outer space.

In an alternate universe, we've been asked to bring the 
classic VIC-20 title "Blue Meanies from Outer Space" to the Commodore 64.


## Coding standard:
(Henry Simpson - Serious Programming with the Commodore 64) 

1. REMarks liberally - identify the modules and make sure to have enough REMarks to tell a story.
In the CBM prg Studio, setup the !-- for the comments.

2. One program statement per line.  Simple elegant style!

3. Compress the progam in CBM prg Studio to optimize and save space.
Options->BASIC Code Generation - Remove REM statement, uncheck remote spaces

With code optimize from 'Commodore 64 Exposed' and 'Fredrik Ramsberg'
https://www.microheaven.com/FastC64Basic/tips.html


## Architecture 

* Startup (Line 0) GOTO 8000
* Subroutines (Lines 1-8999)
* Setup Routines (Lines 8000-8999)
* Main program (Lines 9000-63999)


## Scrum tracking
https://trello.com/invite/b/67fac28a43728da9bc768459/ATTIb784a56d634b4fa16facf26947309c3fA25E5072/blue-meanies-from-output-space64



#BASIC compiler
Tested with MoSpeed BASIC compiler:
https://www.c64-wiki.com/wiki/MOSpeed
https://github.com/EgonOlsen71/basicv2


##Batch file:  (move vars to $9000 after the Screen and custom chars, to give more room for program)
C:
Cd c:\PixelMan\basicv2-master\dist
call mospeed.cmd "C:\PixelMan\source\c64Blue Meanie 64\bluemeanie64.prg" -vice=C:\PixelMan\GTK3VICE-3.8-win64\bin\x64sc.exe /compactlevel=5 /varstart=$9000
Cd c:\PixelMan



mospeed.cmd "C:\PixelMan\source\c64Blue Meanie 64\bluemeanie64.prg" -vice=C:\PixelMan\GTK3VICE-3.8-win64\bin\x64sc.exe /compactlevel=5 /varstart=$9000 /target="C:\PixelMan\source\c64Blue Meanie 64\+bluemeanie64.prg"






## Commodore 64 VICII -Banks
VIC chip can access 16k at a time, controlled by 53272. 
So this is in 4 different banks:

0 = $0000-$3FFF (default)
1 = $4000-$7FFF
2 = $8000-$BFFF 
3 = $C000-$FFFF


## Thanks
Thanks to my family for all the support and Special thanks to Erich, Jeff, Fred and so many more for getting me back into the Commodore 64!


* [Green Pixel Retro lab](https://greenpixelretrolab.com)

Have fun exploring the world of retro computer!



## Credits

Developed from the original game: 
'Blue Meanies from outer space' for the VIC20 - Duane Later, (C)1981 Commodore Business Machines, Inc.

