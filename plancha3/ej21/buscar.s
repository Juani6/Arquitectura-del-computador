.data
cadena: .asciz "123456"

.text
.global busca
busca:
	pushq %rbp
	movq %rsp, %rbp

	xorq %rax, %rax
	movq %rdi, %rax

	bucle:	
		cmpb $0, (%rax)
		je preepilogo

		cmpb %sil, (%rax) # 0x404010
		je epilogo
		incq %rax
		jmp bucle

	preepilogo:
		movq $-1, %rax
	epilogo:
		movq %rbp, %rsp
		popq %rbp

	ret

.section .note.GNU-stack
