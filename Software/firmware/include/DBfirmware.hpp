/******************************************************************
* File name: bouncy.hpp
* Version: v1.0
* DEV: GitHub@Rr42
* Description:
*  Firmware header for the USB-C-DB board (8x10 RGB LED display).
*   SEIZURE WARNING!
******************************************************************/
#pragma once

/* Includes */
#include <USBC_DB_lib.hpp>
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

/* Display brightness (0 to 1) */
/* For the RGB display the set brightness refers to the
*  maximum brightness of the display as the user has the
*  capability to reduce the brightness manually */
#define BRIGHTNESS 1
/* Display frame rate */
#define FRAME_RATE 75
/* Duration of time to wait before switching to next updated buffer */
#define BUFFER_REFRESH_DELAY 0.15

/* WebServer port */
#define WEB_PORT 80

/* WiFi settings 
* IP Address: 192.168.1.1 */
#define WiFi_AP_SSID "USB-C DB"
#define WiFi_AP_PSWD "12345678"

/* Create Display driver object */
extern RGBDisplay my_display;

/* IP Address details */
extern IPAddress local_ip;
extern IPAddress gateway;
extern IPAddress subnet;

/* Create WebServer object */
extern ESP8266WebServer server;

/* Global variables */
extern bool LED1status;
extern bool LED2status;

/* Display frames */
/* On frame */
extern const uint16_t on[LINE_COUNT];
/* Off frame */
extern uint16_t off[LINE_COUNT];

/* HTML page generator */
String SendHTML(uint8_t led1stat, uint8_t led2stat);

/* Web rout handles */
void handle_OnConnect(void);
void handle_led1on(void);
void handle_led1off(void);
void handle_led2on(void);
void handle_led2off(void);
void handle_NotFound(void);

/* Core functions */
void setup(void);
void loop(void);
void cleanup(void);
int main(void);
