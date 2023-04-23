/*******************************************************
This program was created by the CodeWizardAVR V3.40 
Automatic Program Generator
? Copyright 1998-2020 Pavel Haiduc, HP InfoTech S.R.L.
http://www.hpinfotech.ro

Project : 
Version : 
Date    : 4/22/2023
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

int cnt = 0;
int ttl = -1; 
int state = 1;


// External Interrupt 0 service routine
interrupt [EXT_INT0] void ext_int0_isr(void)
{
    // Place your code here
}

// External Interrupt 1 service routine
interrupt [EXT_INT1] void ext_int1_isr(void)
{
    // Place your code here

}

// Timer 0 overflow interrupt service routine
/*interrupt [TIM0_OVF] void timer0_ovf_isr(void)
{
    // Place your code here
}*/

// Timer2 overflow interrupt service routine
interrupt [TIM2_OVF] void timer2_ovf_isr(void)
{
    // Reinitialize Timer2 value
    TCNT2=0x00;
    
    // Place your code here     
    ttl = (ttl + 1) % 10; 
    if (ttl == 0)
    {
    
        if (state == 1)
        {
            lcd_gotoxy(0,0);
            lcd_puts("rpm: +2.5");  
            PORTB = (int)pow(2, 4 + (cnt % 4));
            
            if(cnt >=  72)
            {
                state = 2;
                lcd_clear();  
                cnt = 0;
            }
                
        }
        if (state == 2)
        {
            cnt += 10;
            lcd_gotoxy(0, 0);
            lcd_puts("  stop  ");
            if(cnt >=  72)
            {
                state = 3;
                lcd_clear(); 
                cnt = 0;
            }
        }
        if (state ==  3)
        {
            lcd_gotoxy(0,0);
            lcd_puts("rpm: -2.5");  
            PORTB = (int)pow(2, 7 - (cnt % 4));
            if(cnt >=  72)
            {
                state = 1;
                lcd_clear();  
                cnt = 0;
            }
        }
        cnt = cnt + 1;
    }
}

void modifyDC()
{
    int a = 0, dc;
    a = PINA;     
    dc = (int)(0.35 * a) + 5;                                                                                 
    OCR0 = (int)(2.55 * dc) + 0.5;
}

void main(void)
{
    // Declare your local variables here
        
    initialize();

    while (1)
    {
        // Place your code here 
        modifyDC();
    }
}
