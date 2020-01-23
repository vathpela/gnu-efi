/*
 * Copyright 2019 Red Hat, Inc.
 * Author: Peter Jones <pjones@redhat.com>
 *
 * This program and the accompanying materials are licensed and made
available
 * under the terms and conditions of the BSD License which accompanies
this
 * distribution.  The full text of the license may be found at
 * http://opensource.org/licenses/bsd-license.php.
 *
 * THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS"
BASIS,
 * WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR
 * IMPLIED.
 */
	.text
	.p2align 3

	.globl	setjmp
	.type	setjmp, @function
setjmp:
	sd	ra, 0x00(a0)

	sd	s0, 0x08(a0)
	sd	s1, 0x10(a0)
	sd	s2, 0x18(a0)
	sd	s3, 0x20(a0)
	sd	s4, 0x28(a0)
	sd	s5, 0x30(a0)
	sd	s6, 0x38(a0)
	sd	s7, 0x40(a0)
	sd	s8, 0x48(a0)
	sd	s9, 0x50(a0)
	sd	s10, 0x58(a0)
	sd	s11, 0x60(a0)

	sd	sp, 0x68(a0)

	li	a0, 0
	ret

	.globl	longjmp
	.type	longjmp, @function
longjmp:
	ld	ra, 0x00(a0)

	ld	s0, 0x08(a0)
	ld	s1, 0x10(a0)
	ld	s2, 0x18(a0)
	ld	s3, 0x20(a0)
	ld	s4, 0x28(a0)
	ld	s5, 0x30(a0)
	ld	s6, 0x38(a0)
	ld	s7, 0x40(a0)
	ld	s8, 0x48(a0)
	ld	s9, 0x50(a0)
	ld	s10, 0x58(a0)
	ld	s11, 0x60(a0)

	ld	sp, 0x68(a0)

	mv	a0, s0
	mv	a1, s1
	mv	a2, s2
	mv	a3, s3
	ret
