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
v0.3
Text Notes 8105 7635 0    50   ~ 0
18-12-2021
Text Notes 7290 7235 0    50   ~ 0
1
Text Notes 7375 7255 0    50   ~ 0
1
Text Notes 7000 6650 0    59   ~ 0
Mini display board for testing and evaluating a USB Type-C interface for Micro-controllers.
$Comp
L USB-C-DB-rescue:USB_C_Receptacle-Connector J1
U 1 1 61326B48
P 1150 3950
F 0 "J1" H 800 5100 50  0000 C CNN
F 1 "USB_C_Receptacle" V 700 2900 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 1300 3950 50  0001 C CNN
F 3 "https://gct.co/files/drawings/usb4105.pdf?v=109d7ce0-f2e0-439a-b81c-2ef6b9dd19d2" H 1300 3950 50  0001 C CNN
F 4 "USB4105-GF-A-120" H 1150 3950 50  0001 C CNN "MPN"
	1    1150 3950
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
Text Notes 1100 1200 0    50   ~ 0
Battery connector
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
Text Notes 1200 5700 0    50   ~ 0
Total  power with 80 RGB LEDs comes out to be\n around 1W (821mW Typ, 1.5W Max). Use fixed\n termination for requesting USB power state\n rather than using controller.
Text Notes 1950 2650 0    50   ~ 0
Current sence bead to detect\n USB power draw above 2.5W\n and throttle power to comply\n with the USB 2.0 spec.
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
P 2000 3250
F 0 "R?" V 2100 3150 50  0000 C CNN
F 1 "5.1k" V 2100 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1930 3250 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/447/yagos02312_1-2286750.pdf" H 2000 3250 50  0001 C CNN
F 4 "TR0805KR-075K1L" V 2000 3250 50  0001 C CNN "MPN"
	1    2000 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 61B20944
P 2000 3150
F 0 "R?" V 1900 3050 50  0000 C CNN
F 1 "5.1k" V 1900 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1930 3150 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/447/yagos02312_1-2286750.pdf" H 2000 3150 50  0001 C CNN
F 4 "TR0805KR-075K1L" V 2000 3150 50  0001 C CNN "MPN"
	1    2000 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 3250 1850 3250
Wire Wire Line
	1750 3150 1850 3150
Wire Wire Line
	2150 3150 2350 3150
Wire Wire Line
	2350 3150 2350 3200
Wire Wire Line
	2350 3250 2150 3250
$Comp
L power:GND #PWR?
U 1 1 61B23578
P 2450 3200
F 0 "#PWR?" H 2450 2950 50  0001 C CNN
F 1 "GND" H 2450 3050 50  0000 C CNN
F 2 "" H 2450 3200 50  0001 C CNN
F 3 "" H 2450 3200 50  0001 C CNN
	1    2450 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3200 2450 3200
Connection ~ 2350 3200
Wire Wire Line
	2350 3200 2350 3250
Wire Wire Line
	1750 3450 1800 3450
Wire Wire Line
	1800 3550 1750 3550
Wire Wire Line
	1750 3650 1800 3650
Wire Wire Line
	1800 3750 1750 3750
Text Label 1950 3700 0    50   ~ 0
USB2_P
Text Label 1950 3500 0    50   ~ 0
USB2_N
NoConn ~ 1750 3950
NoConn ~ 1750 4050
NoConn ~ 1750 4250
NoConn ~ 1750 4350
NoConn ~ 1750 4550
NoConn ~ 1750 4650
NoConn ~ 1750 4850
NoConn ~ 1750 4950
$Comp
L power:GND #PWR?
U 1 1 61B2BCDD
P 1150 5600
F 0 "#PWR?" H 1150 5350 50  0001 C CNN
F 1 "GND" H 1150 5450 50  0000 C CNN
F 2 "" H 1150 5600 50  0001 C CNN
F 3 "" H 1150 5600 50  0001 C CNN
	1    1150 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 5550 1150 5600
NoConn ~ 1750 5150
NoConn ~ 1750 5250
Wire Wire Line
	850  5550 850  5600
Wire Wire Line
	850  5600 1150 5600
