#include <avr/io.h>
#include "util/delay.h"

void delay100ms(int d)
{
	_delay_ms(d);
}

int main(void)
{
	DDRB = 0xFF;
    while (true) 
    {
		PORTB = PORTB | 0b00001000;
		delay100ms(100);
		PORTB = PORTB & 0b11110111;
    }
	return 0;
}

