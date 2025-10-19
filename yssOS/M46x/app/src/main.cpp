/*
 * Copyright (c) 2025 Yoon-Ki Hong
 *
 * This file is subject to the terms and conditions of the MIT License.
 * See the file "LICENSE" in the main directory of this archive for more details.
 */

#include <yss.h>
#include <bsp.h>
#include <yss/debug.h>
#include <util/runtime.h>
#include <string.h>

#define SIZE 32

triggerId_t gId;

int main(void)
  {
	uint8_t data[SIZE];

	// 운영체체 초기화
	initializeYss();

	// 보드 초기화
	initializeBoard();
	
	for(uint32_t i = 0; i < SIZE; i++)
		data[i] = i;
	fram.writeBytes(0, data, SIZE);

	memset(data, 0, SIZE); 
	fram.readBytes(0, data, SIZE);
	
	for(uint32_t i = 0; i < SIZE; i++)
		debug_printf("%d\n", data[i]);
	
	debug_printf("%d\r", clock.getHclkClockFrequency());

	while(1)
	{
		//debug_printf("%d\r", (uint32_t)runtime::getMsec());
		thread::yield();
	}
}


