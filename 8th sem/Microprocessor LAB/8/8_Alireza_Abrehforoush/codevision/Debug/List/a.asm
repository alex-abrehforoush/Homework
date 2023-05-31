
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
;Enhanced function parameter passing: Mode 1
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

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF _counter=R4
	.DEF _counter_msb=R5
	.DEF _dc=R6
	.DEF _dc_msb=R7
	.DEF _distance=R8
	.DEF _distance_msb=R9
	.DEF _second=R10
	.DEF _second_msb=R11
	.DEF _minute=R12
	.DEF _minute_msb=R13

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
	JMP  _timer0_ovf_isr
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

_font5x7:
	.DB  0x5,0x7,0x20,0x60,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x5F,0x0,0x0,0x0,0x7
	.DB  0x0,0x7,0x0,0x14,0x7F,0x14,0x7F,0x14
	.DB  0x24,0x2A,0x7F,0x2A,0x12,0x23,0x13,0x8
	.DB  0x64,0x62,0x36,0x49,0x55,0x22,0x50,0x0
	.DB  0x5,0x3,0x0,0x0,0x0,0x1C,0x22,0x41
	.DB  0x0,0x0,0x41,0x22,0x1C,0x0,0x8,0x2A
	.DB  0x1C,0x2A,0x8,0x8,0x8,0x3E,0x8,0x8
	.DB  0x0,0x50,0x30,0x0,0x0,0x8,0x8,0x8
	.DB  0x8,0x8,0x0,0x30,0x30,0x0,0x0,0x20
	.DB  0x10,0x8,0x4,0x2,0x3E,0x51,0x49,0x45
	.DB  0x3E,0x0,0x42,0x7F,0x40,0x0,0x42,0x61
	.DB  0x51,0x49,0x46,0x21,0x41,0x45,0x4B,0x31
	.DB  0x18,0x14,0x12,0x7F,0x10,0x27,0x45,0x45
	.DB  0x45,0x39,0x3C,0x4A,0x49,0x49,0x30,0x1
	.DB  0x71,0x9,0x5,0x3,0x36,0x49,0x49,0x49
	.DB  0x36,0x6,0x49,0x49,0x29,0x1E,0x0,0x36
	.DB  0x36,0x0,0x0,0x0,0x56,0x36,0x0,0x0
	.DB  0x0,0x8,0x14,0x22,0x41,0x14,0x14,0x14
	.DB  0x14,0x14,0x41,0x22,0x14,0x8,0x0,0x2
	.DB  0x1,0x51,0x9,0x6,0x32,0x49,0x79,0x41
	.DB  0x3E,0x7E,0x11,0x11,0x11,0x7E,0x7F,0x49
	.DB  0x49,0x49,0x36,0x3E,0x41,0x41,0x41,0x22
	.DB  0x7F,0x41,0x41,0x22,0x1C,0x7F,0x49,0x49
	.DB  0x49,0x41,0x7F,0x9,0x9,0x1,0x1,0x3E
	.DB  0x41,0x41,0x51,0x32,0x7F,0x8,0x8,0x8
	.DB  0x7F,0x0,0x41,0x7F,0x41,0x0,0x20,0x40
	.DB  0x41,0x3F,0x1,0x7F,0x8,0x14,0x22,0x41
	.DB  0x7F,0x40,0x40,0x40,0x40,0x7F,0x2,0x4
	.DB  0x2,0x7F,0x7F,0x4,0x8,0x10,0x7F,0x3E
	.DB  0x41,0x41,0x41,0x3E,0x7F,0x9,0x9,0x9
	.DB  0x6,0x3E,0x41,0x51,0x21,0x5E,0x7F,0x9
	.DB  0x19,0x29,0x46,0x46,0x49,0x49,0x49,0x31
	.DB  0x1,0x1,0x7F,0x1,0x1,0x3F,0x40,0x40
	.DB  0x40,0x3F,0x1F,0x20,0x40,0x20,0x1F,0x7F
	.DB  0x20,0x18,0x20,0x7F,0x63,0x14,0x8,0x14
	.DB  0x63,0x3,0x4,0x78,0x4,0x3,0x61,0x51
	.DB  0x49,0x45,0x43,0x0,0x0,0x7F,0x41,0x41
	.DB  0x2,0x4,0x8,0x10,0x20,0x41,0x41,0x7F
	.DB  0x0,0x0,0x4,0x2,0x1,0x2,0x4,0x40
	.DB  0x40,0x40,0x40,0x40,0x0,0x1,0x2,0x4
	.DB  0x0,0x20,0x54,0x54,0x54,0x78,0x7F,0x48
	.DB  0x44,0x44,0x38,0x38,0x44,0x44,0x44,0x20
	.DB  0x38,0x44,0x44,0x48,0x7F,0x38,0x54,0x54
	.DB  0x54,0x18,0x8,0x7E,0x9,0x1,0x2,0x8
	.DB  0x14,0x54,0x54,0x3C,0x7F,0x8,0x4,0x4
	.DB  0x78,0x0,0x44,0x7D,0x40,0x0,0x20,0x40
	.DB  0x44,0x3D,0x0,0x0,0x7F,0x10,0x28,0x44
	.DB  0x0,0x41,0x7F,0x40,0x0,0x7C,0x4,0x18
	.DB  0x4,0x78,0x7C,0x8,0x4,0x4,0x78,0x38
	.DB  0x44,0x44,0x44,0x38,0x7C,0x14,0x14,0x14
	.DB  0x8,0x8,0x14,0x14,0x18,0x7C,0x7C,0x8
	.DB  0x4,0x4,0x8,0x48,0x54,0x54,0x54,0x20
	.DB  0x4,0x3F,0x44,0x40,0x20,0x3C,0x40,0x40
	.DB  0x20,0x7C,0x1C,0x20,0x40,0x20,0x1C,0x3C
	.DB  0x40,0x30,0x40,0x3C,0x44,0x28,0x10,0x28
	.DB  0x44,0xC,0x50,0x50,0x50,0x3C,0x44,0x64
	.DB  0x54,0x4C,0x44,0x0,0x8,0x36,0x41,0x0
	.DB  0x0,0x0,0x7F,0x0,0x0,0x0,0x41,0x36
	.DB  0x8,0x0,0x2,0x1,0x2,0x4,0x2,0x7F
	.DB  0x41,0x41,0x41,0x7F
_Yin_and_Yang:
	.DB  0x80,0x0,0x40,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x20,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x8,0x8,0x8,0x10,0x30,0x30,0xE0
	.DB  0xE0,0xC0,0xC0,0x80,0x80,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x20,0x0
	.DB  0x0,0x0,0x2,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x80,0xC0,0xE0,0xE0,0xE0,0xE0,0xE0
	.DB  0xC0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x3,0xF,0x7F,0xFF,0xFF,0xFE,0xFE
	.DB  0xFC,0xF8,0xF0,0xE0,0x80,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x40,0x0,0x2,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x2,0xF,0x1F,0x3F,0x3F,0x3F,0x3F,0x1F
	.DB  0x1F,0x3,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x80,0xF5,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFC,0xF8
	.DB  0xC0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x80
	.DB  0x4,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x80,0x80,0x80,0xC0,0xE0,0xF0,0xF0
	.DB  0xF8,0xFE,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFA,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x48,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x80,0xC0,0xE0,0xF0,0xF8,0xFC,0xFC,0xFE
	.DB  0xFE,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0x3F,0x2,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x4,0x0,0x40,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0xFC
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xF,0x7,0x3,0x3,0x3,0x3,0x7
	.DB  0x7,0x9F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x3F,0xF
	.DB  0x3,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x4,0x0,0x0
	.DB  0x10,0x0,0x0,0x0,0x0,0x0,0x0,0x7
	.DB  0x1F,0x7F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFE,0xFC,0xF8,0xF8,0xF8,0xF8,0xFC
	.DB  0xFC,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
	.DB  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x7F,0x7F
	.DB  0x1F,0x1F,0xF,0x7,0x1,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x1,0x0,0x0,0x0,0x4
	.DB  0x0,0x0,0x0,0x1,0x3,0x7,0x7,0xF
	.DB  0xF,0x1F,0x1F,0x1F,0x1F,0x1F,0x1F,0x1F
	.DB  0x1F,0x1F,0xF,0x1F,0xF,0xF,0xF,0x7
	.DB  0x7,0x3,0x3,0x1,0x1,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0
_dotMatrix:
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x7E,0x0
	.DB  0x9,0x0,0x9,0x0,0x9,0x0,0x7E,0x0
	.DB  0x7E,0x0,0x9,0x0,0x9,0x0,0x9,0x0
	.DB  0x7E,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
_tbl10_G100:
	.DB  0x10,0x27,0xE8,0x3,0x64,0x0,0xA,0x0
	.DB  0x1,0x0
_tbl16_G100:
	.DB  0x0,0x10,0x0,0x1,0x10,0x0,0x1,0x0
__glcd_mask:
	.DB  0x0,0x1,0x3,0x7,0xF,0x1F,0x3F,0x7F
	.DB  0xFF

;GLOBAL REGISTER VARIABLES INITIALIZATION
__REG_VARS:
	.DB  0x0,0x0,0x0,0x0
	.DB  0x0,0x0

_0x20E0060:
	.DB  0x1
_0x20E0000:
	.DB  0x2D,0x4E,0x41,0x4E,0x0,0x49,0x4E,0x46
	.DB  0x0

__GLOBAL_INI_TBL:
	.DW  0x06
	.DW  0x04
	.DW  __REG_VARS*2

	.DW  0x01
	.DW  __seed_G107
	.DW  _0x20E0060*2

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
;interrupt [TIM0_OVF] void timer0_ovf_isr(void)
; 0000 001D {

	.CSEG
_timer0_ovf_isr:
; .FSTART _timer0_ovf_isr
	ST   -Y,R0
	ST   -Y,R1
	ST   -Y,R15
	ST   -Y,R22
	ST   -Y,R23
	ST   -Y,R24
	ST   -Y,R25
	ST   -Y,R26
	ST   -Y,R27
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
; 0000 001E TCNT0=0x64;
	LDI  R30,LOW(100)
	OUT  0x32,R30
; 0000 001F // Place your code here
; 0000 0020 func3();
	RCALL _func3
; 0000 0021 }
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	LD   R27,Y+
	LD   R26,Y+
	LD   R25,Y+
	LD   R24,Y+
	LD   R23,Y+
	LD   R22,Y+
	LD   R15,Y+
	LD   R1,Y+
	LD   R0,Y+
	RETI
; .FEND
;void main(void)
; 0000 0024 {
_main:
; .FSTART _main
; 0000 0025 // Declare your local variables here
; 0000 0026 initialBoard();
	CALL _initialBoard
; 0000 0027 func2();
	RCALL _func2
; 0000 0028 while (1)
_0x3:
; 0000 0029 {
; 0000 002A func1();
	RCALL _func1
; 0000 002B }
	RJMP _0x3
; 0000 002C }
_0x6:
	RJMP _0x6
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
;const unsigned short dotMatrix[] = {0,0,0,0,0,0,0,0,0,0,0,
;0x7e, 0x09, 0x09, 0x09, 0x7e, // A
;0x7e, 0x09, 0x09, 0x09, 0x7e, // A
;0,0,0,0,0,0,0,0,0,0,0};
;int counter = 0, dc = 0, distance = 0;
;int second, minute, hour;
;void func1()
; 0001 000F {

	.CSEG
_func1:
; .FSTART _func1
; 0001 0010 int i;
; 0001 0011 char j;
; 0001 0012 if(dc >= 5)
	CALL __SAVELOCR4
;	i -> R16,R17
;	j -> R19
	LDI  R30,LOW(5)
	LDI  R31,HIGH(5)
	CP   R6,R30
	CPC  R7,R31
	BRLT _0x20003
; 0001 0013 {
; 0001 0014 dc = 0;
	CLR  R6
	CLR  R7
; 0001 0015 distance++;
	MOVW R30,R8
	ADIW R30,1
	MOVW R8,R30
; 0001 0016 if(distance > 23)
	LDI  R30,LOW(23)
	LDI  R31,HIGH(23)
	CP   R30,R8
	CPC  R31,R9
	BRGE _0x20004
; 0001 0017 {
; 0001 0018 distance = 0;
	CLR  R8
	CLR  R9
; 0001 0019 }
; 0001 001A }
_0x20004:
; 0001 001B for(i = 0; i < 8; i++)
_0x20003:
	__GETWRN 16,17,0
_0x20006:
	__CPWRN 16,17,8
	BRGE _0x20007
; 0001 001C {
; 0001 001D j = dotMatrix[(i + distance) % 24];
	MOVW R26,R8
	ADD  R26,R16
	ADC  R27,R17
	CALL SUBOPT_0x0
; 0001 001E PORTD.7 = 1;
	SBI  0x12,7
; 0001 001F PORTA = 1 << i;
	CALL SUBOPT_0x1
; 0001 0020 PORTB = ~j;
; 0001 0021 }
	__ADDWRN 16,17,1
	RJMP _0x20006
_0x20007:
; 0001 0022 for(i = 0; i < 8; i++)
	__GETWRN 16,17,0
_0x2000B:
	__CPWRN 16,17,8
	BRGE _0x2000C
; 0001 0023 {
; 0001 0024 j = dotMatrix[(i + 8 + distance) % 24];
	MOVW R30,R16
	ADIW R30,8
	ADD  R30,R8
	ADC  R31,R9
	MOVW R26,R30
	CALL SUBOPT_0x0
; 0001 0025 PORTD.7 = 0;
	CBI  0x12,7
; 0001 0026 PORTA = 1 << i;
	CALL SUBOPT_0x1
; 0001 0027 PORTB = ~j;
; 0001 0028 }
	__ADDWRN 16,17,1
	RJMP _0x2000B
_0x2000C:
; 0001 0029 }
	CALL __LOADLOCR4
	JMP  _0x212000B
