#include "header.h"
#include "third.h"

#include <mega16.h>
#include <alcd.h>

#include <stdio.h>
#include <delay.h>
#include <stdlib.h>
#include <string.h>


void part1()
{
    char my_str[50];
    lcd_clear();
    sprintf(my_str, "Abrehforoush\n9816603");
    lcd_puts(my_str); 
    return;   
}

void part2()
{
    char walking_text[100];
    char current_window[20];
    int i = 0;
    sprintf(walking_text, "                   Welcome to the Microprocessor Laboratory at Isfahan University of Technology.");  
    for(i = 0; i < 100; i++)
    {   
        lcd_clear(); 
        strncpy(current_window, &walking_text[i], 16);
        lcd_puts(current_window);
        sprintf(current_window, '');
        delay_ms(50);
    }                 
    return;
}

char keypad2(void)
{
    int r, c;
    int key = 100;
    
    while(key == 100)
    {
        for (r = 0; r < 4; r++)
        {
            PORTB = row[r]; 
            
            
            c = 20;
            delay_ms(10);
            if (PINB.0==1) c=0;
            if (PINB.1==1) c=1;
            if (PINB.2==1) c=2;
            if (PINB.3==1) c=3;
            if (!(c==20))
            {
                key=(r*4) + c;
                PORTB = 0xF0;
                while (PINB.0==1) {}
                while (PINB.1==1) {}
                while (PINB.2==1) {}
                while (PINB.3==1) {}
            }
            PORTB=0xF0;
        }
    }
        
    return data_key[key];
}

void part3()
{
    DDRB = 0xf0;
    DDRC.0 = 1;
    while (1)
    {
        lcd_putchar(keypad2());
        delay_ms(500);    
        lcd_clear();  
    }
}

void lcdBaseState()
{
    lcdPos = 0;
    lcd_clear();
    lcd_gotoxy(lcdPos, 0);
}

char readFromKeyPad(){
    int i;
    char h = 0; 
    
    while(h == 0){   
        for(i = 0; i < 4; i++){
            PORTB = readRow[i];
            if(PINB.0){
                h = dataKeys[i][0];
                break;}    
            else if(PINB.1){
                h = dataKeys[i][1];
                break;}
            else if(PINB.2){
                h = dataKeys[i][2];
                break;}
            else if(PINB.3){
                h = dataKeys[i][3];
                break;}
            delay_ms(5);   
        }
        while(PINB.0|PINB.1|PINB.2|PINB.3);
    }
    return h;
}

void part4()
{
    lcdBaseState();
    lcd_puts("=>press some Key");
    delay_ms(2500);
    lcdBaseState();
    GICR |= (1 << INT1);   
    PORTB = 0xff;
    while(lcdPos < 6);
    GICR |= (0 << INT1);   
    PORTB = 0xf0;
}


void part5()
{
    char speed[2];
    char time[2];
    char weigt[2];
    char temp[2];
    
    int speedLimit[2] = {0, 50};  
    int timeLimit[2] = {0, 99};
    int weigtLimit[2] = {0, 99};
    int tempLimit[2] = {20, 80};
    
    char buff[16];
    char buf[2];
    int val;
    
    lcdBaseState();
    
    lcd_gotoxy(0, 0);
    sprintf(buff, "Speed:??(%d-%d%c)", speedLimit[0], speedLimit[1], 'r');
    lcd_puts(buff);
    
    lcdPos = strlen("speed")+ 1;
    lcd_gotoxy(lcdPos, 0);
    speed[0] = readFromKeyPad();
    lcd_putchar(speed[0]);
    
    lcdPos++; 
    lcd_gotoxy(lcdPos, 0);
    speed[1] = readFromKeyPad();
    lcd_putchar(speed[1]);
    
    sprintf(buf, "%c%c", speed[0], speed[1]);
    val = atoi(buf);
    if(val > speedLimit[1] || val < speedLimit[0]){
        lcd_gotoxy(0, 0); 
        speed[0] = speed[1] = 'E';
        sprintf(buff, "Speed:EE(%d-%d%c)", speedLimit[0], speedLimit[1], 'r');
        lcd_puts(buff); 
    } 
    
    lcd_gotoxy(0, 1);
    sprintf(buff, "Time:??(%d-%d%c)", timeLimit[0], timeLimit[1], 's');
    lcd_puts(buff);
    
    lcdPos = strlen("time")+ 1;
    lcd_gotoxy(lcdPos, 1);
    time[0] = readFromKeyPad();
    lcd_putchar(time[0]);
    
    lcdPos++; 
    lcd_gotoxy(lcdPos, 1);
    time[1] = readFromKeyPad();
    lcd_putchar(time[1]);
    
    sprintf(buf, "%c%c", time[0], time[1]);
    val = atoi(buf);
    if(val > timeLimit[1] || val < timeLimit[0])
    {
        lcd_gotoxy(0, 1);
        time[0] = time[1] = 'E';
        sprintf(buff, "Time:EE(%d-%d%c)", timeLimit[0], timeLimit[1], 's');
        lcd_puts(buff); 
    } 
    
    delay_ms(1000); 
    
    
    lcdBaseState();
    
    lcd_gotoxy(0, 0);
    sprintf(buff, "Weigt:??(%d-%d%c)", weigtLimit[0], weigtLimit[1], 'F');
    lcd_puts(buff);
    
    lcdPos = strlen("speed")+ 1;
    lcd_gotoxy(lcdPos, 0);
    weigt[0] = readFromKeyPad();
    lcd_putchar(weigt[0]);
    
    lcdPos++; 
    lcd_gotoxy(lcdPos, 0);
    weigt[1] = readFromKeyPad();
    lcd_putchar(weigt[1]);
    
    sprintf(buf, "%c%c", weigt[0], weigt[1]);
    val = atoi(buf);
    if(val > weigtLimit[1] || val < weigtLimit[0]){
        weigt[0] = weigt[1] = 'E';
        lcd_gotoxy(0, 0);
        sprintf(buff, "Weigt:EE(%d-%d%c)", weigtLimit[0], weigtLimit[1], 'F');
        lcd_puts(buff); 
    } 
    
    
    lcd_gotoxy(0, 1);
    sprintf(buff, "Temp:??(%d-%d%c)", tempLimit[0], tempLimit[1], 'C');
    lcd_puts(buff);
    
    lcdPos = strlen("time")+ 1;
    lcd_gotoxy(lcdPos, 1);
    temp[0] = readFromKeyPad();
    lcd_putchar(temp[0]);
    
    lcdPos++; 
    lcd_gotoxy(lcdPos, 1);
    temp[1] = readFromKeyPad();
    lcd_putchar(temp[1]);
    
    sprintf(buf, "%c%c", temp[0], temp[1]);
    val = atoi(buf);
    if(val > tempLimit[1] || val < tempLimit[0])
    {
        temp[0] = temp[1] = 'E';
        lcd_gotoxy(0, 1);
        sprintf(buff, "Temp:EE(%d-%d%c)", tempLimit[0], tempLimit[1], 'C');
        lcd_puts(buff); 
    } 
    
    delay_ms(1000);
    
    
    lcdBaseState();
    sprintf(buff, "S:%c%cr|Time:%c%cs", speed[0], speed[1], time[0], time[0]);
    lcd_puts(buff);
    lcd_gotoxy(0, 1);
    sprintf(buff, "W:%c%cF|Temp:%c%cC", weigt[0], weigt[1], temp[0], temp[0]);
    lcd_puts(buff);
    
    delay_ms(10000);
}