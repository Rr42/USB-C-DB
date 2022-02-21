EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:LED_ARGB D?
U 1 1 61B13687
P 7800 4600
AR Path="/61B13687" Ref="D?"  Part="1" 
AR Path="/61B0EECD/61B13687" Ref="D?"  Part="1" 
F 0 "D?" H 7800 5097 50  0000 C CNN
F 1 "LED_ARGB" H 7800 5006 50  0000 C CNN
F 2 "LED_SMD:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 7800 4550 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/723/CLV1L_FKB_1238-2583652.pdf" H 7800 4550 50  0001 C CNN
F 4 "CLV1L-FKB-CJ1N1E1BB7B3B3" H 7800 4600 50  0001 C CNN "MPN"
	1    7800 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 61B1368E
P 8350 4000
AR Path="/61B1368E" Ref="D?"  Part="1" 
AR Path="/61B0EECD/61B1368E" Ref="D?"  Part="1" 
F 0 "D?" H 8343 4217 50  0000 C CNN
F 1 "LED" H 8343 4126 50  0000 C CNN
F 2 "LED_SMD:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 8350 4000 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/723/CLA1AWKB-2528996.pdf" H 8350 4000 50  0001 C CNN
F 4 "CLA1A-WKB-CWbYa153" H 8350 4000 50  0001 C CNN "MPN"
	1    8350 4000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U?
U 1 1 61B173AE
P 7400 1550
F 0 "U?" H 7150 2100 50  0000 C CNN
F 1 "74HC595" H 7600 2100 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 7400 1550 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/308/1/MC74HCT595A_D-2315731.pdf" H 7400 1550 50  0001 C CNN
F 4 "MC74HCT595ADTR2G" H 7400 1550 50  0001 C CNN "MPN"
	1    7400 1550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U?
U 1 1 61B173B4
P 8300 1550
F 0 "U?" H 8050 2100 50  0000 C CNN
F 1 "74HC595" H 8500 2100 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 8300 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 8300 1550 50  0001 C CNN
	1    8300 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61C02CC2
P 7400 900
F 0 "#PWR?" H 7400 750 50  0001 C CNN
F 1 "+5V" H 7400 1050 50  0000 C CNN
F 2 "" H 7400 900 50  0001 C CNN
F 3 "" H 7400 900 50  0001 C CNN
	1    7400 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C047D1
P 7400 2300
F 0 "#PWR?" H 7400 2050 50  0001 C CNN
F 1 "GND" H 7400 2150 50  0000 C CNN
F 2 "" H 7400 2300 50  0001 C CNN
F 3 "" H 7400 2300 50  0001 C CNN
	1    7400 2300
	1    0    0    -1  
$EndComp
Text HLabel 1000 950  0    50   Input ~ 0
VCC
Text HLabel 1000 1050 0    50   Input ~ 0
GND
$Comp
L power:GND #PWR?
U 1 1 61C057F7
P 8300 2300
F 0 "#PWR?" H 8300 2050 50  0001 C CNN
F 1 "GND" H 8300 2150 50  0000 C CNN
F 2 "" H 8300 2300 50  0001 C CNN
F 3 "" H 8300 2300 50  0001 C CNN
	1    8300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2300 8300 2250
Wire Wire Line
	7400 2300 7400 2250
Wire Wire Line
	7400 900  7400 950 
$Comp
L power:+5V #PWR?
U 1 1 61C064E2
P 8300 900
F 0 "#PWR?" H 8300 750 50  0001 C CNN
F 1 "+5V" H 8300 1050 50  0000 C CNN
F 2 "" H 8300 900 50  0001 C CNN
F 3 "" H 8300 900 50  0001 C CNN
	1    8300 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 950  8300 900 
$Comp
L power:+5V #PWR?
U 1 1 61C07260
P 1100 950
F 0 "#PWR?" H 1100 800 50  0001 C CNN
F 1 "+5V" H 1100 1100 50  0000 C CNN
F 2 "" H 1100 950 50  0001 C CNN
F 3 "" H 1100 950 50  0001 C CNN
	1    1100 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C07618
