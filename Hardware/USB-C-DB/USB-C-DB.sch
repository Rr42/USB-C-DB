EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
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
v0.2
Text Notes 8105 7635 0    50   ~ 0
18-12-2021
Text Notes 7290 7235 0    50   ~ 0
1
Text Notes 7375 7255 0    50   ~ 0
1
Text Notes 6990 6755 0    59   ~ 0
Demo board for testing and evaluating the USB-C interface for Micro-controllers with \nonboard battery charging.
$Comp
L USB-C-DB-rescue:USB_C_Receptacle-Connector J1
U 1 1 61326B48
P 1300 4300
F 0 "J1" H 950 5450 50  0000 C CNN
F 1 "USB_C_Receptacle" V 850 3250 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 1450 4300 50  0001 C CNN
F 3 "https://gct.co/files/drawings/usb4105.pdf?v=109d7ce0-f2e0-439a-b81c-2ef6b9dd19d2" H 1450 4300 50  0001 C CNN
F 4 "USB4105-GF-A-120" H 1300 4300 50  0001 C CNN "MPN"
	1    1300 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 61327E10
P 1560 1370
F 0 "J2" H 1640 1412 50  0000 L CNN
F 1 "BatTP+" H 1640 1321 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 1560 1370 50  0001 C CNN
F 3 "~" H 1560 1370 50  0001 C CNN
	1    1560 1370
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 613284CF
P 1560 1730
F 0 "J4" H 1640 1772 50  0000 L CNN
F 1 "BatTP-" H 1640 1681 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 1560 1730 50  0001 C CNN
F 3 "~" H 1560 1730 50  0001 C CNN
	1    1560 1730
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 61326DA4
P 1560 1510
F 0 "J3" H 1640 1502 50  0000 L CNN
F 1 "JST Battery con" H 1640 1411 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" H 1560 1510 50  0001 C CNN
F 3 "~" H 1560 1510 50  0001 C CNN
	1    1560 1510
	1    0    0    -1  
$EndComp
Wire Wire Line
	1360 1370 1270 1370
Wire Wire Line
	1270 1370 1270 1440
Wire Wire Line
	1270 1510 1360 1510
Wire Wire Line
	1270 1730 1360 1730
Wire Wire Line
	1270 1610 1360 1610
$Comp
L power:-BATT #PWR0101
U 1 1 6132D582
P 1210 1670
F 0 "#PWR0101" H 1210 1520 50  0001 C CNN
F 1 "-BATT" H 1190 1820 50  0000 C CNN
F 2 "" H 1210 1670 50  0001 C CNN
F 3 "" H 1210 1670 50  0001 C CNN
	1    1210 1670
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR0102
U 1 1 6132E499
P 1210 1440
F 0 "#PWR0102" H 1210 1290 50  0001 C CNN
F 1 "+BATT" H 1220 1580 50  0000 C CNN
F 2 "" H 1210 1440 50  0001 C CNN
F 3 "" H 1210 1440 50  0001 C CNN
	1    1210 1440
	1    0    0    -1  
$EndComp
Wire Wire Line
	1270 1610 1270 1670
Wire Wire Line
	1210 1440 1270 1440
Connection ~ 1270 1440
Wire Wire Line
	1270 1440 1270 1510
Wire Wire Line
	1210 1670 1270 1670
Connection ~ 1270 1670
Wire Wire Line
	1270 1670 1270 1730
Text Notes 1540 1210 0    50   ~ 0
Battery connector
Wire Notes Line
	2250 1130 1100 1130
Wire Notes Line
	1100 1130 1100 1860
Wire Notes Line
	1100 1860 2250 1860
Wire Notes Line
	2250 1860 2250 1130
$Comp
L RF_Module:ESP-WROOM-02 U3
U 1 1 6134D71E
P 8600 5400
F 0 "U3" H 8900 5950 50  0000 C CNN
F 1 "ESP-WROOM-02" H 8200 5950 50  0000 C CNN
F 2 "RF_Module:ESP-WROOM-02" H 9200 4850 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/0c-esp-wroom-02_datasheet_en.pdf" H 8650 6900 50  0001 C CNN
F 4 "ESP-WROOM-02D M1102H1600PH3Q0" H 8600 5400 50  0001 C CNN "MPN"
	1    8600 5400
	1    0    0    -1  
