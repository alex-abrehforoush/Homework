#include <avr/io.h>
#include <avr/interrupt.h>

ISR (TIMER1_COMPA_vect)
{
	PORTB = PORTB ^ (1 << 5);
}

int main()
{
	DDRB = DDRB | (1 << 5);
	OCR1A = 7811;
	TCCR1A = 0x00;
	TCCR1B = 0x0D;
	TIMSK = (1 << OCIE1A);
	sei();
	DDRC = 0x00;
	DDRD = 0xFF;
	while(1)
	{
		PORTD = PINC;
	}
	return 0;
}