.data
a: .float 0.1, 0.2, 0.3
b: .float 0.5, 0.6, 0.7
len: .byte 3


.text

# sum : %rdi : $a, %rsi: $b, %dl  : len
sum: 
	pushq %rbp
	movq %rsp, %rbp

	xorq %r10, %r10
	xorps %xmm0, %xmm0

	.loop:
		movss (%rdi, %r10,4), %xmm1
		movss (%rsi, %r10,4), %xmm2
		addss %xmm2, %xmm1
		movss %xmm1, a(,%r10,4)
		incq %r10
		cmpb %r10b, %dl
		jne .loop


	movq %rbp, %rsp
	popq %rbp
	ret

.global main
main:
	pushq %rbp
	movq %rsp, %rbp
	
	xorq %rdx, %rdx

	movq $a, %rdi
	movq $b, %rsi
	movb len, %dl

	call sum

	movq %rbp, %rsp
	popq %rbp
	ret

.section .note.GNU-stack
