;Enabling output
	LDI R21, 0xFF
	OUT DDRB, R21
;Outputing in port B...
	LDS R16, $90
	OUT PORTB, R16
	LDS R16, $91
	OUT PORTB, R16
	LDS R16, $92
	OUT PORTB, R16
	LDS R16, $93
	OUT PORTB, R16
	LDS R16, $94
	OUT PORTB, R16
;End
	NOP