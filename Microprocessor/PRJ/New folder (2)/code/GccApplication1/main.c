/*
 * GccApplication1.c
 *
 * Created: 1/14/2022 7:00:59 PM
 * Author : Alireza
 */ 

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

void operate(unsigned char operand)
{
	PORTC = operand;
	PORTD &= ~(1 << 0);
	PORTD &= ~(1 << 1);
	PORTD |= (1 << 2);
	_delay_us(1);
	PORTD &= ~(1 << 2);
	_delay_us(100);
}
void print(char* text)
{
	for(unsigned char i = 0; text[i] != 0; i++)
	{
		PORTC = text[i];
		PORTD |= (1 << 0);
		PORTD &= ~(1 << 1);
		PORTD |= (1 << 2);
		_delay_us(1);
		PORTD &= ~(1 << 2);
		_delay_us(100);
	}
}
void setTimer(unsigned char t_index)
{
	switch(t_index)
	{
		case 0:
		TIMSK = (1 << TOIE0);
		break;
		case 1:
		TIMSK = (1 << TOIE0 | 1 << TOIE1);
		break;
		case 2:
		TIMSK = (1 << TOIE0 | 1 << TOIE1 | 1 << TOIE2);
		break;
		default:
		break;
	}
}

int main()
{
	TCNT0 = -32;
	TCCR0 = 0x01;
	TCNT1 = -32;
	TCCR1A = 0x00;
	TCCR1B = 0x01;
	TCNT2 = -32;
	TCCR2 = 0x01;
	setTimer(0);
	DDRC = 0xFF;
	DDRD = 0xFF;
	PORTD &= ~(1<<2);
	_delay_us(2000);
	operate(0x38);
	operate(0x0E);
	operate(0x01);
	_delay_us(2000);
	operate(0x06);
	PORTC = 0x80;
	PORTD &= ~(1 << 0);
	PORTD &= ~(1 << 1);
	PORTD |= (1 << 2);
	_delay_us(1);
	PORTD &= ~(1 << 2);
	_delay_us(200);
	print("\ninitializing...");
	_delay_ms(2000);
	sei();
	while(1);
}

ISR(TIMER0_OVF_vect)
{
	PORTC = 0x80;
	PORTD &= ~(1 << 0);
	PORTD &= ~(1 << 1);
	PORTD |= (1 << 2);
	_delay_us(1);
	PORTD &= ~(1 << 2);
	_delay_us(200);
	operate(1);
	print("\ninterrupt 0 triggered!");
	_delay_ms(2000);
	setTimer(1);
	sei();
	while (1);
	TCNT0 = -32;
}

ISR(TIMER1_OVF_vect)
{
	PORTC = 0x80;
	PORTD &= ~(1 << 0);
	PORTD &= ~(1 << 1);
	PORTD |= (1 << 2);
	_delay_us(1);
	PORTD &= ~(1 << 2);
	_delay_us(200);
	operate(1);
	print ("\ninterrupt 1 triggered!");
	_delay_ms(2000);
	setTimer(2);
	sei();
	while (1);
	TCNT1 = -32;
}

ISR(TIMER2_OVF_vect)
{
	PORTC = 0x80;
	PORTD &= ~(1 << 0);
	PORTD &= ~(1 << 1);
	PORTD |= (1 << 2);
	_delay_us(1);
	PORTD &= ~(1 << 2);
	_delay_us(200);
	operate(1);
	print("\ninterrupt 2 triggered!");
	_delay_ms(2000);
	while (1);
	TCNT2 = -32;
}