	.file	"suma.c"
	.text
	.section	.rodata
.LC0:
	.string	"a es :%d\n"
.LC1:
	.string	"b es :%d\n"
	.text
	.globl	suma
	.type	suma, @function
suma:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	suma, .-suma
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movq	$1, -8(%rbp)
	movq	$2, -16(%rbp)
	movq	$3, -24(%rbp)
	movq	$4, -32(%rbp)
	movq	$5, -40(%rbp)
	movq	$6, -48(%rbp)
	movq	$7, -56(%rbp)
	movq	$8, -64(%rbp)
	movq	$9, -72(%rbp)
	movq	$10, -80(%rbp)
	movq	$11, -88(%rbp)
	movq	$12, -96(%rbp)
	movq	$13, -104(%rbp)
	movq	$14, -112(%rbp)
	movq	$15, -120(%rbp)
	movq	$16, -128(%rbp)
	movq	$17, -136(%rbp)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
