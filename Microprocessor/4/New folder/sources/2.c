#include <avr/io.h>
int main(void)
{
    DDRB = 0x00;
    for(unsigned int i = 0; i < 50000; i++)
    {
        PORTB = 0x55;
        PORTB = 0xAA;
    }
    return 0;
}