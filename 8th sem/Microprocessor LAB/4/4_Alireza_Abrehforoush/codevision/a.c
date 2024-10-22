/*******************************************************
This program was created by the CodeWizardAVR V3.40 
Automatic Program Generator
? Copyright 1998-2020 Pavel Haiduc, HP InfoTech S.R.L.
http://www.hpinfotech.ro

Project : 
Version : 
Date    : 4/21/2023
Author  : Alireza Abrehforoush
Company : 
Comments: 


Chip type               : ATmega16
Program type            : Application
AVR Core Clock frequency: 8.000000 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 256
*******************************************************/

#include "Source/headers.h"

// Declare your global variables here
int capacity = 1000;
char hour = 0, minute = 0, second = 0, csec = 0;

// External Interrupt 0 service routine
interrupt [EXT_INT0] void ext_int0_isr(void)
{
    // Place your code here
    parking();
}

// External Interrupt 1 service routine
interrupt [EXT_INT1] void ext_int1_isr(void)
{
    // Place your code here
    stopwatch();
}

// Timer 0 overflow interrupt service routine
interrupt [TIM0_OVF] void timer0_ovf_isr(void)
{
    // Reinitialize Timer 0 value
    TCNT0=0xB2;
    // Place your code here
    csec++;
    if(csec >= 100)
    {
        csec %= 100;
        second++;
        if(second >= 60)
        {
            second %= 60;
            minute++;
            if (minute >= 60)
            {
                minute %= 60;
                hour = (hour + 1) % 24;
            }
        }   
    }         
    displayTime(hour, minute, second, csec);
}

void main(void)
{
// Declare your local variables here

    initialize();
    
    initDisplay();
    
    while (1) {
        // Place your code here
    }
}
