/*
 * Copyright (c) 2023 Yoon-Ki Hong
 *
 * This file is subject to the terms and conditions of the MIT License.
 * See the file "LICENSE" in the main directory of this archive for more details.
 */

#ifndef DEV_LED__H_
#define DEV_LED__H_

namespace led
{
	void initialize(void) __attribute__((optimize("-O1")));

	void setLedR(bool on) __attribute__((optimize("-O1")));

	void setLedY(bool on) __attribute__((optimize("-O1")));

	void setLedG(bool on) __attribute__((optimize("-O1")));
}

#endif