$EndComp
Text Notes 1400 6050 0    50   ~ 0
Total  power with 80 RGB LEDs comes out to be\n around 1W (821mW Typ, 1.5W Max). Use fixed\n termination for requesting USB power state\n rather than using controller.
Text Notes 2100 3000 0    50   ~ 0
Current sence resistor to detect\n USB power draw above 2.5W\n and throttle power to comply\n with the USB 2.0 spec.
$Sheet
S 8350 1150 1100 600 
U 61B0EECD
F0 "Display-and-controller-61B0EECC" 50
F1 "USB-C-DB-1-61B0EECC.sch" 0
F2 "VCC" I L 8350 1200 50 
F3 "GND" I L 8350 1350 50 
$EndSheet
$Comp
L Device:R R?
U 1 1 61B1FC85
P 2150 3600
F 0 "R?" V 2250 3500 50  0000 C CNN
F 1 "5.1k" V 2250 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2080 3600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/447/yagos02312_1-2286750.pdf" H 2150 3600 50  0001 C CNN
F 4 "TR0805KR-075K1L" V 2150 3600 50  0001 C CNN "MPN"
	1    2150 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 61B20944
P 2150 3500
F 0 "R?" V 2050 3400 50  0000 C CNN
F 1 "5.1k" V 2050 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2080 3500 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/447/yagos02312_1-2286750.pdf" H 2150 3500 50  0001 C CNN
F 4 "TR0805KR-075K1L" V 2150 3500 50  0001 C CNN "MPN"
	1    2150 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 3600 2000 3600
Wire Wire Line
	1900 3500 2000 3500
Wire Wire Line
	2300 3500 2500 3500
Wire Wire Line
	2500 3500 2500 3550
Wire Wire Line
	2500 3600 2300 3600
$Comp
L power:GND #PWR?
U 1 1 61B23578
P 2600 3550
F 0 "#PWR?" H 2600 3300 50  0001 C CNN
F 1 "GND" H 2600 3400 50  0000 C CNN
F 2 "" H 2600 3550 50  0001 C CNN
F 3 "" H 2600 3550 50  0001 C CNN
	1    2600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3550 2600 3550
Connection ~ 2500 3550
Wire Wire Line
	2500 3550 2500 3600
Wire Wire Line
	1900 3800 1950 3800
Wire Wire Line
	1950 3900 1900 3900
Wire Wire Line
	1900 4000 1950 4000
Wire Wire Line
	1950 4100 1900 4100
Text Label 2100 4050 0    50   ~ 0
USB2_P
Text Label 2100 3850 0    50   ~ 0
USB2_N
NoConn ~ 1900 4300
NoConn ~ 1900 4400
NoConn ~ 1900 4600
NoConn ~ 1900 4700
NoConn ~ 1900 4900
NoConn ~ 1900 5000
NoConn ~ 1900 5200
NoConn ~ 1900 5300
$Comp
L power:GND #PWR?
U 1 1 61B2BCDD
P 1300 5950
F 0 "#PWR?" H 1300 5700 50  0001 C CNN
F 1 "GND" H 1300 5800 50  0000 C CNN
F 2 "" H 1300 5950 50  0001 C CNN
F 3 "" H 1300 5950 50  0001 C CNN
	1    1300 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5900 1300 5950
NoConn ~ 1900 5500
NoConn ~ 1900 5600
Wire Wire Line
	1000 5900 1000 5950
Wire Wire Line
	1000 5950 1300 5950
Connection ~ 1300 5950
$Comp
L power:VBUS #PWR?
U 1 1 61B334E2
P 1950 2750
F 0 "#PWR?" H 1950 2600 50  0001 C CNN
F 1 "VBUS" H 1950 2900 50  0000 C CNN
F 2 "" H 1950 2750 50  0001 C CNN
F 3 "" H 1950 2750 50  0001 C CNN
	1    1950 2750
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 61B34071
P 4000 1250
F 0 "#PWR?" H 4000 1100 50  0001 C CNN
F 1 "VBUS" H 4000 1400 50  0000 C CNN
F 2 "" H 4000 1250 50  0001 C CNN
F 3 "" H 4000 1250 50  0001 C CNN
	1    4000 1250
	1    0    0    -1  
$EndComp
Text Notes 3900 1000 0    50   ~ 0
3.3V supply rail generation for ESP module
$Comp
L power:+3.3V #PWR?
U 1 1 61B23922
P 5150 1250
F 0 "#PWR?" H 5150 1100 50  0001 C CNN
F 1 "+3.3V" H 5150 1400 50  0000 C CNN
F 2 "" H 5150 1250 50  0001 C CNN
F 3 "" H 5150 1250 50  0001 C CNN
	1    5150 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 61B24A06
P 8600 4750
F 0 "#PWR?" H 8600 4600 50  0001 C CNN
F 1 "+3.3V" H 8600 4900 50  0000 C CNN
F 2 "" H 8600 4750 50  0001 C CNN
F 3 "" H 8600 4750 50  0001 C CNN
	1    8600 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61B253BA
