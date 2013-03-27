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

#if !(defined(_WIN32))
#  error This file can only be used on Microsoft Windows systems.
#endif

#include <windows.h>

/**
 * Windows doesn't need a handle to the console,
 * so we just use an arbitrary value instead
 */
static const int default_handle = 42;

int
beep_open() {
    return default_handle;
    }

int
beep_do(handle_t handle, double freq, double len) {
    /* Check the user passed in the same handle we gave them earlier */
    if (handle != default_handle)
        FAIL;

    /* Perform the beep */
    Beep((DWORD) freq, (DWORD) (len * 1000));

    /* Return the handle */
    return handle;
    }

void
beep_close(handle_t handle) {
    /* Turn off the speaker, if it is running */
    Beep(0, 0);
    }
