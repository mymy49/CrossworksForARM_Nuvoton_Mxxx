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
#include <yss/Fat32.h>
#include <yss/Directory.h>
#include <stdio.h>

#define SIZE 32

uint32_t gCnt1;

void isr_timer1(void)
{
	gCnt1++;
}

Fat32 dirFat32(sdh0);
Directory dir(dirFat32);

int main(void)
{
	const char *str = "Hello World!!\n\r";
	uint32_t len = strlen(str);
	uint8_t data[SIZE];
	bool flag, lastDetectFlag = false;

	// 운영체체 초기화
	initializeYss();

	// 보드 초기화
	initializeBoard();

	// TMR1 초기화
	timer1.enableClock();
	timer1.initialize(1000);
	timer1.setIsrForUpdate(isr_timer1);
	timer1.enableInterrupt();
	
	for(uint32_t i = 0; i < SIZE; i++)
		data[i] = i;
	fram.writeBytes(0, data, SIZE);

	memset(data, 0, SIZE); 
	fram.readBytes(0, data, SIZE);
	
	for(uint32_t i = 0; i < SIZE; i++)
		debug_printf("%d\n", data[i]);
	
	debug_printf("%d\n", clock.getPllFrequency());

	while(!sdh0.isConnected())
		thread::yield();

	dir.initialize();
	debug_printf("dir cnt = %d\n", dir.getDirectoryCount());

	while(1)
	{
		thread::yield();
	}
}


