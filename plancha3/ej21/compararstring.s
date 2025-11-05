.data 
cadenalarga: .asciz "123456"
cadenacorta: .asciz "456"

.text
# .global main
# 
# main:
# 	movq $cadenalarga, %rdi
# 	movq $cadenacorta, %rsi
# 	movl $3, %edx
# 	call compara
# 	ret

.global compara
compara:
  # Devuelve 1 si los %edx primeros digitos de %rdi y %rsi son iguales
  # Vamos a iterar sobre %rsi
	pushq %rbp
	movq %rsp, %rbp
	pushq %rbx

	xorq %rax, %rax
	xorq %r10, %r10
	xorq %r11, %r11

	xorq %rcx, %rcx
	movq $0, %r10

	bucle: 
		cmpq %r10, %rdx
		je encontrado

		movb (%rdi,%r10), %bl
		movb (%rsi,%r10), %r11b

		cmpb %r11b, %bl
		jne no_encontrado

		incq %r10
		jmp bucle

	no_encontrado:
		xorq %rax, %rax
		jmp epilogo
	encontrado:
		movq $1, %rax
	epilogo:
		popq %rbx
		movq %rbp, %rsp
		popq %rbp 
		ret

.section .note.GNU-stack
