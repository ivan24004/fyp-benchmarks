	.file	"naive.c"
	.text
	.p2align 4
	.globl	xorshift32
	.type	xorshift32, @function
xorshift32:
.LFB11:
	.cfi_startproc
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
.LFE11:
	.size	xorshift32, .-xorshift32
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	movl	$a, %ecx
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$973, %edx
	leaq	40000000(%rcx), %rsi
.L4:
	movl	%edx, %eax
	addq	$4, %rcx
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	sarl	$17, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$5, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	movl	%eax, -4(%rcx)
	sall	$13, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sarl	$17, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$5, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$13, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sarl	$17, %eax
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%eax, %edx
	cmpq	%rcx, %rsi
	jne	.L4
	movl	$b, %ecx
	movl	$973, %edx
	leaq	40000000(%rcx), %rsi
.L5:
	movl	%edx, %eax
	addq	$4, %rcx
	sall	$13, %eax
	xorl	%eax, %edx
	movl	%edx, %eax
	sarl	$17, %eax
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	sarl	$17, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$5, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$13, %edx
	xorl	%eax, %edx
	movl	%edx, %edi
	sarl	$17, %edi
	xorl	%edi, %edx
	movl	%edx, %edi
	sall	$5, %edi
	xorl	%edi, %edx
	addl	%edx, %eax
	movl	%eax, -4(%rcx)
	cmpq	%rcx, %rsi
	jne	.L5
	movl	$c, %edi
	movl	$40000000, %edx
	xorl	%esi, %esi
	call	memset
	movl	$1, %edi
.L6:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	movl	a(%rax), %esi
	testb	$1, %sil
	je	.L7
	addl	$2, %esi
	movl	%esi, a(%rax)
.L7:
	movl	b(%rax), %ecx
	testb	$1, %cl
	je	.L8
	addl	$2, %ecx
	movl	%ecx, b(%rax)
.L8:
	movl	c(%rax), %edx
	testb	$1, %dl
	je	.L9
	addl	$2, %edx
	movl	%edx, c(%rax)
.L9:
	testb	$1, %sil
	je	.L10
	addl	$2, %esi
	movl	%esi, a(%rax)
.L10:
	testb	$1, %cl
	je	.L11
	addl	$2, %ecx
	movl	%ecx, b(%rax)
.L11:
	testb	$1, %dl
	je	.L12
	addl	$2, %edx
	movl	%edx, c(%rax)
.L12:
	addq	$4, %rax
	cmpq	$40000000, %rax
	jne	.L13
	leal	1(%rdi), %ecx
	addl	$2, %edi
	cmpl	$99, %edi
	jne	.L6
.L18:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L17:
	movl	a(%rax), %edx
	testb	$1, %dl
	je	.L14
	addl	$2, %edx
	movl	%edx, a(%rax)
.L14:
	movl	b(%rax), %edx
	testb	$1, %dl
	je	.L15
	addl	$2, %edx
	movl	%edx, b(%rax)
.L15:
### REPEAT START
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
   addq    $4, %rax
   subq    $4, %rax
### REPEAT END
	movl	c(%rax), %edx
	testb	$1, %dl
	je	.L16
	addl	$2, %edx
	movl	%edx, c(%rax)
.L16:
	addq	$4, %rax
	cmpq	$40000000, %rax
	jne	.L17
	addl	$1, %ecx
	cmpl	$100, %ecx
	jne	.L18
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
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
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits