/*
 * Copyright (c) 2025 Yoon-Ki Hong
 *
 * This file is subject to the terms and conditions of the MIT License.
 * See the file "LICENSE" in the main directory of this archive for more details.
 */

#include <disp/DisplayLogo.h>
#include <../bmp/NuvotonLogo.h>
#include <../font/Ubuntu_14_B.h>
#include <../font/Ubuntu_20_B.h>
#include <bsp.h>

DisplayLogo::DisplayLogo(void) : Task(2048)
{

}

DisplayLogo::~DisplayLogo(void)
{

}

void DisplayLogo::thread(void)
{
	// LCD 화면을 구성한다.
	lcd.lock();
	lcd.drawBitmap({20, 30}, NuvotonLogo);

	brush.setSize(240, 20);
	brush.setBackgroundColor({0xFF, 0xFF, 0xFF});
	brush.setBrushColor({0x00, 0x00, 0x00});
	brush.setFont(Font_Ubuntu_14_B);

	brush.clear();
	brush.drawString(Brush::ALIGN_CENTER_MID, "NuMaker-M433SE V1.0");
	lcd.drawBitmap({0, 100}, brush.getBitmap());

	brush.clear();
	brush.drawString(Brush::ALIGN_CENTER_MID, "with");
	lcd.drawBitmap({0, 125}, brush.getBitmap());

	brush.clear();
	brush.drawString(Brush::ALIGN_CENTER_MID, "2.8inch TFT Touch Shield");
	lcd.drawBitmap({0, 150}, brush.getBitmap());

	brush.clear();
	brush.drawString(Brush::ALIGN_CENTER_MID, "Powered by yss OS");
	lcd.drawBitmap({0, 280}, brush.getBitmap());

	brush.setFont(Font_Ubuntu_20_B);
	brush.setSize(200, 25);

	brush.clear();
	brush.drawString(Brush::ALIGN_CENTER_MID, "Exameple");
	lcd.drawBitmap({20, 200}, brush.getBitmap());
	lcd.unlock();

	// 백라이트를 Fade in 한다.
	fadeinBackLight();
	
	// 5초간 로고 화면에서 대기한다.
	while(true)
	{
		thread::delay(250);
		brush.clear();
		lcd.lock();
		lcd.drawBitmap({20, 200}, brush.getBitmap());
		lcd.unlock();

		thread::delay(250);
		brush.clear();
		brush.drawString(Brush::ALIGN_CENTER_MID, "Exameple");
		lcd.lock();
		lcd.drawBitmap({20, 200}, brush.getBitmap());
		lcd.unlock();
	}
	
}

void DisplayLogo::terminate(void)
{
	// 백라이트를 Fade out 한다.
	fadeoutBackLight();
}