Connection ~ 1150 5600
$Comp
L power:VBUS #PWR?
U 1 1 61B334E2
P 1800 2400
F 0 "#PWR?" H 1800 2250 50  0001 C CNN
F 1 "VBUS" H 1800 2550 50  0000 C CNN
F 2 "" H 1800 2400 50  0001 C CNN
F 3 "" H 1800 2400 50  0001 C CNN
	1    1800 2400
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
P 5050 5350
F 0 "#PWR?" H 5050 5100 50  0001 C CNN
F 1 "GND" H 5050 5200 50  0000 C CNN
F 2 "" H 5050 5350 50  0001 C CNN
F 3 "" H 5050 5350 50  0001 C CNN
	1    5050 5350
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
Text Notes 8100 900  0    50   ~ 0
Display and controller hierarchy
$Comp
L Device:R R?
U 1 1 61C1DD7F
P 5000 3150
F 0 "R?" H 4900 3250 50  0000 C CNN
F 1 "5.1k" H 4850 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4930 3150 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/447/yagos02312_1-2286750.pdf" H 5000 3150 50  0001 C CNN
F 4 "TR0805KR-075K1L" V 5000 3150 50  0001 C CNN "MPN"
	1    5000 3150
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 61C29694
P 5050 2900
F 0 "#PWR?" H 5050 2750 50  0001 C CNN
F 1 "VBUS" H 5050 3050 50  0000 C CNN
F 2 "" H 5050 2900 50  0001 C CNN
F 3 "" H 5050 2900 50  0001 C CNN
	1    5050 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3450 1800 3500
Connection ~ 1800 3500
Wire Wire Line
	1800 3500 1800 3550
Wire Wire Line
	1800 3650 1800 3700
Connection ~ 1800 3700
Wire Wire Line
	1800 3700 1800 3750
Wire Wire Line
	2300 3650 2300 3700
Wire Wire Line
	1800 3700 2300 3700
Wire Wire Line
	2300 3550 2300 3500
Wire Wire Line
	1800 3500 2300 3500
Wire Wire Line
	1800 2950 1750 2950
Text Notes 5150 3500 0    50   ~ 0
Negotiate up current but stick to 5V bus
Text Notes 3000 3300 0    50   ~ 0
Series resistor and clamp diodes\n for ESD protection
$Comp
L Device:C C?
U 1 1 61C3BE2E
P 2350 3900
F 0 "C?" H 2465 3946 50  0000 L CNN
F 1 "47p" H 2465 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 2388 3750 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 2350 3900 50  0001 C CNN
F 4 "C0402C470J5GAC" H 2350 3900 50  0001 C CNN "MPN"
	1    2350 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C3CAFC
P 2700 3900
F 0 "C?" H 2815 3946 50  0000 L CNN
F 1 "47p" H 2815 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 2738 3750 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 2700 3900 50  0001 C CNN
F 4 "C0402C470J5GAC" H 2700 3900 50  0001 C CNN "MPN"
	1    2700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3750 2700 3550
Wire Wire Line
	2700 3550 2300 3550
Wire Wire Line
	2350 3750 2350 3650
Wire Wire Line
	2350 3650 2300 3650
$Comp
L power:GND #PWR?
U 1 1 61C3F557
P 2700 4100
F 0 "#PWR?" H 2700 3850 50  0001 C CNN
F 1 "GND" H 2700 3950 50  0000 C CNN
F 2 "" H 2700 4100 50  0001 C CNN
F 3 "" H 2700 4100 50  0001 C CNN
	1    2700 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C3F914
P 2350 4100
F 0 "#PWR?" H 2350 3850 50  0001 C CNN
F 1 "GND" H 2350 3950 50  0000 C CNN
F 2 "" H 2350 4100 50  0001 C CNN
F 3 "" H 2350 4100 50  0001 C CNN
	1    2350 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4100 2350 4050
Wire Wire Line
	2700 4100 2700 4050
Text Label 3600 4750 0    50   ~ 0
VCCIO
Text Label 3850 4550 0    50   ~ 0
VOUT3V3
Wire Wire Line
	5000 5250 5000 5300
Wire Wire Line
	5000 5300 5050 5300
Wire Wire Line
	5050 5300 5050 5350
Wire Wire Line
	5050 5300 5100 5300
