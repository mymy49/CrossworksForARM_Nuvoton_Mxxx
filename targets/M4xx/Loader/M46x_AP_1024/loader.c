/*****************************************************************************
 * Copyright (c) 2023 Rowley Associates Limited.                             *
 *                                                                           *
 * This file may be distributed under the terms of the License Agreement     *
 * provided with this software.                                              *
 *                                                                           *
 * THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND, INCLUDING THE   *
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. *
 *                                                                           *
 *****************************************************************************/

#include <libmem.h>
#include <libmem_loader.h>
#include <NuMicro.h>
#include "libmem_m4xx.h"

extern uint8_t __RAM_segment_start__;
extern uint8_t __RAM_segment_used_end__;
extern uint8_t __RAM_segment_end__;

//uint16_t data[0x800];

int main(uint32_t flags, uint32_t param)
{
  int res;
  uint32_t fosc = flags & LIBMEM_RPC_LOADER_FLAG_PARAM ? param : 0;
  const char *error_string = 0;
  libmem_driver_handle_t flash1_handle;

  /* Configure target if loader is not required to preserve target state */
  if ((flags & LIBMEM_RPC_LOADER_FLAG_PRESERVE_STATE) == 0)
    SystemInit();

  /* Register M43x internal FLASH driver */
  res = libmem_m480_register_internal_flash_driver(&flash1_handle, fosc);
	
  /* Start loader */
  if (res == LIBMEM_STATUS_SUCCESS)
    res = libmem_rpc_loader_start(&__RAM_segment_used_end__, &__RAM_segment_end__ - 1);

  /* Terminate loader */
  libmem_rpc_loader_exit(res, error_string);

  return 0;
}
