/******************************************************************
* File name: RGB8x10_display_lib.cpp
* Version: v1.2
* DEV: GitHub@Rr42
* Description:
*  Display library implementation for the 8x10 RGB LED display.
******************************************************************/

#include "USBC_DB_lib.hpp"

/* Next scan line data */
#define LAST_LINE LINE_COUNT
#define FIRST_LINE 1

/* Macro for setup delay */
#define SETUP_DELAY() {delayMicroseconds(1);}

/* Macro to send line select data to display */
#define SEND_H(dat) { \
    digitalWrite(this->HSYNC, LOW); \
    digitalWrite(this->VSYNC, LOW); \
    digitalWrite(this->DATA, dat); \
    SETUP_DELAY(); \
    digitalWrite(this->HSYNC, HIGH); \
    SETUP_DELAY(); \
    digitalWrite(this->HSYNC, LOW); \
    }

/* Constructor to set default values when object is created */
RGBDisplay::RGBDisplay() : RESET(DEFAULT_RESET_PIN), EOUT(DEFAULT_EOUT_PIN),
                           DCLK(DEFAULT_DCLK_PIN), VSYNC(DEFAULT_VSYNC_PIN),
                           HSYNC(DEFAULT_HSYNC_PIN), DATA(DEFAULT_DATA_PIN) {
    /* Set 100% brightness by default */
    this->brightness = 0;
    /* Set starting line number */
    this->next_line = FIRST_LINE;
    /* Set default refresh rate */
    this->setRefreshRate(DEFAULT_REFRESH_RATE);
}

/* Constructor to set default values when object is created
* Overload to allow reassignment of pins */
RGBDisplay::RGBDisplay(uint8_t RESET, uint8_t EOUT, uint8_t DCLK, uint8_t VSYNC, uint8_t HSYNC, uint8_t DATA) : RESET(RESET), EOUT(EOUT), DCLK(DCLK), VSYNC(VSYNC), HSYNC(HSYNC), DATA(DATA) {
    /* Set 100% brightness by default */
    this->brightness = 0;
    /* Set starting line number */
    this->next_line = FIRST_LINE;
    /* Set default refresh rate */
    this->setRefreshRate(DEFAULT_REFRESH_RATE);
}

RGBDisplay::~RGBDisplay() {
}

/* Method to initialise display with default values */
void RGBDisplay::initialise() {
    /* Set output mode for all connector pins */
    pinMode(this->RESET, OUTPUT);
    pinMode(this->EOUT, OUTPUT);
    pinMode(this->DCLK, OUTPUT);
    pinMode(this->VSYNC, OUTPUT);
    pinMode(this->HSYNC, OUTPUT);
    pinMode(this->DATA, OUTPUT);
    /* Initialise all pins */
    digitalWrite(this->RESET, LOW);
    digitalWrite(this->EOUT, HIGH);
    digitalWrite(this->DCLK, LOW);
    digitalWrite(this->VSYNC, LOW);
    digitalWrite(this->HSYNC, LOW);
    digitalWrite(this->DATA, LOW);

    /* Wait for some time */
    SETUP_DELAY();
    /* Reset display */
    this->displayReset();
}

/* Method to initialise display with user defined brightness and refresh rate */
void RGBDisplay::initialise(float brightness, float refresh_rate) {
        /* Set output mode for all connector pins */
    pinMode(this->RESET, OUTPUT);
    pinMode(this->EOUT, OUTPUT);
    pinMode(this->DCLK, OUTPUT);
    pinMode(this->VSYNC, OUTPUT);
    pinMode(this->HSYNC, OUTPUT);
    pinMode(this->DATA, OUTPUT);
    /* Initialise all pins */
    digitalWrite(this->RESET, LOW);
    digitalWrite(this->EOUT, HIGH);
    digitalWrite(this->DCLK, LOW);
    digitalWrite(this->VSYNC, LOW);
    digitalWrite(this->HSYNC, LOW);
    digitalWrite(this->DATA, LOW);

    /* Set brightness */
    this->setBrightness(brightness);
    /* Set refresh rate */
    this->setRefreshRate(refresh_rate);

    /* Wait for some time */
    SETUP_DELAY();
    /* Reset display */
    this->displayReset();
}

