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
 b=0
 c=0
 x=0
 player0x=50:player0y=50
 player1x=52 : player1y=20
 missile0height=4 : missile0y=255
 missile1height=4 : missile1y=255
 NUSIZ0=16
 NUSIZ1=16

 score = 10000

sprites

 player0:
 %10011001
 %10011001
 %11111111
 %00111100
 %11111111
 %01111110
 %00100100
 %10011001
end

 if c=1 then c=c+1 : player0:
 %00000000
 %00000000
 %00000000
 %00011000
 %00011000
 %00000000
 %00000000
 %00000000
end
 if c=2 then c=c+1 : player0:

 %00000000
 %00000000
 %00100100
 %00011000
 %00011000
 %00100100
 %00000000
 %00000000
end
 if c=3 then c=0 : player0:

 %10000001
 %01000010
 %00100100
 %00011000
 %00011000
 %00100100
 %01000010
 %10000001
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

 if b=1 then b=b+1 : player1:
 %00000000
 %00000000
 %00000000
 %00011000
 %00011000
 %00000000
 %00000000
 %00000000
end
 if b=2 then b=b+1 : player1:

 %00000000
 %00000000
 %00100100
 %00011000
 %00011000
 %00100100
 %00000000
 %00000000
end
 if b=3 then b=0 : player1:

 %00000000
 %01000010
 %00100100
 %00011000
 %00011000
 %00100100
 %01000010
 %00000000
end

 if missile0y>240 then goto skip
 missile0y=missile0y-2 
skip
 if joy0fire then missile0y=player0y-5 : missile0x=player0x+4

 if missile1y>240 then goto skipy
 missile1y=missile1y+2
skipy
 if player1x=player0x then missile1y=player1y-2 : missile1x=player1x+2
 
draw_loop
 COLUP1 = $60
 COLUP0 = $50

 drawscreen
 if collision(player1, playfield) && player1x>70 then a=-1
 if collision(player1, playfield) && player1x<71 then a=1
 player1x=player1x+a
 
 if collision(missile0, player1) then score=score+1: player1x=player1x-10 : b=1
 if collision(missile1, player0) then score=score-1: player0x=player0x-10 : c=1

 if joy0left then player0x=player0x-1:goto jump
 if joy0right then player0x=player0x+1:goto jump
 if joy0up then player0y=player0y-1:goto jump
 if joy0down then player0y=player0y+1:goto jump

jump
 if player0x<21 then player0x=25
 if player0x>97 then player0x=92
 if player0y>64 then player0y=60
 if player0y<40 then player0y=45

 goto sprites
