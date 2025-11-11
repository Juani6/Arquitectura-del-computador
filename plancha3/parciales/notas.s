.data
str1: .asciz "Ingrese al menos una nota\n"
str2: .asciz "El promedio es %f\n"

.text
.global main

main:
	# rdi # cant args
	# rsi # Puntero al primer string
	pushq %rbp
	movq %rsp, %rbp
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15

	cmpq $1 , %rdi
	je .print1

	xorq %r12, %r12 # Contador
	decq %rdi 
	movq %rdi, %r13 # Limite
	movq %rsi, %r14 # Puntero a strings
	xorq %r15, %r15 # Acumulador
	
	xorpd %xmm0, %xmm0
	
	.bucle:
	movq 8(%r14,%r12,8), %rdi 
	call atoi

	addq %rax, %r15
	incq %r12
	cmpq %r13, %r12
	jne .bucle
	
	cvtsi2sd %r15, %xmm0
	cvtsi2sd %r13, %xmm1
	divsd %xmm1, %xmm0

	leaq str2, %rdi
	movq $1, %rax
	call printf
	xorq %rax, %rax
	jmp .epilogo

	.print1:
	leaq str1, %rdi
	call printf	
	movq $1, %rax
	jmp .epilogo

	.epilogo:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	movq %rbp, %rsp
	popq %rbp
	ret
.section .note.GNU-stack
