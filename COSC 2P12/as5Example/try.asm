        .orig   x3000
loop:	
	and	r1,r1,0
	and	r2,r2,0
	and	r4,r4,0
	lea	r0,input
	ld	r5,b
	puts
	TRAP	xFB
	brz	end
	add	r7,r0,0
	brn	negative
	add	r7,r0,0
	brp	positive
display:
	lea	r0,cou
	puts			;out the data
	and	r0,r0,0
	add	r0,r1,0
	TRAP	XFC
;	brnzp	innerloop
	lea	r0,n
	puts			;out the actual data
	and	r1,r1,0
	and	r2,r2,0
	br	loop
displayhex:
	lea	r0,cou
	puts			;out the data
	and	r0,r0,0
	add	r0,r1,0
	puts
;	brnzp	innerloop
	lea	r0,n
	puts			;out the actual data
	and	r1,r1,0
	and	r2,r2,0
	and	r0,r0,0
	br	loop

;innerloop:
;	brnzp	load
;	puts
;	add	r4,r4,-1
;	brp	innerloop
positive:
        add     r7,r7,#-16   ; subtract 16
        brn     remainp     ; if result<0 done
        add     r2,r2,1    ; increment quotient
        br      positive       ; repeat
remainp:
        add     r1,r7,r5   ; add to get remdr
;	add	r4,r4,1
	add	r3,r1,-10
	brn	display		;sssssssssssshould be store
;	add	r3,r3,0
	brzp	convert
	add	r2,r2,-16
	brzp	change
	add	r2,r2,0
	brn	display
change:
	and	r7,r7,0
	add	r7,r7,r2
	brnzp	positive
negative:
        add     r7,r7,r5   ; 
        brp     remainn     ; 
        add     r2,r2,1    ; increment quotient
        br      negative       ; repeat
remainn:
        add     r1,r7,-16   ; add to get remdr
	add	r4,r4,1
	add	r3,r1,-10
	brn	display			;display
	brnzp	convert
convert:			;change to hex
	and	r3,r3,0		;r3 is to check the hex ABCDEF
	add	r3,r1,-10
	brz	XA
	add	r3,r1,-11
	brz	XB
	add	r3,r1,-12
	brz	XC
	add	r3,r1,-13
	brz	XD
	add	r3,r1,-14
	brz	XE
	add	r3,r1,-15
	brz	XF
	ret
XA:	
	Lea	r1,ASCIIA		;loar char into r1
	br	displayhex
XB:	
	lea	r1,ASCIIB
	br	displayhex
XC:	
	lea	r1,ASCIIC
	br	displayhex
XD:	
	lea	r1,ASCIID
	br	displayhex
XE:	
	lea	r1,ASCIIE
	br	displayhex
XF:	
	lea	r1,ASCIIF
	br	displayhex
;store:	
;	add	r6,r6,-4
;	add	r3,r4,-1
;	brz	sto1
;	add	r3,r4,-2
;	brz	sto2
;	add	r3,r4,-3
;	brz	sto3
;	add	r3,r4,-4
;	brz	sto4
;	ret
;load:	add	r3,r4,-1
;	brz	ld1
;	add	r3,r4,-2
;	brz	ld2
;	add	r3,r4,-3
;	brz	ld3
;	add	r3,r4,-4
;	brz	ld4
;	ret
;sto1:
;	str	r0,r6,3
;sto2:
;	str	r0,r6,2
;sto3:
;	str	r0,r6,1
;sto4:
;	str	r0,r6,0
;ld1:
;	ldr	r0,r6,3
;ld2:
;	ldr	r0,r6,2
;ld3:
;	ldr	r0,r6,1
;ld4:
;	ldr	r0,r6,0
				;store the data and print?
				;check the addback and ignore 4321?
				;problem in "out"

b:      .fill   16
n:	.stringz	"\n"
cou:	.stringz	"remainder is :"
input:	.stringz	"enter a number:"
quo:    .blkw   1
rem:    .blkw   1
ASCIIA:	.stringz	"A"	
ASCIIB:	.stringz	"B"
ASCIIC:	.stringz	"C"
ASCIID:	.stringz	"D"
ASCIIE:	.stringz	"E"
ASCIIF:	.stringz	"F"
end	halt
        .end