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
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
 endif
	.byte %10101010, %01010101
	if (pfwidth>2)
	.byte %10101010, %00000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %00000000
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
;.a.  0.
.L011 ;  def a  =  0

;.b.  0.
.L012 ;  def b  =  0

.L013 ;  player0x = 50 : player0y = 50