P 8600 6050
F 0 "#PWR?" H 8600 5800 50  0001 C CNN
F 1 "GND" H 8600 5900 50  0000 C CNN
F 2 "" H 8600 6050 50  0001 C CNN
F 3 "" H 8600 6050 50  0001 C CNN
	1    8600 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61B25674
P 5050 5600
F 0 "#PWR?" H 5050 5350 50  0001 C CNN
F 1 "GND" H 5050 5450 50  0000 C CNN
F 2 "" H 5050 5600 50  0001 C CNN
F 3 "" H 5050 5600 50  0001 C CNN
	1    5050 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4800 8600 4750
$Comp
L power:GND #PWR?
U 1 1 61BD67C7
P 4600 1700
F 0 "#PWR?" H 4600 1450 50  0001 C CNN
F 1 "GND" H 4600 1550 50  0000 C CNN
F 2 "" H 4600 1700 50  0001 C CNN
F 3 "" H 4600 1700 50  0001 C CNN
	1    4600 1700
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LD1117S33TR_SOT223 U?
U 1 1 61BF8A51
P 4600 1300
F 0 "U?" H 4850 1150 50  0000 C CNN
F 1 "LD1117S33TR_SOT223" H 4550 1450 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 4600 1500 50  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000544.pdf" H 4700 1050 50  0001 C CNN
F 4 "LD1117S33CTR" H 4600 1300 50  0001 C CNN "MPN"
	1    4600 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1650 4600 1650
Wire Wire Line
	4600 1650 4600 1600
Wire Wire Line
	4600 1650 5150 1650
Connection ~ 4600 1650
Wire Wire Line
	4600 1700 4600 1650
$Comp
L Device:C C?
U 1 1 61BFD87D
P 4000 1500
F 0 "C?" H 4115 1546 50  0000 L CNN
F 1 "0.1u" H 4115 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4038 1350 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 4000 1500 50  0001 C CNN
F 4 "C0805C104M5RAC" H 4000 1500 50  0001 C CNN "MPN"
	1    4000 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61BFE100
P 5150 1500
F 0 "C?" H 5265 1546 50  0000 L CNN
F 1 "10u" H 5265 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5188 1350 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 5150 1500 50  0001 C CNN
F 4 "CL21A106KOQNNNE" H 5150 1500 50  0001 C CNN "MPN"
	1    5150 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1350 4000 1300
Wire Wire Line
	4000 1300 4300 1300
Connection ~ 4000 1300
Wire Wire Line
	4000 1300 4000 1250
Wire Wire Line
	4900 1300 5150 1300
Wire Wire Line
	5150 1300 5150 1350
Wire Wire Line
	5150 1300 5150 1250
Connection ~ 5150 1300
$Comp
L power:GND #PWR?
U 1 1 61C0B24E
P 8250 1350
F 0 "#PWR?" H 8250 1100 50  0001 C CNN
F 1 "GND" H 8250 1200 50  0000 C CNN
F 2 "" H 8250 1350 50  0001 C CNN
F 3 "" H 8250 1350 50  0001 C CNN
	1    8250 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 1350 8350 1350
Wire Wire Line
	8350 1200 8250 1200
Text Notes 8150 900  0    50   ~ 0
Display and controller hierarchy
$Comp
L Device:R R?
U 1 1 61C1DD7F
P 5000 3400
F 0 "R?" H 4900 3500 50  0000 C CNN
F 1 "5.1k" H 4850 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4930 3400 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/447/yagos02312_1-2286750.pdf" H 5000 3400 50  0001 C CNN
F 4 "TR0805KR-075K1L" V 5000 3400 50  0001 C CNN "MPN"
	1    5000 3400
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 61C29694
P 5050 3150
F 0 "#PWR?" H 5050 3000 50  0001 C CNN
F 1 "VBUS" H 5050 3300 50  0000 C CNN
F 2 "" H 5050 3150 50  0001 C CNN
F 3 "" H 5050 3150 50  0001 C CNN
	1    5050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3800 1950 3850
Connection ~ 1950 3850
Wire Wire Line
	1950 3850 1950 3900
Wire Wire Line
	1950 4000 1950 4050
Connection ~ 1950 4050
Wire Wire Line
	1950 4050 1950 4100
Wire Wire Line
	4350 4000 2500 4000
Wire Wire Line
	2450 4000 2450 4050
Wire Wire Line
	1950 4050 2450 4050
Wire Wire Line
	4350 3900 2850 3900
