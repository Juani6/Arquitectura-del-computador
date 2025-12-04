.text

.global campesino_ruso
campesino_ruso: @ Recibe r0 y r1
	push {lr}
	sub sp, #8
	
	eor r2, r2
	str r2, [sp, #4] @ uint32 res = 0

	eor r3, r3 @ j auxiliar
bucle:
	CMP r1, #1 @ j > 1 
	tst r1, #1 @ Chequea si el bit 0 es 1
	
	@EQ : Equal
	addEQ r2, r0
	subEQ r1, #1
	@NE : Not Equal
	movNE r0, r0, lsl #1 @ lsl r0, r0, #2 analogo
	movNE r1, r1, lsr #1

	CMP r1, #1 @ j > 1 
	bHI bucle @ si j > 1 va al bucle

	add r0, r2, r0
	
	add sp, #8
	pop {lr}
	bx lr

.section .note.GNU-stack
