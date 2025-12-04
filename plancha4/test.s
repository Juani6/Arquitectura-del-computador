.text

.global main
main:
	eor r7, r7
	
	mov r7, #0x8, asr #23

	bx lr