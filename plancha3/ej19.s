.data

a: .long 0x7fffffff
b: .long 1

format1: .asciz "Ejecutando foo1...\n"
format2: .asciz "Ejecutando foo2...\n"
format3: .asciz "Dentro de foo1 : 0x%x\n"
format4: .asciz "Dentro de foo2 : 0x%x\n"
formatfinal: .asciz "f1 : 0x%x\nf2 : 0x%x\n" # 

.text

foo1:
	xorl %eax, %eax
	leaq format1, %rdi
	call printf
	xorl %eax, %eax
	movl b, %eax
	sall $31, %eax
	addl a, %eax
	movl %eax, a
	
	xorl %esi, %esi
	movl %eax, %esi
	xorl %eax, %eax
	leaq format3, %rdi
	call printf
	xorl %eax, %eax
	movl a, %eax
	ret

foo2:
	xorl %eax, %eax
	leaq format2, %rdi
	call printf
	xorl %eax, %eax
	movl b, %eax
	addl a, %eax
	movl %eax, a
	
	xorl %esi, %esi
	movl %eax, %esi
	xorl %eax, %eax
	leaq format4, %rdi
	call printf
	xorl %eax, %eax
	movl a, %eax
	ret

.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	xorl %eax, %eax

	call foo2
	pushq %rax # -8(rbp)
	call foo1
	xorl %esi, %esi
	movl %eax, %esi
	xorl %edx, %edx
	movl -8(%rbp), %edx
	leaq formatfinal, %rdi
	xorl %eax, %eax
	call printf

	xorl %eax, %eax

	movq %rbp, %rsp
	popq %rbp
	ret
