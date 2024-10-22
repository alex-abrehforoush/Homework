#include "headers.h"


const unsigned short dotMatrix[] = {0,0,0,0,0,0,0,0,0,0,0,
0x7e, 0x09, 0x09, 0x09, 0x7e, // A
0x7e, 0x09, 0x09, 0x09, 0x7e, // A
0,0,0,0,0,0,0,0,0,0,0};


int counter = 0, dc = 0, distance = 0;
int second, minute, hour;


void func1()
{
    int i;
    char j;
    if(dc >= 5)
    {
        dc = 0;
        distance++;
        if(distance > 23)
        {
            distance = 0;
        }
    }
    for(i = 0; i < 8; i++)
    {
        j = dotMatrix[(i + distance) % 24];
        PORTD.7 = 1;
        PORTA = 1 << i;
        PORTB = ~j;
    }
    for(i = 0; i < 8; i++)
    {
        j = dotMatrix[(i + 8 + distance) % 24];
        PORTD.7 = 0;
        PORTA = 1 << i;
        PORTB = ~j;
    }
}

void func2()
{
    glcd_putimagef(0, 0, Yin_and_Yang, GLCD_PUTCOPY);
    delay_ms(3000);
    #asm("sei")
}

void func3()
{
   int x, y;
   dc = counter++;
   if (counter >= 50)
   {
       counter = 0;
       second++;
       if(second >= 60)
       {
          second = 0;
          minute++; 
              if(minute >= 60)
              {
                  minute = 0;
                  hour++;
                  if(hour >= 12)
                  {
                    hour = 0;
                  }
           }
       }
       
       glcd_clear();
       glcd_rectrel(32, 2, 64, 60);

       x = HOUR_HANDLE_LEN * sin(2*hour*PI / 12);
       y = HOUR_HANDLE_LEN * cos(2*hour*PI / 12);
       
       glcd_setlinethick(3);
       glcd_line(64, 32, 64+x, 32-y);


       x = MINUTE_HANDLE_LEN * sin(2*minute*PI / 60);
       y = MINUTE_HANDLE_LEN * cos(2*minute*PI / 60);
       
       glcd_setlinethick(2);
       glcd_line(64, 32, 64+x, 32-y); 
       
       x = SECOND_HANDLE_LEN * sin(2*second*PI / 60);
       y = SECOND_HANDLE_LEN * cos(2*second*PI / 60);
       
       glcd_setlinethick(1);
       glcd_line(64, 32, 64+x, 32-y);
   }
}

