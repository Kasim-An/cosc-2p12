        .orig   x3000
	and     r1,r1,0
	and	r4,r4,0
	lea     r0,prompt 
	puts
loop:
	getc
	putc
	add		r4,r4,#1
	ld		r7,nlcomp  ; check for 
	add		r7,r7,r0   ; end of line
	brz finish
	st  r0,lets
	br      loop

finish
	lea r0,lets
	puts
	halt

lets:  .blkw   20  
place:	.blkw	20 
prompt: .stringz "Emter String"
nlcomp  .fill   xfff6        
.end