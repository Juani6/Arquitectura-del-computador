.global text
text:
n: .quad 0xAAAAAAAAAAAAAAAA

.global main
main:
	movq n, %rax
	movb $64, %bl # Inicializamos contador
	xorq %rcx, %rcx # rcx = 0
loop:
	rclq $1, %rax
	adc $0, %rcx
	decb %bl
	jnz loop
	xorq %rax, %rax
	movq %rcx, %rax
	ret