Wire Wire Line
	2450 3900 2450 3850
Wire Wire Line
	1950 3850 2450 3850
Wire Wire Line
	1950 3300 1900 3300
Text Notes 5150 3750 0    50   ~ 0
Negotiate up current but stick to 5V bus
Text Notes 3150 4100 0    50   ~ 0
Add 33 ohm series resistors?
$Comp
L Device:C C?
U 1 1 61C3BE2E
P 2500 4250
F 0 "C?" H 2615 4296 50  0000 L CNN
F 1 "47p" H 2615 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 2538 4100 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 2500 4250 50  0001 C CNN
F 4 "C0402C470J5GAC" H 2500 4250 50  0001 C CNN "MPN"
	1    2500 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C3CAFC
P 2850 4250
F 0 "C?" H 2965 4296 50  0000 L CNN
F 1 "47p" H 2965 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 2888 4100 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 2850 4250 50  0001 C CNN
F 4 "C0402C470J5GAC" H 2850 4250 50  0001 C CNN "MPN"
	1    2850 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4100 2850 3900
Connection ~ 2850 3900
Wire Wire Line
	2850 3900 2450 3900
Wire Wire Line
	2500 4100 2500 4000
Connection ~ 2500 4000
Wire Wire Line
	2500 4000 2450 4000
$Comp
L power:GND #PWR?
U 1 1 61C3F557
P 2850 4450
F 0 "#PWR?" H 2850 4200 50  0001 C CNN
F 1 "GND" H 2850 4300 50  0000 C CNN
F 2 "" H 2850 4450 50  0001 C CNN
F 3 "" H 2850 4450 50  0001 C CNN
	1    2850 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C3F914
P 2500 4450
F 0 "#PWR?" H 2500 4200 50  0001 C CNN
F 1 "GND" H 2500 4300 50  0000 C CNN
F 2 "" H 2500 4450 50  0001 C CNN
F 3 "" H 2500 4450 50  0001 C CNN
	1    2500 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4450 2500 4400
Wire Wire Line
	2850 4450 2850 4400
Text Label 3600 5000 0    50   ~ 0
VCCIO
Text Label 3850 4800 0    50   ~ 0
VOUT3V3
Wire Wire Line
	5000 5500 5000 5550
Wire Wire Line
	5000 5550 5050 5550
Wire Wire Line
	5050 5550 5050 5600
Wire Wire Line
	5050 5550 5100 5550
Wire Wire Line
	5100 5550 5100 5500
Connection ~ 5050 5550
Wire Wire Line
	5050 3150 5050 3200
Wire Wire Line
	5050 3200 5100 3200
Wire Wire Line
	5050 3200 5000 3200
Connection ~ 5050 3200
$Comp
L FT260S-U:FT260S-U U1
U 1 1 61AFAB84
P 4350 3900
F 0 "U1" H 4600 4050 50  0000 C CNN
F 1 "FT260S-U" H 5550 2450 50  0000 C CNN
F 2 "Package_SO:TSSOP-28_4.4x9.7mm_P0.65mm" H 6250 3800 50  0001 L CNN
F 3 "https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT260.pdf" H 6300 3800 50  0001 L CNN
F 4 "FTDI - FT260S-U - INTERFACE BRIDGE, USB TO I2C/UART, TSSOP" H 6250 4000 50  0001 L CNN "Description"
F 5 "1.2" H 6250 3900 50  0001 L CNN "Height"
F 6 "FTDI Chip" H 6250 4100 50  0001 L CNN "Manufacturer_Name"
F 7 "FT260S-U" H 6750 4100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "Digi-Key" H 6350 3700 50  0001 L CNN "Supplier 1"
F 9 "768-1282-5-ND" H 6750 3700 50  0001 L CNN "Supplier Part Number 1"
F 10 "Mouser" H 6300 3600 50  0001 L CNN "Supplier 2"
F 11 "895-FT260S-U" H 6750 3600 50  0001 L CNN "Supplier Part Number 2"
	1    4350 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3550 5000 3600
Wire Wire Line
	5100 3200 5100 3600
Wire Wire Line
	5000 3200 5000 3250
$Comp
L Device:C C?
U 1 1 61C432D7
P 3650 7050
F 0 "C?" H 3765 7096 50  0000 L CNN
F 1 "4.7u" H 3765 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3688 6900 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 3650 7050 50  0001 C CNN
F 4 "CL21A475KAQNNNF" H 3650 7050 50  0001 C CNN "MPN"
	1    3650 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C6A831
