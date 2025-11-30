	.file	"naive.c"
	.text
	.p2align 4
	.globl	xorshift32
	.type	xorshift32, @function
xorshift32:
.LFB16:
	.cfi_startproc
	endbr64
	movl	(%rdi), %edx
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	sarl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	movl	%eax, (%rdi)
	ret
	.cfi_endproc
.LFE16:
	.size	xorshift32, .-xorshift32
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB17:
	.cfi_startproc
	endbr64
	xorl	%ecx, %ecx
	movl	$973, %eax
	leaq	a(%rip), %rsi
	leaq	b(%rip), %r8
	leaq	c(%rip), %rdi
	.p2align 4,,10
	.p2align 3
.L4:
	movl	%eax, %edx
	sall	$13, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sarl	$17, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$5, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	movl	%eax, (%rsi,%rcx)
	sall	$13, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sarl	$17, %eax
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%eax, %edx
	movl	%edx, %eax
	movl	%edx, (%r8,%rcx)
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	sarl	$17, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$5, %edx
	xorl	%edx, %eax
	movl	%eax, (%rdi,%rcx)
	addq	$4, %rcx
	cmpq	$400000000, %rcx
	jne	.L4
	leaq	a(%rip), %rax
	leaq	c(%rip), %rcx
	addq	$400000000, %rsi
	leaq	b(%rip), %rdx
	.p2align 4,,10
	.p2align 3
.L8:
	testb	$1, (%rcx)
	je	.OPTIMIZE
.OPTIMIZE:
	testb	$1, (%rax)
	je	.L5
	movl	$0, (%rax)
.L5:
	testb	$1, (%rdx)
	je	.L6
	movl	$0, (%rdx)
.L6:
	testb	$1, (%rcx)
	je	.L7
	movl	$0, (%rcx)
.L7:
	addq	$4, %rax
	addq	$4, %rcx
	addq	$4, %rdx
	cmpq	%rax, %rsi
	jne	.L8
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.globl	c
	.bss
	.align 32
	.type	c, @object
	.size	c, 400000000
c:
	.zero	400000000
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 400000000
b:
	.zero	400000000
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 400000000
a:
	.zero	400000000
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
