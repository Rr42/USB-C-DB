/******************************************************************
* File name: USBC_DB_lib.hpp
* Version: v1.2
* DEV: GitHub@Rr42
* Description:
*  Display library header for the 8x10 RGB LED display.
******************************************************************/
// #pragma once

/* Using older include guards just to be safe (for compatability) */
#ifndef __RGB_LED8x10_DISPLAY_LIB__

#define __RGB_LED8x10_DISPLAY_LIB__
#include <Arduino.h>

/* Display size */
#define LINE_LENGTH 10
#define LINE_COUNT 8
#define COLOR_COUNT 3

/* Color definitions */
#define RED 0
#define GREEN 1
#define BLUE 2

/* Refresh rate calibration data */
/* Minimum parasitic time between each line in microseconds */
#define PARASITIC_LINE_TIME 192
/* Minimum parasitic time between each frame in milliseconds (including intermediate resets) */
#define PARASITIC_FRAME_TIME 1.6
/* Targeted default display refresh rate in Hz */
#define DEFAULT_REFRESH_RATE 60

/* Connector length */
#define CON_LEN 6

/* Default pin assignments */
#define DEFAULT_RESET_PIN 13 // IO13
#define DEFAULT_EOUT_PIN 12  // IO12 PWM compatable pin for brightness control
#define DEFAULT_DCLK_PIN 16  // IO16
#define DEFAULT_VSYNC_PIN 5  // IO5
#define DEFAULT_HSYNC_PIN 14 // IO14
#define DEFAULT_DATA_PIN 4   // IO4

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
    /* Protected method headers */
    void nextLine();

public:
    /* Class constructor with default pin assignments */
    RGBDisplay();
    /* Class constructor
     * Overload to allow reassignment of pins */
    RGBDisplay(uint8_t RESET, uint8_t EOUT, uint8_t DCLK, uint8_t VSYNC, uint8_t HSYNC, uint8_t DATA);
    /* Class destructor */
    ~RGBDisplay();

    /* Public method headers */
    void initialise(float brightness, float refresh_rate);

    /* Method to show a frame for a given period of time in seconds */
    void showFrame(const uint8_t frame[COLOR_COUNT][LINE_COUNT][LINE_LENGTH], float time);
    /* Method to show a frame for a given period of time in seconds.
     * Overloaded form to accept bit arrays */
    void showFrame(const uint16_t frame[COLOR_COUNT][LINE_COUNT], float time);
    /* Overloads that take separate RGB frames */
    void showFrame(const uint8_t rframe[LINE_COUNT][LINE_LENGTH], const uint8_t gframe[LINE_COUNT][LINE_LENGTH], const uint8_t bframe[LINE_COUNT][LINE_LENGTH], float time);
    void showFrame(const uint16_t rframe[LINE_COUNT], const uint16_t gframe[LINE_COUNT], const uint16_t bframe[LINE_COUNT], float time);
    /* Overloads that use white as the default color */
    void showFrame(const uint8_t frame[LINE_COUNT][LINE_LENGTH], float time);
    void showFrame(const uint16_t frame[LINE_COUNT], float time);

    /* Method to send line data to display */
    void sendLine(const uint8_t rline[LINE_LENGTH], const uint8_t gline[LINE_LENGTH], const uint8_t bline[LINE_LENGTH]);
    /* Method to send line data to display.
     * Overloaded form to accept bit arrays */
    void sendLine(const uint16_t rline, const uint16_t gline, const uint16_t bline);
    /* Overloads that use white as the default color */
    void sendLine(const uint8_t line[LINE_LENGTH]);
    void sendLine(const uint16_t line);

    /* Method to set targeted refresh rate (may not always archive the set refresh rate) */
    void setRefreshRate(float refresh_rate);
    /* Method to set display brightness (Requires EOUT pin to be PWM compatable) */
    void setBrightness(float brightness);
    /* Method to return the set line delay time */
    uint16_t getLineDelay();
    /* Method to update display to show latest data */
    void displayRefresh();
    /* Method to reset all display LEDs */
    void displayReset();
    /* Method to initialise display with default values */
    void initialise();
};
#endif
