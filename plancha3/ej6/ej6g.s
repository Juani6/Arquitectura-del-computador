# .global text
# .text:

.global main
main:
	movl $0, %eax
	subl $1, %eax
	ret
