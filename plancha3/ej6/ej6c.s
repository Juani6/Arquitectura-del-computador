# .global text
# .text:

.global main
main:
	movl $0xFFFFFF00, %ebx
	movl $-1, %eax
	andl %ebx, %eax
	ret