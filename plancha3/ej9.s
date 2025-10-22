.data 
a: .word -1
b: .byte 0xaa, 99
c: .float 1.5
str: .asciz "Hola Mundo\n" # 11 caracteres (11 chars = 11 bytes)

.text
.global main
main: 
	leaq a, %rdx
	movw a, %ax
	movb (b+1), %al
	movl str, %esi
	movl c, %edi
	movl %esi, (%rdx)
	ret