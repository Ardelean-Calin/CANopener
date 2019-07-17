EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm32
LIBS:stm8
LIBS:onsemi
LIBS:silabs
LIBS:stm32-can-cache
EELAYER 25 0
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
L STM32F103CBTx U1
U 1 1 5AEAC8A6
P 3975 2800
F 0 "U1" H 1175 4525 50  0000 L BNN
F 1 "STM32F303CBTx" H 6775 4525 50  0000 R BNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H 6775 4475 50  0001 R TNN
F 3 "" H 3975 2800 50  0001 C CNN
	1    3975 2800
	1    0    0    -1  
$EndComp
$Comp
L DB9_Male_MountingHoles CAN1
U 1 1 5AEAF82D
P 1700 5800
F 0 "CAN1" H 1700 6350 50  0000 C CNN
F 1 "CAN_Connector" H 1700 6375 50  0001 C CNN
F 2 "Connectors_DSub:DSUB-9_Male_Horizontal_Pitch2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 1700 5800 50  0001 C CNN
F 3 "" H 1700 5800 50  0001 C CNN
	1    1700 5800
	1    0    0    -1  
$EndComp
$Comp
L SN65HVD232 U3
U 1 1 5AEC3477
P 9000 5350
F 0 "U3" H 8900 5750 50  0000 R CNN
F 1 "SN65HVD232" H 8900 5650 50  0000 R CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 9000 4850 50  0001 C CNN
F 3 "" H 8900 5750 50  0001 C CNN
	1    9000 5350
	1    0    0    -1  
$EndComp
$Comp
L R_Small Rterm1
U 1 1 5AEC3596
P 10000 5400
F 0 "Rterm1" H 10030 5420 50  0000 L CNN
F 1 "120" H 10030 5360 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 10000 5400 50  0001 C CNN
F 3 "" H 10000 5400 50  0001 C CNN
	1    10000 5400
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP1
U 1 1 5AEC365B
P 10000 5200
F 0 "JP1" V 10050 5100 50  0000 C CNN
F 1 "JC_Rterm" V 9950 5000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10000 5200 50  0001 C CNN
F 3 "" H 10000 5200 50  0001 C CNN
	1    10000 5200
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR01
U 1 1 5AEC3747
P 9000 5750
F 0 "#PWR01" H 9000 5500 50  0001 C CNN
F 1 "GND" H 9000 5600 50  0000 C CNN
F 2 "" H 9000 5750 50  0001 C CNN
F 3 "" H 9000 5750 50  0001 C CNN
	1    9000 5750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C11
U 1 1 5AEC37B0
P 9150 4925
F 0 "C11" H 9160 4995 50  0000 L CNN
F 1 "10n" H 9200 4875 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9150 4925 50  0001 C CNN
F 3 "" H 9150 4925 50  0001 C CNN
	1    9150 4925
	1    0    0    -1  
$EndComp
$Comp
L C_Small C12
U 1 1 5AEC37F5
P 9450 4925
F 0 "C12" H 9460 4995 50  0000 L CNN
F 1 "100n" H 9500 4875 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9450 4925 50  0001 C CNN
F 3 "" H 9450 4925 50  0001 C CNN
	1    9450 4925
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5AEC3864
P 9300 5025
F 0 "#PWR02" H 9300 4775 50  0001 C CNN
F 1 "GND" H 9425 4950 50  0000 C CNN
F 2 "" H 9300 5025 50  0001 C CNN
F 3 "" H 9300 5025 50  0001 C CNN
	1    9300 5025
	1    0    0    -1  
$EndComp
Text GLabel 1075 3600 0    60   Input ~ 0
CAN_Tx
Text GLabel 1075 3500 0    60   Input ~ 0
CAN_Rx
Text GLabel 8600 5250 0    60   Input ~ 0
CAN_Tx
Text GLabel 8600 5350 0    60   Input ~ 0
CAN_Rx
Text GLabel 10200 5050 2    60   Input ~ 0
CANH
Text GLabel 10200 5750 2    60   Input ~ 0
CANL
Text GLabel 1400 6000 0    60   Input ~ 0
CANL
Text GLabel 1400 5900 0    60   Input ~ 0
CANH
$Comp
L GND #PWR03
U 1 1 5AEC41DE
P 1000 5800
F 0 "#PWR03" H 1000 5550 50  0001 C CNN
F 1 "GND" H 1000 5650 50  0000 C CNN
F 2 "" H 1000 5800 50  0001 C CNN
F 3 "" H 1000 5800 50  0001 C CNN
	1    1000 5800
	1    0    0    -1  