Wire Wire Line
	5100 5300 5100 5250
Connection ~ 5050 5300
Wire Wire Line
	5050 2900 5050 2950
Wire Wire Line
	5050 2950 5100 2950
Wire Wire Line
	5050 2950 5000 2950
Connection ~ 5050 2950
Wire Wire Line
	5000 3300 5000 3350
Wire Wire Line
	5100 2950 5100 3350
Wire Wire Line
	5000 2950 5000 3000
$Comp
L Device:C C?
U 1 1 61C432D7
P 3900 6750
F 0 "C?" H 4015 6796 50  0000 L CNN
F 1 "4.7u" H 4015 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3938 6600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 3900 6750 50  0001 C CNN
F 4 "CL21A475KAQNNNF" H 3900 6750 50  0001 C CNN "MPN"
	1    3900 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61C6A831
P 4300 6750
F 0 "C?" H 4415 6796 50  0000 L CNN
F 1 "0.1u" H 4415 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4338 6600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 4300 6750 50  0001 C CNN
F 4 "C0805C104M5RAC" H 4300 6750 50  0001 C CNN "MPN"
	1    4300 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C739AB
P 4100 6950
F 0 "#PWR?" H 4100 6700 50  0001 C CNN
F 1 "GND" H 4100 6800 50  0000 C CNN
F 2 "" H 4100 6950 50  0001 C CNN
F 3 "" H 4100 6950 50  0001 C CNN
	1    4100 6950
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 61C7568D
P 4100 6550
F 0 "#PWR?" H 4100 6400 50  0001 C CNN
F 1 "VBUS" H 4100 6700 50  0000 C CNN
F 2 "" H 4100 6550 50  0001 C CNN
F 3 "" H 4100 6550 50  0001 C CNN
	1    4100 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6600 4100 6600
Wire Wire Line
	4100 6550 4100 6600
Connection ~ 4100 6600
Wire Wire Line
	4100 6600 4300 6600
Wire Wire Line
	4100 6950 4100 6900
Wire Wire Line
	4100 6900 3900 6900
Wire Wire Line
	4100 6900 4300 6900
Connection ~ 4100 6900
Text Label 3850 4200 0    50   ~ 0
STEST_RSTN
Text Label 3850 4300 0    50   ~ 0
RESETN
Wire Wire Line
	3850 4550 4350 4550
Wire Wire Line
	3850 4300 4350 4300
Wire Wire Line
	4350 4200 3850 4200
$Comp
L Device:R R?
U 1 1 61CA564F
P 4150 4850
F 0 "R?" V 4050 4750 50  0000 C CNN
F 1 "10k" V 4050 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 4080 4850 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 4150 4850 50  0001 C CNN
F 4 "CRG0603F10K/10" V 4150 4850 50  0001 C CNN "MPN"
	1    4150 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 61CA6BB4
P 4150 4950
F 0 "R?" V 4050 5050 50  0000 C CNN
F 1 "10k" V 4050 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 4080 4950 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 4150 4950 50  0001 C CNN
F 4 "CRG0603F10K/10" V 4150 4950 50  0001 C CNN "MPN"
	1    4150 4950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CAE23D
P 3900 5000
F 0 "#PWR?" H 3900 4750 50  0001 C CNN
F 1 "GND" H 3900 4850 50  0000 C CNN
F 2 "" H 3900 5000 50  0001 C CNN
F 3 "" H 3900 5000 50  0001 C CNN
	1    3900 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4850 3900 4750
Wire Wire Line
	3900 4650 4350 4650
Wire Wire Line
	3900 4850 4000 4850
Wire Wire Line
	4300 4850 4350 4850
Wire Wire Line
	4300 4950 4350 4950
Wire Wire Line
	3900 5000 3900 4950
Wire Wire Line
	3900 4950 4000 4950
Wire Wire Line
	3600 4750 3900 4750
Connection ~ 3900 4750
Wire Wire Line
	3900 4750 3900 4650
$Comp
L Device:C C?
U 1 1 61CCA003
P 4750 6750
F 0 "C?" H 4865 6796 50  0000 L CNN
F 1 "4.7u" H 4865 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4788 6600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 4750 6750 50  0001 C CNN
F 4 "CL21A475KAQNNNF" H 4750 6750 50  0001 C CNN "MPN"
	1    4750 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61CCA240
