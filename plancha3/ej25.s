.data
.align 16
a: .float 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1
.align 16
b: .float 0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2
len: .long 11

# Cuando hice este codigo solo dios y yo sabiamos que hacia
# Ahora solo dios lo sabe
# Suerte

.text

# sum : %rdi : $a, %rsi: $b, %dl  : len
sum_simd: 
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	pushq %rbx

	movq $a, %rbx
	xorq %r10, %r10 # r10 = 0
	xorq %r11, %r11 # Var auxiliar
	xorq %rax, %rax

	# len / 4 ; al = len / 4. dl = resto(len/4)
	movq %rdx, %rax
	xorq %rdx, %rdx
	movq $4, %r11
	divq %r11
	movl %eax, -4(%rbp) # len/4
	movl %edx, -8(%rbp) # resto
	
	movq $16, %r11
	
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	cmpl $0, -4(%rbp)
	je .loop_scalar
	.loop_packet:
		
		movq %r10, %rax
		mulq %r11
		
		movaps (%rdi, %rax), %xmm1
		movaps (%rsi,%rax), %xmm2
		addps %xmm2, %xmm1
		movaps %xmm1, a(%rax)
		incq %r10
		cmpl -4(%rbp), %r10d 
	jne .loop_packet
	
	movq %r10, %rax
	mulq %r11
	xorq %rcx, %rcx # Contador de 0 a resto
	.loop_scalar:
		movss (%rdi,%rax), %xmm1
		movss (%rsi,%rax), %xmm2
		addss %xmm2, %xmm1
		movss %xmm1, (%rbx,%rax)
		addq $4, %rax
		incq %rcx
		cmpl -8(%rbp), %ecx
	jne .loop_scalar

	popq %rbx
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
	movl len, %edx

	call sum_simd

	movq %rbp, %rsp
	popq %rbp
	ret

.section .note.GNU-stack
