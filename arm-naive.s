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
	mov	w13, #973                       ; =0x3cd
Lloh0:
	adrp	x9, _c@GOTPAGE
Lloh1:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh2:
	adrp	x10, _b@GOTPAGE
Lloh3:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w8, #38528                      ; =0x9680
	movk	w8, #152, lsl #16
Lloh4:
	adrp	x11, _a@GOTPAGE
Lloh5:
	ldr	x11, [x11, _a@GOTPAGEOFF]
	mov	w12, #38528                     ; =0x9680
	movk	w12, #152, lsl #16
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	eor	w13, w13, w13, lsl #13
	eor	w13, w13, w13, asr #17
	eor	w13, w13, w13, lsl #5
	str	w13, [x11], #4
	eor	w13, w13, w13, lsl #13
	eor	w13, w13, w13, asr #17
	eor	w13, w13, w13, lsl #5
	str	w13, [x10], #4
	eor	w13, w13, w13, lsl #13
	eor	w13, w13, w13, asr #17
	eor	w13, w13, w13, lsl #5
	str	w13, [x9], #4
	subs	x12, x12, #1
	b.ne	LBB1_1
; %bb.2:
Lloh6:
	adrp	x9, _c@GOTPAGE
Lloh7:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh8:
	adrp	x10, _b@GOTPAGE
Lloh9:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w11, #38528                     ; =0x9680
	movk	w11, #152, lsl #16
Lloh10:
	adrp	x12, _a@GOTPAGE
Lloh11:
	ldr	x12, [x12, _a@GOTPAGEOFF]
	b	LBB1_4
LBB1_3:                                 ;   in Loop: Header=BB1_4 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x12, x12, #4
	subs	x11, x11, #1
	b.eq	LBB1_10
LBB1_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12]
	tbnz	w13, #0, LBB1_7
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=1
	ldr	w13, [x10]
	tbnz	w13, #0, LBB1_8
LBB1_6:                                 ;   in Loop: Header=BB1_4 Depth=1
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_3
	b	LBB1_9
LBB1_7:                                 ;   in Loop: Header=BB1_4 Depth=1
	add	w13, w13, #2
	str	w13, [x12]
	ldr	w13, [x10]
	tbz	w13, #0, LBB1_6
LBB1_8:                                 ;   in Loop: Header=BB1_4 Depth=1
	add	w13, w13, #2
	str	w13, [x10]
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_3
LBB1_9:                                 ;   in Loop: Header=BB1_4 Depth=1
	add	w13, w13, #2
	str	w13, [x9]
	b	LBB1_3
LBB1_10:
Lloh12:
	adrp	x9, _c@GOTPAGE
Lloh13:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh14:
	adrp	x10, _b@GOTPAGE
Lloh15:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w11, #38528                     ; =0x9680
	movk	w11, #152, lsl #16
Lloh16:
	adrp	x12, _a@GOTPAGE
Lloh17:
	ldr	x12, [x12, _a@GOTPAGEOFF]
	b	LBB1_12
LBB1_11:                                ;   in Loop: Header=BB1_12 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x12, x12, #4
	subs	x11, x11, #1
	b.eq	LBB1_18
LBB1_12:                                ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12]
	tbnz	w13, #0, LBB1_15
; %bb.13:                               ;   in Loop: Header=BB1_12 Depth=1
	ldr	w13, [x10]
	tbnz	w13, #0, LBB1_16
LBB1_14:                                ;   in Loop: Header=BB1_12 Depth=1
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_11
	b	LBB1_17
LBB1_15:                                ;   in Loop: Header=BB1_12 Depth=1
	add	w13, w13, #2
	str	w13, [x12]
	ldr	w13, [x10]
	tbz	w13, #0, LBB1_14
LBB1_16:                                ;   in Loop: Header=BB1_12 Depth=1
	add	w13, w13, #2
	str	w13, [x10]
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_11
LBB1_17:                                ;   in Loop: Header=BB1_12 Depth=1
	add	w13, w13, #2
	str	w13, [x9]
	b	LBB1_11
LBB1_18:
Lloh18:
	adrp	x9, _c@GOTPAGE
Lloh19:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh20:
	adrp	x10, _b@GOTPAGE
Lloh21:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w11, #38528                     ; =0x9680
	movk	w11, #152, lsl #16
Lloh22:
	adrp	x12, _a@GOTPAGE
Lloh23:
	ldr	x12, [x12, _a@GOTPAGEOFF]
	b	LBB1_20
LBB1_19:                                ;   in Loop: Header=BB1_20 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x12, x12, #4
	subs	x11, x11, #1
	b.eq	LBB1_26
