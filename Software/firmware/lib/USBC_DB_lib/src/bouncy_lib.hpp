/******************************************************************
* File name: bouncy.hpp
* Version: v1.0.1
* DEV: GitHub@Rr42
* Description:
*  Bouncy program header.
******************************************************************/
#pragma once

/* Includes */
#include <USBC_DB_lib.hpp>

/* Frames for playing bouncy */
/* Starting frame with borders in white */
extern const uint16_t bouncy_start[COLOR_COUNT][LINE_COUNT];

/* Frame buffer */
extern uint16_t bouncy_buffer[COLOR_COUNT][LINE_COUNT];

/* Bounce logic */
#define X_MAX LINE_LENGTH-1
#define X_MIN 0
#define Y_MAX LINE_COUNT-1
#define Y_MIN 0
/* Directions:
* 1 2 3 | -1 -1 -1 | -1 00 +1
* 4   5 | 00 dy 00 | -1 dx +1
* 6 7 8 | +1 +1 +1 | -1 00 +1
*/
extern struct positionVector ball;

/* Function to move the ball */
void move_ball(bool reflect=false);

/* Function to initialize the bouncy ball */
void init_bouncy(void);
