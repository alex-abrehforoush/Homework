/*
 * a.c
 *
 * Created: 4/4/2023 10:32:35 AM
 * Author: Alireza Abrehforoush
 */
#include <myheader.h>

void main(void)
{
    while (1)
    {
        // Please write your application code here
        part3(4, 500);
        delay_ms(1000);
        part4();
        delay_ms(1000); 
        part5(6789, port_C, port_D);   
    }
}


