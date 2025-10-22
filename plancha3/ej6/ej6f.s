# .global text
# .text:

.global main
main:
	movl $-1, %eax
	movl $1, %ebx
	sall $8, %ebx
	xorl $0xFFFFFFFF, %ebx
	andl %ebx, %eax
	ret
