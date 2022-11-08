/******************************************************************
* File name: RGB8x10_example2.cpp
* Version: v1.0.2
* DEV: GitHub@Rr42
* Description:
*  Example program for the 8x10 RGB LED display that turns
*   on all LEDs with solid colors.
*   SEIZURE WARNING!
******************************************************************/

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
RGBDisplay my_display;

/* On frame */
const uint16_t on[LINE_COUNT] = { 0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111};

/* Off frame */
uint16_t off[LINE_COUNT] = { 0b0000000000,  // 0
                             0b0000000000,  // 1
                             0b0000000000,  // 2
                             0b0000000000,  // 3
                             0b0000000000,  // 4
                             0b0000000000,  // 5
                             0b0000000000,  // 6
                             0b0000000000}; // 7
//                             0123456789

/* Color ID */
uint8_t color_id = 0;

void setup() {
    /* Initialise with custom brightness and frame rate */
    my_display.initialise(BRIGHTNESS, FRAME_RATE);
}

void loop() {
    switch (color_id)
    {
        case 0: // 000
            my_display.showFrame(off, off, off, 1);
            break;
        case 1: // 001
            my_display.showFrame(off, off, on, 1);
            break;
        case 2: // 010
            my_display.showFrame(off, on, off, 1);
            break;
        case 3: // 011
            my_display.showFrame(off, on, on, 1);
            break;
        case 4: // 100
            my_display.showFrame(on, off, off, 1);
            break;
        case 5: // 101
            my_display.showFrame(on, off, on, 1);
            break;
        case 6: // 110
            my_display.showFrame(on, on, off, 1);
            break;
        case 7: // 111
            my_display.showFrame(on, on, on, 1);
            break;
    }
    /* Iterate through the different colors and overflow back to 0 after 7 */
    color_id++;
}

int main() {
    /* Setup stuff */
    setup();

    /* Run the display in an infinite loop */
    while (true)
        loop();

    /* Return with 0 status */
    return 0;
}
