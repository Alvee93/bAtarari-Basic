game
.L00 ;  rem Generated 03-Feb-18 8:48:19 PM by Visual bB Version 1.0.0.568

.L01 ;  rem **********************************

.L02 ;  rem *<filename>                      *

.L03 ;  rem *<description>                   *

.L04 ;  rem *<author>                        *

.L05 ;  rem *<contact info>                  *

.L06 ;  rem *<license>                       *

.L07 ;  rem **********************************

.
 ; 

.L08 ;  playfield:

  ifconst pfres
	  ldx #(11>pfres)*(pfres*pfwidth-1)+(11<=pfres)*43
  else
	  ldx #((11*pfwidth-1)*((11*pfwidth-1)<47))+(47*((11*pfwidth-1)>=47))
  endif
	jmp pflabel0
PF_data0
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111110, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000010, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %10101010, %01010101
	if (pfwidth>2)
	.byte %10101010, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000010, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000010, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000010, %00000000
 endif
	.byte %10000000, %00000000
	if (pfwidth>2)
	.byte %00000010, %00000000
 endif
	.byte %11111111, %11111111
	if (pfwidth>2)
	.byte %11111110, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
pflabel0
	lda PF_data0,x
	sta playfield,x
	dex
	bpl pflabel0
.
 ; 

.L09 ;  COLUBK  =  $9C

	LDA #$9C
	STA COLUBK
.L010 ;  COLUPF  =  50

	LDA #50
	STA COLUPF
.L011 ;  a = 1

	LDA #1
	STA a
.L012 ;  b = 0

	LDA #0
	STA b
.L013 ;  c = 0

	LDA #0
	STA c
.L014 ;  x = 0

	LDA #0
	STA x
.L015 ;  player0x = 50 : player0y = 50

	LDA #50
	STA player0x
	STA player0y
.L016 ;  player1x = 52  :  player1y = 20

	LDA #52
	STA player1x
	LDA #20
	STA player1y
.L017 ;  missile0height = 4  :  missile0y = 255

	LDA #4
	STA missile0height
	LDA #255
	STA missile0y
.L018 ;  missile1height = 4  :  missile1y = 255

	LDA #4
	STA missile1height
	LDA #255
	STA missile1y
.L019 ;  NUSIZ0 = 16

	LDA #16
	STA NUSIZ0
.L020 ;  NUSIZ1 = 16

	LDA #16
	STA NUSIZ1
.
 ; 

.L021 ;  score  =  10000

	LDA #$00
	STA score+2
	LDA #$00
	STA score+1
	LDA #$01
	STA score
.
 ; 

.sprites
 ; sprites

.
 ; 

.L022 ;  player0:

	LDX #<playerL022_0
	STX player0pointerlo
	LDA #>playerL022_0
	STA player0pointerhi
	LDA #7
	STA player0height
.
 ; 

.L023 ;  if c = 1 then c = c + 1  :  player0:

	LDA c
	CMP #1
     BNE .skipL023
.condpart0
	INC c
	LDX #<player0then_0
	STX player0pointerlo
	LDA #>player0then_0
	STA player0pointerhi
	LDA #7
	STA player0height
.skipL023
.L024 ;  if c = 2 then c = c + 1  :  player0:

	LDA c
	CMP #2
     BNE .skipL024
.condpart1
	INC c
	LDX #<player1then_0
	STX player0pointerlo
	LDA #>player1then_0
	STA player0pointerhi
	LDA #8
	STA player0height
.skipL024
.L025 ;  if c = 3 then c = 0  :  player0:

	LDA c
	CMP #3
     BNE .skipL025
.condpart2
	LDA #0
	STA c
	LDX #<player2then_0
	STX player0pointerlo
	LDA #>player2then_0
	STA player0pointerhi
	LDA #8
	STA player0height
.skipL025
.
 ; 

.
 ; 

.L026 ;  player1:

	LDX #<playerL026_1
	STX player1pointerlo
	LDA #>playerL026_1
	STA player1pointerhi
	LDA #7
	STA player1height
.
 ; 

.L027 ;  if b = 1 then b = b + 1  :  player1:

	LDA b
	CMP #1
     BNE .skipL027
.condpart3
	INC b
	LDX #<player3then_1
	STX player1pointerlo
	LDA #>player3then_1
	STA player1pointerhi
	LDA #7
	STA player1height
.skipL027
.L028 ;  if b = 2 then b = b + 1  :  player1:

	LDA b
	CMP #2
     BNE .skipL028
.condpart4
	INC b
	LDX #<player4then_1
	STX player1pointerlo
	LDA #>player4then_1
	STA player1pointerhi
	LDA #8
	STA player1height
.skipL028
.L029 ;  if b = 3 then b = 0  :  player1:

	LDA b
	CMP #3
     BNE .skipL029
.condpart5
	LDA #0
	STA b
	LDX #<player5then_1
	STX player1pointerlo
	LDA #>player5then_1
	STA player1pointerhi
	LDA #8
	STA player1height
.skipL029
.
 ; 

.L030 ;  if missile0y > 240 then goto skip

	LDA #240
	CMP missile0y
     BCS .skipL030
.condpart6
 jmp .skip

.skipL030
.L031 ;  missile0y = missile0y - 2

	LDA missile0y
	SEC
	SBC #2
	STA missile0y
.skip
 ; skip

.L032 ;  if joy0fire then missile0y = player0y - 5  :  missile0x = player0x + 4

 bit INPT4
	BMI .skipL032
.condpart7
	LDA player0y
	SEC
	SBC #5
	STA missile0y
	LDA player0x
	CLC
	ADC #4
	STA missile0x
.skipL032
.
 ; 

.L033 ;  if missile1y > 240 then goto skipy

	LDA #240
	CMP missile1y
     BCS .skipL033