/* Method to set display brightness (Requires EOUT pin to be PWM compatable) */
void RGBDisplay::setBrightness(float brightness) {
    // if (digitalPinToTimer(this->EOUT) != NOT_ON_TIMER)
    this->brightness = 255*(1-brightness);
}

/* Method to set targeted refresh rate (may not always archive the set refresh rate) */
void RGBDisplay::setRefreshRate(float refresh_rate) {
    this->refresh_rate = refresh_rate;
    if (this->refresh_rate > 625)
        /* Cap maximum refresh rate to 625Hz (maximum measured refresh rate) */
        this->line_time_delay = 0;
    else if (this->refresh_rate < 2)
        /* Cap minimum refresh rate to 2Hz (minimum measured 7.5Hz) */
        this->line_time_delay = (uint16_t) 65535;
    else
        this->line_time_delay = (((1.0/this->refresh_rate)/8.0)-PARASITIC_LINE_TIME*1E-6)*1E+6;
}

/* Method to return the set line delay time */
uint16_t RGBDisplay::getLineDelay() {
    return this->line_time_delay;
}

/* Method to show a frame for a given period of time in seconds */
void RGBDisplay::showFrame(const uint8_t frame[COLOR_COUNT][LINE_COUNT][LINE_LENGTH], float time) {
    /* Calculate number of frames to be displayed to match time interval */
    uint16_t switch_count_max = time/(1.0/this->refresh_rate);
    /* Initialise frame switching */
    uint16_t switch_count = 0;
    /* Display frame till specified time runs out by counting frames */
    while (++switch_count < switch_count_max) {
        /* Loop through each line in frame */
        for (uint8_t i=0; i<LINE_COUNT; ++i) {
            /* Send ith line to display */
            this->sendLine(frame[RED][i], frame[GREEN][i], frame[BLUE][i]);
            /* Show line */
            this->displayRefresh();
            /* Wait to match refresh rate */
            delayMicroseconds(this->line_time_delay);
        }
    }
}

/* Method to show a frame for a given period of time in seconds
* Overloaded form to take separate RGB frames */
void RGBDisplay::showFrame(const uint8_t rframe[LINE_COUNT][LINE_LENGTH], const uint8_t gframe[LINE_COUNT][LINE_LENGTH], const uint8_t bframe[LINE_COUNT][LINE_LENGTH], float time) {
    /* Calculate number of frames to be displayed to match time interval */
    uint16_t switch_count_max = time/(1.0/this->refresh_rate);
    /* Initialise frame switching */
    uint16_t switch_count = 0;
    /* Display frame till specified time runs out by counting frames */
    while (++switch_count < switch_count_max) {
        /* Loop through each line in frame */
        for (uint8_t i=0; i<LINE_COUNT; ++i) {
            /* Send ith line to display */
            this->sendLine(rframe[i], gframe[i], bframe[i]);
            /* Show line */
            this->displayRefresh();
            /* Wait to match refresh rate */
            delayMicroseconds(this->line_time_delay);
        }
    }
}

/* Method to show a frame for a given period of time in seconds
* Overloaded form to use white as default color */
void RGBDisplay::showFrame(const uint8_t frame[LINE_COUNT][LINE_LENGTH], float time) {
    /* Calculate number of frames to be displayed to match time interval */
    uint16_t switch_count_max = time/(1.0/this->refresh_rate);
    /* Initialise frame switching */
    uint16_t switch_count = 0;
    /* Display frame till specified time runs out by counting frames */
    while (++switch_count < switch_count_max) {
        /* Loop through each line in frame */
        for (uint8_t i=0; i<LINE_COUNT; ++i) {
            /* Send ith line to display */
            this->sendLine(frame[i]);
            /* Show line */
            this->displayRefresh();
            /* Wait to match refresh rate */
            delayMicroseconds(this->line_time_delay);
        }
    }
}

