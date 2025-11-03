.data

format_error: .asciz "La cantidad de argumentos es insuficiente\n"
format_nerror: .asciz "Cantidad de argumentos : %d, suma de los argumentos : %d\n"

.text

.global main

# argc = %edi, %rsi = Direccion del primer elemento
main:

	pushq %rbp
	movq %rsp, %rbp

	xorl %eax, %eax
	cmpl $2, %edi
	jl error
	
	xorq %rcx, %rcx

	subq $16, %rsp
	movl $0, -4(%rbp)
	movq %rdi, -8(%rbp)
	subq $1, %rdi
	movl %edi, %ecx
	leaq 8(%rsi), %r12
	
	bucle:
		movq (%r12), %rdi
		pushq %rcx
		call atoi
		popq %rcx
		movq -4(%rbp), %rbx
		addl %eax, %ebx
		movl %ebx, -4(%rbp)
		addq $8, %r12
		loop bucle
	
	xorl %eax, %eax
	xorq %rdi, %rdi
	leaq format_nerror, %rdi
	movq -8(%rbp), %rsi
	movq -4(%rbp), %rdx
	call printf
	xorl %eax, %eax

	addq $16, %rsp
	jmp epilogo
	error:
		leaq format_error, %rdi
		call printf
		xorl %eax, %eax
		jmp epilogo

	epilogo:
		movq %rbp, %rsp
		popq %rbp
		ret
