/*
 * Convert SysV calling convention to EFI x86_64 calling convention
 *
 *  Copyright (C) 2007-2010 Intel Corp
 *	Bibo Mao <bibo.mao@intel.com>
 *	Chandramouli Narayanan<mouli@linux.intel.com>
 *	Huang Ying <ying.huang@intel.com>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 */

#include "efi.h"
#include "efistdarg.h"

UINT64 efi_call0(void *func);
UINT64 efi_call1(void *func, UINT64 arg1);
UINT64 efi_call2(void *func, UINT64 arg1, UINT64 arg2);
UINT64 efi_call3(void *func, UINT64 arg1, UINT64 arg2, UINT64 arg3);
UINT64 efi_call4(void *func, UINT64 arg1, UINT64 arg2, UINT64 arg3,
		 UINT64 arg4);
UINT64 efi_call5(void *func, UINT64 arg1, UINT64 arg2, UINT64 arg3,
		 UINT64 arg4, UINT64 arg5);
UINT64 efi_call6(void *func, UINT64 arg1, UINT64 arg2, UINT64 arg3,
		 UINT64 arg4, UINT64 arg5, UINT64 arg6);
UINT64 efi_call7(void *func, UINT64 arg1, UINT64 arg2, UINT64 arg3,
		 UINT64 arg4, UINT64 arg5, UINT64 arg6, UINT64 arg7);
UINT64 efi_call8(void *func, UINT64 arg1, UINT64 arg2, UINT64 arg3,
		 UINT64 arg4, UINT64 arg5, UINT64 arg6, UINT64 arg7,
		 UINT64 arg8);
UINT64 efi_call9(void *func, UINT64 arg1, UINT64 arg2, UINT64 arg3,
		 UINT64 arg4, UINT64 arg5, UINT64 arg6, UINT64 arg7,
		 UINT64 arg8, UINT64 arg9);
UINT64 efi_call10(void *func, UINT64 arg1, UINT64 arg2, UINT64 arg3,
		 UINT64 arg4, UINT64 arg5, UINT64 arg6, UINT64 arg7,
		 UINT64 arg8, UINT64 arg9, UINT64 arg10);

#define EFI_ARG_NUM_MAX 10

EFI_STATUS uefi_call_wrapper(void *fp, unsigned long va_num, ...)
{
	va_list ap;
	int i;
	unsigned long args[EFI_ARG_NUM_MAX];

	if (va_num > EFI_ARG_NUM_MAX || va_num < 0) {
		return EFI_LOAD_ERROR;
	}
	va_start(ap, va_num);
	for (i = 0; i < va_num; i++) {
		args[i] = va_arg(ap, UINT64);
	}
	va_end(ap);
	/* As the number of args grows extend it appropriately */
	switch (va_num) {
	case 0:
		return efi_call0(fp);
	case 1:
		return efi_call1(fp, args[0]);
	case 2:
		return efi_call2(fp,
				 args[0], args[1]);
	case 3:
		return efi_call3(fp,
				 args[0], args[1], args[2]);
	case 4:
		return efi_call4(fp,
				 args[0], args[1], args[2], args[3]);
	case 5:
		return efi_call5(fp,
				 args[0], args[1], args[2], args[3],
				 args[4]);
	case 6:
		return efi_call6(fp,
				 args[0], args[1], args[2], args[3],
				 args[4], args[5]);
	case 7:
		return efi_call7(fp,
				 args[0], args[1], args[2], args[3],
				 args[4], args[5], args[6]);
	case 8:
		return efi_call8(fp,
				 args[0], args[1], args[2], args[3],
				 args[4], args[5], args[6], args[7]);
	case 9:
		return efi_call9(fp,
				 args[0], args[1], args[2], args[3],
				 args[4], args[5], args[6], args[7],
				 args[8]);
	case 10:
		return efi_call10(fp,
				  args[0], args[1], args[2], args[3],
				  args[4], args[5], args[6], args[7],
				  args[8], args[9]);
	default:
		return EFI_LOAD_ERROR;
	}
}