P 4050 7050
F 0 "C?" H 4165 7096 50  0000 L CNN
F 1 "0.1u" H 4165 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4088 6900 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 4050 7050 50  0001 C CNN
F 4 "C0805C104M5RAC" H 4050 7050 50  0001 C CNN "MPN"
	1    4050 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C739AB
P 3850 7250
F 0 "#PWR?" H 3850 7000 50  0001 C CNN
F 1 "GND" H 3850 7100 50  0000 C CNN
F 2 "" H 3850 7250 50  0001 C CNN
F 3 "" H 3850 7250 50  0001 C CNN
	1    3850 7250
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 61C7568D
P 3850 6850
F 0 "#PWR?" H 3850 6700 50  0001 C CNN
F 1 "VBUS" H 3850 7000 50  0000 C CNN
F 2 "" H 3850 6850 50  0001 C CNN
F 3 "" H 3850 6850 50  0001 C CNN
	1    3850 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 6900 3850 6900
Wire Wire Line
	3850 6850 3850 6900
Connection ~ 3850 6900
Wire Wire Line
	3850 6900 4050 6900
Wire Wire Line
	3850 7250 3850 7200
Wire Wire Line
	3850 7200 3650 7200
Wire Wire Line
	3850 7200 4050 7200
Connection ~ 3850 7200
Text Label 3850 4450 0    50   ~ 0
STEST_RSTN
Text Label 3850 4550 0    50   ~ 0
RESETN
Wire Wire Line
	3850 4800 4350 4800
Wire Wire Line
	3850 4550 4350 4550
Wire Wire Line
	4350 4450 3850 4450
$Comp
L Device:R R?
U 1 1 61CA564F
P 4150 5100
F 0 "R?" V 4050 5000 50  0000 C CNN
F 1 "10k" V 4050 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 4080 5100 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 4150 5100 50  0001 C CNN
F 4 "CRG0603F10K/10" V 4150 5100 50  0001 C CNN "MPN"
	1    4150 5100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 61CA6BB4
P 4150 5200
F 0 "R?" V 4050 5300 50  0000 C CNN
F 1 "10k" V 4050 5100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 4080 5200 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 4150 5200 50  0001 C CNN
F 4 "CRG0603F10K/10" V 4150 5200 50  0001 C CNN "MPN"
	1    4150 5200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CAE23D
P 3900 5250
F 0 "#PWR?" H 3900 5000 50  0001 C CNN
F 1 "GND" H 3900 5100 50  0000 C CNN
F 2 "" H 3900 5250 50  0001 C CNN
F 3 "" H 3900 5250 50  0001 C CNN
	1    3900 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5100 3900 5000
Wire Wire Line
	3900 4900 4350 4900
Wire Wire Line
	3900 5100 4000 5100
Wire Wire Line
	4300 5100 4350 5100
Wire Wire Line
	4300 5200 4350 5200
Wire Wire Line
	3900 5250 3900 5200
Wire Wire Line
	3900 5200 4000 5200
Wire Wire Line
	3600 5000 3900 5000
Connection ~ 3900 5000
Wire Wire Line
	3900 5000 3900 4900
$Comp
L Device:C C?
U 1 1 61CCA003
P 4500 7050
F 0 "C?" H 4615 7096 50  0000 L CNN
F 1 "4.7u" H 4615 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4538 6900 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 4500 7050 50  0001 C CNN
F 4 "CL21A475KAQNNNF" H 4500 7050 50  0001 C CNN "MPN"
	1    4500 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61CCA240
P 4900 7050
F 0 "C?" H 5015 7096 50  0000 L CNN
F 1 "0.1u" H 5015 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4938 6900 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 4900 7050 50  0001 C CNN
F 4 "C0805C104M5RAC" H 4900 7050 50  0001 C CNN "MPN"
	1    4900 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CCE749
P 4700 7200
F 0 "#PWR?" H 4700 6950 50  0001 C CNN
F 1 "GND" H 4700 7050 50  0000 C CNN
F 2 "" H 4700 7200 50  0001 C CNN
F 3 "" H 4700 7200 50  0001 C CNN
	1    4700 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61CD1D36
P 5350 7050
F 0 "C?" H 5465 7096 50  0000 L CNN
F 1 "4.7u" H 5465 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5388 6900 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 5350 7050 50  0001 C CNN
F 4 "CL21A475KAQNNNF" H 5350 7050 50  0001 C CNN "MPN"
	1    5350 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61CD2237
P 5750 7050
F 0 "C?" H 5865 7096 50  0000 L CNN
F 1 "0.1u" H 5865 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5788 6900 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 5750 7050 50  0001 C CNN
F 4 "C0805C104M5RAC" H 5750 7050 50  0001 C CNN "MPN"
	1    5750 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CD29FB