P 1100 1050
F 0 "#PWR?" H 1100 800 50  0001 C CNN
F 1 "GND" H 1100 900 50  0000 C CNN
F 2 "" H 1100 1050 50  0001 C CNN
F 3 "" H 1100 1050 50  0001 C CNN
	1    1100 1050
	1    0    0    -1  
$EndComp
Text Notes 600  700  0    50   ~ 0
Hierarchy connectors
Wire Wire Line
	1100 950  1000 950 
Wire Wire Line
	1000 1050 1100 1050
$Comp
L Diode:1N4148W D?
U 1 1 62151722
P 2500 6750
F 0 "D?" V 2550 6900 50  0000 R CNN
F 1 "1N4148W" V 2400 7150 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 2500 6575 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/1057/1N4148W-1869619.pdf" H 2500 6750 50  0001 C CNN
F 4 "1N4148W_R1_00001" H 2500 6750 50  0001 C CNN "MPN"
	1    2500 6750
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 6218A734
P 2750 1350
F 0 "C?" H 2865 1396 50  0000 L CNN
F 1 "10u" H 2865 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2788 1200 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 2750 1350 50  0001 C CNN
F 4 "CL21A106KOQNNNE" H 2750 1350 50  0001 C CNN "MPN"
	1    2750 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6218AB57
P 3150 1350
F 0 "C?" H 3265 1396 50  0000 L CNN
F 1 "0.1u" H 3265 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3188 1200 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1002_X7R_SMD-1102033.pdf" H 3150 1350 50  0001 C CNN
F 4 "C0805C104M5RAC" H 3150 1350 50  0001 C CNN "MPN"
	1    3150 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 62195ACC
P 2350 1350
F 0 "C?" H 2465 1396 50  0000 L CNN
F 1 "4.7u" H 2465 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2388 1200 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/585/MLCC-1837944.pdf" H 2350 1350 50  0001 C CNN
F 4 "CL21A475KAQNNNF" H 2350 1350 50  0001 C CNN "MPN"
	1    2350 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6219E439
P 3200 6400
F 0 "#PWR?" H 3200 6250 50  0001 C CNN
F 1 "+5V" H 3200 6550 50  0000 C CNN
F 2 "" H 3200 6400 50  0001 C CNN
F 3 "" H 3200 6400 50  0001 C CNN
	1    3200 6400
	1    0    0    -1  
$EndComp
$Comp
L USB-C-DB-rescue:NA555D U?
U 1 1 621A91F5
P 3200 6900
F 0 "U?" H 3500 7250 50  0000 C CNN
F 1 "NA555D" H 2950 6550 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4050 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 4050 6500 50  0001 C CNN
	1    3200 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 621AA069
P 3750 7200
F 0 "C?" H 3865 7246 50  0000 L CNN
F 1 "47p" H 3865 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 3788 7050 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 3750 7200 50  0001 C CNN
F 4 "C0402C470J5GAC" H 3750 7200 50  0001 C CNN "MPN"
	1    3750 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 7050 3700 7050
Wire Wire Line
	3700 6750 3750 6750
Wire Wire Line
	3750 6750 3750 6450
Wire Wire Line
	3200 6450 3200 6500
Wire Wire Line
	3200 6450 3200 6400
Connection ~ 3200 6450
Wire Wire Line
	2700 6900 2650 6900
Wire Wire Line
	2650 7050 2700 7050
$Comp
L Device:C C?
U 1 1 621B06C1
P 2500 7150
F 0 "C?" H 2615 7196 50  0000 L CNN
F 1 "47p" H 2615 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 2538 7000 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 2500 7150 50  0001 C CNN
F 4 "C0402C470J5GAC" H 2500 7150 50  0001 C CNN "MPN"
	1    2500 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 621B0CEE
P 2150 7150
F 0 "C?" H 2265 7196 50  0000 L CNN
F 1 "47p" H 2265 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 2188 7000 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 2150 7150 50  0001 C CNN
F 4 "C0402C470J5GAC" H 2150 7150 50  0001 C CNN "MPN"
	1    2150 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 621B1117
