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
	// GPIO 인터럽트 활성화
#if defined(PA)
	gpioA.enableInterrupt();
#endif
#if defined(PB)
	gpioB.enableInterrupt();
#endif
#if defined(PC)
	gpioC.enableInterrupt();
#endif
#if defined(PD)
	gpioD.enableInterrupt();
#endif
#if defined(PE)
	gpioE.enableInterrupt();
#endif
#if defined(PF)
	gpioF.enableInterrupt();
#endif
#if defined(PG)
	gpioG.enableInterrupt();
#endif
#if defined(PH)
	gpioH.enableInterrupt();
#endif
#if defined(PI)
	gpioI.enableInterrupt();
#endif
#if defined(PJ)
	gpioJ.enableInterrupt();
#endif

	// I2C0 초기화
	I2c::mainConfig_t i2c0Config =
	{
		I2c::SPEED_STANDARD //speed_t speed;
	};
	
	gpioB.setAsAltFunc(4, Gpio::PB4_I2C0_SDA, Gpio::AF_OPEN_DRAIN);
	gpioB.setAsAltFunc(5, Gpio::PB5_I2C0_SCL, Gpio::AF_OPEN_DRAIN);
	
	i2c0.enableClock();
	i2c0.initialize(i2c0Config);
	i2c0.enableInterrupt();

	// I2C1 초기화
	I2c::mainConfig_t i2c1Config =
	{
		I2c::SPEED_STANDARD //speed_t speed;
	};
	
	gpioG.setAsAltFunc(2, Gpio::PG2_I2C1_SCL, Gpio::AF_OPEN_DRAIN);
	gpioG.setAsAltFunc(3, Gpio::PG3_I2C1_SDA, Gpio::AF_OPEN_DRAIN);
	
	i2c1.enableClock();
	i2c1.initialize(i2c1Config);
	i2c1.enableInterrupt();

	// UART0 초기화
	Uart::config_t uart0Config = 
	{
		Uart::UART_MODE_NORMAL,		//mode_t mode;
		115200,						//uint32_t baudrate;
		Uart::UART_STOP_1BIT,		//stopbit_t stopbit;
		nullptr,					//void *rcvBuf;
		128,						//uint32_t rcvBufSize;
		nullptr,					//void (*isrRxData)(uint8_t rxData);
		nullptr,					//void (*isrFrameError)(void);
	};

	gpioA.setAsAltFunc(6, Gpio::PA6_UART0_RXD);
	gpioA.setAsAltFunc(7, Gpio::PA7_UART0_TXD);

	uart0.enableClock();
	uart0.initialize(uart0Config);
	uart0.enableInterrupt();

	// BPWM0 초기화
	gpioA.setAsAltFunc(11, Gpio::PA11_BPWM0_CH0);	// PA11을 BPWM0 CH0으로 설정

	bpwm0.enableClock();							// BPWM0의 클럭 활성화
	bpwm0.initialize(1000);							// BPWM0의 출력 주기를 1kHz로 초기화
	bpwm0.setAsPwmOutput(0);						// BPWM0의 CH0을 PWM 반전 출력으로 설정
	bpwm0.start();									// 타이머 카운터 시작

	bpwm0.setDutyRatio(0, 0.1);						// BPWM0 CH0의 출력 듀티비를 10%로 설정

	// SDH0 초기화
	gpioE.setAsAltFunc(2, Gpio::PE2_SD0_DAT0);
	gpioE.setAsAltFunc(3, Gpio::PE3_SD0_DAT1);
	gpioE.setAsAltFunc(4, Gpio::PE4_SD0_DAT2);
	gpioE.setAsAltFunc(5, Gpio::PE5_SD0_DAT3);
	gpioE.setAsAltFunc(6, Gpio::PE6_SD0_CLK);
	gpioE.setAsAltFunc(7, Gpio::PE7_SD0_CMD);
	gpioD.setAsAltFunc(13, Gpio::PD13_SD0_nCD);

	sdh0.enableClock();
	sdh0.initialize();
	sdh0.enableInterrupt();
	sdh0.setDetectPin({&gpioD, 13});

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
		{&gpioA, 10}	//pin_t resetPin;
	};
	gpioB.enableInterrupt();

	touch.initialize(touchConfig);
}

#if YSS_L_HEAP_USE == true
void initializeSdram(void)
{
	// bss 초기화 전이라 함수 호출이 자유롭지 않습니다.
	// bss 초기화가 필요한 함수 호출은 절대 불가능합니다.

	Gpio::altFuncPackage_t hbiPort[13]
	{
		{PC, 0, Gpio::PC0_HBI_D2},
		{PC, 1, Gpio::PC1_HBI_RWDS},
		{PC, 2, Gpio::PC2_HBI_nRESET},
		{PC, 3, Gpio::PC3_HBI_nCS},
		{PC, 4, Gpio::PC4_HBI_CK},
		{PC, 5, Gpio::PC5_HBI_nCK},
		{PG, 9, Gpio::PG9_HBI_D4},
		{PG, 10, Gpio::PG10_HBI_D3},
		{PG, 11, Gpio::PG11_HBI_D0},
		{PG, 12, Gpio::PG12_HBI_D1},
		{PG, 13, Gpio::PG13_HBI_D5},
		{PG, 14, Gpio::PG14_HBI_D6},
		{PG, 15, Gpio::PG15_HBI_D7}
	};

	gpioA.setPackageAsAltFunc(hbiPort, 13, Gpio::AF_PUSH_PULL, Gpio::SLEWRATE_FAST);

	Hbi::config_t config =
	{
		4,								//float tCSS_min_ns;
		40,								//float tACC_min_ns;
		0,								//float tCSH_min_ns;
		10,								//float tCSHI_min_ns;
		4,								//float tCSM_max_us;
		Hbi::BURST_GROUP_SIZE_32BYTES,	//bustGroupSize_t bgs;5
		8 * 1024 * 1024,				//uint32_t capcacity;
		200 * 1000 * 1000				//uint32_t maxFrequency;
	};

	clock.enableAhb0Clock(CLK_AHBCLK0_HBICKEN_Pos);
	hbi.initialize(config, clock.getHclkClockFrequency());
	nvic.enableInterrupt(HBI_IRQn);
}
#endif

