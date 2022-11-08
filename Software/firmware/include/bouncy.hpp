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

/* Display brightness (0 to 1) */
/* For the RGB display the set brightness refers to the
*  maximum brightness of the display as the user has the
*  capability to reduce the brightness manually */
#define BRIGHTNESS 1
/* Display frame rate */
#define FRAME_RATE 75

/* Create Display driver object */
extern RGBDisplay my_display;

/* Frames for playing bouncy */
/* Starting frame with borders in white */
extern const uint16_t start[COLOR_COUNT][LINE_COUNT];

/* Frame buffer */
extern uint16_t buffer[COLOR_COUNT][LINE_COUNT];

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

/* Duration of time to wait before switching to next updated buffer */
#define BUFFER_REFRESH_DELAY 0.15

/* Function to move the ball */
void move_ball(bool reflect=false);

/* Function to initialize the bouncy ball */
void init_bouncy(void);

/* Core functions */
void setup(void);
void loop(void);
int main(void);
