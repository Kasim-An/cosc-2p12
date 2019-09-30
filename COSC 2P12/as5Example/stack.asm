sub_x	add	r6,r6,3
	str	r0,r6,2
	str	r1,r6,1
	str	r7,r6,0
	jsr	sub_x
	ldr	r0,r6,2
	ldr	r1,r6,2
	ldr	r7,r6,2
	add	r6,r6,3
	ret