LBB1_20:                                ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12]
	tbnz	w13, #0, LBB1_23
; %bb.21:                               ;   in Loop: Header=BB1_20 Depth=1
	ldr	w13, [x10]
	tbnz	w13, #0, LBB1_24
LBB1_22:                                ;   in Loop: Header=BB1_20 Depth=1
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_19
	b	LBB1_25
LBB1_23:                                ;   in Loop: Header=BB1_20 Depth=1
	add	w13, w13, #2
	str	w13, [x12]
	ldr	w13, [x10]
	tbz	w13, #0, LBB1_22
LBB1_24:                                ;   in Loop: Header=BB1_20 Depth=1
	add	w13, w13, #2
	str	w13, [x10]
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_19
LBB1_25:                                ;   in Loop: Header=BB1_20 Depth=1
	add	w13, w13, #2
	str	w13, [x9]
	b	LBB1_19
LBB1_26:
Lloh24:
	adrp	x9, _c@GOTPAGE
Lloh25:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh26:
	adrp	x10, _b@GOTPAGE
Lloh27:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w11, #38528                     ; =0x9680
	movk	w11, #152, lsl #16
Lloh28:
	adrp	x12, _a@GOTPAGE
Lloh29:
	ldr	x12, [x12, _a@GOTPAGEOFF]
	b	LBB1_28
LBB1_27:                                ;   in Loop: Header=BB1_28 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x12, x12, #4
	subs	x11, x11, #1
	b.eq	LBB1_34
LBB1_28:                                ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12]
	tbnz	w13, #0, LBB1_31
; %bb.29:                               ;   in Loop: Header=BB1_28 Depth=1
	ldr	w13, [x10]
	tbnz	w13, #0, LBB1_32
LBB1_30:                                ;   in Loop: Header=BB1_28 Depth=1
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_27
	b	LBB1_33
LBB1_31:                                ;   in Loop: Header=BB1_28 Depth=1
	add	w13, w13, #2
	str	w13, [x12]
	ldr	w13, [x10]
	tbz	w13, #0, LBB1_30
LBB1_32:                                ;   in Loop: Header=BB1_28 Depth=1
	add	w13, w13, #2
	str	w13, [x10]
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_27
LBB1_33:                                ;   in Loop: Header=BB1_28 Depth=1
	add	w13, w13, #2
	str	w13, [x9]
	b	LBB1_27
LBB1_34:
Lloh30:
	adrp	x9, _c@GOTPAGE
Lloh31:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh32:
	adrp	x10, _b@GOTPAGE
Lloh33:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w11, #38528                     ; =0x9680
	movk	w11, #152, lsl #16
Lloh34:
	adrp	x12, _a@GOTPAGE
Lloh35:
	ldr	x12, [x12, _a@GOTPAGEOFF]
	b	LBB1_36
LBB1_35:                                ;   in Loop: Header=BB1_36 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x12, x12, #4
	subs	x11, x11, #1
	b.eq	LBB1_42
LBB1_36:                                ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12]
	tbnz	w13, #0, LBB1_39
; %bb.37:                               ;   in Loop: Header=BB1_36 Depth=1
	ldr	w13, [x10]
	tbnz	w13, #0, LBB1_40
LBB1_38:                                ;   in Loop: Header=BB1_36 Depth=1
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_35
	b	LBB1_41
LBB1_39:                                ;   in Loop: Header=BB1_36 Depth=1
	add	w13, w13, #2
	str	w13, [x12]
	ldr	w13, [x10]
	tbz	w13, #0, LBB1_38
LBB1_40:                                ;   in Loop: Header=BB1_36 Depth=1
	add	w13, w13, #2
	str	w13, [x10]
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_35
LBB1_41:                                ;   in Loop: Header=BB1_36 Depth=1
	add	w13, w13, #2
	str	w13, [x9]
	b	LBB1_35
LBB1_42:
Lloh36:
	adrp	x9, _c@GOTPAGE
Lloh37:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh38:
	adrp	x10, _b@GOTPAGE
Lloh39:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w11, #38528                     ; =0x9680
	movk	w11, #152, lsl #16
Lloh40:
	adrp	x12, _a@GOTPAGE
Lloh41:
	ldr	x12, [x12, _a@GOTPAGEOFF]
	b	LBB1_44
LBB1_43:                                ;   in Loop: Header=BB1_44 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x12, x12, #4
	subs	x11, x11, #1
	b.eq	LBB1_50
LBB1_44:                                ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12]
	tbnz	w13, #0, LBB1_47
; %bb.45:                               ;   in Loop: Header=BB1_44 Depth=1
	ldr	w13, [x10]
	tbnz	w13, #0, LBB1_48
