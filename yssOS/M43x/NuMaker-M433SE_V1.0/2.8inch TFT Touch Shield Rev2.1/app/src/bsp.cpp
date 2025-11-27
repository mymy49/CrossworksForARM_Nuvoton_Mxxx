/*
 * Copyright (c) 2024 Yoon-Ki Hong
 *
 * This file is subject to the terms and conditions of the MIT License.
 * See the file "LICENSE" in the main directory of this archive for more details.
 */

#include <bsp.h>
#include <yss/instance.h>

Touch_LCD_Shield_for_Arduino_2_8_inch lcd;

FrameBufferRgb565LE brush;

TaskManager displayManager(10), modeManager(10);

DisplayLogo displayLogo;

void initializeBoard(void)
{
	// LED 초기화
	led::initialize();

	// SPI1 초기화
	gpioC.setAsAltFunc(1, Gpio::PC1_SPI1_CLK);
	gpioC.setAsAltFunc(2, Gpio::PC2_SPI1_MOSI);
	gpioC.setAsAltFunc(3, Gpio::PC3_SPI1_MISO);
	
	Spi::config_t spi0Config = 
	{
		Spi::MODE_MAIN
	};

	spi1.enableClock();
	spi1.initialize(spi0Config);
	spi1.enableInterrupt();

	// BPWM0 초기화
	//gpioA.setAsOutput(4);
	//gpioA.setOutput(4, true);
	gpioA.setAsAltFunc(4, Gpio::PA4_BPWM0_CH4);		// PA8을 BPWM0 CH4으로 설정

	bpwm0.enableClock();							// BPWM0의 클럭 활성화
	bpwm0.initialize(1000);							// BPWM0의 출력 주기를 1kHz로 초기화
	bpwm0.setAsPwmOutput(4);						// BPWM0의 CH4를 PWM 비반전 출력으로 설정
	bpwm0.start();									// 타이머 카운터 시작

	bpwm0.setDutyRatio(4, 0.0f);						// BPWM0 CH4의 출력 듀티비를 50%로 설정

	// LCD 초기화
	gpioA.setAsOutput(3);	// CS
	gpioA.setAsOutput(6);	// DC

	Touch_LCD_Shield_for_Arduino_2_8_inch::config_t lcdConfig =
	{
		spi1,			//Spi &peri;
		{&gpioA, 3},	//pin_t chipSelect;
		{&gpioA, 6},	//pin_t dataCommand;
		{0, 0}			//pin_t reset;
	};
	
	brush.malloc(5000);

	lcd.initialize(lcdConfig);
	lcd.setFrameBuffer(brush);
	lcd.setBackgroundColor({0xFF, 0xFF, 0xFF});
	lcd.clear();
}

void setLcdBackLight(float dimming)
{
	bpwm0.setDutyRatio(4, dimming);
}

void fadeinBackLight(void)
{
	// 백라이트를 Fade in 한다.
	for(uint32_t i=0;i<=100;i++)
	{
		setLcdBackLight((float)i/100.f);
		thread::delay(5);
	}
}

void fadeoutBackLight(void)
{
	// 백라이트를 Fade out 한다.
	for(uint32_t i=0;i<=100;i++)
	{
		setLcdBackLight((float)(100-i)/100.f);
		thread::delay(5);
	}
}