.condpart8
 jmp .skipy

.skipL033
.L034 ;  missile1y = missile1y + 2

	LDA missile1y
	CLC
	ADC #2
	STA missile1y
.skipy
 ; skipy

.L035 ;  if player1x = player0x then missile1y = player1y - 2  :  missile1x = player1x + 2

	LDA player1x
	CMP player0x
     BNE .skipL035
.condpart9
	LDA player1y
	SEC
	SBC #2
	STA missile1y
	LDA player1x
	CLC
	ADC #2
	STA missile1x
.skipL035
.
 ; 

.draw_loop
 ; draw_loop

.L036 ;  COLUP1  =  $60

	LDA #$60
	STA COLUP1
.L037 ;  COLUP0  =  $50

	LDA #$50
	STA COLUP0
.
 ; 

.L038 ;  drawscreen

 jsr drawscreen
.L039 ;  if collision(player1,playfield)  &&  player1x > 70 then a =  - 1

	bit 	CXP1FB
	BPL .skipL039
.condpart10
	LDA #70
	CMP player1x
     BCS .skip10then
.condpart11
	LDA #255
	STA a
.skip10then
.skipL039
.L040 ;  if collision(player1,playfield)  &&  player1x < 71 then a = 1

	bit 	CXP1FB
	BPL .skipL040
.condpart12
	LDA player1x
	CMP #71
     BCS .skip12then
.condpart13
	LDA #1
	STA a
.skip12then
.skipL040
.L041 ;  player1x = player1x + a

	LDA player1x
	CLC
	ADC a
	STA player1x
.
 ; 

.L042 ;  if collision(missile0,player1) then score = score + 1 :  player1x = player1x - 10  :  b = 1

	bit 	CXM0P
	BPL .skipL042
.condpart14
	SED
	CLC
	LDA score+2
	ADC #$01
	STA score+2
	LDA score+1
	ADC #$00
	STA score+1
	LDA score
	ADC #$00
	STA score
	CLD
	LDA player1x
	SEC
	SBC #10
	STA player1x
	LDA #1
	STA b
.skipL042
.L043 ;  if collision(missile1,player0) then score = score - 1 :  player0x = player0x - 10  :  c = 1

	bit 	CXM1P
	BPL .skipL043
.condpart15
	SED
	SEC
	LDA score+2
	SBC #$01
	STA score+2
	LDA score+1
	SBC #$00
	STA score+1
	LDA score
	SBC #$00
	STA score
	CLD
	LDA player0x
	SEC
	SBC #10
	STA player0x
	LDA #1
	STA c
.skipL043
.
 ; 

.L044 ;  if joy0left then player0x = player0x - 1 : goto jump

 bit SWCHA
	BVS .skipL044
.condpart16
	DEC player0x
 jmp .jump

.skipL044
.L045 ;  if joy0right then player0x = player0x + 1 : goto jump

 bit SWCHA
	BMI .skipL045
.condpart17
	INC player0x
 jmp .jump

.skipL045
.L046 ;  if joy0up then player0y = player0y - 1 : goto jump

 lda #$10
 bit SWCHA
	BNE .skipL046
.condpart18
	DEC player0y
 jmp .jump

.skipL046
.L047 ;  if joy0down then player0y = player0y + 1 : goto jump

 lda #$20
 bit SWCHA
	BNE .skipL047
.condpart19
	INC player0y
 jmp .jump

.skipL047
.
 ; 

.jump
 ; jump

.L048 ;  if player0x < 21 then player0x = 25

	LDA player0x
	CMP #21
     BCS .skipL048
.condpart20
	LDA #25
	STA player0x
.skipL048
.L049 ;  if player0x > 97 then player0x = 92

	LDA #97
	CMP player0x
     BCS .skipL049
.condpart21
	LDA #92
	STA player0x
.skipL049
.L050 ;  if player0y > 64 then player0y = 60

	LDA #64
	CMP player0y
     BCS .skipL050
.condpart22
	LDA #60
	STA player0y
.skipL050
.L051 ;  if player0y < 40 then player0y = 45

	LDA player0y
	CMP #40
     BCS .skipL051
.condpart23
	LDA #45
	STA player0y
.skipL051
.
 ; 

.L052 ;  goto sprites

 jmp .sprites

 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL022_0
	.byte  %10011001
	.byte  %10011001
	.byte  %11111111
	.byte  %00111100
	.byte  %11111111
	.byte  %01111110
	.byte  %00100100
	.byte  %10011001
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player0then_0
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00011000
	.byte  %00011000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+8))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player1then_0
	.byte 
	.byte  %00000000
	.byte  %00000000
	.byte  %00100100
	.byte  %00011000
	.byte  %00011000
	.byte  %00100100
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+8))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player2then_0
	.byte 
	.byte  %10000001
	.byte  %01000010
	.byte  %00100100
	.byte  %00011000
	.byte  %00011000
	.byte  %00100100
	.byte  %01000010
	.byte  %10000001
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL026_1
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00011000
	.byte  %00111100
	.byte  %01011010
	.byte  %11111111
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player3then_1
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00011000
	.byte  %00011000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+8))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player4then_1
	.byte 
	.byte  %00000000
	.byte  %00000000
	.byte  %00100100
	.byte  %00011000
	.byte  %00011000
	.byte  %00100100
	.byte  %00000000
	.byte  %00000000
 if (<*) > (<(*+8))
	repeat ($100-<*)
	.byte 0
	repend
	endif
player5then_1
	.byte 
	.byte  %00000000
	.byte  %01000010
	.byte  %00100100
	.byte  %00011000
	.byte  %00011000
	.byte  %00100100
	.byte  %01000010
	.byte  %00000000
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left")
 endif 
ECHOFIRST = 1
 
 
 
