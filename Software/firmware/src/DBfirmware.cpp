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
enum DISPLAY_MODES : uint8_t {MODE_OFF, MODE_STANDBY, MODE_PLAY_BOOT, MODE1, MODE2, MODE3, MODE4, MODE5, MODE6, MODE7, MODE8, MODE9};
uint8_t display_mode = MODE_STANDBY;

/* Display frames */
/* On frame */
const uint16_t ON[LINE_COUNT] = { 0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111,
                                  0b1111111111};
/* Off frame */
const uint16_t OFF[LINE_COUNT] = { 0b0000000000,  // 0
                             0b0000000000,  // 1
                             0b0000000000,  // 2
                             0b0000000000,  // 3
                             0b0000000000,  // 4
                             0b0000000000,  // 5
                             0b0000000000,  // 6
                             0b0000000000}; // 7
//                             0123456789

/* Boot animation */
const uint16_t BOOT_ANIMATION[][LINE_COUNT] = {
    {0b1111111111,
     0b1000000001,
     0b1000000001,
     0b1000000001,
     0b1000000001,   // Frame: 0
     0b1000000001,
     0b1000000001,
     0b1111111111},
    {0b1111111111,
     0b1011111101,
     0b1010000101,
     0b1001001001,
     0b1001001001,   // Frame: 1
     0b1010000101,
     0b1011111101,
     0b1111111111},
    {0b1111111111,
     0b1011111101,
     0b1011111101,
     0b1001001001,
     0b1001001001,   // Frame: 2
     0b1010000101,
     0b1011111101,
     0b1111111111},
    {0b1111111111,
     0b1011111101,
     0b1010000101,
     0b1001111001,
     0b1001001001,   // Frame: 3
     0b1010000101,
     0b1011111101,
     0b1111111111},
    {0b1111111111,
     0b1011111101,
     0b1010000101,
     0b1001001001,
     0b1001111001,   // Frame: 4
     0b1010000101,
     0b1011111101,
     0b1111111111},
    {0b1111111111,
     0b1011111101,
     0b1010000101,
     0b1001001001,
     0b1001001001,   // Frame: 5
     0b1011111101,
     0b1011111101,
     0b1111111111},
    {0b0000000000,
     0b0111101110,
     0b0100110000,
     0b0111111110,
     0b0000000000,   // Frame: 6
     0b0111101110,
     0b0100110000,
     0b0111111110},
    {0b1111011110,
     0b1001010010,
     0b1001010010,
     0b1111011110,
     0b1100011000,   // Frame: 7
     0b1010010100,
     0b1001010010,
     0b1000110001},
    {0b0011001100,
     0b0100110010,
     0b0111111110,
     0b0000000000,
     0b0000000000,   // Frame: 8
     0b0011111100,
     0b0100000010,
     0b0111111110},
    {0b1100011110,
     0b1010010001,
     0b1001010001,
     0b1001011110,
     0b1001011110,   // Frame: 9
     0b1001010001,
     0b1010010001,
     0b1100011110}
};