P 1800 7150
F 0 "C?" H 1915 7196 50  0000 L CNN
F 1 "47p" H 1915 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 1838 7000 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 1800 7150 50  0001 C CNN
F 4 "C0402C470J5GAC" H 1800 7150 50  0001 C CNN "MPN"
	1    1800 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 621B1558
P 1450 7150
F 0 "C?" H 1565 7196 50  0000 L CNN
F 1 "47p" H 1565 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 1488 7000 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/212/KEM_C1003_C0G_SMD-1101588.pdf" H 1450 7150 50  0001 C CNN
F 4 "C0402C470J5GAC" H 1450 7150 50  0001 C CNN "MPN"
	1    1450 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 7350 3200 7300
Wire Wire Line
	3200 7350 3200 7400
Connection ~ 3200 7350
Wire Wire Line
	3750 7350 3200 7350
$Comp
L power:GND #PWR?
U 1 1 6219E97B
P 3200 7400
F 0 "#PWR?" H 3200 7150 50  0001 C CNN
F 1 "GND" H 3200 7250 50  0000 C CNN
F 2 "" H 3200 7400 50  0001 C CNN
F 3 "" H 3200 7400 50  0001 C CNN
	1    3200 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 7350 1800 7350
Wire Wire Line
	1450 6950 1450 7000
Wire Wire Line
	1800 7000 1800 6950
Wire Wire Line
	1450 7300 1450 7350
Wire Wire Line
	1800 7350 1800 7300
Connection ~ 1800 7350
Wire Wire Line
	1800 7350 2150 7350
Wire Wire Line
	2150 7300 2150 7350
Connection ~ 2150 7350
Wire Wire Line
	2150 7350 2500 7350
Wire Wire Line
	2500 7300 2500 7350
Connection ~ 2500 7350
Wire Wire Line
	2500 7350 3200 7350
Wire Wire Line
	2650 6900 2650 6950
Connection ~ 1800 6950
Connection ~ 2650 6950
Wire Wire Line
	2650 6950 2650 7050
Wire Wire Line
	2500 6900 2500 6950
Connection ~ 2500 6950
Wire Wire Line
	2500 6950 2650 6950
Wire Wire Line
	2500 6950 2500 7000
Wire Wire Line
	2150 7000 2150 6950
Connection ~ 2150 6950
Wire Wire Line
	2150 6950 2500 6950
Wire Wire Line
	2700 6750 2650 6750
Wire Wire Line
	2650 6750 2650 6550
Wire Wire Line
	2650 6550 2500 6550
Wire Wire Line
	2500 6550 2500 6600
$Comp
L Device:R R?
U 1 1 62183B08
P 2000 6100
F 0 "R?" V 2100 6100 50  0000 C CNN
F 1 "10k" V 1900 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 1930 6100 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 2000 6100 50  0001 C CNN
F 4 "CRG0603F10K/10" H 2000 6100 50  0001 C CNN "MPN"
	1    2000 6100
	0    -1   -1   0   
$EndComp
$Comp
L Diode:1N4148W D?
U 1 1 6219F63C
P 950 6750
F 0 "D?" V 900 6650 50  0000 C CNN
F 1 "1N4148W" V 1050 6550 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 950 6575 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/1057/1N4148W-1869619.pdf" H 950 6750 50  0001 C CNN
F 4 "1N4148W_R1_00001" H 950 6750 50  0001 C CNN "MPN"
	1    950  6750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 621C34E0
P 1150 6550
F 0 "R?" V 1050 6550 50  0000 C CNN
F 1 "10k" V 1250 6550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 1080 6550 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/418/NG_CD_1622829_BA-677553.pdf" H 1150 6550 50  0001 C CNN
F 4 "CRG0603F10K/10" H 1150 6550 50  0001 C CNN "MPN"
	1    1150 6550
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 621CF5ED
P 2200 6050
F 0 "#PWR?" H 2200 5900 50  0001 C CNN
F 1 "+5V" H 2200 6200 50  0000 C CNN
F 2 "" H 2200 6050 50  0001 C CNN
F 3 "" H 2200 6050 50  0001 C CNN
	1    2200 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 6100 1800 6150
