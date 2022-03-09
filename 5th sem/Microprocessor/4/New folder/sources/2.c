#include <avr/io.h>

void delay100ms(void)
{
	for(unsigned long int i = 0; i < 200000; i++)
	{
	}	
}

int main(void)
{
	DDRB = 0xFF;
    while (true) 
    {
		PORTB = PORTB | 0b00001000;
		delay100ms();
		PORTB = PORTB & 0b11110111;
    }
	return 0;
}

