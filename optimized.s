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
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%ecx, %ecx
	movl	$973, %eax
	leaq	a(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	b(%rip), %r8
	leaq	c(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
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
	cmpq	$40000000, %rcx
	jne	.L4
	movl	$1, %ebx
	leaq	a(%rip), %r8
	leaq	c(%rip), %r10
	leaq	b(%rip), %r9
.L5:
	leaq	40000000(%rsi), %rdi
	leaq	b(%rip), %rbp
	movq	%r8, %rsi
	leaq	c(%rip), %r11
	leaq	-40000000(%rdi), %rcx
	.p2align 4,,10
	.p2align 3
.L12:
	testb	$1, %al
	je	.OPTIMIZE
.OPTIMIZE:
	movl	(%rcx), %r12d
	testb	$1, %r12b
	je	.L6
	addl	$2, %r12d
	movl	%r12d, (%rcx)
.L6:
	movl	0(%rbp), %edx
	testb	$1, %dl
	je	.L7
	addl	$2, %edx
	movl	%edx, 0(%rbp)
.L7:
	movl	(%r11), %eax
	testb	$1, %al
	je	.L8
	addl	$2, %eax
	movl	%eax, (%r11)
.L8:
	testb	$1, %r12b
	je	.L9
	addl	$2, %r12d
	movl	%r12d, (%rcx)
.L9:
	testb	$1, %dl
	je	.L10
	addl	$2, %edx
	movl	%edx, 0(%rbp)
.L10:
	testb	$1, %al
	je	.L11
	addl	$2, %eax
	movl	%eax, (%r11)
.L11:
	addq	$4, %rcx
	addq	$4, %r11
	addq	$4, %rbp
	cmpq	%rdi, %rcx
	jne	.L12
	leal	1(%rbx), %r11d
	addl	$2, %ebx
	cmpl	$9, %ebx
	jne	.L5
.L17:
	movq	%r9, %rcx
	movq	%r10, %rdx
	movq	%r8, %rax
	.p2align 4,,10
	.p2align 3
.L16:
	movl	(%rax), %esi
	testb	$1, %sil
	je	.L13
	addl	$2, %esi
	movl	%esi, (%rax)
.L13:
	movl	(%rcx), %esi
	testb	$1, %sil
	je	.L14
	addl	$2, %esi
	movl	%esi, (%rcx)
.L14:
	movl	(%rdx), %esi
	testb	$1, %sil
	je	.L15
	addl	$2, %esi
	movl	%esi, (%rdx)
.L15:
	addq	$4, %rax
	addq	$4, %rdx
	addq	$4, %rcx
	cmpq	%rdi, %rax
	jne	.L16
	addl	$1, %r11d
	cmpl	$10, %r11d
	jne	.L17
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.globl	c
	.bss
	.align 32
	.type	c, @object
	.size	c, 40000000
c:
	.zero	40000000
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 40000000
b:
	.zero	40000000
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 40000000
a:
	.zero	40000000
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
