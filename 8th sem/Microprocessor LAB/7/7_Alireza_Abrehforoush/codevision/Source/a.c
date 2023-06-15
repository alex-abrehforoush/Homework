/*******************************************************
This program was created by the CodeWizardAVR V3.40 
Automatic Program Generator
? Copyright 1998-2020 Pavel Haiduc, HP InfoTech S.R.L.
http://www.hpinfotech.ro

Project : 
Version : 
Date    : 6/1/2023
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

#include "header.h"

void main(void)
{
    char sss[100]; // Adjust the size according to your needs
    char left[] = "<<";
    char right[] = ">>";
    
    initialize();

    set_baudrate(9600);
    // Declare your local variables here

    // Global enable interrupts
    #asm("sei")
    USART_Enable_Intrupt();
    printf("Part 2 is running!\r\n");
    printf("Enter your fullname: \r\n");
    strcpy(sss, left); // Copy the left string into the buffer
    scanf("%s", buff);
    strcat(sss, buff); // Concatenate the right string to the buffer 
    strcat(sss, right);
    
    lcd_clear();
    lcd_puts(sss);
    printf("%s\r\n", buff);
    printf("Part 2 is ending!\r\n");

    printf("Part 3 is running!\r\n");
    part = 3;
    
    while (1)
    {
    // Place your code here

    }
}