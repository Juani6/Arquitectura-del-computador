# .global text
# .text:

.global main
main:
	movl $1, %eax
	sall $31, %eax
	movl $1, %ebx
	sall $15, %ebx
	orl %ebx, %eax
	ret