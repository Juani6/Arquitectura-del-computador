.global fuerza_bruta

fuerza_bruta:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	
	xorq %rax, %rax

	movq %rdi, -8(%rbp) # S
	movq %rsi, -16(%rbp) # s
	movq %rdx, -24(%rbp) # lS
	movq %rcx, -32(%rbp) # ls
	movq %r12, -40(%rbp) # r12 calle saved
	movq %r13, -48(%rbp) # r13 calle saved
	
	xorq %r12, %r12 # Contador

	movq -24(%rbp), %r13
	subq -32(%rbp), %r13
	incq %r13 # Maximo de iteraciones

	.loop:
		movq -8(%rbp), %rdi
		addq %r12, %rdi

		movq -16(%rbp), %rsi
		movb (%rsi), %sil

		movq -24(%rbp), %rdx
		subq %r12, %rdx
		
		call busca
		movq %rax, -56(%rbp)

		movq -56(%rbp), %rdi # res
		movq -16(%rbp), %rsi # s
		movq -32(%rbp), %rdx # ls

		call compara

		cmpq $1, %rax
		je .posicion
		incq %r12

		cmpq %r12, %r13
		jne .loop

		movq $-1, %rax
		jmp .epilogo

	.posicion:
		movq -56(%rbp), %rax
		subq -8(%rbp), %rax
		jmp .epilogo
	

	.epilogo:
		movq -40(%rbp), %r12
		movq -48(%rbp), %r13
		movq %rbp, %rsp
		popq %rbp
		ret
.section .note.GNU-stack


