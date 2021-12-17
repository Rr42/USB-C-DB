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
P 4250 5550
AR Path="/61B13687" Ref="D?"  Part="1" 
AR Path="/61B0EECD/61B13687" Ref="D?"  Part="1" 
F 0 "D?" H 4250 6047 50  0000 C CNN
F 1 "LED_ARGB" H 4250 5956 50  0000 C CNN
F 2 "LED_SMD:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 4250 5500 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/723/CLV1L_FKB_1238-2583652.pdf" H 4250 5500 50  0001 C CNN
F 4 "CLV1L-FKB-CJ1N1E1BB7B3B3" H 4250 5550 50  0001 C CNN "MPN"
	1    4250 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 61B1368E
P 5500 5500
AR Path="/61B1368E" Ref="D?"  Part="1" 
AR Path="/61B0EECD/61B1368E" Ref="D?"  Part="1" 
F 0 "D?" H 5493 5717 50  0000 C CNN
F 1 "LED" H 5493 5626 50  0000 C CNN
F 2 "LED_SMD:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 5500 5500 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/723/CLA1AWKB-2528996.pdf" H 5500 5500 50  0001 C CNN
F 4 "CLA1A-WKB-CWbYa153" H 5500 5500 50  0001 C CNN "MPN"
	1    5500 5500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U?
U 1 1 61B173AE
P 7050 2000
F 0 "U?" H 6800 2550 50  0000 C CNN
F 1 "74HC595" H 7250 2550 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 7050 2000 50  0001 C CNN
F 3 "https://www.mouser.in/datasheet/2/308/1/MC74HCT595A_D-2315731.pdf" H 7050 2000 50  0001 C CNN
F 4 "MC74HCT595ADTR2G" H 7050 2000 50  0001 C CNN "MPN"
	1    7050 2000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U?
U 1 1 61B173B4
P 7950 2000
F 0 "U?" H 7700 2550 50  0000 C CNN
F 1 "74HC595" H 8150 2550 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 7950 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 7950 2000 50  0001 C CNN
	1    7950 2000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U?
U 1 1 61B173BA
P 8800 2000
F 0 "U?" H 8550 2550 50  0000 C CNN
F 1 "74HC595" H 9000 2550 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 8800 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 8800 2000 50  0001 C CNN
	1    8800 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61C02CC2
P 7050 1350
F 0 "#PWR?" H 7050 1200 50  0001 C CNN
F 1 "+5V" H 7050 1500 50  0000 C CNN
F 2 "" H 7050 1350 50  0001 C CNN
F 3 "" H 7050 1350 50  0001 C CNN
	1    7050 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C047D1
P 7050 2750
F 0 "#PWR?" H 7050 2500 50  0001 C CNN
F 1 "GND" H 7050 2600 50  0000 C CNN
F 2 "" H 7050 2750 50  0001 C CNN
F 3 "" H 7050 2750 50  0001 C CNN
	1    7050 2750
	1    0    0    -1  
$EndComp
Text HLabel 1300 1400 0    50   Input ~ 0
VCC
Text HLabel 1300 1500 0    50   Input ~ 0
GND
$Comp
L power:GND #PWR?
U 1 1 61C057F7
P 7950 2750
F 0 "#PWR?" H 7950 2500 50  0001 C CNN
F 1 "GND" H 7950 2600 50  0000 C CNN
F 2 "" H 7950 2750 50  0001 C CNN
F 3 "" H 7950 2750 50  0001 C CNN
	1    7950 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C05C6B
P 8800 2750
F 0 "#PWR?" H 8800 2500 50  0001 C CNN
F 1 "GND" H 8800 2600 50  0000 C CNN
F 2 "" H 8800 2750 50  0001 C CNN
F 3 "" H 8800 2750 50  0001 C CNN
	1    8800 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2750 7950 2700
Wire Wire Line
	8800 2750 8800 2700
Wire Wire Line
	7050 2750 7050 2700
Wire Wire Line
	7050 1350 7050 1400
$Comp
L power:+5V #PWR?
U 1 1 61C064E2
P 7950 1350
F 0 "#PWR?" H 7950 1200 50  0001 C CNN
F 1 "+5V" H 7950 1500 50  0000 C CNN
F 2 "" H 7950 1350 50  0001 C CNN
F 3 "" H 7950 1350 50  0001 C CNN
	1    7950 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61C068D0
P 8800 1350
F 0 "#PWR?" H 8800 1200 50  0001 C CNN
F 1 "+5V" H 8800 1500 50  0000 C CNN
F 2 "" H 8800 1350 50  0001 C CNN
F 3 "" H 8800 1350 50  0001 C CNN
	1    8800 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1350 8800 1400
Wire Wire Line
	7950 1400 7950 1350
$Comp
L power:+5V #PWR?
U 1 1 61C07260
P 1400 1400
F 0 "#PWR?" H 1400 1250 50  0001 C CNN
F 1 "+5V" H 1400 1550 50  0000 C CNN
F 2 "" H 1400 1400 50  0001 C CNN
F 3 "" H 1400 1400 50  0001 C CNN
	1    1400 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C07618
P 1400 1500
F 0 "#PWR?" H 1400 1250 50  0001 C CNN
F 1 "GND" H 1400 1350 50  0000 C CNN
F 2 "" H 1400 1500 50  0001 C CNN
F 3 "" H 1400 1500 50  0001 C CNN
	1    1400 1500
	1    0    0    -1  
$EndComp
Text Notes 900  1150 0    50   ~ 0
Hierarchy connectors
Wire Wire Line
	1400 1400 1300 1400
Wire Wire Line
	1300 1500 1400 1500
$EndSCHEMATC
