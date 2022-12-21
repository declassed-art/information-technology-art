EESchema Schematic File Version 4
EELAYER 26 0
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
$Comp
L MCU_Microchip_ATmega:ATmega48PA-AU U?
U 1 1 60AD6DC8
P 4100 3600
F 0 "U?" H 4350 5200 50  0000 C CNN
F 1 "ATmega48PA-AU" H 4600 5100 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 4100 3600 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega48PA_88PA_168PA-Data-Sheet-40002011A.pdf" H 4100 3600 50  0001 C CNN
	1    4100 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 60AD6F1C
P 5500 2000
F 0 "J?" V 5550 1812 50  0000 R CNN
F 1 "Conn_02x03_Odd_Even" V 5505 1812 50  0001 R CNN
F 2 "" H 5500 2000 50  0001 C CNN
F 3 "~" H 5500 2000 50  0001 C CNN
	1    5500 2000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 2800 5400 2800
Wire Wire Line
	5400 2800 5400 2200
Wire Wire Line
	4700 2900 5500 2900
Wire Wire Line
	5500 2900 5500 2200
Wire Wire Line
	4700 3900 5600 3900
Wire Wire Line
	5600 3900 5600 2200
Wire Wire Line
	4700 2700 5200 2700
Wire Wire Line
	5200 2700 5200 1600
Wire Wire Line
	5200 1600 5500 1600
Wire Wire Line
	5500 1600 5500 1700
$Comp
L power:VCC #PWR?
U 1 1 60AF5C70
P 5400 1500
F 0 "#PWR?" H 5400 1350 50  0001 C CNN
F 1 "VCC" H 5417 1673 50  0000 C CNN
F 2 "" H 5400 1500 50  0001 C CNN
F 3 "" H 5400 1500 50  0001 C CNN
	1    5400 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60AF5CE7
P 5900 1700
F 0 "#PWR?" H 5900 1450 50  0001 C CNN
F 1 "GND" H 5905 1527 50  0000 C CNN
F 2 "" H 5900 1700 50  0001 C CNN
F 3 "" H 5900 1700 50  0001 C CNN
	1    5900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1700 5400 1500
Wire Wire Line
	5600 1700 5600 1600
Wire Wire Line
	5600 1600 5900 1600
Wire Wire Line
	5900 1600 5900 1700
$Comp
L power:VCC #PWR?
U 1 1 60AF5E86
P 4100 1900
F 0 "#PWR?" H 4100 1750 50  0001 C CNN
F 1 "VCC" H 4117 2073 50  0000 C CNN
F 2 "" H 4100 1900 50  0001 C CNN
F 3 "" H 4100 1900 50  0001 C CNN
	1    4100 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2100 4100 2000
Wire Wire Line
	4100 2000 4200 2000
Wire Wire Line
	4200 2000 4200 2100
Connection ~ 4100 2000
Wire Wire Line
	4100 2000 4100 1900
$Comp
L power:GND #PWR?
U 1 1 60AF61EC
P 4100 5200
F 0 "#PWR?" H 4100 4950 50  0001 C CNN
F 1 "GND" H 4105 5027 50  0000 C CNN
F 2 "" H 4100 5200 50  0001 C CNN
F 3 "" H 4100 5200 50  0001 C CNN
	1    4100 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5200 4100 5100
NoConn ~ 3500 2400
NoConn ~ 3500 2600
NoConn ~ 3500 2700
$Comp
L Device:C C?
U 1 1 60AF68BE
P 6400 1850
F 0 "C?" H 6515 1896 50  0000 L CNN
F 1 "10uF" H 6515 1805 50  0000 L CNN
F 2 "" H 6438 1700 50  0001 C CNN
F 3 "~" H 6400 1850 50  0001 C CNN
	1    6400 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60AF6920
P 6400 2100
F 0 "#PWR?" H 6400 1850 50  0001 C CNN
F 1 "GND" H 6405 1927 50  0000 C CNN
F 2 "" H 6400 2100 50  0001 C CNN
F 3 "" H 6400 2100 50  0001 C CNN
	1    6400 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60AF6931
P 6400 1600
F 0 "#PWR?" H 6400 1450 50  0001 C CNN
F 1 "VCC" H 6417 1773 50  0000 C CNN
F 2 "" H 6400 1600 50  0001 C CNN
F 3 "" H 6400 1600 50  0001 C CNN
	1    6400 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1600 6400 1700
Wire Wire Line
	6400 2000 6400 2100
