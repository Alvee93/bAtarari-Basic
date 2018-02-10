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
.L013 ;  player0x = 50 : player0y = 50

	LDA #50
	STA player0x
	STA player0y
.L014 ;  player1x = 50  :  player1y = 20

	LDA #50
	STA player1x
	LDA #20
	STA player1y
.L015 ;  missile0height = 4 : missile0y = 255

	LDA #4
	STA missile0height
	LDA #255
	STA missile0y
.L016 ;  missile1height = 4 : missile1y = 255

	LDA #4
	STA missile1height
	LDA #255
	STA missile1y
.L017 ;  NUSIZ0 = 16

	LDA #16
	STA NUSIZ0
.L018 ;  NUSIZ1 = 16

	LDA #16
	STA NUSIZ1
.
 ; 

.L019 ;  score  =  10000

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

.L020 ;  player0:

	LDX #<playerL020_0
	STX player0pointerlo
	LDA #>playerL020_0
	STA player0pointerhi
	LDA #7
	STA player0height
.
 ; 

.L021 ;  player1:

	LDX #<playerL021_1
	STX player1pointerlo
	LDA #>playerL021_1
	STA player1pointerhi
	LDA #7
	STA player1height
.
 ; 

.L022 ;  if b = 1 then b = b + 1  :  player1:

	LDA b
	CMP #1
     BNE .skipL022
.condpart0
	INC b
	LDX #<player0then_1
	STX player1pointerlo
	LDA #>player0then_1
	STA player1pointerhi
	LDA #10
	STA player1height
.skipL022
.L023 ;  if b = 2 then b = 0  :  player1:

	LDA b
	CMP #2
     BNE .skipL023
.condpart1
	LDA #0
	STA b
	LDX #<player1then_1
	STX player1pointerlo
	LDA #>player1then_1
	STA player1pointerhi
	LDA #8
	STA player1height
.skipL023
.
 ; 

.
 ; 

.
 ; 

.L024 ;  if missile0y > 240 then goto skip

	LDA #240
	CMP missile0y
     BCS .skipL024
.condpart2
 jmp .skip

.skipL024
.L025 ;  missile0y = missile0y - 2 :  goto draw_loop

	LDA missile0y
	SEC
	SBC #2
	STA missile0y
 jmp .draw_loop

.skip
 ; skip

.L026 ;  if joy0fire then missile0y = player0y - 5  :  missile0x = player0x + 4

 bit INPT4
	BMI .skipL026
.condpart3
	LDA player0y
	SEC
	SBC #5
	STA missile0y
	LDA player0x
	CLC
	ADC #4
	STA missile0x
.skipL026
.
 ; 

.L027 ;  joy1fire  :  missile1y = player1y - 5  :  missile1x = player1x + 4