P 5150 6750
F 0 "C?" H 5265 6796 50  0000 L CNN
F 1 "0.1u" H 5265 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5188 6600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 5150 6750 50  0001 C CNN
F 4 "C0805C104M5RAC" H 5150 6750 50  0001 C CNN "MPN"
	1    5150 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CCE749
P 4950 6900
F 0 "#PWR?" H 4950 6650 50  0001 C CNN
F 1 "GND" H 4950 6750 50  0000 C CNN
F 2 "" H 4950 6900 50  0001 C CNN
F 3 "" H 4950 6900 50  0001 C CNN
	1    4950 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61CD1D36
P 5600 6750
F 0 "C?" H 5715 6796 50  0000 L CNN
F 1 "4.7u" H 5715 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5638 6600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 5600 6750 50  0001 C CNN
F 4 "CL21A475KAQNNNF" H 5600 6750 50  0001 C CNN "MPN"
	1    5600 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61CD2237
P 6000 6750
F 0 "C?" H 6115 6796 50  0000 L CNN
F 1 "0.1u" H 6115 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6038 6600 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 6000 6750 50  0001 C CNN
F 4 "C0805C104M5RAC" H 6000 6750 50  0001 C CNN "MPN"
	1    6000 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61CD29FB
P 5800 6900
F 0 "#PWR?" H 5800 6650 50  0001 C CNN
F 1 "GND" H 5800 6750 50  0000 C CNN
F 2 "" H 5800 6900 50  0001 C CNN
F 3 "" H 5800 6900 50  0001 C CNN
	1    5800 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 6900 5800 6900
Connection ~ 5800 6900
Wire Wire Line
	5800 6900 6000 6900
Wire Wire Line
	5150 6900 4950 6900
Connection ~ 4950 6900
Wire Wire Line
	4950 6900 4750 6900
Text Label 5800 6500 0    50   ~ 0
VOUT3V3
Text Label 4950 6500 0    50   ~ 0
VCCIO
Text Notes 6000 4000 0    50   ~ 0
Pull DCNF1 HIGH and DCNF0 LOW\n to enable only UART\n (DIO3 as RXD, DIO4 as TXD)
Text Label 5500 6250 0    50   ~ 0
VCCIO
Text Label 5950 6250 0    50   ~ 0
VOUT3V3
Wire Wire Line
	5500 6250 5500 6350
Wire Wire Line
	5500 6350 5950 6350
Wire Wire Line
	5950 6350 5950 6250
Wire Wire Line
	4750 6600 4950 6600
Wire Wire Line
	5600 6600 5800 6600
Wire Wire Line
	5800 6500 5800 6600
Connection ~ 5800 6600
Wire Wire Line
	5800 6600 6000 6600
Wire Wire Line
	4950 6500 4950 6600
Connection ~ 4950 6600
Wire Wire Line
	4950 6600 5150 6600
Text Notes 4050 6250 0    50   ~ 0
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
P 1800 2650
F 0 "R?" H 1750 2550 50  0000 R CNN
F 1 "0.15" H 1750 2750 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 1730 2650 50  0001 C CNN
F 3 "https://product.tdk.com/system/files/dam/doc/product/emc/emc/beads/catalog/beads_automotive_power_kpz1608-hr_en.pdf" H 1800 2650 50  0001 C CNN
F 4 "KPZ1608SHR601ATD25" H 1800 2650 50  0001 C CNN "MPN"
	1    1800 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	1800 2850 1800 2950
Wire Wire Line
	1800 2400 1800 2450
Text Label 1100 2750 0    50   ~ 0
VBUS_SENSEP
Text Label 1100 2550 0    50   ~ 0
VBUS_SENSEN
Wire Wire Line
	1100 2550 1650 2550
Wire Wire Line
	1650 2750 1100 2750
Text Label 6350 3750 2    50   ~ 0
UART_RX_N
Text Label 6350 3650 2    50   ~ 0
UART_TX_P
Wire Wire Line
	6350 3750 5950 3750
