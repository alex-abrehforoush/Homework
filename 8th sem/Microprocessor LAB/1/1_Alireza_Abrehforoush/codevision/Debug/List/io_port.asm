
;CodeVisionAVR C Compiler V3.40 Advanced
;(C) Copyright 1998-2020 Pavel Haiduc, HP InfoTech S.R.L.
;http://www.hpinfotech.ro

;Build configuration    : Debug
;Chip type              : ATmega16
;Program type           : Application
;Clock frequency        : 8.000000 MHz
;Memory model           : Small
;Optimize for           : Size
;(s)printf features     : int, width
;(s)scanf features      : int, width
;External RAM size      : 0
;Data Stack size        : 256 byte(s)
;Heap size              : 0 byte(s)
;Promote 'char' to 'int': Yes
;'char' is unsigned     : Yes
;8 bit enums            : Yes
;Global 'const' stored in FLASH: Yes
;Enhanced function parameter passing: Mode 2
;Enhanced core instructions: On
;Automatic register allocation for global variables: On
;Smart register allocation: On

	#define _MODEL_SMALL_

	#pragma AVRPART ADMIN PART_NAME ATmega16
	#pragma AVRPART MEMORY PROG_FLASH 16384
	#pragma AVRPART MEMORY EEPROM 512
	#pragma AVRPART MEMORY INT_SRAM SIZE 1024
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	#define CALL_SUPPORTED 1

	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU GICR=0x3B
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x0060
	.EQU __SRAM_END=0x045F
	.EQU __DSTACK_SIZE=0x0100
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD2M
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	CALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	PUSH R26
	PUSH R27
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMRDW
	POP  R27
	POP  R26
	ICALL
	.ENDM

	.MACRO __CALL2EX
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	CALL __EEPROMRDD
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z
	MOVW R30,R0
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	CALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	CALL __GETW1Z
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	CALL __GETD1Z
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	CALL __GETW2X
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	CALL __GETD2X
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	JMP  __RESET
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00

_tbl10_G100:
	.DB  0x10,0x27,0xE8,0x3,0x64,0x0,0xA,0x0
	.DB  0x1,0x0
_tbl16_G100:
	.DB  0x0,0x10,0x0,0x1,0x10,0x0,0x1,0x0

_0x3:
	.DB  0x3F,0x6,0x5B,0x4F,0x66,0x6D,0x7D,0x7
	.DB  0x7F,0x6F

__GLOBAL_INI_TBL:
	.DW  0x0A
	.DW  _digits
	.DW  _0x3*2

_0xFFFFFFFF:
	.DW  0

#define __GLOBAL_INI_TBL_PRESENT 1

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  GICR,R31
	OUT  GICR,R30
	OUT  MCUCR,R30

;CLEAR R2-R14
	LDI  R24,(14-2)+1
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,__SRAM_START
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	JMP  _main

	.ESEG
	.ORG 0x00

	.DSEG
	.ORG 0x160

	.CSEG
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
;void part1();
;void part2();
;void part3();
;void part4();
;void showDigit(char n);
;void showNumber(int counter);
;void part5();
;void showNumberWithReset(int counter);
;void part6();
;char digits[10] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};

	.DSEG