P 5550 7200
F 0 "#PWR?" H 5550 6950 50  0001 C CNN
F 1 "GND" H 5550 7050 50  0000 C CNN
F 2 "" H 5550 7200 50  0001 C CNN
F 3 "" H 5550 7200 50  0001 C CNN
	1    5550 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 7200 5550 7200
Connection ~ 5550 7200
Wire Wire Line
	5550 7200 5750 7200
Wire Wire Line
	4900 7200 4700 7200
Connection ~ 4700 7200
Wire Wire Line
	4700 7200 4500 7200
Text Label 5850 6800 2    50   ~ 0
VOUT3V3
Text Label 4900 6800 2    50   ~ 0
VCCIO
Text Notes 6000 4250 0    50   ~ 0
Pull DCNF1 HIGH and DCNF0 LOW\n to enable only UART\n (DIO3 as RXD, DIO4 as TXD)
Text Label 5250 6550 0    50   ~ 0
VCCIO
Text Label 5700 6550 0    50   ~ 0
VOUT3V3
Wire Wire Line
	5250 6550 5250 6650
Wire Wire Line
	5250 6650 5700 6650
Wire Wire Line
	5700 6650 5700 6550
Wire Wire Line
	4700 6800 4900 6800
Wire Wire Line
	5550 6800 5850 6800
Wire Wire Line
	4500 6900 4700 6900
Wire Wire Line
	5350 6900 5550 6900
Wire Wire Line
	5550 6800 5550 6900
Connection ~ 5550 6900
Wire Wire Line
	5550 6900 5750 6900
Wire Wire Line
	4700 6800 4700 6900
Connection ~ 4700 6900
Wire Wire Line
	4700 6900 4900 6900
Text Notes 3800 6550 0    50   ~ 0
Bypass caps for USB interface IC
Wire Notes Line
	3850 1950 3850 900 
Wire Notes Line
	3850 900  5600 900 
Wire Notes Line
	3850 1950 5600 1950
$Comp
L power:VBUS #PWR?
U 1 1 61BF0816
P 8250 1150
F 0 "#PWR?" H 8250 1000 50  0001 C CNN
F 1 "VBUS" H 8250 1300 50  0000 C CNN
F 2 "" H 8250 1150 50  0001 C CNN
F 3 "" H 8250 1150 50  0001 C CNN
	1    8250 1150
	1    0    0    -1  
$EndComp
Wire Notes Line
	5600 900  5600 1950
Wire Wire Line
	8250 1150 8250 1200
Wire Notes Line
	8050 800  10000 800 
Wire Notes Line
	10000 800  10000 1800
Wire Notes Line
	10000 1800 8050 1800
Wire Notes Line
	8050 1800 8050 800 
$Comp
L Device:R_Shunt R?
U 1 1 61D53208
P 1950 3000
F 0 "R?" H 1900 2900 50  0000 R CNN
F 1 "0.001" H 1900 3100 50  0000 R CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 1880 3000 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/447/yago_s_a0007665561_1-2286784.pdf" H 1950 3000 50  0001 C CNN
F 4 "PA2512FKE070R001E" H 1950 3000 50  0001 C CNN "MPN"
	1    1950 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	1950 3200 1950 3300
Wire Wire Line
	1950 2750 1950 2800
Text Label 1250 3100 0    50   ~ 0
VBUS_SENSEP
Text Label 1250 2900 0    50   ~ 0
VBUS_SENSEN
Wire Wire Line
	1250 2900 1800 2900
Wire Wire Line
	1800 3100 1250 3100
Text Label 6350 4000 2    50   ~ 0
UART_RX_N
Text Label 6350 3900 2    50   ~ 0
UART_TX_P
Wire Wire Line
	6350 4000 5950 4000
Wire Wire Line
	5950 3900 6350 3900
Text Label 7650 5600 0    50   ~ 0
UART_RX_N
Text Label 7650 5500 0    50   ~ 0
UART_TX_P
Wire Wire Line
	7650 5500 8100 5500
Wire Wire Line
	7650 5600 8100 5600
Text Label 7650 5000 0    50   ~ 0
MCU_EN
Text Label 7650 5100 0    50   ~ 0
MCU_RESET
Wire Wire Line
	7650 5100 8100 5100
Wire Wire Line
	8100 5000 7650 5000
$Comp
L Device:C C?
U 1 1 61DA0D94
P 10000 4750
F 0 "C?" H 10115 4796 50  0000 L CNN
F 1 "10u" H 10115 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10038 4600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 10000 4750 50  0001 C CNN
F 4 "CL21A106KOQNNNE" H 10000 4750 50  0001 C CNN "MPN"
	1    10000 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61DA1517