Wire Wire Line
	5950 3650 6350 3650
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
Text Notes 9900 4300 0    50   ~ 0
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
P 10750 5500
F 0 "C?" V 10800 5550 50  0000 L CNN
F 1 "0.1u" V 10850 5300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10788 5350 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 10750 5500 50  0001 C CNN
F 4 "C0805C104M5RAC" H 10750 5500 50  0001 C CNN "MPN"
	1    10750 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 61DF870E
P 10350 5500
F 0 "R?" V 10450 5550 50  0000 C CNN
F 1 "10k" V 10450 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 10280 5500 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 10350 5500 50  0001 C CNN
F 4 "CRG0603F10K/10" V 10350 5500 50  0001 C CNN "MPN"
	1    10350 5500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61E06C7D
P 10950 5500
F 0 "#PWR?" H 10950 5250 50  0001 C CNN
F 1 "GND" H 10950 5350 50  0000 C CNN
F 2 "" H 10950 5500 50  0001 C CNN
F 3 "" H 10950 5500 50  0001 C CNN
	1    10950 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 61E107A5
P 10150 5500
F 0 "#PWR?" H 10150 5350 50  0001 C CNN
F 1 "+3.3V" H 10000 5600 50  0000 C CNN
F 2 "" H 10150 5500 50  0001 C CNN
F 3 "" H 10150 5500 50  0001 C CNN
	1    10150 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 5500 10950 5500
Wire Wire Line
	10200 5500 10150 5500
Wire Wire Line
	10500 5500 10550 5500
Text Label 10100 5650 0    50   ~ 0
MCU_RESET
Connection ~ 10550 5500
Wire Wire Line
	10550 5500 10600 5500
$Comp
L Device:C C?
U 1 1 61E301FC
P 10750 6000
F 0 "C?" V 10800 6050 50  0000 L CNN
F 1 "0.1u" V 10850 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10788 5850 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 10750 6000 50  0001 C CNN
F 4 "C0805C104M5RAC" H 10750 6000 50  0001 C CNN "MPN"
	1    10750 6000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 61E30203
P 10350 6000
F 0 "R?" V 10450 6050 50  0000 C CNN
F 1 "10k" V 10450 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 10280 6000 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 10350 6000 50  0001 C CNN
F 4 "CRG0603F10K/10" V 10350 6000 50  0001 C CNN "MPN"
	1    10350 6000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61E30209
P 10950 6000
F 0 "#PWR?" H 10950 5750 50  0001 C CNN
F 1 "GND" H 10950 5850 50  0000 C CNN
F 2 "" H 10950 6000 50  0001 C CNN
F 3 "" H 10950 6000 50  0001 C CNN
	1    10950 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 61E3020F
P 10150 6000
F 0 "#PWR?" H 10150 5850 50  0001 C CNN
F 1 "+3.3V" H 10000 6100 50  0000 C CNN
F 2 "" H 10150 6000 50  0001 C CNN
F 3 "" H 10150 6000 50  0001 C CNN
	1    10150 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 6000 10950 6000
Wire Wire Line
	10200 6000 10150 6000
Text Label 10100 6150 0    50   ~ 0
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
	10550 5650 10550 5500
Wire Wire Line
	10100 5650 10550 5650
Wire Wire Line
	10500 6000 10550 6000
Wire Wire Line
	10550 6150 10550 6000
Connection ~ 10550 6000
Wire Wire Line
	10550 6000 10600 6000
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
	10100 6150 10550 6150
$Comp
L Device:R R?
U 1 1 6208B250
P 3200 6400
F 0 "R?" V 3100 6300 50  0000 C CNN
F 1 "10k" V 3100 6500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 3130 6400 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 3200 6400 50  0001 C CNN
F 4 "CRG0603F10K/10" V 3200 6400 50  0001 C CNN "MPN"
	1    3200 6400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 6208C723
P 2650 6400
F 0 "R?" V 2550 6300 50  0000 C CNN
F 1 "4.7k" V 2550 6500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2580 6400 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/447/Yageo_03_18_2021_PYu_RC_Group_51_RoHS_L_11-2199992.pdf" H 2650 6400 50  0001 C CNN
F 4 "RC0805FR-074K7P" V 2650 6400 50  0001 C CNN "MPN"
	1    2650 6400
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 6208CFDA
P 2650 6800
F 0 "C?" H 2765 6846 50  0000 L CNN
F 1 "4.7u" H 2765 6755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2688 6650 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 2650 6800 50  0001 C CNN
F 4 "CL21A475KAQNNNF" H 2650 6800 50  0001 C CNN "MPN"
	1    2650 6800
	1    0    0    -1  
