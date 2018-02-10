 set tv 
 x=75 : y =75

main

 COLUP0 = $40
 COLUP1 = $40
 COLUBK = $0E
 f=f+1

 if f = 30 then f = 0
 if f < 10 then gosub frame1
 if f > 10 && f < 20 then gosub frame2
 if f > 20 && f < 30 then gosub frame3
 drawscreen
 player1x=x :  player1y=y
 if joy0right then x=x+1 : REFP1 = 0
 if joy0left then x=x-1 : REFP1 = 8
 if joy0up then y=y-1
 if joy0down then y=y+1
 goto main

frame1
 player1:
 %00000000
 %00000000
 %00000000
 %00000000
 %00010000
 %00000000
 %00000000
 %00000000
end
 return

frame2
 player1:
 %00000000
 %00000000
 %00100100
 %00011000
 %00011000
 %00100100
 %00000000
 %00000000
end
 return

frame3
 player1:
 %10000001
 %01000010
 %00100100
 %00011000
 %00011000
 %00100100
 %01000010
 %10000001
end
 return
