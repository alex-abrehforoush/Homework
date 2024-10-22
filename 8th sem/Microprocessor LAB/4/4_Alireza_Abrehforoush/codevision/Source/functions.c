#include "headers.h"

void displayTime(char  hour, char minute, char second, char msec)
{
    char timeBuf[16];
    lcd_gotoxy(0,0);
    sprintf(timeBuf, "  %02d:%02d:%02d:%02d  ", hour, minute, second, msec);
    lcd_puts(timeBuf);
}

void displayCapacity(int capacity)
{
    char capBuf[16];
    lcd_gotoxy(0,1);
    sprintf(capBuf, "CE:%4d ** ", capacity);
    lcd_puts(capBuf); 
}

void initDisplay()
{
    displayTime(hour, minute, second, csec);
    displayCapacity(capacity);
    displayPeriod();
}

void stopwatch()
{
    if(PINB.4==0)
    {
        TCCR0=(0<<WGM00) | (0<<COM01) | (0<<COM00) | (0<<WGM01) | (1<<CS02) | (0<<CS01) | (1<<CS00);
    }

    if(PINB.5==0)
    {
        if(TCCR0==0x05)
        {
            TCCR0=0x00;
        }
        else if(TCCR0 == 0x00)
        {
            TCNT0 = 0x00;
            csec = 0;
            second = 0;
            minute = 0;
            hour = 0;
            displayTime(hour, minute, second, csec);
        }
    }
}

void parking()
{
    if(PINB.7 == 0)
    {
        capacity = capacity <= 1 ? 0 : capacity - 1;
    }
    if(PINB.3 == 0)
    {
        capacity = capacity >= 1000 ? 1000 : capacity + 1;
    }
    displayCapacity(capacity);
}

void displayPeriod()
{
    lcd_gotoxy(11, 1);
    lcd_puts("50US5");     
}