; .FEND
;void func2()
; 0001 002C {
_func2:
; .FSTART _func2
; 0001 002D glcd_putimagef(0, 0, Yin_and_Yang, GLCD_PUTCOPY);
	LDI  R30,LOW(0)
	ST   -Y,R30
	ST   -Y,R30
	LDI  R30,LOW(_Yin_and_Yang*2)
	LDI  R31,HIGH(_Yin_and_Yang*2)
	ST   -Y,R31
	ST   -Y,R30
	LDI  R26,LOW(0)
	CALL _glcd_putimagef
; 0001 002E delay_ms(3000);
	LDI  R26,LOW(3000)
	LDI  R27,HIGH(3000)
	CALL _delay_ms
; 0001 002F #asm("sei")
	SEI
; 0001 0030 }
	RET
; .FEND
;void func3()
; 0001 0033 {
_func3:
; .FSTART _func3
; 0001 0034 int x, y;
; 0001 0035 dc = counter++;
	CALL __SAVELOCR4
;	x -> R16,R17
;	y -> R18,R19
	MOVW R30,R4
	ADIW R30,1
	MOVW R4,R30
	SBIW R30,1
	MOVW R6,R30
; 0001 0036 if (counter >= 50)
	LDI  R30,LOW(50)
	LDI  R31,HIGH(50)
	CP   R4,R30
	CPC  R5,R31
	BRGE PC+2
	RJMP _0x2000F
; 0001 0037 {
; 0001 0038 counter = 0;
	CLR  R4
	CLR  R5
; 0001 0039 second++;
	MOVW R30,R10
	ADIW R30,1
	MOVW R10,R30
; 0001 003A if(second >= 60)
	LDI  R30,LOW(60)
	LDI  R31,HIGH(60)
	CP   R10,R30
	CPC  R11,R31
	BRLT _0x20010
; 0001 003B {
; 0001 003C second = 0;
	CLR  R10
	CLR  R11
; 0001 003D minute++;
	MOVW R30,R12
	ADIW R30,1
	MOVW R12,R30
; 0001 003E if(minute >= 60)
	LDI  R30,LOW(60)
	LDI  R31,HIGH(60)
	CP   R12,R30
	CPC  R13,R31
	BRLT _0x20011
; 0001 003F {
; 0001 0040 minute = 0;
	CLR  R12
	CLR  R13
; 0001 0041 hour++;
	LDI  R26,LOW(_hour)
	LDI  R27,HIGH(_hour)
	LD   R30,X+
	LD   R31,X+
	ADIW R30,1
	ST   -X,R31
	ST   -X,R30
; 0001 0042 if(hour >= 12)
	LDS  R26,_hour
	LDS  R27,_hour+1
	SBIW R26,12
	BRLT _0x20012
; 0001 0043 {
; 0001 0044 hour = 0;
	LDI  R30,LOW(0)
	STS  _hour,R30
	STS  _hour+1,R30
; 0001 0045 }
; 0001 0046 }
_0x20012:
; 0001 0047 }
_0x20011:
; 0001 0048 
; 0001 0049 glcd_clear();
_0x20010:
	CALL _glcd_clear
; 0001 004A glcd_rectrel(32, 2, 64, 60);
	LDI  R30,LOW(32)
	ST   -Y,R30
	LDI  R30,LOW(2)
	ST   -Y,R30
	LDI  R30,LOW(64)
	ST   -Y,R30
	LDI  R26,LOW(60)
	CALL _glcd_rectrel
; 0001 004B 
; 0001 004C x = HOUR_HANDLE_LEN * sin(2*hour*PI / 12);
	CALL SUBOPT_0x2
	CALL _sin
	CALL SUBOPT_0x3
	MOVW R16,R30
; 0001 004D y = HOUR_HANDLE_LEN * cos(2*hour*PI / 12);
	CALL SUBOPT_0x2
	CALL _cos
	CALL SUBOPT_0x3
	MOVW R18,R30
; 0001 004E 
; 0001 004F glcd_setlinethick(3);
	LDI  R30,LOW(3)
	CALL SUBOPT_0x4
; 0001 0050 glcd_line(64, 32, 64+x, 32-y);
; 0001 0051 
; 0001 0052 
; 0001 0053 x = MINUTE_HANDLE_LEN * sin(2*minute*PI / 60);
	CALL SUBOPT_0x5
	CALL _sin
	CALL SUBOPT_0x6
	MOVW R16,R30
; 0001 0054 y = MINUTE_HANDLE_LEN * cos(2*minute*PI / 60);
	CALL SUBOPT_0x5
	CALL _cos
	CALL SUBOPT_0x6
	MOVW R18,R30
; 0001 0055 
; 0001 0056 glcd_setlinethick(2);
	LDI  R30,LOW(2)
	CALL SUBOPT_0x4
; 0001 0057 glcd_line(64, 32, 64+x, 32-y);
; 0001 0058 
; 0001 0059 x = SECOND_HANDLE_LEN * sin(2*second*PI / 60);
	CALL SUBOPT_0x7
	CALL _sin
	CALL SUBOPT_0x8
	MOVW R16,R30
; 0001 005A y = SECOND_HANDLE_LEN * cos(2*second*PI / 60);
	CALL SUBOPT_0x7
	CALL _cos
	CALL SUBOPT_0x8
	MOVW R18,R30
; 0001 005B 
; 0001 005C glcd_setlinethick(1);
	LDI  R30,LOW(1)
	CALL SUBOPT_0x4
; 0001 005D glcd_line(64, 32, 64+x, 32-y);
; 0001 005E }
; 0001 005F }
_0x2000F:
	CALL __LOADLOCR4
	JMP  _0x212000B
