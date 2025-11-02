	.file	"ej16.c"
# GNU C17 (Debian 12.2.0-14) version 12.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.1-p1, MPC version 1.3.1, isl version isl-0.25-GMP

# warning: MPFR header version 4.1.1-p1 differs from library version 4.2.0.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O0 -fasynchronous-unwind-tables
	.text
	.section	.rodata
.LC0:
	.string	"a: %p\n"
.LC1:
	.string	"b: %p\n"
.LC2:
	.string	"c: %p\n"
.LC3:
	.string	"d: %p\n"
.LC4:
	.string	"e: %p\n"
.LC5:
	.string	"f: %p\n"
.LC6:
	.string	"g: %p\n"
.LC7:
	.string	"h: %p\n"
	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6

	subq	$32, %rsp	#,
	movl	%esi, -8(%rbp)	# b, b
	
	movl	%edx, %eax	# c, tmp86
	
	movq	%rcx, -24(%rbp)	# d, d
	
	movl	%r8d, %esi	# e, tmp88
	
	movl	%r9d, %ecx	# f, tmp90
	
	movl	%edi, %edx	# (char) a, tmp85
	
	movb	%dl, -4(%rbp)	# tmp85, a
	
	movb	%al, -12(%rbp)	# tmp87, c
	
	movl	%esi, %eax	# tmp88, tmp89
	
	movb	%al, -16(%rbp)	# tmp89, e
	
	movl	%ecx, %eax	# tmp90, tmp91
	
	movw	%ax, -28(%rbp)	# tmp91, f

# ej16.c:6: 	printf("a: %p\n", &a);
	leaq	-4(%rbp), %rax	#, tmp92
	movq	%rax, %rsi	# tmp92,
	leaq	.LC0(%rip), %rax	#, tmp93
	movq	%rax, %rdi	# tmp93,
	movl	$0, %eax	#,
	call	printf@PLT	#

# ej16.c:7: 	printf("b: %p\n", &b);
	leaq	-8(%rbp), %rax	#, tmp94
	movq	%rax, %rsi	# tmp94,
	leaq	.LC1(%rip), %rax	#, tmp95
	movq	%rax, %rdi	# tmp95,
	movl	$0, %eax	#,
	call	printf@PLT	#

# ej16.c:8: 	printf("c: %p\n", &c);
	leaq	-12(%rbp), %rax	#, tmp96
	movq	%rax, %rsi	# tmp96,
	leaq	.LC2(%rip), %rax	#, tmp97
	movq	%rax, %rdi	# tmp97,
	movl	$0, %eax	#,
	call	printf@PLT	#

# ej16.c:9: 	printf("d: %p\n", &d);
	leaq	-24(%rbp), %rax	#, tmp98
	movq	%rax, %rsi	# tmp98,
	leaq	.LC3(%rip), %rax	#, tmp99
	movq	%rax, %rdi	# tmp99,
	movl	$0, %eax	#,
	call	printf@PLT	#

# ej16.c:10: 	printf("e: %p\n", &e);
	leaq	-16(%rbp), %rax	#, tmp100
	movq	%rax, %rsi	# tmp100,
	leaq	.LC4(%rip), %rax	#, tmp101
	movq	%rax, %rdi	# tmp101,
	movl	$0, %eax	#,
	call	printf@PLT	#

# ej16.c:11: 	printf("f: %p\n", &f);
	leaq	-28(%rbp), %rax	#, tmp102
	movq	%rax, %rsi	# tmp102,
	leaq	.LC5(%rip), %rax	#, tmp103
	movq	%rax, %rdi	# tmp103,
	movl	$0, %eax	#,
	call	printf@PLT	#

# ej16.c:12: 	printf("g: %p\n", &g);
	leaq	16(%rbp), %rsi	#, tmp109
	leaq	.LC6(%rip), %rax	#, tmp104
	movq	%rax, %rdi	# tmp104,
	movl	$0, %eax	#,
	call	printf@PLT	#

# ej16.c:13: 	printf("h: %p\n", &h);
	leaq	24(%rbp), %rax	#, tmp105
	movq	%rax, %rsi	# tmp105,
	leaq	.LC7(%rip), %rax	#, tmp106
	movq	%rax, %rdi	# tmp106,
	movl	$0, %eax	#,
	call	printf@PLT	#

# ej16.c:14: 	return 0;
	movl	$0, %eax	#, _10

# ej16.c:15: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc


.LFE0:
	.size	f, .-f
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# ej16.c:17: 	return f('1', 2, '3', 4, '5', 6, 7, 8);
	pushq	$8	#
	pushq	$7	#
	movl	$6, %r9d	#,
	movl	$53, %r8d	#,
	movl	$4, %ecx	#,
	movl	$51, %edx	#,
	movl	$2, %esi	#,
	movl	$49, %edi	#,
	call	f	#
	addq	$16, %rsp	#,
# ej16.c:18: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
