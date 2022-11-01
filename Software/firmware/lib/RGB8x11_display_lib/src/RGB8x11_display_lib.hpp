/******************************************************************
* File name: RGB8x10_display_lib.hpp
* Version: v1.0
* DEV: GitHub@Rr42
* Description:
*  Display library header for the 8x10 RGB LED display.
******************************************************************/
// #pragma once

/* Using older include guards just to be safe (for compatability) */
#ifndef __RGB_LED8X11_DISPLAY_LIB__

#define __RGB_LED8X11_DISPLAY_LIB__
#include <Arduino.h>

/* Display size */
#define LINE_LENGTH 10
#define LINE_COUNT 8
#define COLOR_COUNT 3

/* Color definitions */
#define BLUE 0
#define RED 1
#define GREEN 2

/* Refresh rate calibration data */
/* Minimum parasitic time between each line in microseconds */
#define PARASITIC_LINE_TIME 192
/* Minimum parasitic time between each frame in milliseconds (including intermediate resets) */
#define PARASITIC_FRAME_TIME 1.6
/* Targeted default display refresh rate in Hz */
#define DEFAULT_REFRESH_RATE 60

/* Connector length */
#define CON_LEN 6

/* Display driver class */
class RGBDisplay {
private:
    /* Display brightness (0 to 1) */
    /* For the RGB display the set brightness refers to the
    *  maximum brightness of the display as the user has the
    *  capability to reduce the brightness manually */
    float brightness;
    /* Calculated line time used to match delay */
    uint16_t line_time_delay;
    /* Display refresh rate in Hz */
    float refresh_rate;
    /* Storage for next line index */
    uint8_t next_line; // Initialised in setup()
    /* Connector pin map */
    const uint8_t RESET, EOUT, DCLK, VSYNC, HSYNC, DATA;

protected:
    /* Protected function headers */
    void nextLine();

public:
    /* Class constructor */
    RGBDisplay(uint8_t RESET, uint8_t EOUT, uint8_t DCLK, uint8_t VSYNC, uint8_t HSYNC, uint8_t DATA);
    /* Class destructor */
    ~RGBDisplay();

    /* Public function headers */
    void initialise(float brightness, float refresh_rate);
    void showFrame(const uint8_t frame[COLOR_COUNT][LINE_COUNT][LINE_LENGTH], float time);
    void showFrame(const uint16_t frame[COLOR_COUNT][LINE_COUNT], float time);
    /* Overload that takes separate RGB frames */
    void showFrame(const uint8_t bframe[LINE_COUNT][LINE_LENGTH], const uint8_t rframe[LINE_COUNT][LINE_LENGTH], const uint8_t gframe[LINE_COUNT][LINE_LENGTH], float time);
    void showFrame(const uint16_t bframe[LINE_COUNT], const uint16_t rframe[LINE_COUNT], const uint16_t gframe[LINE_COUNT], float time);
    /* Overloads that use white as the default color */
    void showFrame(const uint8_t frame[LINE_COUNT][LINE_LENGTH], float time);
    void showFrame(const uint16_t frame[LINE_COUNT], float time);
    void sendLine(const uint8_t bline[LINE_LENGTH], const uint8_t rline[LINE_LENGTH], const uint8_t gline[LINE_LENGTH]);
    void sendLine(const uint16_t bline, const uint16_t rline, const uint16_t gline);
    /* Overloads that use white as the default color */
    void sendLine(const uint8_t line[LINE_LENGTH]);
    void sendLine(const uint16_t line);
    void setRefreshRate(float refresh_rate);
    void setBrightness(float brightness);
    uint16_t getLineDelay();
    void displayRefresh();
    void displayReset();
    void initialise();
};
#endif