$EndComp
NoConn ~ 1400 5400
NoConn ~ 1400 5500
NoConn ~ 1400 5600
NoConn ~ 1400 5700
NoConn ~ 1400 6100
NoConn ~ 1400 6200
NoConn ~ 1700 6400
$Comp
L +3.3V #PWR04
U 1 1 5AEC44A9
P 3775 700
F 0 "#PWR04" H 3775 550 50  0001 C CNN
F 1 "+3.3V" H 3775 840 50  0000 C CNN
F 2 "" H 3775 700 50  0001 C CNN
F 3 "" H 3775 700 50  0001 C CNN
	1    3775 700 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5AEC4783
P 3775 4750
F 0 "#PWR05" H 3775 4500 50  0001 C CNN
F 1 "GND" H 3775 4600 50  0000 C CNN
F 2 "" H 3775 4750 50  0001 C CNN
F 3 "" H 3775 4750 50  0001 C CNN
	1    3775 4750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 5AEC490E
P 4325 850
F 0 "C2" H 4335 920 50  0000 L CNN
F 1 "10n" H 4375 800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4325 850 50  0001 C CNN
F 3 "" H 4325 850 50  0001 C CNN
	1    4325 850 
	1    0    0    -1  
$EndComp
$Comp
L C_Small C3
U 1 1 5AEC4967
P 4575 850
F 0 "C3" H 4585 920 50  0000 L CNN
F 1 "100n" H 4625 800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4575 850 50  0001 C CNN
F 3 "" H 4575 850 50  0001 C CNN
	1    4575 850 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5AEC49C2
P 5075 950
F 0 "#PWR06" H 5075 700 50  0001 C CNN
F 1 "GND" H 5175 850 50  0000 C CNN
F 2 "" H 5075 950 50  0001 C CNN
F 3 "" H 5075 950 50  0001 C CNN
	1    5075 950 
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 5AEC4C5F
P 4825 850
F 0 "C4" H 4835 920 50  0000 L CNN
F 1 "10n" H 4875 800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4825 850 50  0001 C CNN
F 3 "" H 4825 850 50  0001 C CNN
	1    4825 850 
	1    0    0    -1  
$EndComp
$Comp
L C_Small C5
U 1 1 5AEC4C65
P 5075 850
F 0 "C5" H 5085 920 50  0000 L CNN
F 1 "100n" H 5125 800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5075 850 50  0001 C CNN
F 3 "" H 5075 850 50  0001 C CNN
	1    5075 850 
	1    0    0    -1  
$EndComp
$Comp
L C_Small C6
U 1 1 5AEC4D94
P 5325 850
F 0 "C6" H 5335 920 50  0000 L CNN
F 1 "10n" H 5375 800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5325 850 50  0001 C CNN
F 3 "" H 5325 850 50  0001 C CNN
	1    5325 850 
	1    0    0    -1  
$EndComp
$Comp
L C_Small C7
U 1 1 5AEC4D9A
P 5575 850
F 0 "C7" H 5585 920 50  0000 L CNN
F 1 "100n" H 5625 800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5575 850 50  0001 C CNN
F 3 "" H 5575 850 50  0001 C CNN
	1    5575 850 
	1    0    0    -1  
$EndComp
Text Notes 4425 700  0    60   ~ 0
VDD1
Text Notes 4875 700  0    60   ~ 0
VDD2
Text Notes 5375 700  0    60   ~ 0
VDD3
$Comp
L C_Small C1
U 1 1 5AEC5E03
P 675 1550
F 0 "C1" H 685 1620 50  0000 L CNN
F 1 "100n" H 685 1470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 675 1550 50  0001 C CNN
F 3 "" H 675 1550 50  0001 C CNN
	1    675  1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5AEC5E95
P 675 1650
F 0 "#PWR07" H 675 1400 50  0001 C CNN
F 1 "GND" H 675 1500 50  0000 C CNN
F 2 "" H 675 1650 50  0001 C CNN
F 3 "" H 675 1650 50  0001 C CNN
	1    675  1650
	1    0    0    -1  
