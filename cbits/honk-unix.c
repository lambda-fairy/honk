/*
 * Copyright 2011 Chris Wong.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "honk.h"

#if !(defined(__unix__) || defined(__unix) || defined(unix))
#  error This file can only be used on POSIX-compatible systems.
#endif

#include <math.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include <sys/ioctl.h>

#if defined(__linux__)
#  include <linux/kd.h>
#elif defined(__FreeBSD__)
#  include <sys/kbio.h>
#endif

#if !defined(KIOCSOUND)
#  error Cannot find the ioctl code for the PC speaker.
#  error Make sure your operating system supports the KIOCSOUND call.
#endif

#define CLOCK_TICK_RATE  1193180
#define freq_to_ticks(x) ((int)(CLOCK_TICK_RATE/(x)))
#define TRY(x) if (x < 0) return -1

/* Sleep for a specified duration in seconds. */
int dsleep(double len);

int
beep_open() {
    /* Open the device */
    int handle = open("/dev/tty0", O_WRONLY);

    /* On success, console_fd >= 0
     * On error, console_fd == -1 */
    return handle;
    }


int
beep_do(const int handle, const double freq, const double len) {
    /* Turn on the PC speaker */
    TRY( ioctl(handle, KIOCSOUND, freq_to_ticks(freq)) );

    /* Wait for the specified duration */
    TRY( dsleep(len) );

    /* Stop the speaker by giving it a period of 0 */
    TRY( ioctl(handle, KIOCSOUND, 0) );

    return handle;
    }


void
beep_close(const int handle) {
    /* Stop it, if it is still playing */
    ioctl(handle, KIOCSOUND, 0);

    /* Then close the fd */
    close(handle);
    }


int
dsleep(const double len) {
    double integral;
    const double fractional = modf(len, &integral);

    const struct timespec req = {
        (time_t) integral,
        (long) (fractional * (1000 * 1000 * 1000))
        };

    return nanosleep(&req, NULL);
    }
