#include <avr/io.h>

int main(void)
{
	DDRB = 0x00;
	DDRC = 0xFF;
	DDRD = 0xFF;	
    while (true)
    {
		unsigned char tmp;
		tmp = PINB;
		if(tmp & 0x01)
		{
			PORTD = 'O';
		}
		else
		{
			PORTC = 'E';
		}
    }
	return 0;
}