$EndComp
$Comp
L R_Small R1
U 1 1 5AEC6051
P 675 1250
F 0 "R1" H 705 1270 50  0000 L CNN
F 1 "100k" H 705 1210 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 675 1250 50  0001 C CNN
F 3 "" H 675 1250 50  0001 C CNN
	1    675  1250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR08
U 1 1 5AEC6112
P 675 1150
F 0 "#PWR08" H 675 1000 50  0001 C CNN
F 1 "+3.3V" H 675 1290 50  0000 C CNN
F 2 "" H 675 1150 50  0001 C CNN
F 3 "" H 675 1150 50  0001 C CNN
	1    675  1150
	1    0    0    -1  
$EndComp
Text GLabel 9525 3150 0    60   Input ~ 0
D+
Text GLabel 9525 3350 0    60   Input ~ 0
D-
Text Notes 9625 3675 0    60   ~ 0
ESD protection\nHigh-speed mode
Text GLabel 10425 3150 2    60   Input ~ 0
USB_DP
Text GLabel 6875 3800 2    60   Input ~ 0
USB_DM
Text GLabel 6875 3900 2    60   Input ~ 0
USB_DP
$Comp
L GND #PWR09
U 1 1 5AEC6CE9
P 9250 3250
F 0 "#PWR09" H 9250 3000 50  0001 C CNN
F 1 "GND" H 9250 3100 50  0000 C CNN
F 2 "" H 9250 3250 50  0001 C CNN
F 3 "" H 9250 3250 50  0001 C CNN
	1    9250 3250
	1    0    0    -1  
$EndComp
$Comp
L USB_C_Receptacle J3
U 1 1 5AEC72F8
P 8350 2400
F 0 "J3" H 7875 3950 50  0000 L CNN
F 1 "USB_C_Receptacle-Molex" H 8825 3850 50  0000 R CNN
F 2 "Connectors_USB:USB_C_Receptacle_Amphenol_12401548E4-2A" H 8500 2400 50  0001 C CNN
F 3 "" H 8500 2400 50  0001 C CNN
	1    8350 2400
	1    0    0    -1  
$EndComp
$Comp
L R_Small R4
U 1 1 5AEC75DA
P 9150 1600
F 0 "R4" V 9300 1600 50  0000 L CNN
F 1 "5.1k" V 9225 1525 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 9150 1600 50  0001 C CNN
F 3 "" H 9150 1600 50  0001 C CNN
	1    9150 1600
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R5
U 1 1 5AEC7951
P 9150 1700
F 0 "R5" V 9000 1700 50  0000 L CNN
F 1 "5.1k" V 9075 1625 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 9150 1700 50  0001 C CNN
F 3 "" H 9150 1700 50  0001 C CNN
	1    9150 1700
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR010
U 1 1 5AEC7AF4
P 9375 1700
F 0 "#PWR010" H 9375 1450 50  0001 C CNN
F 1 "GND" H 9375 1550 50  0000 C CNN
F 2 "" H 9375 1700 50  0001 C CNN
F 3 "" H 9375 1700 50  0001 C CNN
	1    9375 1700
	1    0    0    -1  
$EndComp
Text GLabel 9050 1950 2    60   Input ~ 0
D-
Text GLabel 9050 2150 2    60   Input ~ 0
D+
$Comp
L GND #PWR011
U 1 1 5AEC83C5
P 8250 4000
F 0 "#PWR011" H 8250 3750 50  0001 C CNN
F 1 "GND" H 8400 3900 50  0000 C CNN
F 2 "" H 8250 4000 50  0001 C CNN
F 3 "" H 8250 4000 50  0001 C CNN
	1    8250 4000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR012
U 1 1 5AEC8AD8
P 8950 1100
F 0 "#PWR012" H 8950 950 50  0001 C CNN
F 1 "+5V" H 8950 1240 50  0000 C CNN
F 2 "" H 8950 1100 50  0001 C CNN
F 3 "" H 8950 1100 50  0001 C CNN
	1    8950 1100
	1    0    0    -1  
$EndComp
$Comp
L MIC5205-3.3 U2
U 1 1 5AEC9B0C
P 5475 6950
F 0 "U2" H 5325 7175 50  0000 C CNN
F 1 "MIC5205-3.3" H 5475 7175 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 5475 7275 50  0001 C CNN
F 3 "" H 5475 6950 50  0001 C CNN
	1    5475 6950
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR013
U 1 1 5AEC9E35
P 5075 6850
F 0 "#PWR013" H 5075 6700 50  0001 C CNN
F 1 "+5V" H 5075 6990 50  0000 C CNN
F 2 "" H 5075 6850 50  0001 C CNN
F 3 "" H 5075 6850 50  0001 C CNN
	1    5075 6850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C10
