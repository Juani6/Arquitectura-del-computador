.global main
main: 
	xorq %rax, %rax
	movl $-1, %eax
	movl $2, %ecx
	imull %ecx
	salq $32, %rax
	sarq $32, %rax

	xorq %rax, %rax
	movw $-1, %ax
	movw $2, %cx
	mulw %cx
	shlq $48, %rax
	shrq $48, %rax
	ret
