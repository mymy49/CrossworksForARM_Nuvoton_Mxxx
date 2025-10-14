/*
 * Copyright (c) 2024 Yoon-Ki Hong
 *
 * This file is subject to the terms and conditions of the MIT License.
 * See the file "LICENSE" in the main directory of this archive for more details.
 */

#include <bsp.h>
#include <yss/instance.h>

FM24CL04B fram;

void initializeBoard(void)
{
	// I2C0 초기화
	I2c::mainConfig_t i2c0Config =
	{
		I2c::SPEED_STANDARD //speed_t speed;
	};

	
	gpioB.setAsOutput(3);
	gpioB.setAsAltFunc(4, Gpio::PB4_I2C0_SDA, Gpio::OPEN_DRAIN);
	gpioB.setAsAltFunc(5, Gpio::PB5_I2C0_SCL, Gpio::OPEN_DRAIN);
	
	i2c0.enableClock();
	i2c0.initialize(i2c0Config);
	i2c0.enableInterrupt();

	// FRAM 초기화
	FM24CL04B::config_t framConfig = 
	{
		i2c0,			//I2c &peri;
		{&gpioB, 3},	//pin_t writeProtectPin;
		0				//uint8_t addr;
	};

	fram.initialize(framConfig);
}

