.text
.global fact2
fact2:
	# Prologo
	pushq %rbp
	movq %rsp, %rbp
	# Cuerpo
	xorq %rbx, %rbx
	xorq %rax, %rax
	#Limpiamos
	movl $1, %eax # Inicializamos eax a 1, como Accum
	movq %rdi, %rbx # Guardamos 

	inicio:
		
		mull %ebx
		decl %ebx
		cmpl $1, %ebx
		jg inicio

	movq %rbp, %rsp
	popq %rbp

	ret

.global fact1
fact1: 
	pushq %rbp
	movq %rsp, %rbp

	cmpq $1, %rdi
	jg rec
	movq $1, %rax
	jmp epilogo
	
	rec:
		pushq %rdi
		decq %rdi
		call fact1
		popq %rbx
		mulq %rbx
	
	epilogo:
		movq %rbp, %rsp
		popq %rbp
		ret

.section .note.GNU-stack