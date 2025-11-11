.data
format: .asciz "El resultado es %d\n"

.text

fact:
	pushq %rbp
	movq %rsp, %rbp

	xorq %rax, %rax
	cmpl $1, %edi
	je .CasoBase

	pushq %rdi
	decq %rdi
	call fact
	popq %rdi
	mull %edi
	jmp .Epilogo

.CasoBase:
	movl $1, %eax
.Epilogo:
	movq %rbp, %rsp
	popq %rbp
	ret

fact2:
	pushq %rbp
	movq %rsp, %rbp

	xorq %rax, %rax

	movl $1, -4(%rbp)
	cmpl $1, %edi
	jle .epilogo

	.loop:
		movl -4(%rbp), %eax
		imull %edi, %eax
		movl %eax, -4(%rbp)
		decl %edi
		cmpl $1, %edi
		jg .loop
	
	.epilogo:
		movl -4(%rbp), %eax
		movq %rbp, %rsp
		popq %rbp
		ret


.global main
main:
	push %rbp
	movq %rsp, %rbp

	xorq %rdi, %rdi
	movl $5, %edi
	call fact2

	xorq %rsi, %rsi
	movq %rax, %rsi
	xorq %rax, %rax

	movq $format, %rdi
	call printf	

	movq %rbp, %rsp
	popq %rbp

	ret

.section .note.GNU-stack
