EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 7350 7515 0    59   ~ 0
USB-C demo board for Micro-controllers
Text Notes 10570 7635 0    59   ~ 0
v1.0
Text Notes 8105 7635 0    50   ~ 0
03-09-2021
Text Notes 7290 7235 0    50   ~ 0
1
Text Notes 7375 7255 0    50   ~ 0
1
Text Notes 6990 6755 0    59   ~ 0
Demo board for testing and evaluating the USB-C interface for Micro-controllers with \nonboard battery charging.
$Comp
L MCU_Microchip_PIC18:PIC18F25K50-xSO U?
U 1 1 6132575E
P 6890 4400
F 0 "U?" H 6890 5881 50  0000 C CNN
F 1 "PIC18F25K50-xSO" H 6890 5790 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x17.9mm_P1.27mm" H 6890 4400 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/30000684B.pdf" H 3990 3050 50  0001 C CNN
	1    6890 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_C_Receptacle J?
U 1 1 61326B48
P 1355 4285
F 0 "J?" H 1462 5552 50  0000 C CNN
F 1 "USB_C_Receptacle" H 1462 5461 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 1505 4285 50  0001 C CNN
F 3 "https://gct.co/files/drawings/usb4105.pdf?v=109d7ce0-f2e0-439a-b81c-2ef6b9dd19d2" H 1505 4285 50  0001 C CNN
F 4 "USB4105-GF-A-120" H 1355 4285 50  0001 C CNN "MPN"
	1    1355 4285
	1    0    0    -1  
$EndComp
$EndSCHEMATC