; .FEND
;flash unsigned char Yin_and_Yang[]=
;0x40, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
;0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xF8, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xE0, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00,
;0x00, 0xE0, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xC0, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xC0, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x80, 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x80,
;0x0F, 0x80, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0,
;0x1F, 0x80, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0,
;0x1F, 0x00, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0,
;0x3F, 0x80, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0xF0,
;0x3F, 0x00, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0,
;0x1F, 0x80, 0xFF, 0x07, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0,
;0x1F, 0x00, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0,
;0x1F, 0x80, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80,
;0x07, 0x80, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
;0x00, 0x80, 0xFF, 0x1F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xC0, 0xFF, 0x1F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xC0, 0xFF, 0x1F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xE0, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,
;0x00, 0xE0, 0xFF, 0x1F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xF0, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xFC, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xFE, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0xFF, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
;0xE0, 0xFF, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0,
;0xFF, 0xFF, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8,
;0xFF, 0xFF, 0xFF, 0x7F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE,
;0xFF, 0xFF, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0xFF,
;0xFF, 0xFF, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFF,
;0xFF, 0xFF, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xFF,
;0xFF, 0xFF, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0xE0, 0xFF,
;0xFF, 0xFF, 0xFF, 0x1F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF,
;0xFF, 0xFF, 0xFF, 0x1F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF,
;0xFF, 0xFF, 0xFF, 0x1F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF,
;0xFF, 0xFF, 0xFF, 0x1F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xF8, 0x7F,
;0xF8, 0xFF, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x3F,
;0xE0, 0xFF, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x1F,
;0xE0, 0xFF, 0xFF, 0x07, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x1F,
;0xC0, 0xFF, 0xFF, 0x07, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xF8, 0x1F,
;0xC0, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x1F,
;0xE0, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x1F,
;0xE0, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x3F,
;0xE0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xF8, 0x7F,
;0xF8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF,
;0xFF, 0xFF, 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xF0, 0xFF,
;0xFF, 0xFF, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xFF,
;0xFF, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xFF,
;0xFF, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xFF,
;0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0xFF,
;0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,
;0xFF, 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0xFE,
;0xFF, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8,
;0xFF, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0,
;0xBF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x08,
;0x10, 0x30, 0x30, 0xE0, 0xE0, 0xC0, 0xC0, 0x80,
;0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x02, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xE0,
;0xE0, 0xE0, 0xE0, 0xE0, 0xC0, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0F, 0x7F,
;0xFF, 0xFF, 0xFE, 0xFE, 0xFC, 0xF8, 0xF0, 0xE0,
;0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x02,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x1F, 0x3F,
;0x3F, 0x3F, 0x3F, 0x1F, 0x1F, 0x03, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xF5,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFC, 0xF8, 0xC0, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x80, 0x04, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x80,
;0xC0, 0xE0, 0xF0, 0xF0, 0xF8, 0xFE, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFA, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xE0, 0xF0,
;0xF8, 0xFC, 0xFC, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x3F, 0x02, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x40,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0xFC, 0xFF, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x0F, 0x07, 0x03,
;0x03, 0x03, 0x03, 0x07, 0x07, 0x9F, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0x3F, 0x0F, 0x03, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x04, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x07, 0x1F, 0x7F, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFC, 0xF8,
;0xF8, 0xF8, 0xF8, 0xFC, 0xFC, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
;0xFF, 0xFF, 0x7F, 0x7F, 0x1F, 0x1F, 0x0F, 0x07,
;0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
;0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01,
;0x03, 0x07, 0x07, 0x0F, 0x0F, 0x1F, 0x1F, 0x1F,
;0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x0F, 0x1F,
;0x0F, 0x0F, 0x0F, 0x07, 0x07, 0x03, 0x03, 0x01,
;0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
;};
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
;void initialBoard(){
; 0003 0003 void initialBoard(){

	.CSEG
_initialBoard:
; .FSTART _initialBoard
; 0003 0004 // Variable used to store graphic display
; 0003 0005 // controller initialization data
; 0003 0006 GLCDINIT_t glcd_init_data;
; 0003 0007 
; 0003 0008 
; 0003 0009 // Input/Output Ports initialization
; 0003 000A // Port A initialization
; 0003 000B // Function: Bit7=Out Bit6=Out Bit5=Out Bit4=Out Bit3=Out Bit2=Out Bit1=Out Bit0 ...
; 0003 000C DDRA=(1<<DDA7) | (1<<DDA6) | (1<<DDA5) | (1<<DDA4) | (1<<DDA3) | (1<<DDA2) | (1< ...
	SBIW R28,6
;	glcd_init_data -> Y+0
	LDI  R30,LOW(255)
	OUT  0x1A,R30
; 0003 000D // State: Bit7=0 Bit6=0 Bit5=0 Bit4=0 Bit3=0 Bit2=0 Bit1=0 Bit0=0
; 0003 000E PORTA=(0<<PORTA7) | (0<<PORTA6) | (0<<PORTA5) | (0<<PORTA4) | (0<<PORTA3) | (0<< ...
	LDI  R30,LOW(0)
	OUT  0x1B,R30
; 0003 000F 
; 0003 0010 // Port B initialization
; 0003 0011 // Function: Bit7=Out Bit6=Out Bit5=Out Bit4=Out Bit3=Out Bit2=Out Bit1=Out Bit0 ...
; 0003 0012 DDRB=(1<<DDB7) | (1<<DDB6) | (1<<DDB5) | (1<<DDB4) | (1<<DDB3) | (1<<DDB2) | (1< ...
	LDI  R30,LOW(255)
	OUT  0x17,R30
; 0003 0013 // State: Bit7=0 Bit6=0 Bit5=0 Bit4=0 Bit3=0 Bit2=0 Bit1=0 Bit0=0
; 0003 0014 PORTB=(0<<PORTB7) | (0<<PORTB6) | (0<<PORTB5) | (0<<PORTB4) | (0<<PORTB3) | (0<< ...
	LDI  R30,LOW(0)
	OUT  0x18,R30
; 0003 0015 
; 0003 0016 // Port C initialization
; 0003 0017 // Function: Bit7=Out Bit6=Out Bit5=Out Bit4=Out Bit3=Out Bit2=Out Bit1=Out Bit0 ...
; 0003 0018 DDRC=(1<<DDC7) | (1<<DDC6) | (1<<DDC5) | (1<<DDC4) | (1<<DDC3) | (1<<DDC2) | (1< ...
	LDI  R30,LOW(255)
	OUT  0x14,R30
; 0003 0019 // State: Bit7=0 Bit6=0 Bit5=0 Bit4=0 Bit3=0 Bit2=0 Bit1=0 Bit0=0
; 0003 001A PORTC=(0<<PORTC7) | (0<<PORTC6) | (0<<PORTC5) | (0<<PORTC4) | (0<<PORTC3) | (0<< ...
	LDI  R30,LOW(0)
	OUT  0x15,R30
; 0003 001B 
; 0003 001C // Port D initialization
; 0003 001D // Function: Bit7=Out Bit6=Out Bit5=Out Bit4=Out Bit3=Out Bit2=Out Bit1=Out Bit0 ...
; 0003 001E DDRD=(1<<DDD7) | (1<<DDD6) | (1<<DDD5) | (1<<DDD4) | (1<<DDD3) | (1<<DDD2) | (1< ...
	LDI  R30,LOW(255)
	OUT  0x11,R30
; 0003 001F // State: Bit7=0 Bit6=0 Bit5=0 Bit4=0 Bit3=0 Bit2=0 Bit1=0 Bit0=0
; 0003 0020 PORTD=(0<<PORTD7) | (0<<PORTD6) | (0<<PORTD5) | (0<<PORTD4) | (0<<PORTD3) | (0<< ...
	LDI  R30,LOW(0)
	OUT  0x12,R30
; 0003 0021 
; 0003 0022 // Timer/Counter 0 initialization
; 0003 0023 // Clock source: System Clock
; 0003 0024 // Clock value: 7.813 kHz
; 0003 0025 // Mode: Normal top=0xFF
; 0003 0026 // OC0 output: Disconnected
; 0003 0027 // Timer Period: 19.968 ms
; 0003 0028 TCCR0=(0<<WGM00) | (0<<COM01) | (0<<COM00) | (0<<WGM01) | (1<<CS02) | (0<<CS01)  ...
	LDI  R30,LOW(5)
	OUT  0x33,R30
; 0003 0029 TCNT0=0x64;
	LDI  R30,LOW(100)
	OUT  0x32,R30
; 0003 002A OCR0=0x00;
	LDI  R30,LOW(0)
	OUT  0x3C,R30
; 0003 002B 
; 0003 002C // Timer(s)/Counter(s) Interrupt(s) initialization
; 0003 002D TIMSK=(0<<OCIE2) | (0<<TOIE2) | (0<<TICIE1) | (0<<OCIE1A) | (0<<OCIE1B) | (0<<TO ...
	LDI  R30,LOW(1)
	OUT  0x39,R30
; 0003 002E 
; 0003 002F // Graphic Display Controller initialization
; 0003 0030 // The KS0108 connections are specified in the
; 0003 0031 // Project|Configure|C Compiler|Libraries|Graphic Display menu:
; 0003 0032 // DB0 - PORTC Bit 0
; 0003 0033 // DB1 - PORTC Bit 1
; 0003 0034 // DB2 - PORTC Bit 2
; 0003 0035 // DB3 - PORTC Bit 3
; 0003 0036 // DB4 - PORTC Bit 4
; 0003 0037 // DB5 - PORTC Bit 5
; 0003 0038 // DB6 - PORTC Bit 6
; 0003 0039 // DB7 - PORTC Bit 7
; 0003 003A // E - PORTD Bit 0
; 0003 003B // RD /WR - PORTD Bit 1
; 0003 003C // RS - PORTD Bit 2
; 0003 003D // /RST - PORTD Bit 3
; 0003 003E // /CS1 - PORTD Bit 5
; 0003 003F // /CS2 - PORTD Bit 4
; 0003 0040 
; 0003 0041 // Specify the current font for displaying text
; 0003 0042 glcd_init_data.font=font5x7;
	LDI  R30,LOW(_font5x7*2)
	LDI  R31,HIGH(_font5x7*2)
	ST   Y,R30
	STD  Y+1,R31
; 0003 0043 // No function is used for reading
; 0003 0044 // image data from external memory
; 0003 0045 glcd_init_data.readxmem=NULL;
	LDI  R30,LOW(0)
	STD  Y+2,R30
	STD  Y+2+1,R30
; 0003 0046 // No function is used for writing
; 0003 0047 // image data to external memory
; 0003 0048 glcd_init_data.writexmem=NULL;
	STD  Y+4,R30
	STD  Y+4+1,R30
; 0003 0049 
; 0003 004A glcd_init(&glcd_init_data);
	MOVW R26,R28
	CALL _glcd_init
; 0003 004B }
	JMP  _0x212000A
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
_ftrunc:
; .FSTART _ftrunc
	CALL __PUTPARD2
   ldd  r23,y+3
   ldd  r22,y+2
   ldd  r31,y+1
   ld   r30,y
   bst  r23,7
   lsl  r23
   sbrc r22,7
   sbr  r23,1
   mov  r25,r23
   subi r25,0x7e
   breq __ftrunc0
   brcs __ftrunc0
   cpi  r25,24
   brsh __ftrunc1
   clr  r26
   clr  r27
   clr  r24
__ftrunc2:
   sec
   ror  r24
   ror  r27
   ror  r26
   dec  r25
   brne __ftrunc2
   and  r30,r26
   and  r31,r27
   and  r22,r24
   rjmp __ftrunc1
__ftrunc0:
   clt
   clr  r23
   clr  r30
   clr  r31
   clr  r22
__ftrunc1:
   cbr  r22,0x80
   lsr  r23
   brcc __ftrunc3
   sbr  r22,0x80
__ftrunc3:
   bld  r23,7
   ld   r26,y+
   ld   r27,y+
   ld   r24,y+
   ld   r25,y+
   cp   r30,r26
   cpc  r31,r27
   cpc  r22,r24
   cpc  r23,r25
   bst  r25,7
   ret
; .FEND
_floor:
; .FSTART _floor
	CALL SUBOPT_0x9
	CALL _ftrunc
	CALL __PUTD1S0
    brne __floor1
__floor0:
	CALL __GETD1S0
	RJMP _0x212000B
__floor1:
    brtc __floor0
	CALL __GETD1S0
	__GETD2N 0x3F800000
	CALL __SUBF12
_0x212000B:
	ADIW R28,4
	RET
; .FEND
_sin:
; .FSTART _sin
	CALL __PUTPARD2
	SBIW R28,4
	ST   -Y,R17
	LDI  R17,0
	CALL SUBOPT_0xA
	__GETD1N 0x3E22F983
	CALL __MULF12
	CALL SUBOPT_0xB
	RCALL _floor
	CALL SUBOPT_0xA
	CALL __SWAPD12
	CALL __SUBF12
	CALL SUBOPT_0xB
	__GETD1N 0x3F000000
	CALL __CMPF12
	BREQ PC+2
	BRCC PC+2
	RJMP _0x2020017
	CALL SUBOPT_0xC
	__GETD2N 0x3F000000
	CALL SUBOPT_0xD
	LDI  R17,LOW(1)
_0x2020017:
	CALL SUBOPT_0xA
	__GETD1N 0x3E800000
	CALL __CMPF12
	BREQ PC+2
	BRCC PC+2
	RJMP _0x2020018
	CALL SUBOPT_0xA
	__GETD1N 0x3F000000
	CALL SUBOPT_0xD
_0x2020018:
	CPI  R17,0
	BREQ _0x2020019
	CALL SUBOPT_0xC
	CALL __ANEGF1
	__PUTD1S 5
_0x2020019:
	CALL SUBOPT_0xC
	CALL SUBOPT_0xA
	CALL __MULF12
	__PUTD1S 1
	__GETD2N 0x4226C4B1
	CALL __MULF12
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0x422DE51D
	CALL __SWAPD12
	CALL __SUBF12
	CALL SUBOPT_0xE
	__GETD2N 0x4104534C
	CALL __ADDF12
	CALL SUBOPT_0xA
	CALL __MULF12
	PUSH R23
	PUSH R22
	PUSH R31
	PUSH R30
	__GETD1S 1
	__GETD2N 0x3FDEED11
	CALL __ADDF12
	CALL SUBOPT_0xE
	__GETD2N 0x3FA87B5E
	CALL __ADDF12
	POP  R26
	POP  R27
	POP  R24
	POP  R25
	CALL __DIVF21
	LDD  R17,Y+0
	JMP  _0x2120008
; .FEND
_cos:
; .FSTART _cos
	CALL SUBOPT_0x9
	__GETD1N 0x3FC90FDB
	CALL __SUBF12
	MOVW R26,R30
	MOVW R24,R22
	RCALL _sin
	JMP  _0x2120001
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
_ks0108_enable_G102:
; .FSTART _ks0108_enable_G102
	NOP
	SBI  0x12,0
	NOP
	RET
; .FEND
_ks0108_disable_G102:
; .FSTART _ks0108_disable_G102
	CBI  0x12,0
	CBI  0x12,4
	CBI  0x12,5
	RET
; .FEND
_ks0108_rdbus_G102:
; .FSTART _ks0108_rdbus_G102
	ST   -Y,R17
	RCALL _ks0108_enable_G102
	IN   R17,19
	CBI  0x12,0
	MOV  R30,R17
	LD   R17,Y+
	RET
; .FEND
_ks0108_busy_G102:
; .FSTART _ks0108_busy_G102
	ST   -Y,R26
	ST   -Y,R17
	LDI  R30,LOW(0)
	OUT  0x14,R30
	SBI  0x12,1
	CBI  0x12,2
	LDD  R30,Y+1
	SUBI R30,-LOW(1)
	MOV  R17,R30
	SBRS R17,0
	RJMP _0x2040003
	SBI  0x12,4
	RJMP _0x2040004
_0x2040003:
	CBI  0x12,4
_0x2040004:
	SBRS R17,1
	RJMP _0x2040005
	SBI  0x12,5
	RJMP _0x2040006
_0x2040005:
	CBI  0x12,5
_0x2040006:
_0x2040007:
	RCALL _ks0108_rdbus_G102
	ANDI R30,LOW(0x80)
	BRNE _0x2040007
	LDD  R17,Y+0
	JMP  _0x2120003
; .FEND
_ks0108_wrcmd_G102:
; .FSTART _ks0108_wrcmd_G102
	ST   -Y,R26
	LDD  R26,Y+1
	RCALL _ks0108_busy_G102
	CALL SUBOPT_0xF
	JMP  _0x2120003
; .FEND
_ks0108_setloc_G102:
; .FSTART _ks0108_setloc_G102
	__GETB1MN _ks0108_coord_G102,1
	ST   -Y,R30
	LDS  R30,_ks0108_coord_G102
	ANDI R30,LOW(0x3F)
	ORI  R30,0x40
	MOV  R26,R30
	RCALL _ks0108_wrcmd_G102
	__GETB1MN _ks0108_coord_G102,1
	ST   -Y,R30
	__GETB1MN _ks0108_coord_G102,2
	ORI  R30,LOW(0xB8)
	MOV  R26,R30
	RCALL _ks0108_wrcmd_G102
	RET
; .FEND
_ks0108_gotoxp_G102:
; .FSTART _ks0108_gotoxp_G102
	ST   -Y,R26
	LDD  R30,Y+1
	STS  _ks0108_coord_G102,R30
	SWAP R30
	ANDI R30,0xF
	LSR  R30
	LSR  R30
	__PUTB1MN _ks0108_coord_G102,1
	LD   R30,Y
	__PUTB1MN _ks0108_coord_G102,2
	RCALL _ks0108_setloc_G102
	JMP  _0x2120003
; .FEND
_ks0108_nextx_G102:
; .FSTART _ks0108_nextx_G102
	LDS  R26,_ks0108_coord_G102
	SUBI R26,-LOW(1)
	STS  _ks0108_coord_G102,R26
	CPI  R26,LOW(0x80)
	BRLO _0x204000A
	LDI  R30,LOW(0)
	STS  _ks0108_coord_G102,R30
_0x204000A:
	LDS  R30,_ks0108_coord_G102
	ANDI R30,LOW(0x3F)
	BRNE _0x204000B
	LDS  R30,_ks0108_coord_G102
	ST   -Y,R30
	__GETB2MN _ks0108_coord_G102,2
	RCALL _ks0108_gotoxp_G102
_0x204000B:
	RET
; .FEND
_ks0108_wrdata_G102:
; .FSTART _ks0108_wrdata_G102
	ST   -Y,R26
	__GETB2MN _ks0108_coord_G102,1
	RCALL _ks0108_busy_G102
	SBI  0x12,2
	CALL SUBOPT_0xF
	ADIW R28,1
	RET
; .FEND
_ks0108_rddata_G102:
; .FSTART _ks0108_rddata_G102
	__GETB2MN _ks0108_coord_G102,1
	RCALL _ks0108_busy_G102
	LDI  R30,LOW(0)
	OUT  0x14,R30
	SBI  0x12,1
	SBI  0x12,2
	RCALL _ks0108_rdbus_G102
	RET
; .FEND
_ks0108_rdbyte_G102:
; .FSTART _ks0108_rdbyte_G102
	ST   -Y,R26
	LDD  R30,Y+1
	ST   -Y,R30
	LDD  R30,Y+1
	CALL SUBOPT_0x10
	RCALL _ks0108_rddata_G102
	RCALL _ks0108_setloc_G102
	RCALL _ks0108_rddata_G102
	JMP  _0x2120003
; .FEND
_glcd_init:
; .FSTART _glcd_init
	ST   -Y,R27
	ST   -Y,R26
	ST   -Y,R17
	SBI  0x11,0
	SBI  0x11,1
	SBI  0x11,2
	SBI  0x11,3
	SBI  0x12,3
	SBI  0x11,4
	SBI  0x11,5
	RCALL _ks0108_disable_G102
	CBI  0x12,3
	LDI  R26,LOW(100)
	LDI  R27,0
	CALL _delay_ms
	SBI  0x12,3
	LDI  R17,LOW(0)
_0x204000C:
	CPI  R17,2
	BRSH _0x204000E
	ST   -Y,R17
	LDI  R26,LOW(63)
	RCALL _ks0108_wrcmd_G102
	ST   -Y,R17
	INC  R17
	LDI  R26,LOW(192)
	RCALL _ks0108_wrcmd_G102
	RJMP _0x204000C
_0x204000E:
	LDI  R30,LOW(1)
	STS  _glcd_state,R30
	LDI  R30,LOW(0)
	__PUTB1MN _glcd_state,1
	LDD  R30,Y+1
	LDD  R31,Y+1+1
	SBIW R30,0
	BREQ _0x204000F
	LDD  R26,Y+1
	LDD  R27,Y+1+1
	LD   R30,X+
	LD   R31,X+
	__PUTW1MN _glcd_state,4
	LDD  R26,Y+1
	LDD  R27,Y+1+1
	ADIW R26,2
	LD   R30,X+
	LD   R31,X+
	__PUTW1MN _glcd_state,25
	LDD  R26,Y+1
	LDD  R27,Y+1+1
	ADIW R26,4
	CALL __GETW1P
	RJMP _0x20400AC
_0x204000F:
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	__PUTW1MN _glcd_state,4
	__PUTW1MN _glcd_state,25
_0x20400AC:
	__PUTW1MN _glcd_state,27
	LDI  R30,LOW(1)
	__PUTB1MN _glcd_state,6
	__PUTB1MN _glcd_state,7
	__PUTB1MN _glcd_state,8
	LDI  R30,LOW(255)
	__PUTB1MN _glcd_state,9
	LDI  R30,LOW(1)
	__PUTB1MN _glcd_state,16
	__POINTW1MN _glcd_state,17
	ST   -Y,R31
	ST   -Y,R30
	LDI  R30,LOW(255)
	ST   -Y,R30
	LDI  R26,LOW(8)
	LDI  R27,0
	CALL _memset
	RCALL _glcd_clear
	LDI  R30,LOW(1)
	LDD  R17,Y+0
	JMP  _0x2120002
; .FEND
_glcd_clear:
; .FSTART _glcd_clear
	CALL __SAVELOCR4
	LDI  R16,0
	LDI  R19,0
	__GETB1MN _glcd_state,1
	CPI  R30,0
	BREQ _0x2040015
	LDI  R16,LOW(255)
_0x2040015:
_0x2040016:
	CPI  R19,8
	BRSH _0x2040018
	LDI  R30,LOW(0)
	ST   -Y,R30
	MOV  R26,R19
	SUBI R19,-1
	RCALL _ks0108_gotoxp_G102
	LDI  R17,LOW(0)
_0x2040019:
	MOV  R26,R17
	SUBI R17,-1
	CPI  R26,LOW(0x80)
	BRSH _0x204001B
	MOV  R26,R16
	CALL SUBOPT_0x11
	RJMP _0x2040019
_0x204001B:
	RJMP _0x2040016
_0x2040018:
	LDI  R30,LOW(0)
	ST   -Y,R30
	LDI  R26,LOW(0)
	RCALL _ks0108_gotoxp_G102
	LDI  R30,LOW(0)
	ST   -Y,R30
	LDI  R26,LOW(0)
	RCALL _glcd_moveto
	CALL __LOADLOCR4
	JMP  _0x2120001
; .FEND
_glcd_putpixel:
; .FSTART _glcd_putpixel
	ST   -Y,R26
	ST   -Y,R17
	ST   -Y,R16
	LDD  R26,Y+4
	CPI  R26,LOW(0x80)
	BRSH _0x204001D
	LDD  R26,Y+3
	CPI  R26,LOW(0x40)
	BRLO _0x204001C
_0x204001D:
	LDD  R17,Y+1
	LDD  R16,Y+0
	JMP  _0x2120004
_0x204001C:
	LDD  R30,Y+4
	ST   -Y,R30
	LDD  R26,Y+4
	RCALL _ks0108_rdbyte_G102
	MOV  R17,R30
	RCALL _ks0108_setloc_G102
	LDD  R30,Y+3
	ANDI R30,LOW(0x7)
	LDI  R26,LOW(1)
	CALL __LSLB12
	MOV  R16,R30
	LDD  R30,Y+2
	CPI  R30,0
	BREQ _0x204001F
	OR   R17,R16
	RJMP _0x2040020
_0x204001F:
	MOV  R30,R16
	COM  R30
	AND  R17,R30
_0x2040020:
	MOV  R26,R17
	RCALL _ks0108_wrdata_G102
	LDD  R17,Y+1
	LDD  R16,Y+0
	JMP  _0x2120004
; .FEND
_ks0108_wrmasked_G102:
; .FSTART _ks0108_wrmasked_G102
	ST   -Y,R26
	ST   -Y,R17
	LDD  R30,Y+5
	ST   -Y,R30
	LDD  R26,Y+5
	RCALL _ks0108_rdbyte_G102
	MOV  R17,R30
	RCALL _ks0108_setloc_G102
	LDD  R30,Y+1
	CPI  R30,LOW(0x7)
	BREQ _0x204002B
	CPI  R30,LOW(0x8)
	BRNE _0x204002C
_0x204002B:
	LDD  R30,Y+3
	ST   -Y,R30
	LDD  R26,Y+2
	CALL _glcd_mappixcolor1bit
	STD  Y+3,R30
	RJMP _0x204002D
_0x204002C:
	CPI  R30,LOW(0x3)
	BRNE _0x204002F
	LDD  R30,Y+3
	COM  R30
	STD  Y+3,R30
	RJMP _0x2040030
_0x204002F:
	CPI  R30,0
	BRNE _0x2040031
_0x2040030:
_0x204002D:
	LDD  R30,Y+2
	COM  R30
	AND  R17,R30
	RJMP _0x2040032
_0x2040031:
	CPI  R30,LOW(0x2)
	BRNE _0x2040033
_0x2040032:
	LDD  R30,Y+2
	LDD  R26,Y+3
	AND  R30,R26
	OR   R17,R30
	RJMP _0x2040029
_0x2040033:
	CPI  R30,LOW(0x1)
	BRNE _0x2040034
	LDD  R30,Y+2
	LDD  R26,Y+3
	AND  R30,R26
	EOR  R17,R30
	RJMP _0x2040029
_0x2040034:
	CPI  R30,LOW(0x4)
	BRNE _0x2040029
	LDD  R30,Y+2
	COM  R30
	LDD  R26,Y+3
	OR   R30,R26
	AND  R17,R30
_0x2040029:
	MOV  R26,R17
	CALL SUBOPT_0x11
	LDD  R17,Y+0
_0x212000A:
	ADIW R28,6
	RET
; .FEND
_glcd_block:
; .FSTART _glcd_block
	ST   -Y,R26
	SBIW R28,3
	CALL __SAVELOCR6
	LDD  R26,Y+16
	CPI  R26,LOW(0x80)
	BRSH _0x2040037
	LDD  R26,Y+15
	CPI  R26,LOW(0x40)
	BRSH _0x2040037
	LDD  R26,Y+14
	CPI  R26,LOW(0x0)
	BREQ _0x2040037
	LDD  R26,Y+13
	CPI  R26,LOW(0x0)
	BRNE _0x2040036
_0x2040037:
	RJMP _0x2120009
_0x2040036:
	LDD  R30,Y+14
	STD  Y+8,R30
	LDD  R26,Y+16
	CLR  R27
	LDD  R30,Y+14
	LDI  R31,0
	ADD  R26,R30
	ADC  R27,R31
	CPI  R26,LOW(0x81)
	LDI  R30,HIGH(0x81)
	CPC  R27,R30
	BRLO _0x2040039
	LDD  R26,Y+16
	LDI  R30,LOW(128)
	SUB  R30,R26
	STD  Y+14,R30
_0x2040039:
	LDD  R18,Y+13
	LDD  R26,Y+15
	CLR  R27
	LDD  R30,Y+13
	LDI  R31,0
	ADD  R26,R30
	ADC  R27,R31
	CPI  R26,LOW(0x41)
	LDI  R30,HIGH(0x41)
	CPC  R27,R30
	BRLO _0x204003A
	LDD  R26,Y+15
	LDI  R30,LOW(64)
	SUB  R30,R26
	STD  Y+13,R30
_0x204003A:
	LDD  R26,Y+9
	CPI  R26,LOW(0x6)
	BREQ PC+2
	RJMP _0x204003B
	LDD  R30,Y+12
	CPI  R30,LOW(0x1)
	BRNE _0x204003F
	RJMP _0x2120009
_0x204003F:
	CPI  R30,LOW(0x3)
	BRNE _0x2040042
	__GETW1MN _glcd_state,27
	SBIW R30,0
	BRNE _0x2040041
	RJMP _0x2120009
_0x2040041:
_0x2040042:
	LDD  R16,Y+8
	LDD  R30,Y+13
	LSR  R30
	LSR  R30
	LSR  R30
	MOV  R19,R30
	MOV  R30,R18
	ANDI R30,LOW(0x7)
	BRNE _0x2040044
	LDD  R26,Y+13
	CP   R18,R26
	BREQ _0x2040043
_0x2040044:
	MOV  R26,R16
	CLR  R27
	MOV  R30,R19
	LDI  R31,0
	CALL __MULW12U
	LDD  R26,Y+10
	LDD  R27,Y+10+1
	CALL SUBOPT_0x12
	LSR  R18
	LSR  R18
	LSR  R18
	MOV  R21,R19
_0x2040046:
	PUSH R21
	SUBI R21,-1
	MOV  R30,R18
	POP  R26
	CP   R30,R26
	BRLO _0x2040048
	MOV  R17,R16
_0x2040049:
	MOV  R30,R17
	SUBI R17,1
	CPI  R30,0
	BREQ _0x204004B
	CALL SUBOPT_0x13
	RJMP _0x2040049
_0x204004B:
	RJMP _0x2040046
_0x2040048:
_0x2040043:
	LDD  R26,Y+14
	CP   R16,R26
	BREQ _0x204004C
	LDD  R30,Y+14
	LDD  R26,Y+10
	LDD  R27,Y+10+1
	LDI  R31,0
	CALL SUBOPT_0x12
	LDD  R30,Y+13
	ANDI R30,LOW(0x7)
	BREQ _0x204004D
	SUBI R19,-LOW(1)
_0x204004D:
	LDI  R18,LOW(0)
_0x204004E:
	PUSH R18
	SUBI R18,-1
	MOV  R30,R19
	POP  R26
	CP   R26,R30
	BRSH _0x2040050
	LDD  R17,Y+14
_0x2040051:
	PUSH R17
	SUBI R17,-1
	MOV  R30,R16
	POP  R26
	CP   R26,R30
	BRSH _0x2040053
	CALL SUBOPT_0x13
	RJMP _0x2040051
_0x2040053:
	LDD  R30,Y+14
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	LDI  R31,0
	CALL SUBOPT_0x12
	RJMP _0x204004E
_0x2040050:
_0x204004C:
_0x204003B:
	LDD  R30,Y+15
	ANDI R30,LOW(0x7)
	MOV  R19,R30
_0x2040054:
	LDD  R30,Y+13
	CPI  R30,0
	BRNE PC+2
	RJMP _0x2040056
	LDD  R30,Y+10
	LDD  R31,Y+10+1
	STD  Y+6,R30
	STD  Y+6+1,R31
	LDI  R17,LOW(0)
	LDD  R16,Y+16
	CPI  R19,0
	BREQ PC+2
	RJMP _0x2040057
	LDD  R26,Y+13
	CPI  R26,LOW(0x8)
	BRSH PC+2
	RJMP _0x2040058
	LDD  R30,Y+9
	CPI  R30,0
	BREQ _0x204005D
	CPI  R30,LOW(0x3)
	BRNE _0x204005E
_0x204005D:
	RJMP _0x204005F
_0x204005E:
	CPI  R30,LOW(0x7)
	BRNE _0x2040060
_0x204005F:
	RJMP _0x2040061
_0x2040060:
	CPI  R30,LOW(0x8)
	BRNE _0x2040062
_0x2040061:
	RJMP _0x2040063
_0x2040062:
	CPI  R30,LOW(0x6)
	BRNE _0x2040064
_0x2040063:
	RJMP _0x2040065
_0x2040064:
	CPI  R30,LOW(0x9)
	BRNE _0x2040066
_0x2040065:
	RJMP _0x2040067
_0x2040066:
	CPI  R30,LOW(0xA)
	BRNE _0x204005B
_0x2040067:
	ST   -Y,R16
	LDD  R30,Y+16
	CALL SUBOPT_0x10
_0x204005B:
_0x2040069:
	PUSH R17
	SUBI R17,-1
	LDD  R30,Y+14
	POP  R26
	CP   R26,R30
	BRSH _0x204006B
	LDD  R26,Y+9
	CPI  R26,LOW(0x6)
	BRNE _0x204006C
	RCALL _ks0108_rddata_G102
	RCALL _ks0108_setloc_G102
	CALL SUBOPT_0x14
	ST   -Y,R31
	ST   -Y,R30
	RCALL _ks0108_rddata_G102
	MOV  R26,R30
	CALL _glcd_writemem
	RCALL _ks0108_nextx_G102
	RJMP _0x204006D
_0x204006C:
	LDD  R30,Y+9
	CPI  R30,LOW(0x9)
	BRNE _0x2040071
	LDI  R21,LOW(0)
	RJMP _0x2040072
_0x2040071:
	CPI  R30,LOW(0xA)
	BRNE _0x2040070
	LDI  R21,LOW(255)
	RJMP _0x2040072
_0x2040070:
	CALL SUBOPT_0x14
	CALL SUBOPT_0x15
	MOV  R21,R30
	LDD  R30,Y+9
	CPI  R30,LOW(0x7)
	BREQ _0x2040079
	CPI  R30,LOW(0x8)
	BRNE _0x204007A
_0x2040079:
_0x2040072:
	CALL SUBOPT_0x16
	MOV  R21,R30
	RJMP _0x204007B
_0x204007A:
	CPI  R30,LOW(0x3)
	BRNE _0x204007D
	COM  R21
	RJMP _0x204007E
_0x204007D:
	CPI  R30,0
	BRNE _0x2040080
_0x204007E:
_0x204007B:
	MOV  R26,R21
	CALL SUBOPT_0x11
	RJMP _0x2040077
_0x2040080:
	CALL SUBOPT_0x17
	LDI  R30,LOW(255)
	ST   -Y,R30
	LDD  R26,Y+13
	RCALL _ks0108_wrmasked_G102
_0x2040077:
_0x204006D:
	RJMP _0x2040069
_0x204006B:
	LDD  R30,Y+15
	SUBI R30,-LOW(8)
	STD  Y+15,R30
	LDD  R30,Y+13
	SUBI R30,LOW(8)
	STD  Y+13,R30
	RJMP _0x2040081
_0x2040058:
	LDD  R21,Y+13
	LDI  R18,LOW(0)
	LDI  R30,LOW(0)
	STD  Y+13,R30
	RJMP _0x2040082
_0x2040057:
	MOV  R30,R19
	LDD  R26,Y+13
	ADD  R26,R30
	CPI  R26,LOW(0x9)
	BRSH _0x2040083
	LDD  R18,Y+13
	LDI  R30,LOW(0)
	STD  Y+13,R30
	RJMP _0x2040084
_0x2040083:
	LDI  R30,LOW(8)
	SUB  R30,R19
	MOV  R18,R30
_0x2040084:
	ST   -Y,R19
	MOV  R26,R18
	CALL _glcd_getmask
	MOV  R20,R30
	LDD  R30,Y+9
	CPI  R30,LOW(0x6)
	BRNE _0x2040088
_0x2040089:
	PUSH R17
	SUBI R17,-1
	LDD  R30,Y+14
	POP  R26
	CP   R26,R30
	BRSH _0x204008B
	CALL SUBOPT_0x18
	MOV  R26,R30
	MOV  R30,R19
	CALL __LSRB12
	CALL SUBOPT_0x19
	MOV  R30,R19
	MOV  R26,R20
	CALL __LSRB12
	COM  R30
	AND  R30,R1
	OR   R21,R30
	CALL SUBOPT_0x14
	ST   -Y,R31
	ST   -Y,R30
	MOV  R26,R21
	CALL _glcd_writemem
	RJMP _0x2040089
_0x204008B:
	RJMP _0x2040087
_0x2040088:
	CPI  R30,LOW(0x9)
	BRNE _0x204008C
	LDI  R21,LOW(0)
	RJMP _0x204008D
_0x204008C:
	CPI  R30,LOW(0xA)
	BRNE _0x2040093
	LDI  R21,LOW(255)
_0x204008D:
	CALL SUBOPT_0x16
	MOV  R26,R30
	MOV  R30,R19
	CALL __LSLB12
	MOV  R21,R30
_0x2040090:
	PUSH R17
	SUBI R17,-1
	LDD  R30,Y+14
	POP  R26
	CP   R26,R30
	BRSH _0x2040092
	CALL SUBOPT_0x17
	ST   -Y,R20
	LDI  R26,LOW(0)
	RCALL _ks0108_wrmasked_G102
	RJMP _0x2040090
_0x2040092:
	RJMP _0x2040087
_0x2040093:
_0x2040094:
	PUSH R17
	SUBI R17,-1
	LDD  R30,Y+14
	POP  R26
	CP   R26,R30
	BRSH _0x2040096
	CALL SUBOPT_0x1A
	MOV  R26,R30
	MOV  R30,R19
	CALL __LSLB12
	ST   -Y,R30
	ST   -Y,R20
	LDD  R26,Y+13
	RCALL _ks0108_wrmasked_G102
	RJMP _0x2040094
_0x2040096:
_0x2040087:
	LDD  R30,Y+13
	CPI  R30,0
	BRNE _0x2040097
	RJMP _0x2040056
_0x2040097:
	LDD  R26,Y+13
	CPI  R26,LOW(0x8)
	BRSH _0x2040098
	LDD  R30,Y+13
	SUB  R30,R18
	MOV  R21,R30
	LDI  R30,LOW(0)
	RJMP _0x20400AD
_0x2040098:
	MOV  R21,R19
	LDD  R30,Y+13
	SUBI R30,LOW(8)
_0x20400AD:
	STD  Y+13,R30
	LDI  R17,LOW(0)
	LDD  R30,Y+15
	SUBI R30,-LOW(8)
	STD  Y+15,R30
	LDI  R30,LOW(8)
	SUB  R30,R19
	MOV  R18,R30
	LDD  R16,Y+16
	LDD  R30,Y+10
	LDD  R31,Y+10+1
	STD  Y+6,R30
	STD  Y+6+1,R31
_0x2040082:
	MOV  R30,R21
	LDI  R31,0
	SUBI R30,LOW(-__glcd_mask*2)
	SBCI R31,HIGH(-__glcd_mask*2)
	LPM  R20,Z
	LDD  R30,Y+9
	CPI  R30,LOW(0x6)
	BRNE _0x204009D
_0x204009E:
	PUSH R17
	SUBI R17,-1
	LDD  R30,Y+14
	POP  R26
	CP   R26,R30
	BRSH _0x20400A0
	CALL SUBOPT_0x18
	MOV  R26,R30
	MOV  R30,R18
	CALL __LSLB12
	CALL SUBOPT_0x19
	MOV  R30,R18
	MOV  R26,R20
	CALL __LSLB12
	COM  R30
	AND  R30,R1
	OR   R21,R30
	CALL SUBOPT_0x14
	ST   -Y,R31
	ST   -Y,R30
	MOV  R26,R21
	CALL _glcd_writemem
	RJMP _0x204009E
_0x20400A0:
	RJMP _0x204009C
_0x204009D:
	CPI  R30,LOW(0x9)
	BRNE _0x20400A1
	LDI  R21,LOW(0)
	RJMP _0x20400A2
_0x20400A1:
	CPI  R30,LOW(0xA)
	BRNE _0x20400A8
	LDI  R21,LOW(255)
_0x20400A2:
	CALL SUBOPT_0x16
	MOV  R26,R30
	MOV  R30,R18
	CALL __LSRB12
	MOV  R21,R30
_0x20400A5:
	PUSH R17
	SUBI R17,-1
	LDD  R30,Y+14
	POP  R26
	CP   R26,R30
	BRSH _0x20400A7
	CALL SUBOPT_0x17
	ST   -Y,R20
	LDI  R26,LOW(0)
	RCALL _ks0108_wrmasked_G102
	RJMP _0x20400A5
_0x20400A7:
	RJMP _0x204009C
_0x20400A8:
_0x20400A9:
	PUSH R17
	SUBI R17,-1
	LDD  R30,Y+14
	POP  R26
	CP   R26,R30
	BRSH _0x20400AB
	CALL SUBOPT_0x1A
	MOV  R26,R30
	MOV  R30,R18
	CALL __LSRB12
	ST   -Y,R30
	ST   -Y,R20
	LDD  R26,Y+13
	RCALL _ks0108_wrmasked_G102
	RJMP _0x20400A9
_0x20400AB:
_0x204009C:
_0x2040081:
	LDD  R30,Y+8
	LDD  R26,Y+10
	LDD  R27,Y+10+1
	LDI  R31,0
	ADD  R30,R26
	ADC  R31,R27
	STD  Y+10,R30
	STD  Y+10+1,R31
	RJMP _0x2040054
_0x2040056:
_0x2120009:
	CALL __LOADLOCR6
	ADIW R28,17
	RET
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
_glcd_clipx:
; .FSTART _glcd_clipx
	CALL SUBOPT_0x1B
	BRLT _0x2060003
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	JMP  _0x2120003
_0x2060003:
	LD   R26,Y
	LDD  R27,Y+1
	CPI  R26,LOW(0x80)
	LDI  R30,HIGH(0x80)
	CPC  R27,R30
	BRLT _0x2060004
	LDI  R30,LOW(127)
	LDI  R31,HIGH(127)
	RJMP _0x2120003
_0x2060004:
	LD   R30,Y
	LDD  R31,Y+1
	RJMP _0x2120003
; .FEND
_glcd_clipy:
; .FSTART _glcd_clipy
	CALL SUBOPT_0x1B
	BRLT _0x2060005
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	RJMP _0x2120003
_0x2060005:
	LD   R26,Y
	LDD  R27,Y+1
	CPI  R26,LOW(0x40)
	LDI  R30,HIGH(0x40)
	CPC  R27,R30
	BRLT _0x2060006
	LDI  R30,LOW(63)
	LDI  R31,HIGH(63)
	RJMP _0x2120003
_0x2060006:
	LD   R30,Y
	LDD  R31,Y+1
	RJMP _0x2120003
; .FEND
_glcd_imagesize:
; .FSTART _glcd_imagesize
	ST   -Y,R26
	ST   -Y,R17
	LDD  R26,Y+2
	CPI  R26,LOW(0x81)
	BRSH _0x2060008
	LDD  R26,Y+1
	CPI  R26,LOW(0x41)
	BRLO _0x2060007
_0x2060008:
	__GETD1N 0x0
	LDD  R17,Y+0
	JMP  _0x2120002
_0x2060007:
	LDD  R30,Y+1
	ANDI R30,LOW(0x7)
	MOV  R17,R30
	LDD  R30,Y+1
	LSR  R30
	LSR  R30
	LSR  R30
	STD  Y+1,R30
	CPI  R17,0
	BREQ _0x206000A
	SUBI R30,-LOW(1)
	STD  Y+1,R30
_0x206000A:
	LDD  R26,Y+2
	CLR  R27
	CLR  R24
	CLR  R25
	LDD  R30,Y+1
	CLR  R31
	CLR  R22
	CLR  R23
	CALL __MULD12U
	__ADDD1N 4
	LDD  R17,Y+0
	JMP  _0x2120002
; .FEND
_glcd_putimagef:
; .FSTART _glcd_putimagef
	ST   -Y,R26
	CALL __SAVELOCR4
	LDD  R26,Y+4
	CPI  R26,LOW(0x5)
	BRSH _0x2060062
	LDD  R30,Y+5
	LDD  R31,Y+5+1
	LPM  R16,Z+
	CALL SUBOPT_0x1C
	LPM  R17,Z+
	CALL SUBOPT_0x1C
	LPM  R18,Z+
	CALL SUBOPT_0x1C
	LPM  R19,Z+
	STD  Y+5,R30
	STD  Y+5+1,R31
	LDD  R30,Y+8
	ST   -Y,R30
	LDD  R30,Y+8
	ST   -Y,R30
	ST   -Y,R16
	ST   -Y,R18
	LDI  R30,LOW(1)
	ST   -Y,R30
	LDD  R30,Y+10
	LDD  R31,Y+10+1
	ST   -Y,R31
	ST   -Y,R30
	LDD  R26,Y+11
	RCALL _glcd_block
	ST   -Y,R16
	MOV  R26,R18
	RCALL _glcd_imagesize
	RJMP _0x2120007
_0x2060062:
	__GETD1N 0x0
_0x2120007:
	CALL __LOADLOCR4
_0x2120008:
	ADIW R28,9
	RET
; .FEND
_glcd_putpixelm_G103:
; .FSTART _glcd_putpixelm_G103
	ST   -Y,R26
	LDD  R30,Y+2
	ST   -Y,R30
	LDD  R30,Y+2
	ST   -Y,R30
	__GETB1MN _glcd_state,9
	LDD  R26,Y+2
	AND  R30,R26
	BREQ _0x2060068
	LDS  R30,_glcd_state
	RJMP _0x2060069
_0x2060068:
	__GETB1MN _glcd_state,1
_0x2060069:
	MOV  R26,R30
	RCALL _glcd_putpixel
	LD   R30,Y
	LSL  R30
	ST   Y,R30
	CPI  R30,0
	BRNE _0x206006B
	LDI  R30,LOW(1)
	ST   Y,R30
_0x206006B:
	LD   R30,Y
	RJMP _0x2120002
; .FEND
_glcd_moveto:
; .FSTART _glcd_moveto
	ST   -Y,R26
	LDD  R26,Y+1
	CLR  R27
	RCALL _glcd_clipx
	__PUTB1MN _glcd_state,2
	LD   R26,Y
	CLR  R27
	RCALL _glcd_clipy
	__PUTB1MN _glcd_state,3
	RJMP _0x2120003
; .FEND
_glcd_line:
; .FSTART _glcd_line
	ST   -Y,R26
	SBIW R28,11
	CALL __SAVELOCR6
	LDD  R26,Y+20
	CLR  R27
	RCALL _glcd_clipx
	STD  Y+20,R30
	LDD  R26,Y+18
	CLR  R27
	RCALL _glcd_clipx
	STD  Y+18,R30
	LDD  R26,Y+19
	CLR  R27
	RCALL _glcd_clipy
	STD  Y+19,R30
	LDD  R26,Y+17
	CLR  R27
	RCALL _glcd_clipy
	STD  Y+17,R30
	LDD  R30,Y+18
	__PUTB1MN _glcd_state,2
	LDD  R30,Y+17
	__PUTB1MN _glcd_state,3
	LDI  R30,LOW(1)
	STD  Y+8,R30
	LDD  R30,Y+17
	LDD  R26,Y+19
	CP   R30,R26
	BRNE _0x206006C
	LDD  R17,Y+20
	LDD  R26,Y+18
	CP   R17,R26
	BRNE _0x206006D
	ST   -Y,R17
	LDD  R30,Y+20
	ST   -Y,R30
	LDI  R26,LOW(1)
	RCALL _glcd_putpixelm_G103
	RJMP _0x2120006
_0x206006D:
	LDD  R26,Y+18
	CP   R17,R26
	BRSH _0x206006E
	LDD  R30,Y+18
	SUB  R30,R17
	MOV  R16,R30
	__GETWRN 20,21,1
	RJMP _0x206006F
_0x206006E:
	LDD  R26,Y+18
	MOV  R30,R17
	SUB  R30,R26
	MOV  R16,R30
	__GETWRN 20,21,-1
_0x206006F:
_0x2060071:
	LDD  R19,Y+19
	__GETB1MN _glcd_state,8
	STD  Y+6,R30
_0x2060073:
	CALL SUBOPT_0x1D
	BREQ _0x2060075
	ST   -Y,R17
	ST   -Y,R19
	INC  R19
	LDD  R26,Y+10
	RCALL _glcd_putpixelm_G103
	STD  Y+7,R30
	RJMP _0x2060073
_0x2060075:
	LDD  R30,Y+7
	STD  Y+8,R30
	ADD  R17,R20
	MOV  R30,R16
	SUBI R16,1
	CPI  R30,0
	BRNE _0x2060071
	RJMP _0x2060076
_0x206006C:
	LDD  R30,Y+18
	LDD  R26,Y+20
	CP   R30,R26
	BRNE _0x2060077
	LDD  R19,Y+19
	LDD  R26,Y+17
	CP   R19,R26
	BRSH _0x2060078
	LDD  R30,Y+17
	SUB  R30,R19
	MOV  R18,R30
	LDI  R30,LOW(1)
	LDI  R31,HIGH(1)
	RJMP _0x2060187
_0x2060078:
	LDD  R26,Y+17
	MOV  R30,R19
	SUB  R30,R26
	MOV  R18,R30
	LDI  R30,LOW(65535)
	LDI  R31,HIGH(65535)
_0x2060187:
	STD  Y+13,R30
	STD  Y+13+1,R31
_0x206007B:
	LDD  R17,Y+20
	__GETB1MN _glcd_state,8
	STD  Y+6,R30
_0x206007D:
	CALL SUBOPT_0x1D
	BREQ _0x206007F
	ST   -Y,R17
	INC  R17
	CALL SUBOPT_0x1E
	STD  Y+7,R30
	RJMP _0x206007D
_0x206007F:
	LDD  R30,Y+7
	STD  Y+8,R30
	LDD  R30,Y+13
	ADD  R19,R30
	MOV  R30,R18
	SUBI R18,1
	CPI  R30,0
	BRNE _0x206007B
	RJMP _0x2060080
_0x2060077:
	__GETB1MN _glcd_state,8
	STD  Y+6,R30
_0x2060081:
	CALL SUBOPT_0x1D
	BRNE PC+2
	RJMP _0x2060083
	LDD  R17,Y+20
	LDD  R19,Y+19
	LDI  R30,LOW(1)
	MOV  R18,R30
	MOV  R16,R30
	LDD  R26,Y+18
	CLR  R27
	LDD  R30,Y+20
	LDI  R31,0
	SUB  R26,R30
	SBC  R27,R31
	MOVW R20,R26
	TST  R21
	BRPL _0x2060084
	LDI  R16,LOW(255)
	MOVW R30,R20
	CALL __ANEGW1
	MOVW R20,R30
_0x2060084:
	MOVW R30,R20
	LSL  R30
	ROL  R31
	STD  Y+15,R30
	STD  Y+15+1,R31
	LDD  R26,Y+17
	CLR  R27
	LDD  R30,Y+19
	LDI  R31,0
	SUB  R26,R30
	SBC  R27,R31
	STD  Y+13,R26
	STD  Y+13+1,R27
	LDD  R26,Y+14
	TST  R26
	BRPL _0x2060085
	LDI  R18,LOW(255)
	LDD  R30,Y+13
	LDD  R31,Y+13+1
	CALL __ANEGW1
	STD  Y+13,R30
	STD  Y+13+1,R31
_0x2060085:
	LDD  R30,Y+13
	LDD  R31,Y+13+1
	LSL  R30
	ROL  R31
	STD  Y+11,R30
	STD  Y+11+1,R31
	ST   -Y,R17
	ST   -Y,R19
	LDI  R26,LOW(1)
	RCALL _glcd_putpixelm_G103
	STD  Y+8,R30
	LDI  R30,LOW(0)
	STD  Y+9,R30
	STD  Y+9+1,R30
	LDD  R26,Y+13
	LDD  R27,Y+13+1
	CP   R20,R26
	CPC  R21,R27
	BRLT _0x2060086
_0x2060088:
	ADD  R17,R16
	LDD  R30,Y+11
	LDD  R31,Y+11+1
	CALL SUBOPT_0x1F
	LDD  R26,Y+9
	LDD  R27,Y+9+1
	CP   R20,R26
	CPC  R21,R27
	BRGE _0x206008A
	ADD  R19,R18
	LDD  R26,Y+15
	LDD  R27,Y+15+1
	CALL SUBOPT_0x20
_0x206008A:
	ST   -Y,R17
	CALL SUBOPT_0x1E
	STD  Y+8,R30
	LDD  R30,Y+18
	CP   R30,R17
	BRNE _0x2060088
	RJMP _0x206008B
_0x2060086:
_0x206008D:
	ADD  R19,R18
	LDD  R30,Y+15
	LDD  R31,Y+15+1
	CALL SUBOPT_0x1F
	LDD  R30,Y+13
	LDD  R31,Y+13+1
	LDD  R26,Y+9
	LDD  R27,Y+9+1
	CP   R30,R26
	CPC  R31,R27
	BRGE _0x206008F
	ADD  R17,R16
	LDD  R26,Y+11
	LDD  R27,Y+11+1
	CALL SUBOPT_0x20
_0x206008F:
	ST   -Y,R17
	CALL SUBOPT_0x1E
	STD  Y+8,R30
	LDD  R30,Y+17
	CP   R30,R19
	BRNE _0x206008D
_0x206008B:
	LDD  R30,Y+19
	SUBI R30,-LOW(1)
	STD  Y+19,R30
	LDD  R30,Y+17
	SUBI R30,-LOW(1)
	STD  Y+17,R30
	RJMP _0x2060081
_0x2060083:
_0x2060080:
_0x2060076:
_0x2120006:
	CALL __LOADLOCR6
	ADIW R28,21
	RET
; .FEND
_glcd_corners_G103:
; .FSTART _glcd_corners_G103
	ST   -Y,R27
	ST   -Y,R26
	CALL __SAVELOCR6
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	LDD  R17,Z+3
	LDD  R16,Z+1
	LDD  R19,Z+2
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	LD   R18,X
	CP   R16,R17
	BRSH _0x2060090
	MOV  R21,R16
	MOV  R16,R17
	MOV  R17,R21
_0x2060090:
	CP   R18,R19
	BRSH _0x2060091
	MOV  R21,R18
	MOV  R18,R19
	MOV  R19,R21
_0x2060091:
	MOV  R30,R17
	__PUTB1SNS 6,3
	MOV  R30,R19
	__PUTB1SNS 6,2
	MOV  R30,R16
	__PUTB1SNS 6,1
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	ST   X,R18
	CALL __LOADLOCR6
	RJMP _0x2120005
; .FEND
_glcd_rectrel:
; .FSTART _glcd_rectrel
	ST   -Y,R26
	LDD  R30,Y+3
	ST   -Y,R30
	LDD  R30,Y+3
	ST   -Y,R30
	LDD  R30,Y+5
	SUBI R30,LOW(1)
	LDD  R26,Y+3
	ADD  R30,R26
	ST   -Y,R30
	LDD  R30,Y+5
	SUBI R30,LOW(1)
	LDD  R26,Y+3
	ADD  R26,R30
	RCALL _glcd_rectangle
	RJMP _0x2120001
; .FEND
_glcd_rectangle:
; .FSTART _glcd_rectangle
	ST   -Y,R26
	CALL __SAVELOCR4
	__GETB1MN _glcd_state,8
	SUBI R30,LOW(1)
	MOV  R19,R30
	MOVW R26,R28
	ADIW R26,4
	RCALL _glcd_corners_G103
	LDD  R30,Y+5
	SUB  R30,R19
	MOV  R17,R30
	LDD  R30,Y+4
	SUB  R30,R19
	MOV  R16,R30
	LDD  R30,Y+7
	ST   -Y,R30
	LDD  R30,Y+7
	ST   -Y,R30
	ST   -Y,R17
	LDD  R26,Y+9
	RCALL _glcd_line
	ST   -Y,R17
	LDD  R30,Y+7
	ST   -Y,R30
	ST   -Y,R17
	MOV  R26,R16
	RCALL _glcd_line
	LDD  R30,Y+5
	ST   -Y,R30
	ST   -Y,R16
	MOV  R30,R19
	LDD  R26,Y+9
	ADD  R30,R26
	ST   -Y,R30
	MOV  R26,R16
	RCALL _glcd_line
	LDD  R30,Y+7
	ST   -Y,R30
	LDD  R30,Y+5
	ST   -Y,R30
	LDD  R30,Y+9
	ST   -Y,R30
	MOV  R30,R19
	LDD  R26,Y+9
	ADD  R26,R30
	RCALL _glcd_line
	CALL __LOADLOCR4
_0x2120005:
	ADIW R28,8
	RET
; .FEND

	.CSEG

	.CSEG
_memset:
; .FSTART _memset
	ST   -Y,R27
	ST   -Y,R26
    ldd  r27,y+1
    ld   r26,y
    adiw r26,0
    breq memset1
    ldd  r31,y+4
    ldd  r30,y+3
    ldd  r22,y+2
memset0:
    st   z+,r22
    sbiw r26,1
    brne memset0
memset1:
    ldd  r30,y+3
    ldd  r31,y+4
_0x2120004:
	ADIW R28,5
	RET
; .FEND

	.CSEG

	.DSEG

	.CSEG

	.CSEG
_glcd_getmask:
; .FSTART _glcd_getmask
	ST   -Y,R26
	LD   R30,Y
	LDI  R31,0
	SUBI R30,LOW(-__glcd_mask*2)
	SBCI R31,HIGH(-__glcd_mask*2)
	LPM  R26,Z
	LDD  R30,Y+1
	CALL __LSLB12
_0x2120003:
	ADIW R28,2
	RET
; .FEND
_glcd_mappixcolor1bit:
; .FSTART _glcd_mappixcolor1bit
	ST   -Y,R26
	ST   -Y,R17
	LDD  R30,Y+1
	CPI  R30,LOW(0x7)
	BREQ _0x2100007
	CPI  R30,LOW(0xA)
	BRNE _0x2100008
_0x2100007:
	LDS  R17,_glcd_state
	RJMP _0x2100009
_0x2100008:
	CPI  R30,LOW(0x9)
	BRNE _0x210000B
	__GETBRMN 17,_glcd_state,1
	RJMP _0x2100009
_0x210000B:
	CPI  R30,LOW(0x8)
	BRNE _0x2100005
	__GETBRMN 17,_glcd_state,16
_0x2100009:
	__GETB1MN _glcd_state,1
	CPI  R30,0
	BREQ _0x210000E
	CPI  R17,0
	BREQ _0x210000F
	LDI  R30,LOW(255)
	LDD  R17,Y+0
	RJMP _0x2120002
_0x210000F:
	LDD  R30,Y+2
	COM  R30
	LDD  R17,Y+0
	RJMP _0x2120002
_0x210000E:
	CPI  R17,0
	BRNE _0x2100011
	LDI  R30,LOW(0)
	LDD  R17,Y+0
	RJMP _0x2120002
_0x2100011:
_0x2100005:
	LDD  R30,Y+2
	LDD  R17,Y+0
	RJMP _0x2120002
; .FEND
_glcd_readmem:
; .FSTART _glcd_readmem
	ST   -Y,R27
	ST   -Y,R26
	LDD  R30,Y+2
	CPI  R30,LOW(0x1)
	BRNE _0x2100015
	LD   R30,Y
	LDD  R31,Y+1
	LPM  R30,Z
	RJMP _0x2120002
_0x2100015:
	CPI  R30,LOW(0x2)
	BRNE _0x2100016
	LD   R26,Y
	LDD  R27,Y+1
	CALL __EEPROMRDB
	RJMP _0x2120002
_0x2100016:
	CPI  R30,LOW(0x3)
	BRNE _0x2100018
	LD   R26,Y
	LDD  R27,Y+1
	__CALL1MN _glcd_state,25
	RJMP _0x2120002
_0x2100018:
	LD   R26,Y
	LDD  R27,Y+1
	LD   R30,X
_0x2120002:
	ADIW R28,3
	RET
; .FEND
_glcd_writemem:
; .FSTART _glcd_writemem
	ST   -Y,R26
	LDD  R30,Y+3
	CPI  R30,0
	BRNE _0x210001C
	LD   R30,Y
	LDD  R26,Y+1
	LDD  R27,Y+1+1
	ST   X,R30
	RJMP _0x210001B
_0x210001C:
	CPI  R30,LOW(0x2)
	BRNE _0x210001D
	LD   R30,Y
	LDD  R26,Y+1
	LDD  R27,Y+1+1
	CALL __EEPROMWRB
	RJMP _0x210001B
_0x210001D:
	CPI  R30,LOW(0x3)
	BRNE _0x210001B
	LDD  R30,Y+1
	LDD  R31,Y+1+1
	ST   -Y,R31
	ST   -Y,R30
	LDD  R26,Y+2
	__CALL1MN _glcd_state,27
_0x210001B:
_0x2120001:
	ADIW R28,4
	RET
; .FEND

	.DSEG
_glcd_state:
	.BYTE 0x1D
_hour:
	.BYTE 0x2
_ks0108_coord_G102:
	.BYTE 0x3
__seed_G107:
	.BYTE 0x4

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x0:
	LDI  R30,LOW(24)
	LDI  R31,HIGH(24)
	CALL __MODW21
	LDI  R26,LOW(_dotMatrix*2)
	LDI  R27,HIGH(_dotMatrix*2)
	LSL  R30
	ROL  R31
	ADD  R30,R26
	ADC  R31,R27
	LPM  R19,Z
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x1:
	MOV  R30,R16
	LDI  R26,LOW(1)
	CALL __LSLB12
	OUT  0x1B,R30
	MOV  R30,R19
	COM  R30
	OUT  0x18,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:21 WORDS
SUBOPT_0x2:
	LDS  R30,_hour
	LDS  R31,_hour+1
	LSL  R30
	ROL  R31
	CALL __CWD1
	CALL __CDF1
	__GETD2N 0x40490FDB
	CALL __MULF12
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0x41400000
	CALL __DIVF21
	MOVW R26,R30
	MOVW R24,R22
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x3:
	__GETD2N 0x41600000
	CALL __MULF12
	CALL __CFD1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:21 WORDS
SUBOPT_0x4:
	__PUTB1MN _glcd_state,8
	LDI  R30,LOW(64)
	ST   -Y,R30
	LDI  R30,LOW(32)
	ST   -Y,R30
	MOV  R30,R16
	SUBI R30,-LOW(64)
	ST   -Y,R30
	LDI  R30,LOW(32)
	SUB  R30,R18
	MOV  R26,R30
	JMP  _glcd_line

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:18 WORDS
SUBOPT_0x5:
	MOVW R30,R12
	LSL  R30
	ROL  R31
	CALL __CWD1
	CALL __CDF1
	__GETD2N 0x40490FDB
	CALL __MULF12
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0x42700000
	CALL __DIVF21
	MOVW R26,R30
	MOVW R24,R22
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x6:
	__GETD2N 0x41A80000
	CALL __MULF12
	CALL __CFD1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:18 WORDS
SUBOPT_0x7:
	MOVW R30,R10
	LSL  R30
	ROL  R31
	CALL __CWD1
	CALL __CDF1
	__GETD2N 0x40490FDB
	CALL __MULF12
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0x42700000
	CALL __DIVF21
	MOVW R26,R30
	MOVW R24,R22
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x8:
	__GETD2N 0x41E00000
	CALL __MULF12
	CALL __CFD1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x9:
	CALL __PUTPARD2
	CALL __GETD2S0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:11 WORDS
SUBOPT_0xA:
	__GETD2S 5
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xB:
	__PUTD1S 5
	RJMP SUBOPT_0xA

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xC:
	__GETD1S 5
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xD:
	CALL __SUBF12
	__PUTD1S 5
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xE:
	__GETD2S 1
	CALL __MULF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0xF:
	CBI  0x12,1
	LDI  R30,LOW(255)
	OUT  0x14,R30
	LD   R30,Y
	OUT  0x15,R30
	CALL _ks0108_enable_G102
	JMP  _ks0108_disable_G102

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x10:
	LSR  R30
	LSR  R30
	LSR  R30
	MOV  R26,R30
	JMP  _ks0108_gotoxp_G102

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x11:
	CALL _ks0108_wrdata_G102
	JMP  _ks0108_nextx_G102

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x12:
	ADD  R30,R26
	ADC  R31,R27
	STD  Y+6,R30
	STD  Y+6+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:8 WORDS
SUBOPT_0x13:
	LDD  R30,Y+12
	ST   -Y,R30
	LDD  R30,Y+7
	LDD  R31,Y+7+1
	ADIW R30,1
	STD  Y+7,R30
	STD  Y+7+1,R31
	SBIW R30,1
	ST   -Y,R31
	ST   -Y,R30
	LDI  R26,LOW(0)
	JMP  _glcd_writemem

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0x14:
	LDD  R30,Y+12
	ST   -Y,R30
	LDD  R30,Y+7
	LDD  R31,Y+7+1
	ADIW R30,1
	STD  Y+7,R30
	STD  Y+7+1,R31
	SBIW R30,1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x15:
	CLR  R22
	CLR  R23
	MOVW R26,R30
	MOVW R24,R22
	JMP  _glcd_readmem

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x16:
	ST   -Y,R21
	LDD  R26,Y+10
	JMP  _glcd_mappixcolor1bit

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x17:
	ST   -Y,R16
	INC  R16
	LDD  R30,Y+16
	ST   -Y,R30
	ST   -Y,R21
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x18:
	ST   -Y,R16
	INC  R16
	LDD  R26,Y+16
	CALL _ks0108_rdbyte_G102
	AND  R30,R20
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x19:
	MOV  R21,R30
	LDD  R30,Y+12
	ST   -Y,R30
	LDD  R26,Y+7
	LDD  R27,Y+7+1
	CLR  R24
	CLR  R25
	CALL _glcd_readmem
	MOV  R1,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x1A:
	ST   -Y,R16
	INC  R16
	LDD  R30,Y+16
	ST   -Y,R30
	LDD  R30,Y+14
	ST   -Y,R30
	LDD  R30,Y+9
	LDD  R31,Y+9+1
	ADIW R30,1
	STD  Y+9,R30
	STD  Y+9+1,R31
	SBIW R30,1
	RJMP SUBOPT_0x15

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x1B:
	ST   -Y,R27
	ST   -Y,R26
	LD   R26,Y
	LDD  R27,Y+1
	CALL __CPW02
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x1C:
	STD  Y+5,R30
	STD  Y+5+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x1D:
	LDD  R30,Y+6
	SUBI R30,LOW(1)
	STD  Y+6,R30
	SUBI R30,-LOW(1)
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x1E:
	ST   -Y,R19
	LDD  R26,Y+10
	JMP  _glcd_putpixelm_G103

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x1F:
	LDD  R26,Y+9
	LDD  R27,Y+9+1
	ADD  R30,R26
	ADC  R31,R27
	STD  Y+9,R30
	STD  Y+9+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x20:
	LDD  R30,Y+9
	LDD  R31,Y+9+1
	SUB  R30,R26
	SBC  R31,R27
	STD  Y+9,R30
	STD  Y+9+1,R31
	RET

;RUNTIME LIBRARY

	.CSEG
__SAVELOCR6:
	ST   -Y,R21
__SAVELOCR5:
	ST   -Y,R20
__SAVELOCR4:
	ST   -Y,R19
__SAVELOCR3:
	ST   -Y,R18
__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR6:
	LDD  R21,Y+5
__LOADLOCR5:
	LDD  R20,Y+4
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

__ANEGD1:
	COM  R31
	COM  R22
	COM  R23
	NEG  R30
	SBCI R31,-1
	SBCI R22,-1
	SBCI R23,-1
	RET

__LSLB12:
	TST  R30
	MOV  R0,R30
	MOV  R30,R26
	BREQ __LSLB12R
__LSLB12L:
	LSL  R30
	DEC  R0
	BRNE __LSLB12L
__LSLB12R:
	RET

__LSRB12:
	TST  R30
	MOV  R0,R30
	MOV  R30,R26
	BREQ __LSRB12R
__LSRB12L:
	LSR  R30
	DEC  R0
	BRNE __LSRB12L
__LSRB12R:
	RET

__CWD1:
	MOV  R22,R31
	ADD  R22,R22
	SBC  R22,R22
	MOV  R23,R22
	RET

__MULW12U:
	MUL  R31,R26
	MOV  R31,R0
	MUL  R30,R27
	ADD  R31,R0
	MUL  R30,R26
	MOV  R30,R0
	ADD  R31,R1
	RET

__MULD12U:
	MUL  R23,R26
	MOV  R23,R0
	MUL  R22,R27
	ADD  R23,R0
	MUL  R31,R24
	ADD  R23,R0
	MUL  R30,R25
	ADD  R23,R0
	MUL  R22,R26
	MOV  R22,R0
	ADD  R23,R1
	MUL  R31,R27
	ADD  R22,R0
	ADC  R23,R1
	MUL  R30,R24
	ADD  R22,R0
	ADC  R23,R1
	CLR  R24
	MUL  R31,R26
	MOV  R31,R0
	ADD  R22,R1
	ADC  R23,R24
	MUL  R30,R27
	ADD  R31,R0
	ADC  R22,R1
	ADC  R23,R24
	MUL  R30,R26
	MOV  R30,R0
	ADD  R31,R1
	ADC  R22,R24
	ADC  R23,R24
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

__GETW1P:
	LD   R30,X+
	LD   R31,X
	SBIW R26,1
	RET

__GETD1S0:
	LD   R30,Y
	LDD  R31,Y+1
	LDD  R22,Y+2
	LDD  R23,Y+3
	RET

__GETD2S0:
	LD   R26,Y
	LDD  R27,Y+1
	LDD  R24,Y+2
	LDD  R25,Y+3
	RET

__PUTD1S0:
	ST   Y,R30
	STD  Y+1,R31
	STD  Y+2,R22
	STD  Y+3,R23
	RET

__PUTPARD2:
	ST   -Y,R25
	ST   -Y,R24
	ST   -Y,R27
	ST   -Y,R26
	RET

__SWAPD12:
	MOV  R1,R24
	MOV  R24,R22
	MOV  R22,R1
	MOV  R1,R25
	MOV  R25,R23
	MOV  R23,R1

__SWAPW12:
	MOV  R1,R27
	MOV  R27,R31
	MOV  R31,R1

__SWAPB12:
	MOV  R1,R26
	MOV  R26,R30
	MOV  R30,R1
	RET

__EEPROMRDB:
	SBIC EECR,EEWE
	RJMP __EEPROMRDB
	PUSH R31
	IN   R31,SREG
	CLI
	OUT  EEARL,R26
	OUT  EEARH,R27
	SBI  EECR,EERE
	IN   R30,EEDR
	OUT  SREG,R31
	POP  R31
	RET

__EEPROMWRB:
	SBIS EECR,EEWE
	RJMP __EEPROMWRB1
	WDR
	RJMP __EEPROMWRB
__EEPROMWRB1:
	IN   R25,SREG
	CLI
	OUT  EEARL,R26
	OUT  EEARH,R27
	SBI  EECR,EERE
	IN   R24,EEDR
	CP   R30,R24
	BREQ __EEPROMWRB0
	OUT  EEDR,R30
	SBI  EECR,EEMWE
	SBI  EECR,EEWE
__EEPROMWRB0:
	OUT  SREG,R25
	RET

__CPW02:
	CLR  R0
	CP   R0,R26
	CPC  R0,R27
	RET

__ANEGF1:
	SBIW R30,0
	SBCI R22,0
	SBCI R23,0
	BREQ __ANEGF10
	SUBI R23,0x80
__ANEGF10:
	RET

__ROUND_REPACK:
	TST  R21
	BRPL __REPACK
	CPI  R21,0x80
	BRNE __ROUND_REPACK0
	SBRS R30,0
	RJMP __REPACK
__ROUND_REPACK0:
	ADIW R30,1
	ADC  R22,R25
	ADC  R23,R25
	BRVS __REPACK1

__REPACK:
	LDI  R21,0x80
	EOR  R21,R23
	BRNE __REPACK0
	PUSH R21
	RJMP __ZERORES
__REPACK0:
	CPI  R21,0xFF
	BREQ __REPACK1
	LSL  R22
	LSL  R0
	ROR  R21
	ROR  R22
	MOV  R23,R21
	RET
__REPACK1:
	PUSH R21
	TST  R0
	BRMI __REPACK2
	RJMP __MAXRES
__REPACK2:
	RJMP __MINRES

__UNPACK:
	LDI  R21,0x80
	MOV  R1,R25
	AND  R1,R21
	LSL  R24
	ROL  R25
	EOR  R25,R21
	LSL  R21
	ROR  R24

__UNPACK1:
	LDI  R21,0x80
	MOV  R0,R23
	AND  R0,R21
	LSL  R22
	ROL  R23
	EOR  R23,R21
	LSL  R21
	ROR  R22
	RET

__CFD1U:
	SET
	RJMP __CFD1U0
__CFD1:
	CLT
__CFD1U0:
	PUSH R21
	RCALL __UNPACK1
	CPI  R23,0x80
	BRLO __CFD10
	CPI  R23,0xFF
	BRCC __CFD10
	RJMP __ZERORES
__CFD10:
	LDI  R21,22
	SUB  R21,R23
	BRPL __CFD11
	NEG  R21
	CPI  R21,8
	BRTC __CFD19
	CPI  R21,9
__CFD19:
	BRLO __CFD17
	SER  R30
	SER  R31
	SER  R22
	LDI  R23,0x7F
	BLD  R23,7
	RJMP __CFD15
__CFD17:
	CLR  R23
	TST  R21
	BREQ __CFD15
__CFD18:
	LSL  R30
	ROL  R31
	ROL  R22
	ROL  R23
	DEC  R21
	BRNE __CFD18
	RJMP __CFD15
__CFD11:
	CLR  R23
__CFD12:
	CPI  R21,8
	BRLO __CFD13
	MOV  R30,R31
	MOV  R31,R22
	MOV  R22,R23
	SUBI R21,8
	RJMP __CFD12
__CFD13:
	TST  R21
	BREQ __CFD15
__CFD14:
	LSR  R23
	ROR  R22
	ROR  R31
	ROR  R30
	DEC  R21
	BRNE __CFD14
__CFD15:
	TST  R0
	BRPL __CFD16
	RCALL __ANEGD1
__CFD16:
	POP  R21
	RET

__CDF1U:
	SET
	RJMP __CDF1U0
__CDF1:
	CLT
__CDF1U0:
	SBIW R30,0
	SBCI R22,0
	SBCI R23,0
	BREQ __CDF10
	CLR  R0
	BRTS __CDF11
	TST  R23
	BRPL __CDF11
	COM  R0
	RCALL __ANEGD1
__CDF11:
	MOV  R1,R23
	LDI  R23,30
	TST  R1
__CDF12:
	BRMI __CDF13
	DEC  R23
	LSL  R30
	ROL  R31
	ROL  R22
	ROL  R1
	RJMP __CDF12
__CDF13:
	MOV  R30,R31
	MOV  R31,R22
	MOV  R22,R1
	PUSH R21
	RCALL __REPACK
	POP  R21
__CDF10:
	RET

__SWAPACC:
	PUSH R20
	MOVW R20,R30
	MOVW R30,R26
	MOVW R26,R20
	MOVW R20,R22
	MOVW R22,R24
	MOVW R24,R20
	MOV  R20,R0
	MOV  R0,R1
	MOV  R1,R20
	POP  R20
	RET

__UADD12:
	ADD  R30,R26
	ADC  R31,R27
	ADC  R22,R24
	RET

__NEGMAN1:
	COM  R30
	COM  R31
	COM  R22
	SUBI R30,-1
	SBCI R31,-1
	SBCI R22,-1
	RET

__SUBF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R25,0x80
	BREQ __ADDF129
	LDI  R21,0x80
	EOR  R1,R21

	RJMP __ADDF120

__ADDF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R25,0x80
	BREQ __ADDF129

__ADDF120:
	CPI  R23,0x80
	BREQ __ADDF128
__ADDF121:
	MOV  R21,R23
	SUB  R21,R25
	BRVS __ADDF1211
	BRPL __ADDF122
	RCALL __SWAPACC
	RJMP __ADDF121
__ADDF122:
	CPI  R21,24
	BRLO __ADDF123
	CLR  R26
	CLR  R27
	CLR  R24
__ADDF123:
	CPI  R21,8
	BRLO __ADDF124
	MOV  R26,R27
	MOV  R27,R24
	CLR  R24
	SUBI R21,8
	RJMP __ADDF123
__ADDF124:
	TST  R21
	BREQ __ADDF126
__ADDF125:
	LSR  R24
	ROR  R27
	ROR  R26
	DEC  R21
	BRNE __ADDF125
__ADDF126:
	MOV  R21,R0
	EOR  R21,R1
	BRMI __ADDF127
	RCALL __UADD12
	BRCC __ADDF129
	ROR  R22
	ROR  R31
	ROR  R30
	INC  R23
	BRVC __ADDF129
	RJMP __MAXRES
__ADDF128:
	RCALL __SWAPACC
__ADDF129:
	RCALL __REPACK
	POP  R21
	RET
__ADDF1211:
	BRCC __ADDF128
	RJMP __ADDF129
__ADDF127:
	SUB  R30,R26
	SBC  R31,R27
	SBC  R22,R24
	BREQ __ZERORES
	BRCC __ADDF1210
	COM  R0
	RCALL __NEGMAN1
__ADDF1210:
	TST  R22
	BRMI __ADDF129
	LSL  R30
	ROL  R31
	ROL  R22
	DEC  R23
	BRVC __ADDF1210

__ZERORES:
	CLR  R30
	CLR  R31
	MOVW R22,R30
	POP  R21
	RET

__MINRES:
	SER  R30
	SER  R31
	LDI  R22,0x7F
	SER  R23
	POP  R21
	RET

__MAXRES:
	SER  R30
	SER  R31
	LDI  R22,0x7F
	LDI  R23,0x7F
	POP  R21
	RET

__MULF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R23,0x80
	BREQ __ZERORES
	CPI  R25,0x80
	BREQ __ZERORES
	EOR  R0,R1
	SEC
	ADC  R23,R25
	BRVC __MULF124
	BRLT __ZERORES
__MULF125:
	TST  R0
	BRMI __MINRES
	RJMP __MAXRES
__MULF124:
	PUSH R0
	PUSH R17
	PUSH R18
	PUSH R19
	PUSH R20
	CLR  R17
	CLR  R18
	CLR  R25
	MUL  R22,R24
	MOVW R20,R0
	MUL  R24,R31
	MOV  R19,R0
	ADD  R20,R1
	ADC  R21,R25
	MUL  R22,R27
	ADD  R19,R0
	ADC  R20,R1
	ADC  R21,R25
	MUL  R24,R30
	RCALL __MULF126
	MUL  R27,R31
	RCALL __MULF126
	MUL  R22,R26
	RCALL __MULF126
	MUL  R27,R30
	RCALL __MULF127
	MUL  R26,R31
	RCALL __MULF127
	MUL  R26,R30
	ADD  R17,R1
	ADC  R18,R25
	ADC  R19,R25
	ADC  R20,R25
	ADC  R21,R25
	MOV  R30,R19
	MOV  R31,R20
	MOV  R22,R21
	MOV  R21,R18
	POP  R20
	POP  R19
	POP  R18
	POP  R17
	POP  R0
	TST  R22
	BRMI __MULF122
	LSL  R21
	ROL  R30
	ROL  R31
	ROL  R22
	RJMP __MULF123
__MULF122:
	INC  R23
	BRVS __MULF125
__MULF123:
	RCALL __ROUND_REPACK
	POP  R21
	RET

__MULF127:
	ADD  R17,R0
	ADC  R18,R1
	ADC  R19,R25
	RJMP __MULF128
__MULF126:
	ADD  R18,R0
	ADC  R19,R1
__MULF128:
	ADC  R20,R25
	ADC  R21,R25
	RET

__DIVF21:
	PUSH R21
	RCALL __UNPACK
	CPI  R23,0x80
	BRNE __DIVF210
	TST  R1
__DIVF211:
	BRPL __DIVF219
	RJMP __MINRES
__DIVF219:
	RJMP __MAXRES
__DIVF210:
	CPI  R25,0x80
	BRNE __DIVF218
__DIVF217:
	RJMP __ZERORES
__DIVF218:
	EOR  R0,R1
	SEC
	SBC  R25,R23
	BRVC __DIVF216
	BRLT __DIVF217
	TST  R0
	RJMP __DIVF211
__DIVF216:
	MOV  R23,R25
	PUSH R17
	PUSH R18
	PUSH R19
	PUSH R20
	CLR  R1
	CLR  R17
	CLR  R18
	CLR  R19
	MOVW R20,R18
	LDI  R25,32
__DIVF212:
	CP   R26,R30
	CPC  R27,R31
	CPC  R24,R22
	CPC  R20,R17
	BRLO __DIVF213
	SUB  R26,R30
	SBC  R27,R31
	SBC  R24,R22
	SBC  R20,R17
	SEC
	RJMP __DIVF214
__DIVF213:
	CLC
__DIVF214:
	ROL  R21
	ROL  R18
	ROL  R19
	ROL  R1
	ROL  R26
	ROL  R27
	ROL  R24
	ROL  R20
	DEC  R25
	BRNE __DIVF212
	MOVW R30,R18
	MOV  R22,R1
	POP  R20
	POP  R19
	POP  R18
	POP  R17
	TST  R22
	BRMI __DIVF215
	LSL  R21
	ROL  R30
	ROL  R31
	ROL  R22
	DEC  R23
	BRVS __DIVF217
__DIVF215:
	RCALL __ROUND_REPACK
	POP  R21
	RET

__CMPF12:
	TST  R25
	BRMI __CMPF120
	TST  R23
	BRMI __CMPF121
	CP   R25,R23
	BRLO __CMPF122
	BRNE __CMPF121
	CP   R26,R30
	CPC  R27,R31
	CPC  R24,R22
	BRLO __CMPF122
	BREQ __CMPF123
__CMPF121:
	CLZ
	CLC
	RET
__CMPF122:
	CLZ
	SEC
	RET
__CMPF123:
	SEZ
	CLC
	RET
__CMPF120:
	TST  R23
	BRPL __CMPF122
	CP   R25,R23
	BRLO __CMPF121
	BRNE __CMPF122
	CP   R30,R26
	CPC  R31,R27
	CPC  R22,R24
	BRLO __CMPF122
	BREQ __CMPF123
	RJMP __CMPF121

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
