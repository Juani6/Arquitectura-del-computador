.text
.global potDos
potDos:
	@ Recibo i en R0
	@ Queremos chequear si esta entre 0 y 31
	mov r1, #1
	CMP r0, #0
	mvnLT r0, #0
	bLT epilogo
	CMP r0, #31
	movLE r0, r1, lsl r0
	epilogo:
	bx lr 
.section .note.GNU-stack

