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
.L012 ;  player0x = 50 : player0y = 50

	LDA #50
	STA player0x
	STA player0y
.L013 ;  player1x = 50  :  player1y = 20

	LDA #50
	STA player1x
	LDA #20
	STA player1y
.L014 ;  missile0height = 4 : missile0y = 255

	LDA #4
	STA missile0height
	LDA #255
	STA missile0y
.L015 ;  NUSIZ0 = 16

	LDA #16
	STA NUSIZ0
.
 ; 

.L016 ;  score  =  10000

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

.L017 ;  player0:

	LDX #<playerL017_0
	STX player0pointerlo
	LDA #>playerL017_0
	STA player0pointerhi
	LDA #7
	STA player0height
.
 ; 

.L018 ;  player1:

	LDX #<playerL018_1
	STX player1pointerlo
	LDA #>playerL018_1
	STA player1pointerhi
	LDA #7
	STA player1height
.
 ; 

.L019 ;  if missile0y > 240 then goto skip

	LDA #240
	CMP missile0y
     BCS .skipL019
.condpart0
 jmp .skip

.skipL019
.L020 ;  missile0y = missile0y - 2 : goto draw_loop

	LDA missile0y
	SEC
	SBC #2
	STA missile0y
 jmp .draw_loop

.skip
 ; skip

.L021 ;  if joy0fire then missile0y = player0y - 5  :  missile0x = player0x + 4

 bit INPT4
	BMI .skipL021
.condpart1
	LDA player0y
	SEC
	SBC #5
	STA missile0y
	LDA player0x
	CLC
	ADC #4
	STA missile0x
.skipL021
.
 ; 

.draw_loop
 ; draw_loop

.L022 ;  drawscreen

 jsr drawscreen
.L023 ;  if collision(player1,playfield)  &&  player1x > 70 then a =  - 1

	bit 	CXP1FB
	BPL .skipL023
.condpart2
	LDA #70
	CMP player1x
     BCS .skip2then
.condpart3
	LDA #255
	STA a
.skip2then
.skipL023
.L024 ;  if collision(player1,playfield)  &&  player1x < 71 then a = 1

	bit 	CXP1FB
	BPL .skipL024
.condpart4
	LDA player1x
	CMP #71
     BCS .skip4then
.condpart5
	LDA #1
	STA a
.skip4then
.skipL024
.L025 ;  player1x = player1x + a

	LDA player1x
	CLC
	ADC a
	STA player1x
.
 ; 

.L026 ;  if collision(missile0,player1) then score = score + 1 : player1x = player1x - 10

	bit 	CXM0P
	BPL .skipL026
.condpart6
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
.skipL026
.
 ; 

.L027 ;  if joy0left then player0x = player0x - 1 : goto jump

 bit SWCHA
	BVS .skipL027
.condpart7
	DEC player0x
 jmp .jump

.skipL027
.L028 ;  if joy0right then player0x = player0x + 1 : goto jump

 bit SWCHA
	BMI .skipL028
.condpart8
	INC player0x
 jmp .jump

.skipL028
.L029 ;  if joy0up then player0y = player0y - 1 : goto jump

 lda #$10
 bit SWCHA
	BNE .skipL029
.condpart9
	DEC player0y
 jmp .jump

.skipL029
.L030 ;  if joy0down then player0y = player0y + 1 : goto jump

 lda #$20
 bit SWCHA
	BNE .skipL030
.condpart10
	INC player0y
 jmp .jump

.skipL030
.
 ; 

.jump
 ; jump

.L031 ;  if player0x < 21 then score = score - 1 : player0x = 25

	LDA player0x
	CMP #21
     BCS .skipL031
.condpart11
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
	LDA #25
	STA player0x
.skipL031
.L032 ;  if player0x > 97 then score = score - 1 : player0x = 92

	LDA #97
	CMP player0x
     BCS .skipL032
.condpart12
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
	LDA #92
	STA player0x
.skipL032
.L033 ;  if player0y > 64 then score = score - 1 : player0y = 60

	LDA #64
	CMP player0y
     BCS .skipL033
.condpart13
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
	LDA #60
	STA player0y
.skipL033
.L034 ;  if player0y < 40 then score = score - 1 : player0y = 45

	LDA player0y
	CMP #40
     BCS .skipL034
.condpart14
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
	LDA #45
	STA player0y
.skipL034
.
 ; 

.L035 ;  goto sprites

 jmp .sprites

 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL017_0
	.byte  %11111111
	.byte  %10000001
	.byte  %11000011
	.byte  %01111110
	.byte  %01111110
	.byte  %01000010
	.byte  %01111110
	.byte  %00011000
 if (<*) > (<(*+7))
	repeat ($100-<*)
	.byte 0
	repend
	endif
playerL018_1
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00000000
	.byte  %00011000
	.byte  %00111100
	.byte  %01011010
	.byte  %11111111
 if ECHOFIRST
       echo "    ",[(scoretable - *)]d , "bytes of ROM space left")
 endif 
ECHOFIRST = 1
 
 
 
