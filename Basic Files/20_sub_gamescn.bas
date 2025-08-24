!-- ****************************************
!-- *      BLUE MEANIES - GAME SCREEN
!-- *  displays the game screen
!-- ****************************************
!--
2000 REM dim r2$( 26)
!-- Game Scene *****************************
2020 r2$(1) = "{reverse on}{green}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2030 r2$(2) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2040 r2$(3) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2050 r2$(4) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2060 r2$(5) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{reverse off}{white}q{cm q}{123}                          {123}{cm w}e{reverse on}{green}{sh space}{sh space}{sh space}{sh space}"
2070 r2$(6) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2080 r2$(7) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2090 r2$(8) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2100 r2$(9) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2110 r2$(10) ="{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{reverse off}{white}a{cm q}{123}                          {123}{cm w}d{reverse on}{green}{sh space}{sh space}{sh space}{sh space}"
2120 r2$(11) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2130 r2$(12) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2140 r2$(13) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2150 r2$(14) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2160 r2$(15) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{reverse off}{white}z{cm q}{123}                          {123}{cm w}c{reverse on}{green}{sh space}{sh space}{sh space}{sh space}"
2170 r2$(16) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2180 r2$(17) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2190 r2$(18) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2200 r2$(19) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{reverse off}                              {reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}"
2210 r2$(20) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}"
2220 r2$(21) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}"
2230 r2$(22) = "{reverse off}{reverse on}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}{sh space}"
2240 r2$(23) = "{reverse off}     {light blue}energy=                            "
2250 r2$(24) = "                      {yellow}good hit          "
2260 r2$(25) = "     {purple}score =    "

!-- Set border=green, background=black
2270 POKE 53280,0: POKE 53281,0 
!-- **************** Turn off screen during loading
2275 POKE 53265,PEEK(53265) AND 239
!-- Clear screen
2280 PRINT CHR$(147)

!-- Loop the array to print screen
2285 FOR I=1 TO 25
2290    PRINT r2$(I);
2295 NEXT I
!-- **************** Turn Screen back on
2300 POKE 53265,PEEK(53265) OR 16
2310 return 