/* Function definitions */
String SendHTML(uint8_t mode) {
    String ptr = "<!DOCTYPE html> <html>\n";
    ptr += "<!DOCTYPE html>\n";
    ptr += "<html>\n";
    ptr += "<head>\n";
    ptr += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\">\n";
    ptr += "<title>LED Control</title>\n";
    ptr += "<style>\n";
    ptr += "html {\n";
    ptr += "    font-family: Helvetica;\n";
    ptr += "    display: inline-block;\n";
    ptr += "    margin: 0px auto;\n";
    ptr += "    text-align: center;\n";
    ptr += "}\n";
    ptr += "body {\n";
    ptr += "    margin-top: 50px;\n";
    ptr += "}\n";
    ptr += "h1 {\n";
    ptr += "    color: #444444;\n";
    ptr += "    margin: 50px auto 30px;\n";
    ptr += "}\n";
    ptr += "h3 {\n";
    ptr += "    color: #444444;\n";
    ptr += "    margin-bottom: 50px;\n";
    ptr += "}\n";
    ptr += "p {\n";
    ptr += "    font-size: 14px;\n";
    ptr += "    color: #888;\n";
    ptr += "    margin-bottom: 10px;\n";
    ptr += "}\n";
    ptr += ".button {\n";
    ptr += "    display: block;\n";
    ptr += "    width: 80px;\n";
    ptr += "    background-color: #1abc9c;\n";
    ptr += "    border: none;\n";
    ptr += "    color: white;\n";
    ptr += "    padding: 13px 30px;\n";
    ptr += "    text-decoration: none;\n";
    ptr += "    font-size: 25px;\n";
    ptr += "    margin: 0px auto 35px;\n";
    ptr += "    cursor: pointer;\n";
    ptr += "    border-radius: 4px;\n";
    ptr += "}\n";
    ptr += ".button.disabled {\n";
    ptr += "    pointer-events: none;\n";
    ptr += "}\n";
    ptr += ".button-single {\n";
    ptr += "    display: block;\n";
    ptr += "    width: 250px;\n";
    ptr += "    background-color: #1abc9c;\n";
    ptr += "    border: none;\n";
    ptr += "    color: white;\n";
    ptr += "    padding: 13px 30px;\n";
    ptr += "    text-decoration: none;\n";
    ptr += "    font-size: 25px;\n";
    ptr += "    margin: 0px auto 35px;\n";
    ptr += "    cursor: pointer;\n";
    ptr += "    border-radius: 4px;\n";
    ptr += "}\n";
    ptr += ".button-on {\n";
    ptr += "    background-color: #1abc9c;\n";
    ptr += "}\n";
    ptr += ".button-on:active {\n";
    ptr += "    background-color: #16a085;\n";
    ptr += "}\n";
    ptr += ".button-off {\n";
    ptr += "    background-color: #34495e;\n";
    ptr += "}\n";
    ptr += ".button-off:active {\n";
    ptr += "    background-color: #2c3e50;\n";
    ptr += "}\n";
    ptr += ".button-disabled {\n";
    ptr += "    background-color: #aaaaff;\n";
    ptr += "    pointer-events: none;\n";
    ptr += "}\n";
    ptr += "</style>\n";
    ptr += "</head>\n";
    ptr += "<body>\n";
    ptr += "<h1>ESP8266 Web Server</h1>\n";
    ptr += "<h3>Using Access Point(AP) Mode</h3>\n";

    // Boot animation button
    if (mode == MODE_PLAY_BOOT)
        ptr += "<a class=\"button-single button-on\" href=\"/play_boot\">Play boot animation</a>\n";
    else
        ptr += "<a class=\"button-single button-off\" href=\"/play_boot\">Play boot animation</a>\n";

    // Array of display mode selectors
    ptr += "<p>Display mode</p>\n";
    ptr += "<table align=\"center\">\n";
    ptr += "    <tr>\n";
    if (mode == MODE_OFF) {
        ptr += "      <th><a href=\"/mode1\" class=\"button button-disabled\">1</a></th>\n";
        ptr += "      <th><a href=\"/mode2\" class=\"button button-disabled\">2</a></th>\n";
        ptr += "      <th><a href=\"/mode3\" class=\"button button-disabled\">3</a></th>\n";
    } else {
        // Mode 1
        if (mode == MODE1)
            ptr += "      <th><a href=\"/mode1\" class=\"button button-on\">1</a></th>\n";
        else
            ptr += "      <th><a href=\"/mode1\" class=\"button button-off\">1</a></th>\n";
        // Mode 2
        if (mode == MODE2)
            ptr += "      <th><a href=\"/mode2\" class=\"button button-on\">2</a></th>\n";
        else
            ptr += "      <th><a href=\"/mode2\" class=\"button button-off\">2</a></th>\n";
        // Mode 3
        if (mode == MODE3)
            ptr += "      <th><a href=\"/mode3\" class=\"button button-on\">3</a></th>\n";
        else
            ptr += "      <th><a href=\"/mode3\" class=\"button button-off\">3</a></th>\n";
    }
    ptr += "    </tr>\n";
    ptr += "    <tr>\n";
    if (mode == MODE_OFF) {
        ptr += "      <th><a href=\"/mode4\" class=\"button button-disabled\">4</a></th>\n";
        ptr += "      <th><a href=\"/mode5\" class=\"button button-disabled\">5</a></th>\n";
        ptr += "      <th><a href=\"/mode6\" class=\"button button-disabled\">6</a></th>\n";
    } else {
        // Mode 4
        if (mode == MODE4)
            ptr += "        <th><a href=\"/mode4\" class=\"button button-on\">4</a></th>\n";
        else
            ptr += "        <th><a href=\"/mode4\" class=\"button button-off\">4</a></th>\n";
        // Mode 5
        if (mode == MODE5)
            ptr += "        <th><a href=\"/mode5\" class=\"button button-on\">5</a></th>\n";
        else
            ptr += "        <th><a href=\"/mode5\" class=\"button button-off\">5</a></th>\n";
        // Mode 6
        if (mode == MODE6)
            ptr += "        <th><a href=\"/mode6\" class=\"button button-on\">6</a></th>\n";
        else
            ptr += "        <th><a href=\"/mode6\" class=\"button button-off\">6</a></th>\n";
    }
    ptr += "    </tr>\n";
    ptr += "    <tr>\n";
    if (mode == MODE_OFF) {
        ptr += "      <th><a href=\"/mode7\" class=\"button button-disabled\">7</a></th>\n";
        ptr += "      <th><a href=\"/mode8\" class=\"button button-disabled\">8</a></th>\n";
        ptr += "      <th><a href=\"/mode9\" class=\"button button-disabled\">9</a></th>\n";
    } else {
        // Mode 7
        if (mode == MODE7)
            ptr += "        <th><a href=\"/mode7\" class=\"button button-on\">7</a></th>\n";
        else
            ptr += "        <th><a href=\"/mode7\" class=\"button button-off\">7</a></th>\n";
        // Mode 8
        if (mode == MODE8)
            ptr += "        <th><a href=\"/mode8\" class=\"button button-on\">8</a></th>\n";
        else
            ptr += "        <th><a href=\"/mode8\" class=\"button button-off\">8</a></th>\n";
        // Mode 9
        if (mode == MODE9)
            ptr += "        <th><a href=\"/mode9\" class=\"button button-on\">9</a></th>\n";
        else
            ptr += "        <th><a href=\"/mode9\" class=\"button button-off\">9</a></th>\n";
    }
    ptr += "    </tr>\n";
    ptr += "</table>\n";
    ptr +="</body>\n";
    ptr +="</html>\n";
    return ptr;
}

