.data
format: .asciz "%ld\n"
format2: .asciz "%p\n"
i: .quad 0xDEADBEEF

.text
.global main
main:
	movq $format, %rdi
	movq $1234, %rsi
	xorq %rax, %rax
	call printf
	
	xorl %eax, %eax
	movq %rsp, %rsi
	movq $format, %rdi
	call printf

	xorl %eax, %eax
	movq format, %rbx
	movq %rbx, %rsi
	movq $format2, %rdi
	call printf

	xorl %eax, %eax
	movq %rsp, %rsi
	movq $format2, %rdi
	call printf

	xorl %eax, %eax
	movq 8(%rsp), %rsi
	movq $format2, %rdi
	call printf

	
	xorl %eax, %eax
	movq $i, %rsi
	movq $format2, %rdi
	call printf

	xorl %eax, %eax
	movq i, %rsi
	movq $format2, %rdi
	call printf

	ret

