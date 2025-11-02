
.text
.global calculo2

# (1arg + 3arg + 4arg) * (7arg+8arg)
# (char + char + int) * (int + int)
# rdi + rdx + rcx * (pila16 + pila24)

calculo2: 
	pushq %rbp
	movq %rsp, %rbp

	xorl %eax, %eax
	
	addl %edi, %ecx
	addl %ecx, %edx # sil + dl + carry
	
	movl 16(%rbp), %eax
	addl 24(%rbp), %eax

	mull %edx

	movq %rbp, %rsp
	popq %rbp

	ret
