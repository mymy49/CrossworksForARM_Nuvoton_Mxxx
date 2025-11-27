/*
 * Copyright (c) 2024 Yoon-Ki Hong
 *
 * This file is subject to the terms and conditions of the MIT License.
 * See the file "LICENSE" in the main directory of this archive for more details.
 */

#ifndef BSP__H_
#define BSP__H_

#include <stdint.h>

#include <dev/led.h>

#include <mod/spi_tft_lcd/Touch_LCD_Shield_for_Arduino_2_8_inch.h>

#include <gui/FrameBufferRgb565LE.h>

#include <util/Task.h>

#include <util/TaskManager.h>

#include <disp/DisplayLogo.h>

#include <util/TaskManager.h>

extern Touch_LCD_Shield_for_Arduino_2_8_inch lcd;

extern FrameBufferRgb565LE brush;

extern TaskManager displayManager, modeManager;

extern DisplayLogo displayLogo;

void initializeBoard(void);

void fadeinBackLight(void);

void fadeoutBackLight(void);

#endif