/* Web rout handles */
void handle_OnConnect() {
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_mode1() {
    display_mode = MODE1;
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_mode2() {
    display_mode = MODE2;
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_mode3() {
    display_mode = MODE3;
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_mode4() {
    display_mode = MODE4;
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_mode5() {
    display_mode = MODE5;
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_mode6() {
    display_mode = MODE6;
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_mode7() {
    display_mode = MODE7;
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_mode8() {
    display_mode = MODE8;
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_mode9() {
    display_mode = MODE9;
    /* Initialise/reset the bouncy module */
    init_bouncy();
    server.send(200, "text/html", SendHTML(display_mode));
}

void handle_NotFound() {
    display_mode = MODE_STANDBY;
    server.send(404, "text/plain", "Not found");
}

void handle_play_boot() {
    display_mode = MODE_PLAY_BOOT;
    server.send(200, "text/html", SendHTML(display_mode));
}

void setup() {
    /* WebServer class docs: https://arduino-esp8266.readthedocs.io/en/latest/esp8266wifi/soft-access-point-class.html */
    // Serial.begin(115200);
    /* Initialise with custom brightness and frame rate */
    my_display.initialise(BRIGHTNESS, FRAME_RATE);

    while (!WiFi.softAPConfig(local_ip, gateway, subnet))
        my_display.showFrame(OFF, OFF, ON, 0.5);

    while (!WiFi.softAP(ssid, password))
        my_display.showFrame(OFF, OFF, ON, 0.5);

    server.on("/", handle_OnConnect);
    server.on("/mode1", handle_mode1);
    server.on("/mode2", handle_mode2);
    server.on("/mode3", handle_mode3);
    server.on("/mode4", handle_mode4);
    server.on("/mode5", handle_mode5);
    server.on("/mode6", handle_mode6);
    server.on("/mode7", handle_mode7);
    server.on("/mode8", handle_mode8);
    server.on("/mode9", handle_mode9);
    server.on("/play_boot", handle_play_boot);
    server.onNotFound(handle_NotFound);

    server.begin();

    // Set off mode on start-up
    display_mode = MODE_OFF;
}

void loop() {
    /* Check if any clients are connected */
    if (WiFi.softAPgetStationNum() == 0) {
        my_display.showFrame(ON, OFF, OFF, BUFFER_REFRESH_DELAY);
    } else {
        server.handleClient();
        switch (display_mode)
        {
        case MODE_PLAY_BOOT:
            my_display.showFrame(OFF, BUFFER_REFRESH_DELAY);
            // Hourglass in red
            for (uint8_t frame_inx = 1; frame_inx <= 5; frame_inx++)
                my_display.showFrame(BOOT_ANIMATION[frame_inx], BOOT_ANIMATION[0], BOOT_ANIMATION[0], 0.8);
            // Hourglass in green
            for (uint8_t frame_inx = 1; frame_inx <= 5; frame_inx++)
                my_display.showFrame(BOOT_ANIMATION[0], BOOT_ANIMATION[frame_inx], BOOT_ANIMATION[0], 0.8);
            // Hourglass in blue
            for (uint8_t frame_inx = 1; frame_inx <= 5; frame_inx++)
                my_display.showFrame(BOOT_ANIMATION[0], BOOT_ANIMATION[0], BOOT_ANIMATION[frame_inx], 0.8);
            // Show text 1.1
            my_display.showFrame(BOOT_ANIMATION[6], 5);
            // Show text 1.1
            my_display.showFrame(BOOT_ANIMATION[7], 5);
            // Show text 2.1
            my_display.showFrame(BOOT_ANIMATION[8], 5);
            // Show text 2.2
            my_display.showFrame(BOOT_ANIMATION[9], 5);
            display_mode = MODE_STANDBY;
            break;
        case MODE1:
            my_display.showFrame(OFF, OFF, ON, BUFFER_REFRESH_DELAY);
            break;
        case MODE2:
            my_display.showFrame(OFF, ON, OFF, BUFFER_REFRESH_DELAY);
            break;
        case MODE3:
            my_display.showFrame(OFF, ON, ON, BUFFER_REFRESH_DELAY);
            break;
        case MODE4:
            my_display.showFrame(ON, OFF, OFF, BUFFER_REFRESH_DELAY);
            break;
        case MODE5:
            my_display.showFrame(ON, OFF, ON, BUFFER_REFRESH_DELAY);
            break;
        case MODE6:
            my_display.showFrame(ON, ON, OFF, BUFFER_REFRESH_DELAY);
            break;
        case MODE7:
            my_display.showFrame(ON, ON, ON, BUFFER_REFRESH_DELAY);
            break;
        case MODE8:
            my_display.showFrame(OFF, OFF, OFF, BUFFER_REFRESH_DELAY);
            break;
        case MODE9:
            my_display.showFrame(bouncy_buffer, 0.35);
            move_ball();
            break;
        default:
            // MODE_STANDBY, MODE_OFF
            my_display.showFrame(OFF, OFF, ON, BUFFER_REFRESH_DELAY);
            break;
        }
    }
}

void cleanup() {
    /* Disconnect all clients */
    while (!WiFi.softAPdisconnect(true))
        my_display.showFrame(ON, OFF, OFF, BUFFER_REFRESH_DELAY);

    /* Turn off display */
    my_display.showFrame(OFF, OFF, OFF, BUFFER_REFRESH_DELAY);
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
