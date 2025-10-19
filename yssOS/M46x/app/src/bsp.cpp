/*
 * Copyright (c) 2024 Yoon-Ki Hong
 *
 * This file is subject to the terms and conditions of the MIT License.
 * See the file "LICENSE" in the main directory of this archive for more details.
 */

#include <bsp.h>
#include <yss/instance.h>

FM24CL04B fram;

GT911 touch;

void initializeBoard(void)
{
	// I2C0 초기화
	I2c::mainConfig_t i2c0Config =
	{
		I2c::SPEED_STANDARD //speed_t speed;
	};
	
	gpioB.setAsAltFunc(4, Gpio::PB4_I2C0_SDA, Gpio::OPEN_DRAIN);
	gpioB.setAsAltFunc(5, Gpio::PB5_I2C0_SCL, Gpio::OPEN_DRAIN);
	
	i2c0.enableClock();
	i2c0.initialize(i2c0Config);
	i2c0.enableInterrupt();

	// I2C1 초기화
	I2c::mainConfig_t i2c1Config =
	{
		I2c::SPEED_STANDARD //speed_t speed;
	};
	
	gpioG.setAsAltFunc(2, Gpio::PG2_I2C1_SCL, Gpio::OPEN_DRAIN);
	gpioG.setAsAltFunc(3, Gpio::PG3_I2C1_SDA, Gpio::OPEN_DRAIN);
	
	i2c1.enableClock();
	i2c1.initialize(i2c1Config);
	i2c1.enableInterrupt();

	// FRAM 초기화
	FM24CL04B::config_t framConfig = 
	{
		i2c0,			//I2c &peri;
		{&gpioB, 3},	//pin_t writeProtectPin;
		0				//uint8_t addr;
	};

	gpioB.setAsOutput(3);

	fram.initialize(framConfig);

	// CTOUCH 초기화
	gpioA.setAsOutput(10);
	gpioA.setOutput(10, false);

	GT911::config_t touchConfig = 
	{
		i2c1,			//I2c &peri;
		{&gpioB, 6},	//pin_t isrPin;
		{&gpioA, 10},	//pin_t resetPin;
		{480, 272}		//Size_t size;
	};
	gpioB.enableInterrupt();

	touch.initialize(touchConfig);
}

