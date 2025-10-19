/*
 * Copyright (c) 2024 Yoon-Ki Hong
 *
 * This file is subject to the terms and conditions of the MIT License.
 * See the file "LICENSE" in the main directory of this archive for more details.
 */

#ifndef BSP__H_
#define BSP__H_

#include <stdint.h>
#include <mod/fram/FM24CL04B.h>
#include <mod/ctouch/GT911.h>

void initializeBoard(void);

extern FM24CL04B fram;

extern GT911 touch;

#endif

