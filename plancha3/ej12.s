.data
	list: .long 1,2,3,4,5,6,7,8,9,10
	len: .byte 10

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

.global main
main:
	leaq list, %rdi
	xorq %rsi, %rsi
	movb len, %sil
	call suma_arr
	ret

.section .note.GNU-stack