U 1 1 5AEC9FAE
P 6150 6975
F 0 "C10" H 6225 7025 50  0000 L CNN
F 1 "2.2u" H 6225 6950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6150 6975 50  0001 C CNN
F 3 "" H 6150 6975 50  0001 C CNN
	1    6150 6975
	1    0    0    -1  
$EndComp
$Comp
L C_Small C9
U 1 1 5AECA0E3
P 5850 7050
F 0 "C9" H 5925 7100 50  0000 L CNN
F 1 "470p" H 5925 7025 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5850 7050 50  0001 C CNN
F 3 "" H 5850 7050 50  0001 C CNN
	1    5850 7050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5AECAA69
P 5850 7250
F 0 "#PWR014" H 5850 7000 50  0001 C CNN
F 1 "GND" H 5850 7100 50  0000 C CNN
F 2 "" H 5850 7250 50  0001 C CNN
F 3 "" H 5850 7250 50  0001 C CNN
	1    5850 7250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR015
U 1 1 5AECAC7C
P 6250 6850
F 0 "#PWR015" H 6250 6700 50  0001 C CNN
F 1 "+3.3V" H 6250 6990 50  0000 C CNN
F 2 "" H 6250 6850 50  0001 C CNN
F 3 "" H 6250 6850 50  0001 C CNN
	1    6250 6850
	1    0    0    -1  
$EndComp
Text Notes 9500 4200 0    60   ~ 12
USB-C and ESC protection circuit
Text Notes 9325 6250 0    60   ~ 12
CAN Transceiver with optional\ntermination resistance
$Comp
L +3.3V #PWR016
U 1 1 5AECC8CA
P 9000 4775
F 0 "#PWR016" H 9000 4625 50  0001 C CNN
F 1 "+3.3V" H 9000 4915 50  0000 C CNN
F 2 "" H 9000 4775 50  0001 C CNN
F 3 "" H 9000 4775 50  0001 C CNN
	1    9000 4775
	1    0    0    -1  
$EndComp
Text Notes 4975 7550 0    60   ~ 12
3V3 Power Supply
$Comp
L LED_Small TXLED1
U 1 1 5AECDD1C
P 3650 6850
F 0 "TXLED1" H 3550 6975 50  0000 L CNN
F 1 "Red" H 3575 6775 50  0000 L CNN
F 2 "LEDs:LED_0805_HandSoldering" V 3650 6850 50  0001 C CNN
F 3 "" V 3650 6850 50  0001 C CNN
	1    3650 6850
	1    0    0    -1  
$EndComp
$Comp
L R_Small R2
U 1 1 5AECDDB0
P 3975 6850
F 0 "R2" V 3900 6775 50  0000 L CNN
F 1 "330" V 4050 6775 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 3975 6850 50  0001 C CNN
F 3 "" H 3975 6850 50  0001 C CNN
	1    3975 6850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR017
U 1 1 5AECDEC3
P 3425 6850
F 0 "#PWR017" H 3425 6600 50  0001 C CNN
F 1 "GND" H 3425 6700 50  0000 C CNN
F 2 "" H 3425 6850 50  0001 C CNN
F 3 "" H 3425 6850 50  0001 C CNN
	1    3425 6850
	1    0    0    -1  
$EndComp
Text GLabel 4175 6850 2    60   Input ~ 0
CAN_Tx
$Comp
L LED_Small RXLED1
U 1 1 5AECEB51
P 3650 7150
F 0 "RXLED1" H 3550 7275 50  0000 L CNN
F 1 "Orange" H 3550 7075 50  0000 L CNN
F 2 "LEDs:LED_0805_HandSoldering" V 3650 7150 50  0001 C CNN
F 3 "" V 3650 7150 50  0001 C CNN
	1    3650 7150
	1    0    0    -1  
$EndComp
$Comp
L R_Small R3
U 1 1 5AECEB57
P 3975 7150
F 0 "R3" V 3900 7075 50  0000 L CNN
F 1 "330" V 4050 7075 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 3975 7150 50  0001 C CNN
F 3 "" H 3975 7150 50  0001 C CNN
	1    3975 7150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR018
