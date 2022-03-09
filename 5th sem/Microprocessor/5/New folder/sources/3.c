#include <avr/io.h>
int main()
{
	DDRB = 0x01; 
	DDRC = 0xFF;
  	DDRD = 0xFF;
  	TCCR1A = 0x00;
  	TCCR1B = 0x07;
  	TCNT1L = 0x00;
  	TCNT1H = 0x00;
	while (1)
	{
		do
		{
			PORTC = TCNT1L;
			PORTD = TCNT1H;
		}
		while ((TIFR & (0x1 << TOV1)) == 0);
		TIFR = 0x1 << TOV1;
	}
	return 0;
}