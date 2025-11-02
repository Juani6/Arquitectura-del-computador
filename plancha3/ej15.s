.data
fmt: .string "%d"
fmt_print: .string "%d\n"
entero: .long -100
funcs: 
	.quad f1
	.quad f2
	.quad f3
.text
	f1: movl $0, %esi
	movq $fmt_print, %rdi 
	call printf
	jmp fin
	
	f2: movl $1, %esi;
	movq $fmt_print, %rdi;
	call printf; 
	jmp fin
	
	f3: movl $2, %esi;
	movq $fmt_print, %rdi;
	call printf;
	jmp fin


.global main
main:
	pushq %rbp
	movq %rsp, %rbp


	# Leemos el entero.
	movq $entero, %rsi # SI TIENE $ ENTONCES ES LA DIRECCION DE LA ETIQUETA
	movq $fmt, %rdi
	xorq %rax, %rax
	call scanf
	xorq %rax, %rax
	
	movl entero, %eax
	movq funcs(,%rax,8), %rdx
	
	# COMPLETE CON DOS INSTRUCCIONES.
	jmp * %rdx


	fin:
	movq %rbp, %rsp
	popq %rbp
	ret

	.section .note.GNU-stack