LBB1_46:                                ;   in Loop: Header=BB1_44 Depth=1
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_43
	b	LBB1_49
LBB1_47:                                ;   in Loop: Header=BB1_44 Depth=1
	add	w13, w13, #2
	str	w13, [x12]
	ldr	w13, [x10]
	tbz	w13, #0, LBB1_46
LBB1_48:                                ;   in Loop: Header=BB1_44 Depth=1
	add	w13, w13, #2
	str	w13, [x10]
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_43
LBB1_49:                                ;   in Loop: Header=BB1_44 Depth=1
	add	w13, w13, #2
	str	w13, [x9]
	b	LBB1_43
LBB1_50:
Lloh42:
	adrp	x9, _c@GOTPAGE
Lloh43:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh44:
	adrp	x10, _b@GOTPAGE
Lloh45:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w11, #38528                     ; =0x9680
	movk	w11, #152, lsl #16
Lloh46:
	adrp	x12, _a@GOTPAGE
Lloh47:
	ldr	x12, [x12, _a@GOTPAGEOFF]
	b	LBB1_52
LBB1_51:                                ;   in Loop: Header=BB1_52 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x12, x12, #4
	subs	x11, x11, #1
	b.eq	LBB1_58
LBB1_52:                                ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12]
	tbnz	w13, #0, LBB1_55
; %bb.53:                               ;   in Loop: Header=BB1_52 Depth=1
	ldr	w13, [x10]
	tbnz	w13, #0, LBB1_56
LBB1_54:                                ;   in Loop: Header=BB1_52 Depth=1
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_51
	b	LBB1_57
LBB1_55:                                ;   in Loop: Header=BB1_52 Depth=1
	add	w13, w13, #2
	str	w13, [x12]
	ldr	w13, [x10]
	tbz	w13, #0, LBB1_54
LBB1_56:                                ;   in Loop: Header=BB1_52 Depth=1
	add	w13, w13, #2
	str	w13, [x10]
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_51
LBB1_57:                                ;   in Loop: Header=BB1_52 Depth=1
	add	w13, w13, #2
	str	w13, [x9]
	b	LBB1_51
LBB1_58:
Lloh48:
	adrp	x9, _c@GOTPAGE
Lloh49:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh50:
	adrp	x10, _b@GOTPAGE
Lloh51:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w11, #38528                     ; =0x9680
	movk	w11, #152, lsl #16
Lloh52:
	adrp	x12, _a@GOTPAGE
Lloh53:
	ldr	x12, [x12, _a@GOTPAGEOFF]
	b	LBB1_60
LBB1_59:                                ;   in Loop: Header=BB1_60 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x12, x12, #4
	subs	x11, x11, #1
	b.eq	LBB1_66
LBB1_60:                                ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12]
	tbnz	w13, #0, LBB1_63
; %bb.61:                               ;   in Loop: Header=BB1_60 Depth=1
	ldr	w13, [x10]
	tbnz	w13, #0, LBB1_64
LBB1_62:                                ;   in Loop: Header=BB1_60 Depth=1
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_59
	b	LBB1_65
LBB1_63:                                ;   in Loop: Header=BB1_60 Depth=1
	add	w13, w13, #2
	str	w13, [x12]
	ldr	w13, [x10]
	tbz	w13, #0, LBB1_62
LBB1_64:                                ;   in Loop: Header=BB1_60 Depth=1
	add	w13, w13, #2
	str	w13, [x10]
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_59
LBB1_65:                                ;   in Loop: Header=BB1_60 Depth=1
	add	w13, w13, #2
	str	w13, [x9]
	b	LBB1_59
LBB1_66:
Lloh54:
	adrp	x9, _c@GOTPAGE
Lloh55:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh56:
	adrp	x10, _b@GOTPAGE
Lloh57:
	ldr	x10, [x10, _b@GOTPAGEOFF]
	mov	w11, #38528                     ; =0x9680
	movk	w11, #152, lsl #16
Lloh58:
	adrp	x12, _a@GOTPAGE
Lloh59:
	ldr	x12, [x12, _a@GOTPAGEOFF]
	b	LBB1_68
LBB1_67:                                ;   in Loop: Header=BB1_68 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x12, x12, #4
	subs	x11, x11, #1
	b.eq	LBB1_74
LBB1_68:                                ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12]
	tbnz	w13, #0, LBB1_71
; %bb.69:                               ;   in Loop: Header=BB1_68 Depth=1
	ldr	w13, [x10]
	tbnz	w13, #0, LBB1_72
LBB1_70:                                ;   in Loop: Header=BB1_68 Depth=1
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_67
	b	LBB1_73
