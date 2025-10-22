.global text
text:
n: .quad 0xbbbbbbbbaaaaaaaa

.global main

main:
	movq n, %rax
	rolq $32, %rax
	ret