/* Method to show a frame for a given period of time in seconds.
* Overloaded form to accept bit arrays */
void RGBDisplay::showFrame(const uint16_t frame[COLOR_COUNT][LINE_COUNT], float time) {
    /* Calculate number of frames to be displayed to match time interval */
    uint16_t switch_count_max = time/(1.0/this->refresh_rate);
    /* Initialise frame switching */
    uint16_t switch_count = 0;
    /* Display frame till specified time runs out by counting frames */
    while (++switch_count < switch_count_max) {
        /* Loop through each line in frame */
        for (uint8_t i=0; i<LINE_COUNT; ++i) {
            /* Send ith line to display */
            this->sendLine(frame[RED][i], frame[GREEN][i], frame[BLUE][i]);
            /* Show line */
            this->displayRefresh();
            /* Wait to match refresh rate */
            delayMicroseconds(this->line_time_delay);
        }
    }
}

/* Method to show a frame for a given period of time in seconds.
* Overloaded form to accept bit arrays (separate RGB frames) */
void RGBDisplay::showFrame(const uint16_t rframe[LINE_COUNT], const uint16_t gframe[LINE_COUNT], const uint16_t bframe[LINE_COUNT], float time) {
    /* Calculate number of frames to be displayed to match time interval */
    uint16_t switch_count_max = time/(1.0/this->refresh_rate);
    /* Initialise frame switching */
    uint16_t switch_count = 0;
    /* Display frame till specified time runs out by counting frames */
    while (++switch_count < switch_count_max) {
        /* Loop through each line in frame */
        for (uint8_t i=0; i<LINE_COUNT; ++i) {
            /* Send ith line to display */
            this->sendLine(rframe[i], gframe[i], bframe[i]);
            /* Show line */
            this->displayRefresh();
            /* Wait to match refresh rate */
            delayMicroseconds(this->line_time_delay);
        }
    }
}

/* Method to show a frame for a given period of time in seconds.
* Overloaded form to accept bit arrays and use white as default color */
void RGBDisplay::showFrame(const uint16_t frame[LINE_COUNT], float time) {
    /* Calculate number of frames to be displayed to match time interval */
    uint16_t switch_count_max = time/(1.0/this->refresh_rate);
    /* Initialise frame switching */
    uint16_t switch_count = 0;
    /* Display frame till specified time runs out by counting frames */
    while (++switch_count < switch_count_max) {
        /* Loop through each line in frame */
        for (uint8_t i=0; i<LINE_COUNT; ++i) {
            /* Send ith line to display */
            this->sendLine(frame[i]);
            /* Show line */
            this->displayRefresh();
            /* Wait to match refresh rate */
            delayMicroseconds(this->line_time_delay);
        }
    }
}

/* Method to send line data to display */
void RGBDisplay::sendLine(const uint8_t rline[LINE_LENGTH], const uint8_t gline[LINE_LENGTH], const uint8_t bline[LINE_LENGTH]) {
    /* Prep for sending line data to display */
    digitalWrite(this->HSYNC, LOW);
    digitalWrite(this->VSYNC, LOW);
    digitalWrite(this->DCLK, LOW);

    /* Send data to display back to front to match orientation */
    for (int i=LINE_LENGTH-1; i>=0; --i) {
        // Send the red value
        digitalWrite(this->DATA, !rline[i]);
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
        // Send the green value
        digitalWrite(this->DATA, !gline[i]);
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
        // Send the blue value
        digitalWrite(this->DATA, !bline[i]);
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
    }
    /* Cleanup */
    digitalWrite(this->DATA, LOW);
}

/* Method to send line data to display
* Overloaded form to use white as default color */
void RGBDisplay::sendLine(const uint8_t line[LINE_LENGTH]) {
    /* Prep for sending line data to display */
    digitalWrite(this->HSYNC, LOW);
    digitalWrite(this->VSYNC, LOW);
    digitalWrite(this->DCLK, LOW);

    /* Send data to display back to front to match orientation */
    for (int i=LINE_LENGTH-1; i>=0; --i) {
        // Send the red value
        digitalWrite(this->DATA, !line[i]);
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
        // Send the green value
        digitalWrite(this->DATA, !line[i]);
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
        // Send the blue value
        digitalWrite(this->DATA, !line[i]);
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
    }
    /* Cleanup */
    digitalWrite(this->DATA, LOW);
}

