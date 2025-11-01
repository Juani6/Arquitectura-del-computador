.data
	list: .long 10,20,30,400,50,-60,70,80,90,100
	len: .byte 10
	formato: .asciz "Suma: %d\nPromedio : %d\nMayor : %d\nMenor: %d\n"
.text
# Arr: %rdi, len: %rsi
suma_arr:
	# Prologo
	pushq %rbp
	movq %rsp, %rbp
	
	# Funcion
	xorq %r10, %r10
	xorq %rax, %rax
sum:
	leaq (%rdi,%r10,4), %r11
	addl (%r11), %eax
	incq %r10
	cmpq %rsi, %r10
	jne sum
	
	# Epilogo
	movq %rbp, %rsp
	popq %rbp
	ret

# %rdi : lista, %rsi : len
promedio:
	call suma_arr
	divb %sil
	ret

# %rdi : lista, %rsi : len
mayor:
	# Vamos a usar R10 como registro auxiliar
	xorq %r10, %r10
	xorq %r11, %r11
	xorq %rax, %rax
	xorq %rcx, %rcx
	movb %sil, %cl
mayor_loop:	
	leaq (%rdi, %r11, 4), %r10
	incq %r11
	cmpl (%r10d), %eax # rax - r10 
	jle almacenar # rax - r10 < 0
	jmp continuar
almacenar:	
	movl (%r10d), %eax
continuar:
	loop mayor_loop
	
	ret
menor:
	# Vamos a usar R10 como registro auxiliar
	xorq %r10, %r10
	xorq %r11, %r11
	xorq %rax, %rax
	xorq %rcx, %rcx
	movb %sil, %cl
menor_loop:	
	leaq (%rdi, %r11, 4), %r10
	incq %r11
	cmpl (%r10d), %eax # rax - r10 
	jg almacenar_menor # rax - r10 < 0
	jmp continuar_menor
almacenar_menor:	
	movl (%r10d), %eax
continuar_menor:
	loop menor_loop
	
	ret



.global main
main:
	pushq %rbp
	movq %rsp, %rbp

	leaq list, %rdi
	xorq %rsi, %rsi
	movb len, %sil
	call suma_arr
	movq %rax, %r12
	
	leaq list, %rdi
	xorq %rsi, %rsi
	movb len, %sil
	call promedio
	movq %rax, %r13

	leaq list, %rdi
	xorq %rsi, %rsi
	movb len, %sil
	call mayor
	movq %rax, %r14

	leaq list, %rdi
	xorq %rsi, %rsi
	movb len, %sil
	call menor
	movq %rax, %r15
	# 	formato: .asciz "Suma: %d\n Promedio : %d\n Mayor : %d\n Menor: %d\n"
	leaq formato, %rdi
	movl %r12d, %esi 
	movl %r13d, %edx
	movl %r14d, %ecx
	movl %r15d, %r8d
	call printf

	movq %rbp, %rsp
	popq %rbp
	ret

.section .note.GNU-stack