;void main(void)
; 0000 002F {

	.CSEG
_main:
; .FSTART _main
; 0000 0030 // Declare your local variables here
; 0000 0031 
; 0000 0032 // Input/Output Ports initialization
; 0000 0033 // Port A initialization
; 0000 0034 // Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In
; 0000 0035 DDRA=(0<<DDA7) | (0<<DDA6) | (0<<DDA5) | (0<<DDA4) | (0<<DDA3) | (0<<DDA2) | (0< ...
	LDI  R30,LOW(0)
	OUT  0x1A,R30
; 0000 0036 // State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T
; 0000 0037 PORTA=(0<<PORTA7) | (0<<PORTA6) | (0<<PORTA5) | (0<<PORTA4) | (0<<PORTA3) | (0<< ...
	OUT  0x1B,R30
; 0000 0038 
; 0000 0039 // Port B initialization
; 0000 003A // Function: Bit7=Out Bit6=Out Bit5=Out Bit4=Out Bit3=Out Bit2=Out Bit1=Out Bit0 ...
; 0000 003B DDRB=(1<<DDB7) | (1<<DDB6) | (1<<DDB5) | (1<<DDB4) | (1<<DDB3) | (1<<DDB2) | (1< ...
	LDI  R30,LOW(255)
	OUT  0x17,R30
; 0000 003C // State: Bit7=0 Bit6=0 Bit5=0 Bit4=0 Bit3=0 Bit2=0 Bit1=0 Bit0=0
; 0000 003D PORTB=(0<<PORTB7) | (0<<PORTB6) | (0<<PORTB5) | (0<<PORTB4) | (0<<PORTB3) | (0<< ...
	LDI  R30,LOW(0)
	OUT  0x18,R30
; 0000 003E 
; 0000 003F // Port C initialization
; 0000 0040 // Function: Bit7=Out Bit6=Out Bit5=Out Bit4=Out Bit3=Out Bit2=Out Bit1=Out Bit0 ...
; 0000 0041 DDRC=(1<<DDC7) | (1<<DDC6) | (1<<DDC5) | (1<<DDC4) | (1<<DDC3) | (1<<DDC2) | (1< ...
	LDI  R30,LOW(255)
	OUT  0x14,R30
; 0000 0042 // State: Bit7=0 Bit6=0 Bit5=0 Bit4=0 Bit3=0 Bit2=0 Bit1=0 Bit0=0
; 0000 0043 PORTC=(0<<PORTC7) | (0<<PORTC6) | (0<<PORTC5) | (0<<PORTC4) | (0<<PORTC3) | (0<< ...
	LDI  R30,LOW(0)
	OUT  0x15,R30
; 0000 0044 
; 0000 0045 // Port D initialization
; 0000 0046 // Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=Out Bit2=Out Bit1=Out Bit0=Out
; 0000 0047 DDRD=(0<<DDD7) | (0<<DDD6) | (0<<DDD5) | (0<<DDD4) | (1<<DDD3) | (1<<DDD2) | (1< ...
	LDI  R30,LOW(15)
	OUT  0x11,R30
; 0000 0048 // State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=0 Bit2=0 Bit1=0 Bit0=0
; 0000 0049 PORTD=(0<<PORTD7) | (0<<PORTD6) | (0<<PORTD5) | (0<<PORTD4) | (0<<PORTD3) | (0<< ...
	LDI  R30,LOW(0)
	OUT  0x12,R30
; 0000 004A 
; 0000 004B // Timer/Counter 0 initialization
; 0000 004C // Clock source: System Clock
; 0000 004D // Clock value: Timer 0 Stopped
; 0000 004E // Mode: Normal top=0xFF
; 0000 004F // OC0 output: Disconnected
; 0000 0050 TCCR0=(0<<WGM00) | (0<<COM01) | (0<<COM00) | (0<<WGM01) | (0<<CS02) | (0<<CS01)  ...
	OUT  0x33,R30
; 0000 0051 TCNT0=0x00;
	OUT  0x32,R30
; 0000 0052 OCR0=0x00;
	OUT  0x3C,R30
; 0000 0053 
; 0000 0054 // Timer/Counter 1 initialization
; 0000 0055 // Clock source: System Clock
; 0000 0056 // Clock value: Timer1 Stopped
; 0000 0057 // Mode: Normal top=0xFFFF
; 0000 0058 // OC1A output: Disconnected
; 0000 0059 // OC1B output: Disconnected
; 0000 005A // Noise Canceler: Off
; 0000 005B // Input Capture on Falling Edge
; 0000 005C // Timer1 Overflow Interrupt: Off
; 0000 005D // Input Capture Interrupt: Off
; 0000 005E // Compare A Match Interrupt: Off
; 0000 005F // Compare B Match Interrupt: Off
; 0000 0060 TCCR1A=(0<<COM1A1) | (0<<COM1A0) | (0<<COM1B1) | (0<<COM1B0) | (0<<WGM11) | (0<< ...
	OUT  0x2F,R30
; 0000 0061 TCCR1B=(0<<ICNC1) | (0<<ICES1) | (0<<WGM13) | (0<<WGM12) | (0<<CS12) | (0<<CS11) ...
	OUT  0x2E,R30
; 0000 0062 TCNT1H=0x00;
	OUT  0x2D,R30
; 0000 0063 TCNT1L=0x00;
	OUT  0x2C,R30
; 0000 0064 ICR1H=0x00;
	OUT  0x27,R30
; 0000 0065 ICR1L=0x00;
	OUT  0x26,R30
; 0000 0066 OCR1AH=0x00;
	OUT  0x2B,R30
; 0000 0067 OCR1AL=0x00;
	OUT  0x2A,R30
; 0000 0068 OCR1BH=0x00;
	OUT  0x29,R30
; 0000 0069 OCR1BL=0x00;
	OUT  0x28,R30
; 0000 006A 
; 0000 006B // Timer/Counter 2 initialization
; 0000 006C // Clock source: System Clock
; 0000 006D // Clock value: Timer2 Stopped
; 0000 006E // Mode: Normal top=0xFF
; 0000 006F // OC2 output: Disconnected
; 0000 0070 ASSR=0<<AS2;
	OUT  0x22,R30
; 0000 0071 TCCR2=(0<<PWM2) | (0<<COM21) | (0<<COM20) | (0<<CTC2) | (0<<CS22) | (0<<CS21) |  ...
	OUT  0x25,R30
; 0000 0072 TCNT2=0x00;
	OUT  0x24,R30
; 0000 0073 OCR2=0x00;
	OUT  0x23,R30
; 0000 0074 
; 0000 0075 // Timer(s)/Counter(s) Interrupt(s) initialization
; 0000 0076 TIMSK=(0<<OCIE2) | (0<<TOIE2) | (0<<TICIE1) | (0<<OCIE1A) | (0<<OCIE1B) | (0<<TO ...
	OUT  0x39,R30
; 0000 0077 
; 0000 0078 // External Interrupt(s) initialization
; 0000 0079 // INT0: Off
; 0000 007A // INT1: Off
; 0000 007B // INT2: Off
; 0000 007C MCUCR=(0<<ISC11) | (0<<ISC10) | (0<<ISC01) | (0<<ISC00);
	OUT  0x35,R30
; 0000 007D MCUCSR=(0<<ISC2);
	OUT  0x34,R30
; 0000 007E 
; 0000 007F // USART initialization
; 0000 0080 // USART disabled
; 0000 0081 UCSRB=(0<<RXCIE) | (0<<TXCIE) | (0<<UDRIE) | (0<<RXEN) | (0<<TXEN) | (0<<UCSZ2)  ...
	OUT  0xA,R30
; 0000 0082 
; 0000 0083 // Analog Comparator initialization
; 0000 0084 // Analog Comparator: Off
; 0000 0085 // The Analog Comparator's positive input is
; 0000 0086 // connected to the AIN0 pin
; 0000 0087 // The Analog Comparator's negative input is
; 0000 0088 // connected to the AIN1 pin
; 0000 0089 ACSR=(1<<ACD) | (0<<ACBG) | (0<<ACO) | (0<<ACI) | (0<<ACIE) | (0<<ACIC) | (0<<AC ...
	LDI  R30,LOW(128)
	OUT  0x8,R30
; 0000 008A SFIOR=(0<<ACME);
	LDI  R30,LOW(0)
	OUT  0x30,R30
; 0000 008B 
; 0000 008C // ADC initialization
; 0000 008D // ADC disabled
; 0000 008E ADCSRA=(0<<ADEN) | (0<<ADSC) | (0<<ADATE) | (0<<ADIF) | (0<<ADIE) | (0<<ADPS2) | ...
	OUT  0x6,R30
; 0000 008F 
; 0000 0090 // SPI initialization
; 0000 0091 // SPI disabled
; 0000 0092 SPCR=(0<<SPIE) | (0<<SPE) | (0<<DORD) | (0<<MSTR) | (0<<CPOL) | (0<<CPHA) | (0<< ...
	OUT  0xD,R30
; 0000 0093 
; 0000 0094 // TWI initialization
; 0000 0095 // TWI disabled
; 0000 0096 TWCR=(0<<TWEA) | (0<<TWSTA) | (0<<TWSTO) | (0<<TWEN) | (0<<TWIE);
	OUT  0x36,R30
; 0000 0097 
; 0000 0098 /////////////////////////////////////////////////////////////////////////
; 0000 0099 DDRA = 0x00;
	OUT  0x1A,R30
; 0000 009A DDRB = 0xff;
	LDI  R30,LOW(255)
	OUT  0x17,R30
; 0000 009B DDRC = 0xff;
	OUT  0x14,R30
; 0000 009C DDRD = 0x0f;
	LDI  R30,LOW(15)
	OUT  0x11,R30
; 0000 009D 
; 0000 009E 
; 0000 009F 
; 0000 00A0 
; 0000 00A1 while (1)
_0x4:
; 0000 00A2 {
; 0000 00A3 // Place your code here
; 0000 00A4 part1();
	RCALL _part1
; 0000 00A5 delay_ms(1000);
	CALL SUBOPT_0x0
; 0000 00A6 part2();
	RCALL _part2
; 0000 00A7 delay_ms(1000);
	CALL SUBOPT_0x0
; 0000 00A8 part3();
	RCALL _part3
; 0000 00A9 delay_ms(1000);
	CALL SUBOPT_0x0
; 0000 00AA part4();
	RCALL _part4
; 0000 00AB delay_ms(1000);
	CALL SUBOPT_0x0
; 0000 00AC part5();
	RCALL _part5
; 0000 00AD delay_ms(1000);
	CALL SUBOPT_0x0
; 0000 00AE part6();
	RCALL _part6
; 0000 00AF delay_ms(1000);
	CALL SUBOPT_0x0
; 0000 00B0 }
	RJMP _0x4
; 0000 00B1 }
_0x7:
	RJMP _0x7
; .FEND
;void part1()
; 0000 00B5 {
_part1:
; .FSTART _part1
; 0000 00B6 int i = 0;
; 0000 00B7 for (i = 0; i < 4; i++)
	ST   -Y,R17
	ST   -Y,R16
;	i -> R16,R17
	__GETWRN 16,17,0
	__GETWRN 16,17,0
_0x9:
	__CPWRN 16,17,4
	BRGE _0xA
; 0000 00B8 {
; 0000 00B9 PORTB = 0xff;
	LDI  R30,LOW(255)
	OUT  0x18,R30
; 0000 00BA delay_ms(500);
	LDI  R26,LOW(500)
	LDI  R27,HIGH(500)
	CALL _delay_ms
; 0000 00BB PORTB = 0x00;
	LDI  R30,LOW(0)
	OUT  0x18,R30
; 0000 00BC delay_ms(500);
	LDI  R26,LOW(500)
	LDI  R27,HIGH(500)
	CALL _delay_ms
; 0000 00BD }
	__ADDWRN 16,17,1
	RJMP _0x9
_0xA:
; 0000 00BE return;
	RJMP _0x2060003
; 0000 00BF }
; .FEND
;void part2()
; 0000 00C3 {
_part2:
; .FSTART _part2
; 0000 00C4 int i;
; 0000 00C5 PORTB = 0b10000000;
	ST   -Y,R17
	ST   -Y,R16
;	i -> R16,R17
	LDI  R30,LOW(128)
	OUT  0x18,R30
; 0000 00C6 i = 0;
	__GETWRN 16,17,0
; 0000 00C7 for (; i < 10; i++)
_0xC:
	__CPWRN 16,17,10
	BRGE _0xD
; 0000 00C8 {
; 0000 00C9 delay_ms(300);
	LDI  R26,LOW(300)
	LDI  R27,HIGH(300)
	CALL _delay_ms
; 0000 00CA PORTB = PORTB >> 1;
	IN   R30,0x18
	LDI  R31,0
	ASR  R31
	ROR  R30
	OUT  0x18,R30
; 0000 00CB }
	__ADDWRN 16,17,1
	RJMP _0xC
_0xD:
; 0000 00CC return;
	RJMP _0x2060003
; 0000 00CD }
; .FEND
;void part3()
; 0000 00D1 {
_part3:
; .FSTART _part3
; 0000 00D2 char number = 0;
; 0000 00D3 //    while(1)
; 0000 00D4 //    {
; 0000 00D5 //        number = PINA;
; 0000 00D6 //        PORTB = number;
; 0000 00D7 //    }
; 0000 00D8 number = PINA;
	ST   -Y,R17
;	number -> R17
	LDI  R17,0
	IN   R17,25
; 0000 00D9 PORTB = number;
	OUT  0x18,R17
; 0000 00DA return;
	LD   R17,Y+
	RET
; 0000 00DB }
; .FEND
;void part4()
; 0000 00DF {
_part4:
; .FSTART _part4
; 0000 00E0 int i = 9;
; 0000 00E1 for (i = 9; i >= 0; i--)
	ST   -Y,R17
	ST   -Y,R16
;	i -> R16,R17
	__GETWRN 16,17,9
	__GETWRN 16,17,9
_0xF:
	TST  R17
	BRMI _0x10
; 0000 00E2 {
; 0000 00E3 PORTC = digits[i];
	LDI  R26,LOW(_digits)
	LDI  R27,HIGH(_digits)
	ADD  R26,R16
	ADC  R27,R17
	LD   R30,X
	OUT  0x15,R30
; 0000 00E4 delay_ms(250);
	LDI  R26,LOW(250)
	LDI  R27,0
	CALL _delay_ms
; 0000 00E5 }
	__SUBWRN 16,17,1
	RJMP _0xF
_0x10:
; 0000 00E6 return;
_0x2060003:
	LD   R16,Y+
	LD   R17,Y+
	RET
; 0000 00E7 }
; .FEND
;void showDigit(char n)
; 0000 00EA {
_showDigit:
; .FSTART _showDigit
; 0000 00EB int i = 0;
; 0000 00EC 
; 0000 00ED PORTD.0 = 1;
	CALL __SAVELOCR4
	MOV  R19,R26
;	n -> R19
;	i -> R16,R17
	__GETWRN 16,17,0
	SBI  0x12,0
; 0000 00EE PORTD.1 = 1;
	SBI  0x12,1
; 0000 00EF PORTD.2 = 1;
	SBI  0x12,2
; 0000 00F0 PORTD.3 = 1;
	SBI  0x12,3
; 0000 00F1 
; 0000 00F2 for (; i < 4; i++)
_0x1A:
	__CPWRN 16,17,4
	BRGE _0x1B
; 0000 00F3 {
; 0000 00F4 if (n == 0) PORTD.0 = 0;
	CPI  R19,0
	BRNE _0x1C
	CBI  0x12,0
; 0000 00F5 if (n == 1) PORTD.1 = 0;
_0x1C:
	CPI  R19,1
	BRNE _0x1F
	CBI  0x12,1
; 0000 00F6 if (n == 2) PORTD.2 = 0;
_0x1F:
	CPI  R19,2
	BRNE _0x22
	CBI  0x12,2
; 0000 00F7 if (n == 3) PORTD.3 = 0;
_0x22:
	CPI  R19,3
	BRNE _0x25
	CBI  0x12,3
; 0000 00F8 }
_0x25:
	__ADDWRN 16,17,1
	RJMP _0x1A
_0x1B:
; 0000 00F9 return;
	RJMP _0x2060001
; 0000 00FA }
; .FEND
;void showNumber(int counter)
; 0000 00FD {
_showNumber:
; .FSTART _showNumber
; 0000 00FE char w[5] = {0, 2, 4, 6, 8};
; 0000 00FF 
; 0000 0100 showDigit(0);
	CALL SUBOPT_0x1
;	counter -> R16,R17
;	w -> Y+2
; 0000 0101 PORTC = digits[(counter / 500) % 10];
	CALL SUBOPT_0x2
	OUT  0x15,R30
; 0000 0102 delay_ms(50);
	CALL SUBOPT_0x3
; 0000 0103 
; 0000 0104 showDigit(1);
	LDI  R26,LOW(1)
	RCALL _showDigit
; 0000 0105 PORTC = digits[(counter / 50) % 10];
	CALL SUBOPT_0x4
	OUT  0x15,R30
; 0000 0106 delay_ms(50);
	CALL SUBOPT_0x3
; 0000 0107 
; 0000 0108 showDigit(2);
	LDI  R26,LOW(2)
	RCALL _showDigit
; 0000 0109 PORTC = digits[(counter / 5) % 10];
	CALL SUBOPT_0x5
	OUT  0x15,R30
; 0000 010A PORTC.7 = 1;
	SBI  0x15,7
; 0000 010B delay_ms(50);
	CALL SUBOPT_0x3
; 0000 010C PORTC.7 = 0;
	CBI  0x15,7
; 0000 010D 
; 0000 010E showDigit(3);
	LDI  R26,LOW(3)
	RCALL _showDigit
; 0000 010F PORTC = digits[w[counter % 5]];
	CALL SUBOPT_0x6
	OUT  0x15,R30
; 0000 0110 delay_ms(50);
	RJMP _0x2060002
; 0000 0111 
; 0000 0112 return;
; 0000 0113 }
; .FEND
;void part5()
; 0000 0117 {
_part5:
; .FSTART _part5
; 0000 0118 char a = 0;
; 0000 0119 int counter;
; 0000 011A a = PINA;
	CALL SUBOPT_0x7
;	a -> R17
;	counter -> R18,R19
; 0000 011B counter = 5 * a;
; 0000 011C while(counter >= 0)
_0x2C:
	TST  R19
	BRMI _0x2E
; 0000 011D {
; 0000 011E showNumber(counter);
	MOVW R26,R18
	RCALL _showNumber
; 0000 011F counter--;
	__SUBWRN 18,19,1
; 0000 0120 }
	RJMP _0x2C
_0x2E:
; 0000 0121 return;
	RJMP _0x2060001
; 0000 0122 }
; .FEND
;void showNumberWithReset(int counter)
; 0000 0126 {
_showNumberWithReset:
; .FSTART _showNumberWithReset
; 0000 0127 char w[5] = {0, 2, 4, 6, 8};
; 0000 0128 
; 0000 0129 showDigit(0);
	CALL SUBOPT_0x1
;	counter -> R16,R17
;	w -> Y+2
; 0000 012A if (PIND.7 == 1)
	SBIS 0x10,7
	RJMP _0x2F
; 0000 012B {
; 0000 012C PORTC = digits[0];
	LDS  R30,_digits
	RJMP _0x3E
; 0000 012D }
; 0000 012E else
_0x2F:
; 0000 012F {
; 0000 0130 PORTC = digits[(counter / 500) % 10];
	CALL SUBOPT_0x2
_0x3E:
	OUT  0x15,R30
; 0000 0131 }
; 0000 0132 delay_ms(50);
	CALL SUBOPT_0x3
; 0000 0133 
; 0000 0134 showDigit(1);
	LDI  R26,LOW(1)
	RCALL _showDigit
; 0000 0135 if (PIND.6 == 1)
	SBIS 0x10,6
	RJMP _0x31
; 0000 0136 {
; 0000 0137 PORTC = digits[0];
	LDS  R30,_digits
	RJMP _0x3F
; 0000 0138 }
; 0000 0139 else
_0x31:
; 0000 013A {
; 0000 013B PORTC = digits[(counter / 50) % 10];
	CALL SUBOPT_0x4
_0x3F:
	OUT  0x15,R30
; 0000 013C }
; 0000 013D delay_ms(50);
	CALL SUBOPT_0x3
; 0000 013E 
; 0000 013F showDigit(2);
	LDI  R26,LOW(2)
	RCALL _showDigit
; 0000 0140 if (PIND.5 == 1)
	SBIS 0x10,5
	RJMP _0x33
; 0000 0141 {
; 0000 0142 PORTC = digits[0];
	LDS  R30,_digits
	RJMP _0x40
; 0000 0143 }
; 0000 0144 else
_0x33:
; 0000 0145 {
; 0000 0146 PORTC = digits[(counter / 5) % 10];
	CALL SUBOPT_0x5
_0x40:
	OUT  0x15,R30
; 0000 0147 }
; 0000 0148 delay_ms(50);
	CALL SUBOPT_0x3
; 0000 0149 PORTC.7 = 1;
	SBI  0x15,7
; 0000 014A delay_ms(50);
	CALL SUBOPT_0x3
; 0000 014B PORTC.7 = 0;
	CBI  0x15,7
; 0000 014C 
; 0000 014D showDigit(3);
	LDI  R26,LOW(3)
	RCALL _showDigit
; 0000 014E if (PIND.4 == 1)
	SBIS 0x10,4
	RJMP _0x39
; 0000 014F {
; 0000 0150 PORTC = digits[0];
	LDS  R30,_digits
	RJMP _0x41
; 0000 0151 }
; 0000 0152 else
_0x39:
; 0000 0153 {
; 0000 0154 PORTC = digits[w[counter % 5]];
	CALL SUBOPT_0x6
_0x41:
	OUT  0x15,R30
; 0000 0155 }
; 0000 0156 delay_ms(50);
_0x2060002:
	LDI  R26,LOW(50)
	LDI  R27,0
	CALL _delay_ms
; 0000 0157 
; 0000 0158 return;
	LDD  R17,Y+1
	LDD  R16,Y+0
	ADIW R28,7
	RET
; 0000 0159 }
; .FEND
;void part6()
; 0000 015D {
_part6:
; .FSTART _part6
; 0000 015E char a = 0;
; 0000 015F int counter;
; 0000 0160 a = PINA;
	CALL SUBOPT_0x7
;	a -> R17
;	counter -> R18,R19
; 0000 0161 counter = 5 * a;
; 0000 0162 while(counter >= 0)
_0x3B:
	TST  R19
	BRMI _0x3D
; 0000 0163 {
; 0000 0164 showNumberWithReset(counter);
	MOVW R26,R18
	RCALL _showNumberWithReset
; 0000 0165 counter--;
	__SUBWRN 18,19,1
; 0000 0166 }
	RJMP _0x3B
_0x3D:
; 0000 0167 return;
_0x2060001:
	CALL __LOADLOCR4
	ADIW R28,4
	RET
; 0000 0168 }
; .FEND
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif

	.CSEG

	.CSEG

	.CSEG

	.DSEG
_digits:
	.BYTE 0xA

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x0:
	LDI  R26,LOW(1000)
	LDI  R27,HIGH(1000)
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:12 WORDS
SUBOPT_0x1:
	SBIW R28,5
	LDI  R30,LOW(0)
	ST   Y,R30
	LDI  R30,LOW(2)
	STD  Y+1,R30
	LDI  R30,LOW(4)
	STD  Y+2,R30
	LDI  R30,LOW(6)
	STD  Y+3,R30
	LDI  R30,LOW(8)
	STD  Y+4,R30
	ST   -Y,R17
	ST   -Y,R16
	MOVW R16,R26
	LDI  R26,LOW(0)
	JMP  _showDigit

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:8 WORDS
SUBOPT_0x2:
	MOVW R26,R16
	LDI  R30,LOW(500)
	LDI  R31,HIGH(500)
	CALL __DIVW21
	MOVW R26,R30
	LDI  R30,LOW(10)
	LDI  R31,HIGH(10)
	CALL __MODW21
	SUBI R30,LOW(-_digits)
	SBCI R31,HIGH(-_digits)
	LD   R30,Z
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x3:
	LDI  R26,LOW(50)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:8 WORDS
SUBOPT_0x4:
	MOVW R26,R16
	LDI  R30,LOW(50)
	LDI  R31,HIGH(50)
	CALL __DIVW21
	MOVW R26,R30
	LDI  R30,LOW(10)
	LDI  R31,HIGH(10)
	CALL __MODW21
	SUBI R30,LOW(-_digits)
	SBCI R31,HIGH(-_digits)
	LD   R30,Z
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:8 WORDS
SUBOPT_0x5:
	MOVW R26,R16
	LDI  R30,LOW(5)
	LDI  R31,HIGH(5)
	CALL __DIVW21
	MOVW R26,R30
	LDI  R30,LOW(10)
	LDI  R31,HIGH(10)
	CALL __MODW21
	SUBI R30,LOW(-_digits)
	SBCI R31,HIGH(-_digits)
	LD   R30,Z
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x6:
	MOVW R26,R16
	LDI  R30,LOW(5)
	LDI  R31,HIGH(5)
	CALL __MODW21
	MOVW R26,R28
	ADIW R26,2
	ADD  R26,R30
	ADC  R27,R31
	LD   R30,X
	LDI  R31,0
	SUBI R30,LOW(-_digits)
	SBCI R31,HIGH(-_digits)
	LD   R30,Z
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x7:
	RCALL __SAVELOCR4
	LDI  R17,0
	IN   R17,25
	LDI  R26,LOW(5)
	MUL  R17,R26
	MOVW R18,R0
	RET

;RUNTIME LIBRARY

	.CSEG
__SAVELOCR4:
	ST   -Y,R19
__SAVELOCR3:
	ST   -Y,R18
__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR4:
	LDD  R19,Y+3
__LOADLOCR3:
	LDD  R18,Y+2
__LOADLOCR2:
	LDD  R17,Y+1
	LD   R16,Y
	RET

__ANEGW1:
	NEG  R31
	NEG  R30
	SBCI R31,0
	RET

__DIVW21U:
	CLR  R0
	CLR  R1
	LDI  R25,16
__DIVW21U1:
	LSL  R26
	ROL  R27
	ROL  R0
	ROL  R1
	SUB  R0,R30
	SBC  R1,R31
	BRCC __DIVW21U2
	ADD  R0,R30
	ADC  R1,R31
	RJMP __DIVW21U3
__DIVW21U2:
	SBR  R26,1
__DIVW21U3:
	DEC  R25
	BRNE __DIVW21U1
	MOVW R30,R26
	MOVW R26,R0
	RET

__DIVW21:
	RCALL __CHKSIGNW
	RCALL __DIVW21U
	BRTC __DIVW211
	RCALL __ANEGW1
__DIVW211:
	RET

__MODW21:
	CLT
	SBRS R27,7
	RJMP __MODW211
	NEG  R27
	NEG  R26
	SBCI R27,0
	SET
__MODW211:
	SBRC R31,7
	RCALL __ANEGW1
	RCALL __DIVW21U
	MOVW R30,R26
	BRTC __MODW212
	RCALL __ANEGW1
__MODW212:
	RET

__CHKSIGNW:
	CLT
	SBRS R31,7
	RJMP __CHKSW1
	RCALL __ANEGW1
	SET
__CHKSW1:
	SBRS R27,7
	RJMP __CHKSW2
	NEG  R27
	NEG  R26
	SBCI R27,0
	BLD  R0,0
	INC  R0
	BST  R0,0
__CHKSW2:
	RET

_delay_ms:
	adiw r26,0
	breq __delay_ms1
__delay_ms0:
	wdr
	__DELAY_USW 0x7D0
	sbiw r26,1
	brne __delay_ms0
__delay_ms1:
	ret

;END OF CODE MARKER
__END_OF_CODE:
