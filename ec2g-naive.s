	.arch armv8.2-a+crypto+crc
	.file	"naive.c"
	.text
	.align	2
	.p2align 5,,15
	.global	xorshift32
	.type	xorshift32, %function
xorshift32:
.LFB11:
	.cfi_startproc
	mov	x1, x0
	ldr	w0, [x0]
	eor	w0, w0, w0, lsl 13
	eor	w0, w0, w0, asr 17
	eor	w0, w0, w0, lsl 5
	str	w0, [x1]
	ret
	.cfi_endproc
.LFE11:
	.size	xorshift32, .-xorshift32
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 5,,15
	.global	main
	.type	main, %function
main:
.LFB12:
	.cfi_startproc
	adrp	x2, a
	adrp	x3, b
	adrp	x4, c
	mov	x6, 23040
	add	x2, x2, :lo12:a
	add	x3, x3, :lo12:b
	add	x4, x4, :lo12:c
	mov	x5, 0
	mov	w0, 973
	movk	x6, 0x262, lsl 16
	.p2align 5,,15
.L4:
	eor	w0, w0, w0, lsl 13
	eor	w0, w0, w0, asr 17
	eor	w0, w0, w0, lsl 5
	eor	w1, w0, w0, lsl 13
	str	w0, [x2, x5]
	eor	w1, w1, w1, asr 17
	eor	w1, w1, w1, lsl 5
	eor	w0, w1, w1, lsl 13
	str	w1, [x3, x5]
	eor	w0, w0, w0, asr 17
	eor	w0, w0, w0, lsl 5
	str	w0, [x4, x5]
	add	x5, x5, 4
	cmp	x5, x6
	bne	.L4
	adrp	x0, .LC0
	mov	w11, 1
	ldr	x10, [x0, #:lo12:.LC0]
.L5:
	mov	x6, x2
	mov	x8, x4
	mov	x7, x3
	.p2align 5,,15
.L12:
	ldr	w5, [x6]
	tbz	x5, 0, .L6
	add	w0, w5, 2
	mov	w5, w0
	str	w0, [x6]
.L6:
	ldr	w1, [x7]
	tbz	x1, 0, .L7
	add	w0, w1, 2
	mov	w1, w0
	str	w0, [x7]
.L7:
	ldr	w0, [x8]
	tbz	x0, 0, .L8
	add	w9, w0, 2
	mov	w0, w9
	str	w9, [x8]
.L8:
	tbz	x5, 0, .L9
	add	w5, w5, 2
	str	w5, [x6]
.L9:
	tbz	x1, 0, .L10
	add	w1, w1, 2
	str	w1, [x7]
.L10:
	tbz	x0, 0, .L11
	add	w0, w0, 2
	str	w0, [x8]
.L11:
	add	x6, x6, 4
	add	x8, x8, 4
	add	x7, x7, 4
	cmp	x6, x10
	bne	.L12
	add	w6, w11, 1
	add	w11, w11, 2
	cmp	w11, 9
	bne	.L5
	mov	x5, 23040
	movk	x5, 0x262, lsl 16
.L17:
	mov	x0, 0
	.p2align 5,,15
.L16:
	ldr	w1, [x2, x0]
	tbz	x1, 0, .L13
	add	w1, w1, 2
	str	w1, [x2, x0]
.L13:
	ldr	w1, [x3, x0]
	tbz	x1, 0, .L14
	add	w1, w1, 2
	str	w1, [x3, x0]
.L14:
	ldr	w1, [x4, x0]
	tbz	x1, 0, .L15
	add	w1, w1, 2
	str	w1, [x4, x0]
.L15:
	add	x0, x0, 4
	cmp	x0, x5
	bne	.L16
	add	w6, w6, 1
	cmp	w6, 10
	bne	.L17
	mov	w0, 0
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.global	c
	.global	b
	.global	a
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.xword	a+40000000
	.bss
	.align	4
	.type	c, %object
	.size	c, 40000000
c:
	.zero	40000000
	.type	b, %object
	.size	b, 40000000
b:
	.zero	40000000
	.type	a, %object
	.size	a, 40000000
a:
	.zero	40000000
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
	