#include <myheader.h>

char digits[10] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};

char part1(char port_in)
{
    char data_in;
    switch(port_in)
    {
        case port_A:
            DDRA = 0x00; // as input
            data_in = PINA;
            break;
        case port_B:
            DDRB = 0x00; // as input
            data_in = PINB;
            break;
        case port_C:
            DDRC = 0x00; // as input
            data_in = PINC;
            break;
        case port_D:
            DDRD = 0x00; // as input
            data_in = PIND;
            break;
    }              
    return data_in;
}

void part2(char data_in, char port_out)
{
    switch(port_out)
    {
        case port_A:
            DDRA = 0xFF; // as output
            PORTA = data_in;
            break;
        case port_B:
            DDRB = 0xFF; // as output
            PORTB = data_in;
            break;
        case port_C:
            DDRC = 0xFF; // as output
            PORTC = data_in;
            break;
        case port_D:
            DDRD = 0xFF; // as output
            PORTD = data_in;
            break;
    }
    return;
}

void part3(int number, unsigned int interval)
{
    int i;
    for (i = 0; i < number; i++)
    {
        part2(0x00, port_B);
        delay_ms(interval); 
        part2(0xFF, port_B);
        delay_ms(interval);
    }
    return;    
}

void part4()
{
    char data;
    data = part1(port_A);
    part2(data, port_B);
    return;
}

void part5(int data, char data_port, char enable_data)
{
    int cnt = 10;
    
    int temp;
    char one, two, three, four;
    temp = data;
    
    four = temp % 10;
    temp /= 10;
    
    three = temp % 10;
    temp /= 10;
    
    two = temp % 10;
    temp /= 10;
    
    one = temp % 10;
    temp /= 10;
     
    while(cnt > 0)
    {    
        part2(~0x01, enable_data);
        part2(digits[four], data_port);
        delay_ms(50);
        
        part2(~0x02, enable_data);
        part2(digits[three], data_port);
        delay_ms(50);
        
        part2(~0x04, enable_data);
        part2(digits[two], data_port);
        delay_ms(50);
        
        part2(~0x08, enable_data);
        part2(digits[one], data_port);
        delay_ms(50);
        
        cnt--;
    }
    part2(~0x00, enable_data);
    return;
}