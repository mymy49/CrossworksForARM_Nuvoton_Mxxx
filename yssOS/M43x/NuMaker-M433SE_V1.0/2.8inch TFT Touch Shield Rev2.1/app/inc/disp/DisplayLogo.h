/*
 * Copyright (c) 2025 Yoon-Ki Hong
 *
 * This file is subject to the terms and conditions of the MIT License.
 * See the file "LICENSE" in the main directory of this archive for more details.
 */

#ifndef DISP_DISPLAY_LOGO__H_
#define DISP_DISPLAY_LOGO__H_

#include <util/Task.h>

class DisplayLogo : public Task
{
public:
	DisplayLogo(void);

	~DisplayLogo(void);

	virtual void terminate(void);

	virtual void thread(void);
};

#endif

 