U 1 1 5AECEB5D
P 3425 7150
F 0 "#PWR018" H 3425 6900 50  0001 C CNN
F 1 "GND" H 3425 7000 50  0000 C CNN
F 2 "" H 3425 7150 50  0001 C CNN
F 3 "" H 3425 7150 50  0001 C CNN
	1    3425 7150
	1    0    0    -1  
$EndComp
Text GLabel 4175 7150 2    60   Input ~ 0
CAN_Rx
Text Notes 4150 7550 0    60   ~ 12
Status LEDs
Text GLabel 6875 4100 2    60   Input ~ 0
SWCLK
Text GLabel 6875 4000 2    60   Input ~ 0
SWDIO
$Comp
L Conn_02x05_Odd_Even JTAG1
U 1 1 5AF010EB
P 1575 7025
F 0 "JTAG1" H 1625 7325 50  0000 C CNN
F 1 "JTAG" H 1625 6725 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 1575 7025 50  0001 C CNN
F 3 "" H 1575 7025 50  0001 C CNN
	1    1575 7025
	1    0    0    -1  
$EndComp
Text GLabel 850  825  0    60   Input ~ 0
RST
Text GLabel 1275 6825 0    60   Input ~ 0
RST
$Comp
L GND #PWR019
U 1 1 5AF01E4E
P 1150 6925
F 0 "#PWR019" H 1150 6675 50  0001 C CNN
F 1 "GND" H 1150 6775 50  0000 C CNN
F 2 "" H 1150 6925 50  0001 C CNN
F 3 "" H 1150 6925 50  0001 C CNN
	1    1150 6925
	1    0    0    -1  
$EndComp
Text GLabel 1975 6825 2    60   Input ~ 0
SWDIO
Text GLabel 1975 7025 2    60   Input ~ 0
SWCLK
$Comp
L GND #PWR020
U 1 1 5AF02134
P 2425 6925
F 0 "#PWR020" H 2425 6675 50  0001 C CNN
F 1 "GND" H 2425 6775 50  0000 C CNN
F 2 "" H 2425 6925 50  0001 C CNN
F 3 "" H 2425 6925 50  0001 C CNN
	1    2425 6925
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR021
U 1 1 5AF02F39
P 2100 7125
F 0 "#PWR021" H 2100 6975 50  0001 C CNN
F 1 "+3.3V" H 2100 7265 50  0000 C CNN
F 2 "" H 2100 7125 50  0001 C CNN
F 3 "" H 2100 7125 50  0001 C CNN
	1    2100 7125
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR022
U 1 1 5AF0303D
P 1150 7125
F 0 "#PWR022" H 1150 6975 50  0001 C CNN
F 1 "+3.3V" H 1150 7265 50  0000 C CNN
F 2 "" H 1150 7125 50  0001 C CNN
F 3 "" H 1150 7125 50  0001 C CNN
	1    1150 7125
	-1   0    0    1   
$EndComp
NoConn ~ 1875 7225
NoConn ~ 1375 7225
Text Notes 2000 7550 0    60   ~ 12
Connectors
NoConn ~ 1375 7025
Text Notes 6600 4975 0    60   ~ 12
STM32F303CB uC
$Comp
L NUF2221W1T2G U4
U 1 1 5AF07596
P 9975 3250
F 0 "U4" H 10325 3600 60  0000 C CNN
F 1 "NUF2221W1T2G" H 10025 3500 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-363_SC-70-6_Handsoldering" H 9975 3150 60  0001 C CNN
F 3 "" H 9975 3150 60  0001 C CNN
	1    9975 3250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR023
U 1 1 5AF07B52
P 10950 3250
F 0 "#PWR023" H 10950 3100 50  0001 C CNN
F 1 "+3.3V" H 10950 3390 50  0000 C CNN
F 2 "" H 10950 3250 50  0001 C CNN
F 3 "" H 10950 3250 50  0001 C CNN
	1    10950 3250
	1    0    0    -1  
$EndComp
Text GLabel 10425 3350 2    60   Input ~ 0
USB_DM
Wire Wire Line
	1875 6925 2425 6925
Wire Notes Line
	1950 7450 2550 7450
Wire Notes Line
	1950 7575 1950 7450
Wire Notes Line
	2550 5075 925  5075
Wire Notes Line
	2550 7575 2550 5075
Wire Notes Line
	925  7575 2550 7575
Wire Notes Line
	925  5075 925  7575
