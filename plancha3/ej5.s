.global main
main:
	movq $0x1122334455667788, %rax
	addq $0x11223388 , %rax
	ret