P 10400 4750
F 0 "C?" H 10515 4796 50  0000 L CNN
F 1 "10u" H 10515 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10438 4600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 10400 4750 50  0001 C CNN
F 4 "CL21A106KOQNNNE" H 10400 4750 50  0001 C CNN "MPN"
	1    10400 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61DA17B4
P 10800 4750
F 0 "C?" H 10915 4796 50  0000 L CNN
F 1 "4.7u" H 10915 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10838 4600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 10800 4750 50  0001 C CNN
F 4 "CL21A475KAQNNNF" H 10800 4750 50  0001 C CNN "MPN"
	1    10800 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 4900 10000 4950
Wire Wire Line
	10000 4950 10400 4950
Wire Wire Line
	10800 4950 10800 4900
Wire Wire Line
	10400 4900 10400 4950
Connection ~ 10400 4950
Wire Wire Line
	10400 4950 10800 4950
Wire Wire Line
	10000 4600 10000 4550
Wire Wire Line
	10000 4550 10400 4550
Wire Wire Line
	10800 4550 10800 4600
Wire Wire Line
	10400 4600 10400 4550
Connection ~ 10400 4550
Wire Wire Line
	10400 4550 10800 4550
$Comp
L power:+3.3V #PWR?
U 1 1 61DB0214
P 10400 4500
F 0 "#PWR?" H 10400 4350 50  0001 C CNN
F 1 "+3.3V" H 10400 4650 50  0000 C CNN
F 2 "" H 10400 4500 50  0001 C CNN
F 3 "" H 10400 4500 50  0001 C CNN
	1    10400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 4500 10400 4550
Wire Wire Line
	8600 6050 8600 6000
$Comp
L power:GND #PWR?
U 1 1 61DB43E4
P 10400 5000
F 0 "#PWR?" H 10400 4750 50  0001 C CNN
F 1 "GND" H 10400 4850 50  0000 C CNN
F 2 "" H 10400 5000 50  0001 C CNN
F 3 "" H 10400 5000 50  0001 C CNN
	1    10400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 5000 10400 4950
Text Notes 10000 4300 0    50   ~ 0
Bypass caps for MCU
$Comp
L Device:R R?
U 1 1 61DD1185
P 9300 4800
F 0 "R?" H 9400 4900 50  0000 C CNN
F 1 "10k" H 9400 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 9230 4800 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 9300 4800 50  0001 C CNN
F 4 "CRG0603F10K/10" V 9300 4800 50  0001 C CNN "MPN"
	1    9300 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61DD18A0
P 9600 4800
F 0 "R?" H 9500 4700 50  0000 C CNN
F 1 "10k" H 9500 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 9530 4800 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 9600 4800 50  0001 C CNN
F 4 "CRG0603F10K/10" V 9600 4800 50  0001 C CNN "MPN"
	1    9600 4800
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 61DDECDD
P 9450 4550
F 0 "#PWR?" H 9450 4400 50  0001 C CNN
F 1 "+3.3V" H 9450 4700 50  0000 C CNN
F 2 "" H 9450 4550 50  0001 C CNN
F 3 "" H 9450 4550 50  0001 C CNN
	1    9450 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61DE862E
P 9600 5900
F 0 "R?" H 9500 5800 50  0000 C CNN
F 1 "10k" H 9500 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 9530 5900 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 9600 5900 50  0001 C CNN
F 4 "CRG0603F10K/10" V 9600 5900 50  0001 C CNN "MPN"
	1    9600 5900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61DE8C0A
P 9600 6100
F 0 "#PWR?" H 9600 5850 50  0001 C CNN
F 1 "GND" H 9500 6000 50  0000 C CNN
F 2 "" H 9600 6100 50  0001 C CNN
F 3 "" H 9600 6100 50  0001 C CNN
	1    9600 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61DF8707
P 10750 5450
F 0 "C?" V 10800 5500 50  0000 L CNN
F 1 "0.1u" V 10850 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10788 5300 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 10750 5450 50  0001 C CNN
F 4 "C0805C104M5RAC" H 10750 5450 50  0001 C CNN "MPN"
	1    10750 5450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 61DF870E
P 10350 5450
F 0 "R?" V 10450 5500 50  0000 C CNN
F 1 "10k" V 10450 5350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 10280 5450 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 10350 5450 50  0001 C CNN
F 4 "CRG0603F10K/10" V 10350 5450 50  0001 C CNN "MPN"
	1    10350 5450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61E06C7D
