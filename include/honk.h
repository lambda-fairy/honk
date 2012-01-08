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

/**
 * A handle to the console.
 *
 * All methods except beep_init require a valid non-negative handle as
 * their first argument. A negative return value from these functions
 * indicates an error.
 */
typedef int handle_t;

/**
 * Initialize the beep system, returning a handle to the console on
 * success or -1 on an error.
 */
handle_t beep_open(void);

/**
 * Perform a beep.
 */
handle_t beep_do(handle_t handle, double freq, double len);

/**
 * Close the handle, stopping the speaker if running.
 */
void beep_close(handle_t handle);
