#include "headers.h"

void func1(unsigned char input_index)
{
    float temp;  
    int tempInt, tempFloat;
    temp = ((float)adc_data[input_index] / MAX_ADC_IN) * 5 * 1000;
    tempInt = (int)temp;
    tempFloat = (int)((temp - (float)tempInt) * 10);
    sprintf(buff1,"ADC %d: %d.%dmv", input_index, tempInt, tempFloat);
}

void func2(unsigned char input_index)
{
    int change, temp;
    char ch;
    if(firstUpdateDone[input_index] == 1 && ((adc_data[input_index] - previous_data[input_index]) >= ADC_FIVE_PERCENT || (previous_data[input_index]-adc_data[input_index]) >= ADC_FIVE_PERCENT))
    {                       
        change = adc_data[input_index] - previous_data[input_index]; 
        temp = ((float)change / MAX_ADC_IN) * 5 * 1000;              
        ch = change > 0 ? '+' : '-';  
        temp = temp > 0 ? temp : temp * (-1);
        sprintf(buff2,"new>ADC%d:%c%dmv", input_index, ch, temp);   
    }                           
    
    previous_data[input_index] = adc_data[input_index];
    if(firstUpdateDone[input_index] == 0)
    {
        firstUpdateDone[input_index] = 1;
    }
}

void func3()
{
    int duty = (int)adc_data[0] / 10.23;
    OCR0 = (2.55 * duty) + 0.5;
}