Wire Wire Line
	1375 7125 1150 7125
Wire Wire Line
	1875 7125 2100 7125
Wire Wire Line
	1975 7025 1875 7025
Wire Wire Line
	1975 6825 1875 6825
Wire Wire Line
	1375 6925 1150 6925
Wire Wire Line
	1375 6825 1275 6825
Connection ~ 900  1400
Wire Wire Line
	900  825  900  1400
Wire Wire Line
	850  825  900  825 
Wire Notes Line
	4125 7450 4700 7450
Wire Notes Line
	4125 7575 4125 7450
Wire Notes Line
	3300 7575 3300 6600
Wire Notes Line
	4700 7575 3300 7575
Wire Notes Line
	4700 6600 4700 7575
Wire Notes Line
	3300 6600 4700 6600
Wire Wire Line
	3750 7150 3875 7150
Wire Wire Line
	4075 7150 4175 7150
Wire Wire Line
	3425 7150 3550 7150
Wire Wire Line
	3750 6850 3875 6850
Wire Wire Line
	4075 6850 4175 6850
Wire Wire Line
	3425 6850 3550 6850
Wire Notes Line
	5850 7450 5850 7575
Wire Notes Line
	4950 7450 5850 7450
Wire Notes Line
	6425 6600 4950 6600
Wire Notes Line
	6425 7575 6425 6600
Wire Notes Line
	4950 7575 6425 7575
Wire Notes Line
	4950 6600 4950 7575
Wire Wire Line
	9000 4775 9450 4775
Wire Wire Line
	9000 4775 9000 5050
Wire Notes Line
	9300 6050 10700 6050
Wire Notes Line
	9300 6275 9300 6050
Wire Notes Line
	8100 6275 8100 4575
Wire Notes Line
	10700 6275 8100 6275
Wire Notes Line
	10700 4575 10700 6275
Wire Notes Line
	8100 4575 10700 4575
Wire Notes Line
	9475 4100 11100 4100
Wire Notes Line
	9475 4225 9475 4100
Wire Notes Line
	11100 675  7700 675 
Wire Notes Line
	11100 4225 11100 675 
Wire Notes Line
	7700 4225 11100 4225
Wire Notes Line
	7700 675  7700 4225
Connection ~ 6150 6850
Connection ~ 5850 7250
Wire Wire Line
	5850 7250 5850 7150
Wire Wire Line
	5475 7250 6150 7250
Wire Wire Line
	6150 6850 6150 6875
Wire Wire Line
	6150 7250 6150 7075
Wire Wire Line
	5850 6950 5775 6950
Wire Wire Line
	5775 6850 6250 6850
Connection ~ 5125 6850
Wire Wire Line
	5075 6850 5175 6850
Wire Wire Line
	5125 6950 5125 6850
Wire Wire Line
	5175 6950 5125 6950
Connection ~ 8950 1300
Connection ~ 8950 1200
Wire Wire Line
	8950 1100 8950 1400
Connection ~ 9000 2150
Wire Wire Line
	9050 2150 9000 2150
Connection ~ 9000 1950
Wire Wire Line
	9000 1950 9050 1950
Wire Wire Line
	9000 1900 8950 1900
Wire Wire Line
	9000 2000 9000 1900
Wire Wire Line
	8950 2000 9000 2000
Wire Wire Line
	9000 2200 8950 2200
Wire Wire Line
	9000 2100 9000 2200
Wire Wire Line
	8950 2100 9000 2100
Connection ~ 8150 4000
Connection ~ 8250 4000
Connection ~ 8350 4000
Wire Wire Line
	8050 4000 8450 4000
Wire Wire Line
	9375 1600 9375 1700
Wire Wire Line
	9250 1600 9375 1600
Wire Wire Line
	9375 1700 9250 1700
Wire Wire Line
	9050 1700 8950 1700
Wire Wire Line
	9050 1600 8950 1600
Connection ~ 675  1400
Wire Wire Line
	675  1350 675  1450
Wire Wire Line
	1075 1400 675  1400
Wire Notes Line
	5225 650  5225 1050
Wire Notes Line
	4725 650  4725 1050
Connection ~ 5325 950 
Connection ~ 5075 950 
Connection ~ 5325 750 
Connection ~ 5075 750 
Connection ~ 4825 950 
Connection ~ 4825 750 
Connection ~ 4325 750 
Connection ~ 3775 750 
Connection ~ 4575 750 
Connection ~ 4575 950 
Connection ~ 3975 4650
Wire Wire Line
	3975 4650 3975 4600
