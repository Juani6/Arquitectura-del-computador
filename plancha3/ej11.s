.data
len: .byte 10
arr: .byte 0,1,2,3,4,5,6,7,8,9

.text
# rdi 1: cant elementos - rsi 2 : arreglo- devuelve en rax
invertir:
	# Proloco
	pushq %rbp
	movq %rsp, %rbp
	
	# Funcion
	xorq %r10, %r10
	xorq %rax, %rax
	xorq %r11, %r11
push_loop:
	pushq (%rsi, %r10, 1)
	incq %r10
	cmpq %rdi, %r10
	jne push_loop
pop_loop:
	popq (%rsi, %r11, 1)
	incq %r11
	cmpq %rdi, %r11
	jne pop_loop

	movq %rsi, %rax
	
	# epiloco
	movq %rbp, %rsp
	popq %rbp
	ret

.global main
main:
	xorq %rdi, %rdi
	movb len, %dil
	leaq arr, %rsi
	call invertir
	ret
