WAIT:	SBIC EECR, EEWE
		RJMP WAIT
;Counting last
		LDI R18, 0
		LDI R17, 0x5F
		OUT EEARH, R18
		OUT EEARL, R17
		SBI EECR, EERE
		IN R16, EEDR
;To EEPROM
LOOP:	SBIC EECR, EEWE 
		RJMP LOOP
		LDI R18, 0
		LDI R17, 0x5F
		OUT EEARH, R18
		OUT EEARL, R17
		OUT EEDR, R16
		SBI EECR, EEMWE
		SBI EECR, EEWE
		.EXIT
;End
	NOP