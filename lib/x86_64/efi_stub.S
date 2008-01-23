/*
 * Function calling ABI conversion from Linux to EFI for x86_64
 *
 * Copyright (C) 2007 Intel Corp
 *	Bibo Mao <bibo.mao@intel.com>
 *	Huang Ying <ying.huang@intel.com>
 */

#define ENTRY(name)	\
	.globl name;	\
	name:

ENTRY(efi_call0)
	subq $40, %rsp
	call *%rdi
	addq $40, %rsp
	ret

ENTRY(efi_call1)
	subq $40, %rsp
	mov  %rsi, %rcx
	call *%rdi
	addq $40, %rsp
	ret

ENTRY(efi_call2)
	subq $40, %rsp
	mov  %rsi, %rcx
	call *%rdi
	addq $40, %rsp
	ret

ENTRY(efi_call3)
	subq $40, %rsp
	mov  %rcx, %r8
	mov  %rsi, %rcx
	call *%rdi
	addq $40, %rsp
	ret

ENTRY(efi_call4)
	subq $40, %rsp
	mov %r8, %r9
	mov %rcx, %r8
	mov %rsi, %rcx
	call *%rdi
	addq $40, %rsp
	ret

ENTRY(efi_call5)
	subq $40, %rsp
	mov %r9, 32(%rsp)
	mov %r8, %r9
	mov %rcx, %r8
	mov %rsi, %rcx
	call *%rdi
	addq $40, %rsp
	ret

ENTRY(efi_call6)
	subq $56, %rsp
	mov 56+8(%rsp), %rax
	mov %rax, 40(%rsp)
	mov %r9, 32(%rsp)
	mov %r8, %r9
	mov %rcx, %r8
	mov %rsi, %rcx
	call *%rdi
	addq $56, %rsp
	ret

ENTRY(efi_call7)
	subq $56, %rsp
	mov 56+16(%rsp), %rax
	mov %rax, 48(%rsp)
	mov 56+8(%rsp), %rax
	mov %rax, 40(%rsp)
	mov %r9, 32(%rsp)
	mov %r8, %r9
	mov %rcx, %r8
	mov %rsi, %rcx
	call *%rdi
	addq $56, %rsp
	ret

ENTRY(efi_call8)
	subq $72, %rsp
	mov 72+24(%rsp), %rax
	mov %rax, 56(%rsp)
	mov 72+16(%rsp), %rax
	mov %rax, 48(%rsp)
	mov 72+8(%rsp), %rax
	mov %rax, 40(%rsp)
	mov %r9, 32(%rsp)
	mov %r8, %r9
	mov %rcx, %r8
	mov %rsi, %rcx
	call *%rdi
	addq $72, %rsp
	ret

ENTRY(efi_call9)
	subq $72, %rsp
	mov 72+32(%rsp), %rax
	mov %rax, 64(%rsp)
	mov 72+24(%rsp), %rax
	mov %rax, 56(%rsp)
	mov 72+16(%rsp), %rax
	mov %rax, 48(%rsp)
	mov 72+8(%rsp), %rax
	mov %rax, 40(%rsp)
	mov %r9, 32(%rsp)
	mov %r8, %r9
	mov %rcx, %r8
	mov %rsi, %rcx
	call *%rdi
	addq $72, %rsp
	ret

ENTRY(efi_call10)
	subq $88, %rsp
	mov 88+40(%rsp), %rax
	mov %rax, 72(%rsp)
	mov 88+32(%rsp), %rax
	mov %rax, 64(%rsp)
	mov 88+24(%rsp), %rax
	mov %rax, 56(%rsp)
	mov 88+16(%rsp), %rax
	mov %rax, 48(%rsp)
	mov 88+8(%rsp), %rax
	mov %rax, 40(%rsp)
	mov %r9, 32(%rsp)
	mov %r8, %r9
	mov %rcx, %r8
	mov %rsi, %rcx
	call *%rdi
	addq $88, %rsp
	ret