P 10950 5450
F 0 "#PWR?" H 10950 5200 50  0001 C CNN
F 1 "GND" H 10950 5300 50  0000 C CNN
F 2 "" H 10950 5450 50  0001 C CNN
F 3 "" H 10950 5450 50  0001 C CNN
	1    10950 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 61E107A5
P 10150 5450
F 0 "#PWR?" H 10150 5300 50  0001 C CNN
F 1 "+3.3V" H 10000 5550 50  0000 C CNN
F 2 "" H 10150 5450 50  0001 C CNN
F 3 "" H 10150 5450 50  0001 C CNN
	1    10150 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 5450 10950 5450
Wire Wire Line
	10200 5450 10150 5450
Wire Wire Line
	10500 5450 10550 5450
Text Label 10100 5600 0    50   ~ 0
MCU_RESET
Connection ~ 10550 5450
Wire Wire Line
	10550 5450 10600 5450
$Comp
L Device:C C?
U 1 1 61E301FC
P 10750 5950
F 0 "C?" V 10800 6000 50  0000 L CNN
F 1 "0.1u" V 10850 5750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10788 5800 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 10750 5950 50  0001 C CNN
F 4 "C0805C104M5RAC" H 10750 5950 50  0001 C CNN "MPN"
	1    10750 5950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 61E30203
P 10350 5950
F 0 "R?" V 10450 6000 50  0000 C CNN
F 1 "10k" V 10450 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 10280 5950 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 10350 5950 50  0001 C CNN
F 4 "CRG0603F10K/10" V 10350 5950 50  0001 C CNN "MPN"
	1    10350 5950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61E30209
P 10950 5950
F 0 "#PWR?" H 10950 5700 50  0001 C CNN
F 1 "GND" H 10950 5800 50  0000 C CNN
F 2 "" H 10950 5950 50  0001 C CNN
F 3 "" H 10950 5950 50  0001 C CNN
	1    10950 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 61E3020F
P 10150 5950
F 0 "#PWR?" H 10150 5800 50  0001 C CNN
F 1 "+3.3V" H 10000 6050 50  0000 C CNN
F 2 "" H 10150 5950 50  0001 C CNN
F 3 "" H 10150 5950 50  0001 C CNN
	1    10150 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 5950 10950 5950
Wire Wire Line
	10200 5950 10150 5950
Text Label 10100 6100 0    50   ~ 0
MCU_EN
Wire Wire Line
	9300 4650 9300 4600
Wire Wire Line
	9600 4600 9600 4650
Wire Wire Line
	9300 4600 9450 4600
Wire Wire Line
	9450 4550 9450 4600
Connection ~ 9450 4600
Wire Wire Line
	9450 4600 9600 4600
Text Label 9500 5200 2    50   ~ 0
MCU_IO4
Text Label 9500 5300 2    50   ~ 0
MCU_IO5
Text Label 9500 5400 2    50   ~ 0
MCU_IO12
Text Label 9500 5500 2    50   ~ 0
MCU_IO13
Text Label 9500 5600 2    50   ~ 0
MCU_IO14
Text Label 9500 5800 2    50   ~ 0
MCU_IO16
Wire Wire Line
	9500 5200 9100 5200
Wire Wire Line
	9100 5300 9500 5300
Wire Wire Line
	9500 5400 9100 5400
Wire Wire Line
	9100 5500 9500 5500
Wire Wire Line
	9500 5600 9100 5600
Wire Wire Line
	9100 5800 9500 5800
Wire Wire Line
	9600 6100 9600 6050
Wire Wire Line
	9600 5750 9600 5700
Wire Wire Line
	9600 5700 9100 5700
Wire Wire Line
	9300 5000 9300 4950
Wire Wire Line
	9100 5000 9300 5000
Wire Wire Line
	9600 5100 9600 4950
Wire Wire Line
	9100 5100 9600 5100
Text Notes 7600 4300 0    50   ~ 0
ESP micro-controller
Wire Wire Line
	10550 5600 10550 5450
Wire Wire Line
	10100 5600 10550 5600
Wire Wire Line
	10500 5950 10550 5950
Wire Wire Line
	10550 6100 10550 5950
Connection ~ 10550 5950
Wire Wire Line
	10550 5950 10600 5950
Wire Notes Line
	11100 4200 11100 6250
Wire Notes Line
	9850 5200 11100 5200
Wire Notes Line
	9850 4200 9850 6250
Wire Notes Line
	7550 6250 7550 4200
Wire Notes Line
	7550 6250 11100 6250
Wire Notes Line
	7550 4200 11100 4200
Wire Wire Line
	10100 6100 10550 6100
$EndSCHEMATC
