/******************************************************************
* File name: bouncy.cpp
* Version: v1.0
* DEV: GitHub@Rr42
* Description:
*  Firmware for the USB-C-DB board (8x10 RGB LED display).
*   SEIZURE WARNING!
******************************************************************/

/* Includes */
#include <DBfirmware.hpp>

/* WiFi SSID & Password */
inline const char* ssid = WiFi_AP_SSID;
inline const char* password = WiFi_AP_PSWD;

/* IP Address details */
IPAddress local_ip(192,168,1,1);
IPAddress gateway(192,168,1,1);
IPAddress subnet(255,255,255,0);

/* Create Display driver object */
RGBDisplay my_display;

/* Create WebServer object */
ESP8266WebServer server(WEB_PORT);

/* Global variables */
bool LED1status = LOW;
bool LED2status = LOW;

/* Display frames */
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

/* Function definitions */
String SendHTML(uint8_t led1stat,uint8_t led2stat) {
    String ptr = "<!DOCTYPE html> <html>\n";
    ptr +="<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\">\n";
    ptr +="<title>LED Control</title>\n";
    ptr +="<style>html { font-family: Helvetica; display: inline-block; margin: 0px auto; text-align: center;}\n";
    ptr +="body{margin-top: 50px;} h1 {color: #444444;margin: 50px auto 30px;} h3 {color: #444444;margin-bottom: 50px;}\n";
    ptr +=".button {display: block;width: 80px;background-color: #1abc9c;border: none;color: white;padding: 13px 30px;text-decoration: none;font-size: 25px;margin: 0px auto 35px;cursor: pointer;border-radius: 4px;}\n";
    ptr +=".button-on {background-color: #1abc9c;}\n";
    ptr +=".button-on:active {background-color: #16a085;}\n";
    ptr +=".button-off {background-color: #34495e;}\n";
    ptr +=".button-off:active {background-color: #2c3e50;}\n";
    ptr +="p {font-size: 14px;color: #888;margin-bottom: 10px;}\n";
    ptr +="</style>\n";
    ptr +="</head>\n";
    ptr +="<body>\n";
    ptr +="<h1>ESP8266 Web Server</h1>\n";
    ptr +="<h3>Using Access Point(AP) Mode</h3>\n";

    if (led1stat)
        ptr +="<p>LED1 Status: ON</p><a class=\"button button-off\" href=\"/led1off\">OFF</a>\n";
    else
        ptr +="<p>LED1 Status: OFF</p><a class=\"button button-on\" href=\"/led1on\">ON</a>\n";

    if (led2stat)
        ptr +="<p>LED2 Status: ON</p><a class=\"button button-off\" href=\"/led2off\">OFF</a>\n";
    else
        ptr +="<p>LED2 Status: OFF</p><a class=\"button button-on\" href=\"/led2on\">ON</a>\n";

    ptr +="</body>\n";
    ptr +="</html>\n";
    return ptr;
}

/* Web rout handles */
void handle_OnConnect() {
    LED1status = LOW;
    LED2status = LOW;
    server.send(200, "text/html", SendHTML(LED1status,LED2status)); 
}

void handle_led1on() {
    LED1status = HIGH;
    server.send(200, "text/html", SendHTML(true,LED2status)); 
}

void handle_led1off() {
  LED1status = LOW;
  server.send(200, "text/html", SendHTML(false,LED2status)); 
}

void handle_led2on() {
    LED2status = HIGH;
    server.send(200, "text/html", SendHTML(LED1status,true)); 
}

void handle_led2off() {
    LED2status = LOW;
    server.send(200, "text/html", SendHTML(LED1status,false)); 
}

void handle_NotFound() {
    server.send(404, "text/plain", "Not found");
}

void setup() {
    /* WebServer class docs: https://arduino-esp8266.readthedocs.io/en/latest/esp8266wifi/soft-access-point-class.html */
    /* Initialise with custom brightness and frame rate */
    my_display.initialise(BRIGHTNESS, FRAME_RATE);

    while (!WiFi.softAPConfig(local_ip, gateway, subnet))
        my_display.showFrame(off, off, on, 0.5);

    while (!WiFi.softAP(ssid, password))
        my_display.showFrame(off, off, on, 0.5);

    server.on("/", handle_OnConnect);
    server.on("/led1on", handle_led1on);
    server.on("/led1off", handle_led1off);
    server.on("/led2on", handle_led2on);
    server.on("/led2off", handle_led2off);
    server.onNotFound(handle_NotFound);

    server.begin();
}

void loop() {
    /* Check if any clients are connected */
    if (WiFi.softAPgetStationNum() == 0)
        my_display.showFrame(on, off, off, BUFFER_REFRESH_DELAY);
    else {
        server.handleClient();
        if (LED1status)
            my_display.showFrame(on, off, on, BUFFER_REFRESH_DELAY);
        else if (LED2status)
            my_display.showFrame(off, on, off, BUFFER_REFRESH_DELAY);
        else
            my_display.showFrame(off, off, on, BUFFER_REFRESH_DELAY);
    }
}

void cleanup() {
    /* Disconnect all clients */
    while (!WiFi.softAPdisconnect(true))
        my_display.showFrame(on, off, off, BUFFER_REFRESH_DELAY);

    /* Turn off display */
    my_display.showFrame(off, off, off, BUFFER_REFRESH_DELAY);
}

int main() {
    /* Setup stuff */
    setup();

    /* Run the display in an infinite loop */
    while (true)
        loop();

    /* Cleanup */
    cleanup();

    /* Return with 0 status */
    return 0;
}
