	.file	"ej18.c"
# GNU C17 (Debian 12.2.0-14) version 12.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.1-p1, MPC version 1.3.1, isl version isl-0.25-GMP

# warning: MPFR header version 4.1.1-p1 differs from library version 4.2.0.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O0 -fasynchronous-unwind-tables
	.text
	.globl	calculo
	.type	calculo, @function
calculo:
.LFB6:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6

	movl	%edx, %eax	# c, tmp93
	movl	%ecx, -16(%rbp)	# d, d
	movl	%r8d, %ecx	# e, tmp95
	movss	%xmm0, -24(%rbp)	# f, f
	movsd	%xmm1, -32(%rbp)	# g, g
	movl	%r9d, -36(%rbp)	# h, h
	movl	%edi, %edx	# tmp89, tmp90
	movb	%dl, -4(%rbp)	# tmp90, a
	movl	%esi, %edx	# tmp91, tmp92
	movb	%dl, -8(%rbp)	# tmp92, b
	movb	%al, -12(%rbp)	# tmp94, c
	movl	%ecx, %eax	# tmp95, tmp96
	movb	%al, -20(%rbp)	# tmp96, e

# ej18.c:5: 	return (a+c+d)*(i+j);
	movsbl	-4(%rbp), %edx	# a, _1
	movsbl	-12(%rbp), %eax	# c, _2
	addl	%eax, %edx	# _2, _3

# ej18.c:5: 	return (a+c+d)*(i+j);
	movl	-16(%rbp), %eax	# d, tmp97
	addl	%eax, %edx	# tmp97, _4

# ej18.c:5: 	return (a+c+d)*(i+j);
	movl	16(%rbp), %ecx	# i, tmp98
	movl	24(%rbp), %eax	# j, tmp99
	addl	%ecx, %eax	# tmp98, _5

# ej18.c:5: 	return (a+c+d)*(i+j);
	imull	%edx, %eax	# _4, _11

# ej18.c:6: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	calculo, .-calculo
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
# ej18.c:9: 	int e = 5;
	movl	$5, -4(%rbp)	#, e
# ej18.c:10: 	return calculo(1,2,3,4,5,1.0,2.0,6,7,8);
	movsd	.LC0(%rip), %xmm0	#, tmp84
	pushq	$8	#
	pushq	$7	#
	movl	$6, %r9d	#,
	movapd	%xmm0, %xmm1	# tmp84,
	movl	.LC1(%rip), %eax	#, tmp85
	movd	%eax, %xmm0	# tmp85,
	movl	$5, %r8d	#,
	movl	$4, %ecx	#,
	movl	$3, %edx	#,
	movl	$2, %esi	#,
	movl	$1, %edi	#,
	call	calculo	#
	addq	$16, %rsp	#,
# ej18.c:11: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1073741824 # 0x40000000 (0 | 100 0000 | 0 ...)
	.align 4
.LC1:
	.long	1065353216
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
