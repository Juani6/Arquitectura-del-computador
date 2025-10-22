.data

a: .long 1,2,3,4
g: .quad 0x1122334455667788
msg: .asciz "Imprime %c\n"

.text
.global main
# rsp = 0x7fffffffebc8
main:
	subq $8, %rsp # rsp = 0x7fffffffebc0
	movq $g, %rax # rax = 0x 00000000 | 00404020
	movl g+4, %eax # eax = 0x55667788
	movq $3, %rbx # rbx = 0x000000000000000003
	movb a(,%rbx,4), %al # al = 0x4
	leaq msg, %ird # rdi = 0x404028
	movb (%rdi, %rbx, 2), %sil # sil = (0x40402f) = e
	xorl %eax, %eax # eax = 0 => rax = 0
	call printf # printf(rdi =  rsi = e) imprime e
	addq $8, %rsp
	ret