$EndComp
Text Label 2350 6600 0    50   ~ 0
RESETN
Text Label 3200 6650 0    50   ~ 0
STEST_RSTN
Wire Wire Line
	3200 6550 3200 6650
Wire Wire Line
	2650 6200 2650 6250
Wire Wire Line
	2900 6200 2900 6100
Wire Wire Line
	2900 6200 2650 6200
Text Label 2900 6100 0    50   ~ 0
VCCIO
Wire Wire Line
	2650 6550 2650 6600
$Comp
L power:GND #PWR?
U 1 1 620A6FD8
P 2650 7000
F 0 "#PWR?" H 2650 6750 50  0001 C CNN
F 1 "GND" H 2650 6850 50  0000 C CNN
F 2 "" H 2650 7000 50  0001 C CNN
F 3 "" H 2650 7000 50  0001 C CNN
	1    2650 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 7000 2650 6950
Wire Wire Line
	2350 6600 2650 6600
Connection ~ 2650 6600
Wire Wire Line
	2650 6600 2650 6650
Text Notes 5150 5300 0    50   ~ 0
USB controller set to use a\n Bus Powered Configuration
Text Label 3850 3950 0    50   ~ 0
EFUSE_PROG
Wire Wire Line
	3850 3950 4350 3950
Text Label 1400 6700 0    50   ~ 0
EFUSE_PROG
$Comp
L power:VBUS #PWR?
U 1 1 620C4F9E
P 1900 6050
F 0 "#PWR?" H 1900 5900 50  0001 C CNN
F 1 "VBUS" H 1900 6200 50  0000 C CNN
F 2 "" H 1900 6050 50  0001 C CNN
F 3 "" H 1900 6050 50  0001 C CNN
	1    1900 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 620C5552
P 1900 7100
F 0 "#PWR?" H 1900 6850 50  0001 C CNN
F 1 "GND" H 1900 6950 50  0000 C CNN
F 2 "" H 1900 7100 50  0001 C CNN
F 3 "" H 1900 7100 50  0001 C CNN
	1    1900 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 620C610A
P 1900 6900
F 0 "R?" V 1800 6800 50  0000 C CNN
F 1 "10k" V 1800 7000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 1830 6900 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 1900 6900 50  0001 C CNN
F 4 "CRG0603F10K/10" V 1900 6900 50  0001 C CNN "MPN"
	1    1900 6900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 620C6B5B
P 1900 6500
F 0 "R?" V 1800 6400 50  0000 C CNN
F 1 "13k" V 1800 6600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1830 6500 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/447/Yageo_03_18_2021_PYu_RC_Group_51_RoHS_L_11-2199992.pdf" H 1900 6500 50  0001 C CNN
F 4 "RC0805FR-0713KL" V 1900 6500 50  0001 C CNN "MPN"
	1    1900 6500
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 620C741C
P 1700 6100
F 0 "J?" H 1750 6100 50  0000 L CNN
F 1 "EFPROG_POS" H 1550 6000 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 1700 6100 50  0001 C CNN
F 3 "~" H 1700 6100 50  0001 C CNN
	1    1700 6100
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 620C88AD
P 1700 6300
F 0 "J?" H 1750 6300 50  0000 L CNN
F 1 "EFPROG_NEG" H 1550 6400 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 1700 6300 50  0001 C CNN
F 3 "~" H 1700 6300 50  0001 C CNN
	1    1700 6300
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 6100 1900 6050
Wire Wire Line
	1900 6300 1900 6350
Wire Wire Line
	1900 7050 1900 7100
Wire Wire Line
	1900 6650 1900 6700
Wire Wire Line
	1900 6700 1400 6700
Connection ~ 1900 6700
Wire Wire Line
	1900 6700 1900 6750
