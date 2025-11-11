.data
a: .float 1.0, 2.0, 3.0, 4.0, 5.0
str: .asciz "Suma : %f\nPromedio : %f\n"

.text
suma:
	pushq %rbp
	movq %rsp, %rbp
	pushq %r12
	xorq %r12, %r12
	xorps %xmm1, %xmm1 
	
	.loop:
	movss (%rdi, %r12, 4), %xmm0
	addss %xmm0, %xmm1
	incq %r12
	cmpb %sil, %r12b
	jne .loop

	cvtsi2ss %rsi, %xmm2
	movss %xmm1, %xmm0
	divss %xmm2, %xmm1

	movl $2, %eax
	cvtss2sd %xmm0, %xmm0
	cvtss2sd %xmm1, %xmm1
	leaq str, %rdi

	call printf

	xorl %eax, %eax

	movq %rbp, %rsp
	popq %rbp
	ret


.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	leaq a, %rdi
	movq $5, %rsi

	call suma

	popq %r12
	movq %rbp, %rsp
	popq %rbp
	ret

.section .note.GNU-stack
