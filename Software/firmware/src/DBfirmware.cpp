/******************************************************************
* File name: bouncy.cpp
* Version: v2.0
* DEV: GitHub@Rr42
* Description:
*  Firmware for the USB-C-DB board (8x10 RGB LED display).
*   SEIZURE WARNING!
******************************************************************/

/* Includes */
#include <DBfirmware.hpp>

/* Note on display data transfer:
* Given 3 Bits per LED, 8 LEDs per row, adn 10 Rows per display a minimum of 240 bits
* or 30 bytes is required to store the raw data required to display an image.
* 
* Currently using a 16 bit integer per column results in a space requirement of 384 bits
* or 48 bytes; due to the extra 6 unused bits per column a total of 144 bits or 18 bytes
* is wasted/unused.
* 
* If the display algorithm was updated to take 10 rows of 8 bit integers then no space
* would be wasted, however, the display library will have to be heavily refactored.
*/

/* Potential way to load pages in future
* Host page on user machine and only connect with board to communicate information.
* Use electron?
*/

/* Dynamic Network connection
* If the WiFi ssid is not present, go into AP mode and host the WiFi network.
* However, if the network already exists (could be hosted by a PC or another USB-C DB board)
*  then go into Client mode and connect to it rather than hosting a new network.
*/

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
enum DISPLAY_MODES : uint8_t {MODE_OFF, MODE_STANDBY, MODE_PLAY_BOOT, MODE1, MODE2, MODE3, MODE4, MODE5, MODE6, MODE7, MODE8, MODE9, CUSTOM_SELECTION};
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
/* Custom frame */
uint16_t custom_buffer[COLOR_COUNT][LINE_COUNT] = {
                                            { 0b0000000000,
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
void SendHTML_nostore(uint8_t mode) {
    /* Sent the header */
    server.sendHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    server.sendHeader("Pragma", "no-cache");
    server.sendHeader("Expires", "-1");
    server.setContentLength(CONTENT_LENGTH_UNKNOWN);
    /* Here begin chunked transfer */
    server.send(200, "text/html", "");
    /* Start sending the data */
    server.sendContent("<!DOCTYPE html>\n");
    server.sendContent("<html>\n");
    server.sendContent("<head>\n");
    server.sendContent("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\">\n");
    server.sendContent("<title>LED Control</title>\n");

    server.sendContent("<style>\n");
    server.sendContent("html {\n");
    server.sendContent("    font-family: Helvetica;\n");
    server.sendContent("    display: inline-block;\n");
    server.sendContent("    margin: 0px auto;\n");
    server.sendContent("    text-align: center;\n");
    server.sendContent("}\n");
    server.sendContent("body {\n");
    server.sendContent("    margin-top: 50px;\n");
    server.sendContent("}\n");
    server.sendContent("h1 {\n");
    server.sendContent("    color: #444444;\n");
    server.sendContent("    margin: 50px auto 30px;\n");
    server.sendContent("}\n");
    server.sendContent("h3 {\n");
    server.sendContent("    color: #444444;\n");
    server.sendContent("    margin-bottom: 50px;\n");
    server.sendContent("}\n");
    server.sendContent("p {\n");
    server.sendContent("    font-size: 14px;\n");
    server.sendContent("    color: #888;\n");
    server.sendContent("    margin-bottom: 10px;\n");
    server.sendContent("}\n");
    server.sendContent(".button {\n");
    server.sendContent("    display: block;\n");
    server.sendContent("    width: 80px;\n");
    server.sendContent("    background-color: #1abc9c;\n");
    server.sendContent("    border: none;\n");
    server.sendContent("    color: white;\n");
    server.sendContent("    padding: 13px 30px;\n");
    server.sendContent("    text-decoration: none;\n");
    server.sendContent("    font-size: 25px;\n");
    server.sendContent("    margin: 0px auto 35px;\n");
    server.sendContent("    cursor: pointer;\n");
    server.sendContent("    border-radius: 4px;\n");
    server.sendContent("}\n");
    server.sendContent(".button.disabled {\n");
    server.sendContent("    pointer-events: none;\n");
    server.sendContent("}\n");
    server.sendContent(".button-single {\n");
    server.sendContent("    display: block;\n");
    server.sendContent("    width: 250px;\n");
    server.sendContent("    background-color: #1abc9c;\n");
    server.sendContent("    border: none;\n");
    server.sendContent("    color: white;\n");
    server.sendContent("    padding: 13px 30px;\n");
    server.sendContent("    text-decoration: none;\n");
    server.sendContent("    font-size: 25px;\n");
    server.sendContent("    margin: 0px auto 35px;\n");
    server.sendContent("    cursor: pointer;\n");
    server.sendContent("    border-radius: 4px;\n");
    server.sendContent("}\n");
    server.sendContent(".button-on {\n");
    server.sendContent("    background-color: #1abc9c;\n");
    server.sendContent("}\n");
    server.sendContent(".button-on:active {\n");
    server.sendContent("    background-color: #16a085;\n");
    server.sendContent("}\n");
    server.sendContent(".button-off {\n");
    server.sendContent("    background-color: #34495e;\n");
    server.sendContent("}\n");
    server.sendContent(".button-off:active {\n");
    server.sendContent("    background-color: #2c3e50;\n");
    server.sendContent("}\n");
    server.sendContent(".button-disabled {\n");
    server.sendContent("    background-color: #aaaaff;\n");
    server.sendContent("    pointer-events: none;\n");
    server.sendContent("}\n");
    server.sendContent(".dropdown {\n");
    server.sendContent("    display:table-cell;\n");
    server.sendContent("    width: 60px;\n");
    server.sendContent("    background-color: #000000;\n");
    server.sendContent("    border: none;\n");
    server.sendContent("    color: white;\n");
    server.sendContent("    padding: 10px 7px;\n");
    server.sendContent("    text-decoration: none;\n");
    server.sendContent("    font-size: 20px;\n");
    server.sendContent("    margin: auto auto auto;\n");
    server.sendContent("    cursor: pointer;\n");
    server.sendContent("    border-radius: 10px;\n");
    server.sendContent("}\n");
    server.sendContent("</style>\n");
    server.sendContent("</head>\n");

    server.sendContent("<body>\n");
    server.sendContent("<h1>USB-C DB Control Center</h1>\n");
    server.sendContent("<h3>Using ESP8266's Access Point (AP) Mode</h3>\n");

    /* Boot animation button */
    if (mode == MODE_PLAY_BOOT)
        /* Set boot button to ON state if in boot mode */
        server.sendContent("<a class=\"button-single button-on\" href=\"/play_boot\">Play boot animation</a>\n");
    else if (mode != CUSTOM_SELECTION)
        /* Set boot button to OFF state if not in boot mode or custom selection mode */
        server.sendContent("<a class=\"button-single button-off\" href=\"/play_boot\">Play boot animation</a>\n");
    else
        /* Change button to allow user to go back to the main page when in custom mode */
        server.sendContent("<a class=\"button-single button-off\" href=\"/\">Home</a>\n");

    /* Array of display mode selectors */
    if (mode != CUSTOM_SELECTION) {
        server.sendContent("<p>Display mode</p>\n");
        server.sendContent("<table align=\"center\">\n");
        server.sendContent("    <tr>\n");
        if (mode == MODE_OFF) {
            server.sendContent("      <th><a href=\"/mode1\" class=\"button button-disabled\">1</a></th>\n");
            server.sendContent("      <th><a href=\"/mode2\" class=\"button button-disabled\">2</a></th>\n");
            server.sendContent("      <th><a href=\"/mode3\" class=\"button button-disabled\">3</a></th>\n");
        } else {
            /* Mode 1 */
            if (mode == MODE1)
                server.sendContent("      <th><a href=\"/mode1\" class=\"button button-on\">1</a></th>\n");
            else
                server.sendContent("      <th><a href=\"/mode1\" class=\"button button-off\">1</a></th>\n");
            /* Mode 2 */
            if (mode == MODE2)
                server.sendContent("      <th><a href=\"/mode2\" class=\"button button-on\">2</a></th>\n");
            else
                server.sendContent("      <th><a href=\"/mode2\" class=\"button button-off\">2</a></th>\n");
            /* Mode 3 */
            if (mode == MODE3)
                server.sendContent("      <th><a href=\"/mode3\" class=\"button button-on\">3</a></th>\n");
            else
                server.sendContent("      <th><a href=\"/mode3\" class=\"button button-off\">3</a></th>\n");
        }
        server.sendContent("    </tr>\n");
        server.sendContent("    <tr>\n");
        if (mode == MODE_OFF) {
            server.sendContent("      <th><a href=\"/mode4\" class=\"button button-disabled\">4</a></th>\n");
            server.sendContent("      <th><a href=\"/mode5\" class=\"button button-disabled\">5</a></th>\n");
            server.sendContent("      <th><a href=\"/mode6\" class=\"button button-disabled\">6</a></th>\n");
        } else {
            /* Mode 4 */
            if (mode == MODE4)
                server.sendContent("        <th><a href=\"/mode4\" class=\"button button-on\">4</a></th>\n");
            else
                server.sendContent("        <th><a href=\"/mode4\" class=\"button button-off\">4</a></th>\n");
            /* Mode 5 */
            if (mode == MODE5)
                server.sendContent("        <th><a href=\"/mode5\" class=\"button button-on\">5</a></th>\n");
            else
                server.sendContent("        <th><a href=\"/mode5\" class=\"button button-off\">5</a></th>\n");
            /* Mode 6 */
            if (mode == MODE6)
                server.sendContent("        <th><a href=\"/mode6\" class=\"button button-on\">6</a></th>\n");
            else
                server.sendContent("        <th><a href=\"/mode6\" class=\"button button-off\">6</a></th>\n");
        }
        server.sendContent("    </tr>\n");
        server.sendContent("    <tr>\n");
        if (mode == MODE_OFF) {
            server.sendContent("      <th><a href=\"/mode7\" class=\"button button-disabled\">7</a></th>\n");
            server.sendContent("      <th><a href=\"/mode8\" class=\"button button-disabled\">8</a></th>\n");
            server.sendContent("      <th><a href=\"/mode9\" class=\"button button-disabled\">9</a></th>\n");
        } else {
            /* Mode 7 */
            if (mode == MODE7)
                server.sendContent("        <th><a href=\"/mode7\" class=\"button button-on\">7</a></th>\n");
            else
                server.sendContent("        <th><a href=\"/mode7\" class=\"button button-off\">7</a></th>\n");
            /* Mode 8 */
            if (mode == MODE8)
                server.sendContent("        <th><a href=\"/mode8\" class=\"button button-on\">8</a></th>\n");
            else
                server.sendContent("        <th><a href=\"/mode8\" class=\"button button-off\">8</a></th>\n");
            /* Mode 9 */
            if (mode == MODE9)
                server.sendContent("        <th><a href=\"/mode9\" class=\"button button-on\">9</a></th>\n");
            else
                server.sendContent("        <th><a href=\"/mode9\" class=\"button button-off\">9</a></th>\n");
        }
        server.sendContent("    </tr>\n");
        server.sendContent("</table>\n");

        /* Button top switch to custom mode */
        server.sendContent("<p>Custom mode</p>\n");
        if (mode == MODE_OFF)
            server.sendContent("<a class=\"button-single button-disabled\" href=\"/custom_selection\">Custom mode</a>\n");
        else
            server.sendContent("<a class=\"button-single button-off\" href=\"/custom_selection\">Custom mode</a>\n");

        server.sendContent("</body>\n");
    } else {
        /* Custom color selection table
        * Need to compress/offload work as generating table onboard takes too much RAM.
        * Just about 49,536 bytes (51,584 if the above table is removed)
        *  is available at this point after all other variables have been loaded.
        * 
        * Thanks to Github@nikramakrishnan for the help in sorting out the dynamic table creation!
        */
        server.sendContent("<p>Custom mode</p>\n");
        server.sendContent("<table align=\"center\" id=\"table-custom\">\n");
        server.sendContent("</table>\n");

        server.sendContent("</body>\n");

        server.sendContent("<script>\n");
        server.sendContent("    var color_map = [\n");
        server.sendContent("        { chash: '#000000', ctext: 'white' },\n");
        server.sendContent("        { chash: '#0000FF', ctext: 'white' },\n");
        server.sendContent("        { chash: '#00FF00', ctext: 'black' },\n");
        server.sendContent("        { chash: '#00FFFF', ctext: 'black' },\n");
        server.sendContent("        { chash: '#FF0000', ctext: 'white' },\n");
        server.sendContent("        { chash: '#FF00FF', ctext: 'black' },\n");
        server.sendContent("        { chash: '#FFFF00', ctext: 'black' },\n");
        server.sendContent("        { chash: '#FFFFFF', ctext: 'black' },\n");
        server.sendContent("    ];\n");
        server.sendContent("    var bcolor_map = {\n");
        server.sendContent("        '#000000': 'white',\n");
        server.sendContent("        '#0000FF': 'white',\n");
        server.sendContent("        '#00FF00': 'black',\n");
        server.sendContent("        '#00FFFF': 'black',\n");
        server.sendContent("        '#FF0000': 'white',\n");
        server.sendContent("        '#FF00FF': 'black',\n");
        server.sendContent("        '#FFFF00': 'black',\n");
        server.sendContent("        '#FFFFFF': 'black',\n");
        server.sendContent("    };\n");
        server.sendContent("    function change_color(id,color,text) {\n");
        server.sendContent("        id.style.backgroundColor=color;\n");
        server.sendContent("        id.style.color=bcolor_map[color];\n");
        server.sendContent("        /* Reformat the color string to make it easier to parse */\n");
        server.sendContent("        var fcolor = color.toString()\n");
        server.sendContent("        fcolor = fcolor.replace('#', '');\n");
        server.sendContent("        fcolor = fcolor.replace(/00/g, '0');\n");
        server.sendContent("        fcolor = fcolor.replace(/FF/g, '1');\n");
        server.sendContent("        /* Reformat the text string to make it easier to parse */\n");
        server.sendContent("        var LED_id = Number(text);\n");
        server.sendContent("        var row = (LED_id-1)%8;\n");
        server.sendContent("        var col = Math.ceil(LED_id/8)-1;\n");
        server.sendContent("        /* Send an AJAX request with the latest display configuration */\n");
        server.sendContent("        var xhttp = new XMLHttpRequest();\n");
        server.sendContent("        xhttp.open('GET', 'custom_selection?id='+id.toString()+'&color='+parseInt(fcolor)+'&row='+row.toString()+'&col='+col.toString(), true);\n");
        server.sendContent("        xhttp.send();\n");
        server.sendContent("    }\n");
        server.sendContent("    \n");
        server.sendContent("    var LED_number = 1;\n");
        server.sendContent("    var custom_table = '';\n");
        server.sendContent("    /* Generate the custom table */\n");
        server.sendContent("    for (var i = 0; i < 10; i++) {\n");
        server.sendContent("        custom_table += '<tr>';\n");
        server.sendContent("        for (var j = 0; j < 8; j++) {\n");
        server.sendContent("            var LED_name = LED_number.toString();\n");
        server.sendContent("            if (LED_number < 10) {\n");
        server.sendContent("                LED_name = '0' + LED_name;\n");
        server.sendContent("            };\n");
        server.sendContent("            custom_table += '<th>';\n");
        server.sendContent("            custom_table += '<select onchange=\\'change_color(this,value,'+LED_name+')\\' class=\\'dropdown\\'>';\n");
        server.sendContent("            /* Fill in the options of the dropdown */\n");
        server.sendContent("            color_map.forEach(function (color_item) {\n");
        server.sendContent("                custom_table += '<option style=\\'background-color:'+color_item['chash']+';color:'+color_item['ctext']+'\\' value=\\''+color_item['chash']+'\\'>'+LED_name+'</option>';\n");
        server.sendContent("            });\n");
        server.sendContent("            custom_table += '</select>';\n");
        server.sendContent("            custom_table += '</th>';\n");
        server.sendContent("            /* Increment the LED index */\n");
        server.sendContent("            LED_number += 1\n");
        server.sendContent("        };\n");
        server.sendContent("        custom_table += '</tr>';\n");
        server.sendContent("    };\n");
        server.sendContent("    document.getElementById('table-custom').innerHTML = custom_table;\n");
        server.sendContent("</script>");
    }

    server.sendContent("</html>\n");
    /* Tis tells web client that transfer is done */
    server.sendContent(F(""));
    /* Stop sending data */
    server.client().stop();
}

/* Web rout handles */
void handle_OnConnect() {
    /* Reset mode if site is coming back from the custom page */
    if (display_mode == CUSTOM_SELECTION)
        display_mode = MODE_STANDBY;
    SendHTML_nostore(display_mode);
}

void handle_mode1() {
    display_mode = MODE1;
    SendHTML_nostore(display_mode);
}

void handle_mode2() {
    display_mode = MODE2;
    SendHTML_nostore(display_mode);
}

void handle_mode3() {
    display_mode = MODE3;
    SendHTML_nostore(display_mode);
}

void handle_mode4() {
    display_mode = MODE4;
    SendHTML_nostore(display_mode);
}

void handle_mode5() {
    display_mode = MODE5;
    SendHTML_nostore(display_mode);
}

void handle_mode6() {
    display_mode = MODE6;
    SendHTML_nostore(display_mode);
}

void handle_mode7() {
    display_mode = MODE7;
    SendHTML_nostore(display_mode);
}

void handle_mode8() {
    display_mode = MODE8;
    SendHTML_nostore(display_mode);
}

void handle_mode9() {
    display_mode = MODE9;
    /* Initialise/reset the bouncy module */
    init_bouncy();
    SendHTML_nostore(display_mode);
}

void handle_play_boot() {
    display_mode = MODE_PLAY_BOOT;
    SendHTML_nostore(display_mode);
}

void handle_custom_selection() {
    display_mode = CUSTOM_SELECTION;
    /* Process the LED color change if data is available */
    if (server.arg("id") != "") {
        /* Grab the color selection */
        uint8_t color = atoi(server.arg("color").c_str());
        /* Grab the line the LED is on */
        uint8_t line = atoi(server.arg("col").c_str());
        /* Grab the LED shift for the line */
        uint8_t shift = atoi(server.arg("row").c_str());
        /* Update the custom display buffer */
        if (color != 0) {
            for (uint8_t mask = 0b001, color_inx = COLOR_COUNT-1; mask <= 0b100; mask<<=1, color_inx--)
                if (mask&color)
                    custom_buffer[color_inx][shift] = (0b0000000001<<line)|custom_buffer[color_inx][shift];
        }
        else {
            for (uint8_t color_inx = 0; color_inx < COLOR_COUNT; color_inx++)
                custom_buffer[color_inx][shift] = (~(0b0000000001<<line))&custom_buffer[color_inx][shift];
        }
        /* No need to update the site as the color change on the site is handled by the client side JavaScript */
        server.send(200, "text/html", "");
    } else {
        /* Reset custom display */
        for (uint8_t line = 0; line < LINE_COUNT; line++)
            for (uint8_t color = 0; color < COLOR_COUNT; color++)
                custom_buffer[color][line] = 0b0000000000;
        /* Update the site */
        SendHTML_nostore(display_mode);
    }
}

void handle_NotFound() {
    display_mode = MODE_STANDBY;
    server.send(404, "text/plain", "[ERROR-404] Page Not Found");
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
    server.on("/custom_selection", handle_custom_selection);
    server.onNotFound(handle_NotFound);

    server.begin();

    /* Set off mode on start-up */
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
            /* Hourglass in red */
            for (uint8_t frame_inx = 1; frame_inx <= 5; frame_inx++)
                my_display.showFrame(BOOT_ANIMATION[frame_inx], BOOT_ANIMATION[0], BOOT_ANIMATION[0], 0.8);
            /* Hourglass in green */
            for (uint8_t frame_inx = 1; frame_inx <= 5; frame_inx++)
                my_display.showFrame(BOOT_ANIMATION[0], BOOT_ANIMATION[frame_inx], BOOT_ANIMATION[0], 0.8);
            /* Hourglass in blue */
            for (uint8_t frame_inx = 1; frame_inx <= 5; frame_inx++)
                my_display.showFrame(BOOT_ANIMATION[0], BOOT_ANIMATION[0], BOOT_ANIMATION[frame_inx], 0.8);
            /* Show text 1.1 */
            my_display.showFrame(BOOT_ANIMATION[6], 5);
            /* Show text 1.2 */
            my_display.showFrame(BOOT_ANIMATION[7], 5);
            /* Show text 2.1 */
            my_display.showFrame(BOOT_ANIMATION[8], 5);
            /* Show text 2.2 */
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
        case CUSTOM_SELECTION:
            my_display.showFrame(custom_buffer, BUFFER_REFRESH_DELAY);
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