$Comp
L Device:R R?
U 1 1 62129999
P 3100 3550
F 0 "R?" V 3000 3450 50  0000 C CNN
F 1 "11" V 3000 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" V 3030 3550 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/427/crcwce3-1762584.pdf" H 3100 3550 50  0001 C CNN
F 4 "CRCW040211R0FKEDC" V 3100 3550 50  0001 C CNN "MPN"
	1    3100 3550
	0    1    1    0   
$EndComp
$Comp
L USB-C-DB-rescue:FT260S-U U1
U 1 1 62150EA6
P 4350 3650
F 0 "U1" H 4600 3800 50  0000 C CNN
F 1 "FT260S-U" H 5550 2200 50  0000 C CNN
F 2 "Mouser-imports:SOP65P640X120-28N" H 6250 3550 50  0001 L CNN
F 3 "https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT260.pdf" H 6300 3550 50  0001 L CNN
F 4 "FTDI - FT260S-U - INTERFACE BRIDGE, USB TO I2C/UART, TSSOP" H 6250 3750 50  0001 L CNN "Description"
F 5 "1.2" H 6250 3650 50  0001 L CNN "Height"
F 6 "FTDI Chip" H 6250 3850 50  0001 L CNN "Manufacturer_Name"
F 7 "FT260S-U" H 6750 3850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "Digi-Key" H 6350 3450 50  0001 L CNN "Supplier 1"
F 9 "768-1282-5-ND" H 6750 3450 50  0001 L CNN "Supplier Part Number 1"
F 10 "Mouser" H 6300 3350 50  0001 L CNN "Supplier 2"
F 11 "895-FT260S-U" H 6750 3350 50  0001 L CNN "Supplier Part Number 2"
F 12 "FT260S-U" H 4350 3650 50  0001 C CNN "MPN"
	1    4350 3650
	1    0    0    -1  
$EndComp
$Comp
L USB-C-DB-rescue:NUF2221W1T2G U?
U 1 1 621665F6
P 3800 3650
F 0 "U?" H 3600 3400 50  0000 C CNN
F 1 "NUF2221W1T2G" H 3800 3900 50  0000 C CNN
F 2 "SOT65P210X110-6N" H 4850 3750 50  0001 L CNN
F 3 "http://www.onsemi.com/pub/Collateral/NUF2221W1T2-D.PDF" H 4850 3650 50  0001 L CNN
F 4 "USB Upstream Terminator with ESD Protection" H 4850 3550 50  0001 L CNN "Description"
F 5 "1.1" H 4850 3450 50  0001 L CNN "Height"
F 6 "863-NUF2221W1T2G" H 4850 3350 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/ON-Semiconductor/NUF2221W1T2G/?qs=ZXBb0xZ9WeBhigCT%252BMBgKA%3D%3D" H 4850 3250 50  0001 L CNN "Mouser Price/Stock"
F 8 "ON Semiconductor" H 4850 3150 50  0001 L CNN "Manufacturer_Name"
F 9 "NUF2221W1T2G" H 4850 3050 50  0001 L CNN "Manufacturer_Part_Number"
F 10 "NUF2221W1T2G" H 3800 3650 50  0001 C CNN "MPN"
	1    3800 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 621A0F86
P 3100 3650
F 0 "R?" V 3200 3550 50  0000 C CNN
F 1 "11" V 3200 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" V 3030 3650 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/427/crcwce3-1762584.pdf" H 3100 3650 50  0001 C CNN
F 4 "CRCW040211R0FKEDC" V 3100 3650 50  0001 C CNN "MPN"
	1    3100 3650
	0    1    1    0   
$EndComp
Connection ~ 2350 3650
Connection ~ 2700 3550
Wire Wire Line
	4250 3650 4350 3650
Wire Wire Line
	4350 3750 4250 3750
$Comp
L power:GND #PWR?
U 1 1 621E9CAA
P 3300 3850
F 0 "#PWR?" H 3300 3600 50  0001 C CNN
F 1 "GND" H 3300 3700 50  0000 C CNN
F 2 "" H 3300 3850 50  0001 C CNN
F 3 "" H 3300 3850 50  0001 C CNN
	1    3300 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3850 3300 3800
Wire Wire Line
	3300 3800 3350 3800