Wire Wire Line
	1800 6950 2150 6950
Wire Wire Line
	1800 6950 1450 6950
Wire Wire Line
	3750 6450 3200 6450
$Comp
L USB-C-DB-rescue:RV100F-30-4K1-B1M VR?
U 1 1 6214C8F2
P 2250 6650
F 0 "VR?" H 2900 6300 50  0000 C CNN
F 1 "RV100F-30-4K1-B1M" H 2900 6800 50  0000 C CNN
F 2 "RV100F304K1B1M" H 3200 6750 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/RV100F-30-4K1-B1M.pdf" H 3200 6650 50  0001 L CNN
F 4 "Potentiometers 10mm Linear 1M PC Mount" H 3200 6550 50  0001 L CNN "Description"
F 5 "3.4" H 3200 6450 50  0001 L CNN "Height"
F 6 "312-1001F-1M" H 3200 6350 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Alpha-Taiwan/RV100F-30-4K1-B1M?qs=Y%252BBGkTaltXsB5KMzQF0w3g%3D%3D" H 3200 6250 50  0001 L CNN "Mouser Price/Stock"
F 8 "Alpha (Taiwan)" H 3200 6150 50  0001 L CNN "Manufacturer_Name"
F 9 "RV100F-30-4K1-B1M" H 3200 6050 50  0001 L CNN "Manufacturer_Part_Number"
F 10 "RV100F-30-4K1-B1M" H 2250 6650 50  0001 C CNN "MPN"
	1    2250 6650
	-1   0    0    1   
$EndComp
Wire Wire Line
	2250 6550 2500 6550
Connection ~ 2500 6550
Wire Wire Line
	1300 6550 1350 6550
Wire Wire Line
	950  6600 950  6550
Wire Wire Line
	950  6550 1000 6550
Wire Wire Line
	950  6900 950  6950
Wire Wire Line
	950  6950 1450 6950
Connection ~ 1450 6950
Wire Wire Line
	1800 6100 1850 6100
Wire Wire Line
	2150 6100 2200 6100
Wire Wire Line
	2200 6100 2200 6050
Text Notes 600  5750 0    50   ~ 0
PWM signal generator for brightness control
Wire Notes Line
	550  5650 550  7700
Wire Wire Line
	9200 900  9200 950 
$Comp
L power:+5V #PWR?
U 1 1 61C068D0
P 9200 900
F 0 "#PWR?" H 9200 750 50  0001 C CNN
F 1 "+5V" H 9200 1050 50  0000 C CNN
F 2 "" H 9200 900 50  0001 C CNN
F 3 "" H 9200 900 50  0001 C CNN
	1    9200 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 2300 9200 2250
$Comp
L power:GND #PWR?
U 1 1 61C05C6B
P 9200 2300
F 0 "#PWR?" H 9200 2050 50  0001 C CNN
F 1 "GND" H 9200 2150 50  0000 C CNN
F 2 "" H 9200 2300 50  0001 C CNN
F 3 "" H 9200 2300 50  0001 C CNN
	1    9200 2300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U?
U 1 1 61B173BA
P 9200 1550
F 0 "U?" H 8950 2100 50  0000 C CNN
F 1 "74HC595" H 9400 2100 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 9200 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 9200 1550 50  0001 C CNN
	1    9200 1550
	1    0    0    -1  
$EndComp
Text Notes 800  2450 0    50   ~ 0
ToDo:\n1. Add required bipass caps for IO and supply pins
Wire Wire Line
	3800 6900 3700 6900
Text Label 3800 6900 0    50   ~ 0
PWM_BC
Wire Notes Line
	550  7700 4150 7700
Wire Notes Line
	4150 7700 4150 5650
Wire Notes Line
	4150 5650 550  5650
Text Notes 2500 6150 0    50   ~ 0
PWM switching frequency is about 6.6kHz\n for a 1MEG ohm pot and 4x47pF caps.
Text Notes 700  7650 0    50   ~ 0
Using a 1MEG rotary thumbwheel potentiometer (VR) to control pulse width.
$EndSCHEMATC
