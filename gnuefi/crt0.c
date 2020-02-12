// SPDX-License-Identifier:
/*
 * crt0.c
 * Copyright 2020 Peter Jones <pjones@redhat.com>
 *
 */

#include <efi.h>
#include <efilib.h>

#pragma GCC optimize "-O0"

EFI_STATUS
_start(EFI_HANDLE image, EFI_SYSTEM_TABLE *systab)
{
	EFI_STATUS status;

	status = _entry(image, systab);

	return status;
}

// vim:fenc=utf-8:tw=75:noet