$Comp
L power:VBUS #PWR?
U 1 1 621F1E3A
P 4300 3450
F 0 "#PWR?" H 4300 3300 50  0001 C CNN
F 1 "VBUS" H 4300 3600 50  0000 C CNN
F 2 "" H 4300 3450 50  0001 C CNN
F 3 "" H 4300 3450 50  0001 C CNN
	1    4300 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3450 4300 3500
Wire Wire Line
	4300 3500 4250 3500
Wire Wire Line
	2350 3650 2950 3650
Wire Wire Line
	2700 3550 2950 3550
Wire Wire Line
	3250 3550 3350 3550
Wire Wire Line
	3250 3650 3350 3650
Wire Notes Line
	7400 2150 7400 6450
Wire Notes Line
	7400 6450 6450 6450
Wire Notes Line
	6450 6450 6450 7350
Wire Notes Line
	6450 7350 600  7350
Wire Notes Line
	600  7350 600  2150
Wire Notes Line
	600  2150 7400 2150
Text Notes 650  2250 0    50   ~ 0
USB interface
Wire Notes Line
	1050 1100 1050 1900
Wire Notes Line
	1050 1900 2300 1900
Wire Notes Line
	2300 1900 2300 1100
Wire Notes Line
	2300 1100 1050 1100
Text Notes 9900 5300 0    50   ~ 0
Default states for MCU
NoConn ~ 5950 3850
NoConn ~ 5950 3950
NoConn ~ 5950 4050
NoConn ~ 5950 4150
NoConn ~ 5950 4250
NoConn ~ 5950 4350
NoConn ~ 5950 4450
NoConn ~ 5950 4550
NoConn ~ 5950 4650
NoConn ~ 5950 4750
NoConn ~ 5950 4950
Text Label 6300 4850 0    50   ~ 0
NOT_SUSPOUT
Wire Wire Line
	5950 4850 6100 4850
$Comp
L Device:R R?
U 1 1 62310C8D
P 6100 4700
F 0 "R?" H 6000 4600 50  0000 C CNN
F 1 "10k" H 6000 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 6030 4700 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 6100 4700 50  0001 C CNN
F 4 "CRG0603F10K/10" V 6100 4700 50  0001 C CNN "MPN"
	1    6100 4700
	-1   0    0    1   
$EndComp
Text Label 6100 4500 0    50   ~ 0
VCCIO
Wire Wire Line
	6100 4850 6300 4850
Connection ~ 6100 4850
Wire Wire Line
	6100 4550 6100 4500
Text Notes 7900 3300 0    50   ~ 0
ToDo:\n1. Wire up functionality for USB interface's RESETN\n2. Wire up functionality for MCU's RESET and EN\n3. Wire up functionality for programming MCU in the fly\n4. Fill up the display subsircuit
Text Label 3850 4050 0    50   ~ 0
DEBUGGER
Wire Wire Line
	3850 4050 4350 4050
Text Label 3000 6750 0    50   ~ 0
DEBUGGER
$Comp
L Device:R R?
U 1 1 62334833
P 3000 6400
F 0 "R?" V 2900 6300 50  0000 C CNN
F 1 "10k" V 2900 6500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 2930 6400 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 3000 6400 50  0001 C CNN
F 4 "CRG0603F10K/10" V 3000 6400 50  0001 C CNN "MPN"
	1    3000 6400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 6200 3000 6200
Wire Wire Line
	3000 6200 3000 6250
Connection ~ 2900 6200
Wire Wire Line
	3000 6200 3200 6200
Wire Wire Line
	3200 6200 3200 6250
Connection ~ 3000 6200
Wire Wire Line
	3000 6550 3000 6750
Text Notes 7650 3750 0    50   ~ 0
For 1, 2, 3 use MOSFETs to trigger RESET and enables on different IO domains
$Comp
L Device:C C?
U 1 1 62161AC5
P 5850 -1500
F 0 "C?" H 5965 -1454 50  0000 L CNN
F 1 "47p" H 5965 -1545 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 5888 -1650 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 5850 -1500 50  0001 C CNN
F 4 "C0402C470J5GAC" H 5850 -1500 50  0001 C CNN "MPN"
	1    5850 -1500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
