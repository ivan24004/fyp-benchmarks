	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 5
	.globl	_xorshift32                     ; -- Begin function xorshift32
	.p2align	2
_xorshift32:                            ; @xorshift32
	.cfi_startproc
; %bb.0:
	ldr	w8, [x0]
	eor	w8, w8, w8, lsl #13
	eor	w8, w8, w8, asr #17
	eor	w8, w8, w8, lsl #5
	str	w8, [x0]
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
Lloh0:
	adrp	x8, _c@GOTPAGE
Lloh1:
	ldr	x8, [x8, _c@GOTPAGEOFF]
	mov	w12, #973                       ; =0x3cd
Lloh2:
	adrp	x9, _b@GOTPAGE
Lloh3:
	ldr	x9, [x9, _b@GOTPAGEOFF]
	mov	w10, #16960                     ; =0x4240
	movk	w10, #15, lsl #16
Lloh4:
	adrp	x11, _a@GOTPAGE
Lloh5:
	ldr	x11, [x11, _a@GOTPAGEOFF]
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	eor	w12, w12, w12, lsl #13
	eor	w12, w12, w12, asr #17
	eor	w12, w12, w12, lsl #5
	str	w12, [x11], #4
	eor	w12, w12, w12, lsl #13
	eor	w12, w12, w12, asr #17
	eor	w12, w12, w12, lsl #5
	str	w12, [x9], #4
	eor	w12, w12, w12, lsl #13
	eor	w12, w12, w12, asr #17
	eor	w12, w12, w12, lsl #5
	str	w12, [x8], #4
	subs	x10, x10, #1
	b.ne	LBB1_1
; %bb.2:
	mov	w8, #0                          ; =0x0
Lloh6:
	adrp	x9, _c@GOTPAGE
Lloh7:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh8:
	adrp	x10, _b@GOTPAGE
Lloh9:
	ldr	x10, [x10, _b@GOTPAGEOFF]
Lloh10:
	adrp	x11, _a@GOTPAGE
Lloh11:
	ldr	x11, [x11, _a@GOTPAGEOFF]
	b	LBB1_4
LBB1_3:                                 ;   in Loop: Header=BB1_4 Depth=1
	add	w8, w8, #1
	cmp	w8, #100
	b.eq	LBB1_12
LBB1_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_6 Depth 2
	mov	w12, #16960                     ; =0x4240
	movk	w12, #15, lsl #16
	mov	x13, x11
	mov	x14, x10
	mov	x15, x9
	b	LBB1_6
LBB1_5:                                 ;   in Loop: Header=BB1_6 Depth=2
	add	x15, x15, #4
	add	x14, x14, #4
	add	x13, x13, #4
	subs	x12, x12, #1
	b.eq	LBB1_3
LBB1_6:                                 ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
    // --- added degenerate branch: if (c[i] & 1) {} ---
    ldr     w16, [x15]
    tbnz    w16, #0, LBB1_6_deg          // if odd, branch to empty body
LBB1_6_deg:
    // --- end added degenerate branch ---

    ldr     w16, [x13]
    tbnz    w16, #0, LBB1_9
; %bb.7:                                ;   in Loop: Header=BB1_6 Depth=2
	ldr	w16, [x14]
	tbnz	w16, #0, LBB1_10
LBB1_8:                                 ;   in Loop: Header=BB1_6 Depth=2
	ldr	w16, [x15]
	tbz	w16, #0, LBB1_5
	b	LBB1_11
LBB1_9:                                 ;   in Loop: Header=BB1_6 Depth=2
	add	w16, w16, #2
	str	w16, [x13]
	ldr	w16, [x14]
	tbz	w16, #0, LBB1_8
LBB1_10:                                ;   in Loop: Header=BB1_6 Depth=2
	add	w16, w16, #2
	str	w16, [x14]
	ldr	w16, [x15]
	tbz	w16, #0, LBB1_5
LBB1_11:                                ;   in Loop: Header=BB1_6 Depth=2
	add	w16, w16, #2
	str	w16, [x15]
	b	LBB1_5
LBB1_12:
	mov	w0, #0                          ; =0x0
	ret
	.loh AdrpLdrGot	Lloh4, Lloh5
	.loh AdrpLdrGot	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpLdrGot	Lloh10, Lloh11
	.loh AdrpLdrGot	Lloh8, Lloh9
	.loh AdrpLdrGot	Lloh6, Lloh7
	.cfi_endproc
                                        ; -- End function
	.comm	_a,4000000,2                    ; @a
	.comm	_b,4000000,2                    ; @b
	.comm	_c,4000000,2                    ; @c
.subsections_via_symbols
