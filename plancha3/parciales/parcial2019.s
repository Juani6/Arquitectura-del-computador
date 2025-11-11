.data
a: .long 0xffff
f: .long 0xbeef
str: .asciz "%d\n"

.text
.global main
main:
	movl a, %eax
	addl f, %eax
	movl $2, %ebx
	imull %ebx
	movl $1, %eax
	imull $-1, %eax
	cltq
	leal 8(%eax), %eax
	pushq %rax
	ret

	