$Comp
L Device:C C?
U 1 1 60AF6F6E
P 7000 1850
F 0 "C?" H 7115 1896 50  0000 L CNN
F 1 "10uF" H 7115 1805 50  0000 L CNN
F 2 "" H 7038 1700 50  0001 C CNN
F 3 "~" H 7000 1850 50  0001 C CNN
	1    7000 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60AF6F75
P 7000 2100
F 0 "#PWR?" H 7000 1850 50  0001 C CNN
F 1 "GND" H 7005 1927 50  0000 C CNN
F 2 "" H 7000 2100 50  0001 C CNN
F 3 "" H 7000 2100 50  0001 C CNN
	1    7000 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60AF6F7B
P 7000 1600
F 0 "#PWR?" H 7000 1450 50  0001 C CNN
F 1 "VCC" H 7017 1773 50  0000 C CNN
F 2 "" H 7000 1600 50  0001 C CNN
F 3 "" H 7000 1600 50  0001 C CNN
	1    7000 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1600 7000 1700
Wire Wire Line
	7000 2000 7000 2100
Wire Wire Line
	4700 3300 4800 3300
Wire Wire Line
	4800 3300 4800 3400
Wire Wire Line
	4800 3700 4700 3700
Wire Wire Line
	4700 3400 4800 3400
Connection ~ 4800 3400
Wire Wire Line
	4800 3400 4800 3500
Wire Wire Line
	4700 3500 4800 3500
Connection ~ 4800 3500
Wire Wire Line
	4800 3500 4800 3600
Wire Wire Line
	4700 4100 4800 4100
Wire Wire Line
	4800 4100 4800 4200
Wire Wire Line
	4800 4500 4700 4500
Wire Wire Line
	4700 4200 4800 4200
Connection ~ 4800 4200
Wire Wire Line
	4800 4200 4800 4300
Wire Wire Line
	4700 4300 4800 4300
Connection ~ 4800 4300
Wire Wire Line
	4800 4300 4800 4400
Wire Wire Line
	4700 4400 4800 4400
Connection ~ 4800 4400
Wire Wire Line
	4800 4400 4800 4500
Wire Wire Line
	4700 3600 4800 3600
Connection ~ 4800 3600
Wire Wire Line
	4800 3600 4800 3700
Text GLabel 5800 3700 2    50   UnSpc ~ 0
HEAD+
Text GLabel 5800 4100 2    50   UnSpc ~ 0
HEAD-
Wire Wire Line
	4800 3700 5800 3700
Connection ~ 4800 3700
Wire Wire Line
	4800 4100 5800 4100
Connection ~ 4800 4100
Text GLabel 5750 2500 2    50   UnSpc ~ 0
MOTOR-W-GREEN+
Text GLabel 5800 4800 2    50   UnSpc ~ 0
MOTOR-V-YELLOW+
Text GLabel 5800 4600 2    50   UnSpc ~ 0
MOTOR-U-BLUE+
$Comp
L Device:CP C?
U 1 1 60B07CB7
P 7600 1850
F 0 "C?" H 7718 1896 50  0000 L CNN
F 1 "470uF" H 7718 1805 50  0000 L CNN
F 2 "" H 7638 1700 50  0001 C CNN
F 3 "~" H 7600 1850 50  0001 C CNN
	1    7600 1850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60B07D05
P 7600 1600
F 0 "#PWR?" H 7600 1450 50  0001 C CNN
F 1 "VCC" H 7617 1773 50  0000 C CNN
F 2 "" H 7600 1600 50  0001 C CNN
F 3 "" H 7600 1600 50  0001 C CNN
	1    7600 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B07D1A
P 7600 2100
F 0 "#PWR?" H 7600 1850 50  0001 C CNN
F 1 "GND" H 7605 1927 50  0000 C CNN
F 2 "" H 7600 2100 50  0001 C CNN
F 3 "" H 7600 2100 50  0001 C CNN
	1    7600 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 1600 7600 1700
Wire Wire Line
	7600 2000 7600 2100
Wire Wire Line
	4700 4800 5800 4800
Wire Wire Line
	4700 4600 5800 4600
Text GLabel 5800 4700 2    50   UnSpc ~ 0
MOTOR-U-BLUE-
Wire Wire Line
	5800 4700 4700 4700
Text GLabel 5750 2400 2    50   UnSpc ~ 0
MOTOR-V-YELLOW-
Wire Wire Line
	5750 2400 4700 2400
Text GLabel 5750 2600 2    50   UnSpc ~ 0
MOTOR-W-GREEN-
Wire Wire Line
	5750 2500 4700 2500
Wire Wire Line
	5750 2600 4700 2600
$EndSCHEMATC