/* Method to send line data to display.
* Overloaded form to accept bit arrays */
void RGBDisplay::sendLine(const uint16_t rline, const uint16_t gline, const uint16_t bline) {
    /* Prep for sending line data to display */

    digitalWrite(this->HSYNC, LOW);
    digitalWrite(this->VSYNC, LOW);
    digitalWrite(this->DCLK, LOW);

    /* Send data to display back to front to match orientation */
    for (uint16_t i=0x1; i<=1<<(LINE_LENGTH-1); i<<=1) {
        // Send the red value
        digitalWrite(this->DATA, !(rline&i));
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
        // Send the green value
        digitalWrite(this->DATA, !(gline&i));
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
        // Send the blue value
        digitalWrite(this->DATA, !(bline&i));
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
    }
    /* Cleanup */
    digitalWrite(this->DATA, LOW);
}

/* Method to send line data to display.
* Overloaded form to accept bit arrays and use white as default color */
void RGBDisplay::sendLine(const uint16_t line) {
    /* Prep for sending line data to display */

    digitalWrite(this->HSYNC, LOW);
    digitalWrite(this->VSYNC, LOW);
    digitalWrite(this->DCLK, LOW);

    /* Send data to display back to front to match orientation */
    for (uint16_t i=0x1; i<=1<<(LINE_LENGTH-1); i<<=1) {
        // Send the red value
        digitalWrite(this->DATA, !(line&i));
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
        // Send the green value
        digitalWrite(this->DATA, !(line&i));
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
        // Send the blue value
        digitalWrite(this->DATA, !(line&i));
        SETUP_DELAY();
        digitalWrite(this->DCLK, HIGH);
        SETUP_DELAY();
        digitalWrite(this->DCLK, LOW);
    }
    /* Cleanup */
    digitalWrite(this->DATA, LOW);
}

/* Method to select next line (loop if end) */
void RGBDisplay::nextLine() {
    /* Select next scan line */
    switch (this->next_line)
    {
    case FIRST_LINE:
        /* Send HIGH signal to start scanning display */
        SEND_H(HIGH);
        /* Shift to select first line */
        SEND_H(LOW);
        break;
    default:
        /* Shift to select next line */
        SEND_H(LOW);
        break;
    }
    /* Increment line number or loop back to first line */
    if (++this->next_line > LAST_LINE)
        this->next_line = FIRST_LINE;
}

/* Method to reset all display LEDs */
void RGBDisplay::displayReset() {
    /* Disable line output */
    digitalWrite(this->EOUT, HIGH);
    /* Prep for sending reset signal */
    digitalWrite(this->VSYNC, LOW);
    digitalWrite(this->HSYNC, LOW);
    digitalWrite(this->DCLK, LOW);
    digitalWrite(this->DATA, LOW);
    /* Send reset signal */
    digitalWrite(this->RESET, LOW);
    SETUP_DELAY();
    digitalWrite(this->RESET, HIGH);
    /* Reset next line number */
    this->next_line = FIRST_LINE;
    /* Enable output */
    analogWrite(this->EOUT, this->brightness);
}

/* Method to update display to show latest data */
void RGBDisplay::displayRefresh() {
    /* Disable line output */
    digitalWrite(this->EOUT, HIGH);
    /* Move to next line */
    this->nextLine();
    /* Latch new data to output */
    digitalWrite(this->VSYNC, LOW);
    SETUP_DELAY();
    digitalWrite(this->VSYNC, HIGH);
    SETUP_DELAY();
    digitalWrite(this->VSYNC, LOW);
    SETUP_DELAY();
    /* Enable output */
    analogWrite(this->EOUT, this->brightness);
}
