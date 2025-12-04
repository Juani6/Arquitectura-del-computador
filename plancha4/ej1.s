
.data 

array: .word 0x00000000, 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777, 0x88888888, 0x99999999
@ 								0-3 						4-7 			8-11 			12-15 			16-19			 20-23,				24-27
.text
.global main

@ x = r0 y y=r1
main: 
	push {lr} @ Guardamos el instruction pointer en la pila
	sub sp, sp, #12
	@ r2 = &array
	ldr r2, =array
	@ r0 = arr[7]
	ldr r0, [r2, #28]
	@ x = arr[7]
	str r0, [sp, #8] @ guardo r0 en el espacio de memoria sp+8
	@ r1 = 1 (lo invente yo)
	mov r1, #1
	@ y = 1
	str r1, [sp, #4]
	@ r0 = arr[7] + y
	add r0, r1
	@ x = r0
	str r0, [r2, #28]
	@ Guardo el valor de arr[8]
	ldr r3, [r2,#36]
	add r3, r1
	str r3, [r2,#36]

	eor r0, r0
	add sp, sp, #12
	pop	{lr}
	bx	lr

.section .note.GNU-stack
