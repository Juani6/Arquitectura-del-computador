# .global text
# .text:

.global main
main:
	movl $0xAA, %ebx
	movl $0xAA, %eax
	sall $23, %eax
	orl %ebx, %eax
	ret