LBB1_71:                                ;   in Loop: Header=BB1_68 Depth=1
	add	w13, w13, #2
	str	w13, [x12]
	ldr	w13, [x10]
	tbz	w13, #0, LBB1_70
LBB1_72:                                ;   in Loop: Header=BB1_68 Depth=1
	add	w13, w13, #2
	str	w13, [x10]
	ldr	w13, [x9]
	tbz	w13, #0, LBB1_67
LBB1_73:                                ;   in Loop: Header=BB1_68 Depth=1
	add	w13, w13, #2
	str	w13, [x9]
	b	LBB1_67
LBB1_74:
Lloh60:
	adrp	x9, _c@GOTPAGE
Lloh61:
	ldr	x9, [x9, _c@GOTPAGEOFF]
Lloh62:
	adrp	x10, _b@GOTPAGE
Lloh63:
	ldr	x10, [x10, _b@GOTPAGEOFF]
Lloh64:
	adrp	x11, _a@GOTPAGE
Lloh65:
	ldr	x11, [x11, _a@GOTPAGEOFF]
	b	LBB1_76
LBB1_75:                                ;   in Loop: Header=BB1_76 Depth=1
	add	x9, x9, #4
	add	x10, x10, #4
	add	x11, x11, #4
	subs	x8, x8, #1
	b.eq	LBB1_82
LBB1_76:                                ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x11]
	tbnz	w12, #0, LBB1_79
; %bb.77:                               ;   in Loop: Header=BB1_76 Depth=1
	ldr	w12, [x10]
	tbnz	w12, #0, LBB1_80
LBB1_78:                                ;   in Loop: Header=BB1_76 Depth=1
	ldr	w12, [x9]
	tbz	w12, #0, LBB1_75
	b	LBB1_81
LBB1_79:                                ;   in Loop: Header=BB1_76 Depth=1
	add	w12, w12, #2
	str	w12, [x11]
	ldr	w12, [x10]
	tbz	w12, #0, LBB1_78
LBB1_80:                                ;   in Loop: Header=BB1_76 Depth=1
	add	w12, w12, #2
	str	w12, [x10]
	ldr	w12, [x9]
	tbz	w12, #0, LBB1_75
LBB1_81:                                ;   in Loop: Header=BB1_76 Depth=1
	add	w12, w12, #2
	str	w12, [x9]
	b	LBB1_75
LBB1_82:
	mov	w0, #0                          ; =0x0
	ret
	.loh AdrpLdrGot	Lloh4, Lloh5
	.loh AdrpLdrGot	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpLdrGot	Lloh10, Lloh11
	.loh AdrpLdrGot	Lloh8, Lloh9
	.loh AdrpLdrGot	Lloh6, Lloh7
	.loh AdrpLdrGot	Lloh16, Lloh17
	.loh AdrpLdrGot	Lloh14, Lloh15
	.loh AdrpLdrGot	Lloh12, Lloh13
	.loh AdrpLdrGot	Lloh22, Lloh23
	.loh AdrpLdrGot	Lloh20, Lloh21
	.loh AdrpLdrGot	Lloh18, Lloh19
	.loh AdrpLdrGot	Lloh28, Lloh29
	.loh AdrpLdrGot	Lloh26, Lloh27
	.loh AdrpLdrGot	Lloh24, Lloh25
	.loh AdrpLdrGot	Lloh34, Lloh35
	.loh AdrpLdrGot	Lloh32, Lloh33
	.loh AdrpLdrGot	Lloh30, Lloh31
	.loh AdrpLdrGot	Lloh40, Lloh41
	.loh AdrpLdrGot	Lloh38, Lloh39
	.loh AdrpLdrGot	Lloh36, Lloh37
	.loh AdrpLdrGot	Lloh46, Lloh47
	.loh AdrpLdrGot	Lloh44, Lloh45
	.loh AdrpLdrGot	Lloh42, Lloh43
	.loh AdrpLdrGot	Lloh52, Lloh53
	.loh AdrpLdrGot	Lloh50, Lloh51
	.loh AdrpLdrGot	Lloh48, Lloh49
	.loh AdrpLdrGot	Lloh58, Lloh59
	.loh AdrpLdrGot	Lloh56, Lloh57
	.loh AdrpLdrGot	Lloh54, Lloh55
	.loh AdrpLdrGot	Lloh64, Lloh65
	.loh AdrpLdrGot	Lloh62, Lloh63
	.loh AdrpLdrGot	Lloh60, Lloh61
	.cfi_endproc
                                        ; -- End function
	.comm	_a,40000000,2                   ; @a
	.comm	_b,40000000,2                   ; @b
	.comm	_c,40000000,2                   ; @c
.subsections_via_symbols
