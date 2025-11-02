.text
format: .asciz "Cantidad de argumentos : %d\n Suma : %d"
error: .asciz "Ingrese al menos un argumento\n"
.global f

# %rdi : #args, %rsi : puntero a argv[]
f: 
	# Prologo
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	# Queremos recorrer el arreglo entero y cada valor de la memoria apuntada por Rsi se sume en un calle save
	# Vamos a guardar todo en rbx

	leaq 8(%rsi), %r12 # Puntero al arreglo
	subq $1, %rdi
	movq %rdi, %rcx
	xorq %rbx, %rbx
	xorq %rax, %rax
loop_suma:
	movq (%r12), %rdi # *r12
	pushq %rcx
	call atoi
	popq %rcx
	mulq %rax
	addq %rax, %rbx
	addq $8, %r12
	loop loop_suma # jump si ZF != 0 

	# Epilogo
	# popq %r10
	movq %rbx, %rax
	addq $16, %rsp
	movq %rbp, %rsp
	popq %rbp
	ret


.section .note.GNU-stack
