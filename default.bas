 rem Generated 03-Feb-18 8:48:19 PM by Visual bB Version 1.0.0.568
 rem **********************************
 rem *<filename>                      *
 rem *<description>                   *
 rem *<author>                        *
 rem *<contact info>                  *
 rem *<license>                       *
 rem **********************************
 
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXX.........
 X.....................X.........
 ................................
 X.X.X.X.X.X.X.X.X.X.X.X.........
 X.....................X.........
 X.....................X.........
 X.....................X.........
 X.....................X.........
 XXXXXXXXXXXXXXXXXXXXXXX.........
 ................................
 ................................
end

 COLUBK = $9C
 COLUPF = 50
 a=1
 player0x=50:player0y=50
 player1x=50 : player1y=20
 missile0height=4:missile0y=255
 NUSIZ0=16

 score = 10000

sprites

 player0:
 %11111111
 %10000001
 %11000011
 %01111110
 %01111110
 %01000010
 %01111110
 %00011000
end

 player1:
 %00000000
 %00000000
 %00000000
 %00000000
 %00011000
 %00111100
 %01011010
 %11111111
end

 if missile0y>240 then goto skip
 missile0y=missile0y-2:goto draw_loop
skip
 if joy0fire then missile0y=player0y-5 : missile0x=player0x+4

draw_loop
 drawscreen
 if collision(player1, playfield) && player1x>70 then a=-1
 if collision(player1, playfield) && player1x<71 then a=1
 player1x=player1x+a
 
 if collision(missile0, player1) then score=score+1:player1x=player1x-10

 if joy0left then player0x=player0x-1:goto jump
 if joy0right then player0x=player0x+1:goto jump
 if joy0up then player0y=player0y-1:goto jump
 if joy0down then player0y=player0y+1:goto jump

jump
 if player0x<21 then score=score-1:player0x=25
 if player0x>97 then score=score-1:player0x=92
 if player0y>64 then score=score-1:player0y=60
 if player0y<40 then score=score-1:player0y=45

 goto sprites
