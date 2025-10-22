.global text
text: 
N1: .byte 100
N2: .byte 120
N3: .byte -63
N4: .byte -56
N5: .byte -91

.global main
main:
	movb N5, %al
	movb N2, %bl
	subb %bl, %al
	ret

