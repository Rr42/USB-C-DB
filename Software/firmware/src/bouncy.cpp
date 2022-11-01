/******************************************************************
* File name: bouncy.cpp
* Version: v1.0
* DEV: GitHub@Rr42
* Description:
*  Program for the 8x11 RGB LED display that shows
*   an animated ball bouncing around in a white box.
*   SEIZURE WARNING!
******************************************************************/

/* Includes */
#include <bouncy.hpp>

/* Display brightness (0 to 1) */
/* For the RGB display the set brightness refers to the
*  maximum brightness of the display as the user has the
*  capability to reduce the brightness manually */
#define BRIGHTNESS 1
/* Display frame rate */
#define FRAME_RATE 75

/* Create Display driver object */
RGBDisplay my_display(
    13, // RESET IO13
    12, // EOUT (Use a PWM compatable pin for brightness control) IO12
    16, // DCLK IO16
     5, // VSYNC IO5
    14, // HSYNC IO14
     4  // DATA IO4
);

/* Frames for playing bouncy */
/* Starting frame with borders in white */
const uint16_t start[COLOR_COUNT][LINE_COUNT] = {{ 0b1111111111,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1111111111},
                                                 { 0b1111111111,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1111111111},
                                                 { 0b1111111111,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1000000001,
                                                   0b1111111111}};

/* Frame buffer */
uint16_t buffer[COLOR_COUNT][LINE_COUNT] = {{ 0b0000000000,
                                              0b0000000000,
                                              0b0000000000,
                                              0b0000000000,
                                              0b0000000000,  // BLUE
                                              0b0000000000,
                                              0b0000000000,
                                              0b0000000000},
                                            { 0b0000000000,
                                              0b0000000000,
                                              0b0000000000,
                                              0b0000000000,
                                              0b0000000000,  // RED
                                              0b0000000000,
                                              0b0000000000,
                                              0b0000000000},
                                            { 0b0000000000,   // 0
                                              0b0000000000,   // 1
                                              0b0000000000,   // 2
                                              0b0000000000,   // 3
                                              0b0000000000,   // 4 GREEN
                                              0b0000000000,   // 5
                                              0b0000000000,   // 6
                                              0b0000000000}}; // 7
//                                              0123456789

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
struct positionVector
{
    /* Init with default starting positions */
    positionVector() : x_pos(5), y_pos(4), x_dir(+1), y_dir(-1) {}
    uint8_t x_pos;
    uint8_t y_pos;
    int8_t x_dir;
    int8_t y_dir;
}ball;

/* Function to move the ball */
void move_ball(bool reflect) {
    
    /* Remove previous position in buffer if ball is not being reflected */
    if (!reflect){
        buffer[RED][ball.y_pos] &= ( ( ~(0x1<<ball.x_pos) )|0b10000000001 );
        buffer[GREEN][ball.y_pos] &= ( ( ~(0x1<<ball.x_pos) )|0b10000000001 );
        buffer[BLUE][ball.y_pos] &= ( ( ~(0x1<<ball.x_pos) )|0b10000000001 );
    }

    /* Move */
    ball.x_pos += ball.x_dir;
    ball.y_pos += ball.y_dir;

    /* Reflect */
    bool move_again = false;
    if (ball.x_pos == X_MAX || ball.x_pos == X_MIN) {
        ball.x_dir *= -1;
        move_again = true;
    }
    if (ball.y_pos == Y_MAX || ball.y_pos == Y_MIN) {
        ball.y_dir *= -1;
        move_again = true;
    }

    /* If an edge was hit move the ball */
    if (move_again)
        move_ball(true);

    /* Set new position in buffer (random color) */
    switch (random(1, 7))
    {
        case 1: // 001
            buffer[RED][ball.y_pos]   |= 0x0;
            buffer[GREEN][ball.y_pos] |= 0x0;
            buffer[BLUE][ball.y_pos]  |= (0x1<<ball.x_pos);
            break;
        case 2: // 010
            buffer[RED][ball.y_pos]   |= 0x0;
            buffer[GREEN][ball.y_pos] |= (0x1<<ball.x_pos);
            buffer[BLUE][ball.y_pos]  |= 0x0;
            break;
        case 3: // 011
            buffer[RED][ball.y_pos]   |= 0x0;
            buffer[GREEN][ball.y_pos] |= (0x1<<ball.x_pos);
            buffer[BLUE][ball.y_pos]  |= (0x1<<ball.x_pos);
            break;
        case 4: // 100
            buffer[RED][ball.y_pos]   |= (0x1<<ball.x_pos);
            buffer[GREEN][ball.y_pos] |= 0x0;
            buffer[BLUE][ball.y_pos]  |= 0x0;
            break;
        case 5: // 101
            buffer[RED][ball.y_pos]   |= (0x1<<ball.x_pos);
            buffer[GREEN][ball.y_pos] |= 0x0;
            buffer[BLUE][ball.y_pos]  |= (0x1<<ball.x_pos);
            break;
        case 6: // 110
            buffer[RED][ball.y_pos]   |= (0x1<<ball.x_pos);
            buffer[GREEN][ball.y_pos] |= (0x1<<ball.x_pos);
            buffer[BLUE][ball.y_pos]  |= 0x0;
            break;
        default: // 111
            buffer[RED][ball.y_pos]   |= (0x1<<ball.x_pos);
            buffer[GREEN][ball.y_pos] |= (0x1<<ball.x_pos);
            buffer[BLUE][ball.y_pos]  |= (0x1<<ball.x_pos);
            break;
    }
}

/* Function to initialize the bouncy ball */
void init_bouncy(){
    /* Set the random seed using a some (hopefully) unconnected pin */
    randomSeed(analogRead(0));

    /* Set a random starting position for the ball */
    ball.x_pos = random(X_MIN+2, X_MAX-2);
    ball.y_pos = random(Y_MIN+2, Y_MAX-2);

    /* Set a random starting direction for the ball */
    switch(random(1, 9)) {
    case 1:
        ball.x_dir=-1;
        ball.y_dir=-1;
        break;
    case 2:
        ball.x_dir=0;
        ball.y_dir=-1;
        break;
    case 3:
        ball.x_dir=+1;
        ball.y_dir=-1;
        break;
    case 4:
        ball.x_dir=-1;
        ball.y_dir=0;
        break;
    case 5:
        ball.x_dir=+1;
        ball.y_dir=0;
        break;
    case 6:
        ball.x_dir=-1;
        ball.y_dir=+1;
        break;
    case 7:
        ball.x_dir=0;
        ball.y_dir=+1;
        break;
    case 8:
        ball.x_dir=+1;
        ball.y_dir=+1;
        break;
    }
}

/* Duration of time to wait before switching to next updated buffer */
#define BUFFER_REFRESH_DELAY 0.15

void setup(void) {
    /* Initialise with custom brightness and frame rate */
    my_display.initialise(BRIGHTNESS, FRAME_RATE);

    /* Initialise bouncy ball */
    init_bouncy();

    /* Load starting frame into buffer */
    for (uint8_t i=0; i<LINE_COUNT; ++i) {
        buffer[RED][i]   = start[RED][i];
        buffer[GREEN][i] = start[GREEN][i];
        buffer[BLUE][i]  = start[BLUE][i];
    }
}

void loop(void) {
    my_display.showFrame(buffer, BUFFER_REFRESH_DELAY);
    move_ball();
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
