.data
a: .long 0xaaaaaaaa, 0x11223344, 16, 4
str1: .asciz "Determinante : %d * %d - %d * %d = %d\n" # a d b c, r
str2: .asciz "Vamos a calcular el determinante de la matriz \n %d \t %d \n %d \t %d\n" # x y z w

.text

determinante:
	pushq %rbp
	movq %rsp, %rbp

	subq $32, %rsp
	movl %esi, -4(%rbp) # a
	movl %edi, -8(%rbp) # b
	movl %edx, -12(%rbp) # c 
	movl %ecx, -16(%rbp) # d

	imull %esi, %edx
	imull %edi, %ecx
	subl %ecx, %edx
	movl %edx, -20(%rbp) # r
	
	leaq str1, %rdi
	movl -4(%rbp), %esi
	movl -8(%rbp), %edx
	movl -12(%rbp), %ecx
	movl -16(%rbp), %r8d
	movl -20(%rbp), %r9d
	call printf

	movl -20(%rbp), %eax

	movq %rbp, %rsp
	popq %rbp
	ret

.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	subq $32, %rsp

	leaq a, %rax
	
	movl (%rax), %esi
	movl 4(%rax), %edx
	movl 8(%rax), %ecx
	movl 12(%rax), %r8d

	movl %esi, -4(%rbp) # x = a[0]
	movl %edx, -8(%rbp) # y = a[1]
	movl %ecx, -12(%rbp) # z = a[2]
	movl %r8d, -16(%rbp) # w = a[3]

	leaq str2, %rdi
	xorq %rax, %rax
	call printf

	movl -4(%rbp), %esi
	movl -8(%rbp), %edi
	movl -12(%rbp), %edx
	movl -16(%rbp), %ecx
	call determinante

	movl %eax, -20(%rbp)
	xorq %rax, %rax

	movq %rbp, %rsp
	popq %rbp
	ret
	
.section .note.GNU-stack
