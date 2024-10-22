/*******************************************************
This program was created by the CodeWizardAVR V3.40 
Automatic Program Generator
? Copyright 1998-2020 Pavel Haiduc, HP InfoTech S.R.L.
http://www.hpinfotech.ro

Project : 
Version : 
Date    : 5/28/2023
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
unsigned int adc_data[LAST_ADC_INPUT-FIRST_ADC_INPUT+1];
unsigned int previous_data[LAST_ADC_INPUT-FIRST_ADC_INPUT+1] = {0};
char firstUpdateDone[LAST_ADC_INPUT-FIRST_ADC_INPUT+1] = {0};
char buff1[16], buff2[16];

// ADC interrupt service routine
// with auto input scanning
interrupt [ADC_INT] void adc_isr(void)
{
    static unsigned char input_index=0;
        
    // Read the AD conversion result
    adc_data[input_index] = ADCW;
     
    /*combined parts 1 and 2  */   
    // print adc valuse
    func1(input_index);
    lcd_clear();
    lcd_gotoxy(0, 0);  
    lcd_puts(buff1);
                       
    // check adc updates
    func2(input_index);
    lcd_gotoxy(0, 1); 
    lcd_puts(buff2);
        
    /* set timer0 dutucyle in pwm mode */
    func3();
    
    // delay for display
    delay_ms(125);
         
    // Select next ADC input
    if (++input_index > (LAST_ADC_INPUT-FIRST_ADC_INPUT))
       input_index = 0;
    ADMUX = (FIRST_ADC_INPUT | ADC_VREF_TYPE) + input_index;
    
    // Delay needed for the stabilization of the ADC input voltage
    delay_us(10);  
    
    // Start the AD conversion
    ADCSRA |= (1 << ADSC);
}

void main(void)
{
    // Declare your local variables here
    
    initBoard();
    while (1)
    { // Place your code here

    }
}