Connection ~ 3875 4650
Wire Wire Line
	3875 4650 3875 4600
Connection ~ 3775 4650
Wire Wire Line
	4075 4650 4075 4600
Wire Wire Line
	3775 4650 4075 4650
Wire Wire Line
	3775 4600 3775 4750
Connection ~ 3975 950 
Wire Wire Line
	3975 1000 3975 950 
Connection ~ 3875 950 
Wire Wire Line
	3875 1000 3875 950 
Connection ~ 3775 950 
Wire Wire Line
	4075 950  4075 1000
Wire Wire Line
	3775 950  4075 950 
Wire Wire Line
	3775 700  3775 1000
Wire Wire Line
	1400 5800 1000 5800
Connection ~ 10000 5050
Connection ~ 10000 5750
Connection ~ 9150 4775
Wire Wire Line
	9150 4775 9150 4825
Wire Wire Line
	9450 4775 9450 4825
Connection ~ 9300 5025
Wire Wire Line
	9150 5025 9450 5025
Wire Wire Line
	10000 5750 10000 5500
Wire Wire Line
	9550 5750 10200 5750
Wire Wire Line
	9550 5450 9550 5750
Wire Wire Line
	9400 5450 9550 5450
Wire Wire Line
	10000 5050 10000 5100
Wire Wire Line
	9550 5050 10200 5050
Wire Wire Line
	9550 5350 9550 5050
Wire Wire Line
	9400 5350 9550 5350
Wire Notes Line
	475  5000 7425 5000
Wire Notes Line
	7425 5000 7425 475 
Wire Notes Line
	6575 5000 6575 4875
Wire Notes Line
	6575 4875 7425 4875
Wire Wire Line
	9250 3250 9525 3250
Wire Wire Line
	10425 3250 10950 3250
Wire Wire Line
	3775 750  5575 750 
Wire Wire Line
	5575 950  4325 950 
$Comp
L Crystal_GND24_Small Y1
U 1 1 5AF2ACAE
P 775 4625
F 0 "Y1" H 825 4800 50  0000 L CNN
F 1 "16MHz" H 825 4725 50  0000 L CNN
F 2 "Crystals:Crystal_SMD_3225-4pin_3.2x2.5mm_HandSoldering" H 775 4625 50  0001 C CNN
F 3 "" H 775 4625 50  0001 C CNN
F 4 "QX333A16.00000B15M" H 775 4625 60  0001 C CNN "Part No."
	1    775  4625
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR024
U 1 1 5AF2BB40
P 775 4450
F 0 "#PWR024" H 775 4300 50  0001 C CNN
F 1 "+3.3V" H 775 4590 50  0000 C CNN
F 2 "" H 775 4450 50  0001 C CNN
F 3 "" H 775 4450 50  0001 C CNN
	1    775  4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 5AF2BB8C
P 775 4750
F 0 "#PWR025" H 775 4500 50  0001 C CNN
F 1 "GND" H 775 4600 50  0000 C CNN
F 2 "" H 775 4750 50  0001 C CNN
F 3 "" H 775 4750 50  0001 C CNN
	1    775  4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	775  4450 775  4500
Wire Wire Line
	775  4475 625  4475
Wire Wire Line
	625  4475 625  4625
Wire Wire Line
	625  4625 675  4625
Connection ~ 775  4475
Text GLabel 950  4625 2    60   Input ~ 0
16MHz
Wire Wire Line
	950  4625 875  4625
Text GLabel 950  2000 0    60   Input ~ 0
16MHz
Wire Wire Line
	950  2000 1075 2000
$Comp
L GND #PWR026
U 1 1 5AF2C593
P 975 1800
F 0 "#PWR026" H 975 1550 50  0001 C CNN
F 1 "GND" H 850 1750 50  0000 C CNN
F 2 "" H 975 1800 50  0001 C CNN
F 3 "" H 975 1800 50  0001 C CNN
	1    975  1800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R6
U 1 1 5AF2C5DF
P 975 1700
F 0 "R6" H 1005 1720 50  0000 L CNN
F 1 "10k" H 800 1650 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 975 1700 50  0001 C CNN
F 3 "" H 975 1700 50  0001 C CNN
	1    975  1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	975  1600 1075 1600
$EndSCHEMATC
