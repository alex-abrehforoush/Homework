/*******************************************************
This program was created by the CodeWizardAVR V3.40 
Automatic Program Generator
? Copyright 1998-2020 Pavel Haiduc, HP InfoTech S.R.L.
http://www.hpinfotech.ro

Project : 
Version : 
Date    : 5/18/2023
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

#include "headers.h"

// Declare your global variables here

// Timer 0 overflow interrupt service routine
interrupt [TIM0_OVF] void timer0_ovf_isr(void)
{
    TCNT0=0x64;
    // Place your code here
    func3();
}

void main(void)
{
// Declare your local variables here
    initialBoard();
    func2();
    while (1)
    {
        func1();
    }
}
