#include "header.h"

#define DATA_REGISTER_EMPTY (1<<UDRE)
#define RX_COMPLETE (1<<RXC)
#define FRAMING_ERROR (1<<FE)
#define PARITY_ERROR (1<<UPE)
#define DATA_OVERRUN (1<<DOR)

// USART Receiver buffer
#define RX_BUFFER_SIZE 8
char rx_buffer[RX_BUFFER_SIZE];

#if RX_BUFFER_SIZE <= 256
unsigned char rx_wr_index=0,rx_rd_index=0;
#else
unsigned int rx_wr_index=0,rx_rd_index=0;
#endif

#if RX_BUFFER_SIZE < 256
unsigned char rx_counter=0;
#else
unsigned int rx_counter=0;
#endif

// This flag is set on USART Receiver buffer overflow
bit rx_buffer_overflow;

// USART Receiver interrupt service routine
interrupt [USART_RXC] void usart_rx_isr(void)
{
char status,data;
status=UCSRA;
data=UDR;
if ((status & (FRAMING_ERROR | PARITY_ERROR | DATA_OVERRUN))==0)
   {
   rx_buffer[rx_wr_index++]=data;
#if RX_BUFFER_SIZE == 256
   // special case for receiver buffer size=256
   if (++rx_counter == 0) rx_buffer_overflow=1;
#else
   if (rx_wr_index == RX_BUFFER_SIZE) rx_wr_index=0;
   if (++rx_counter == RX_BUFFER_SIZE)
      {
      rx_counter=0;
      rx_buffer_overflow=1;
      }
#endif
   }

   if(part == 3) question3();
   if(part == 4) question4();
}

#ifndef _DEBUG_TERMINAL_IO_
// Get a character from the USART Receiver buffer
#define _ALTERNATE_GETCHAR_
#pragma used+
char getchar(void)
{
char data;
while (rx_counter==0);
data=rx_buffer[rx_rd_index++];
#if RX_BUFFER_SIZE != 256
if (rx_rd_index == RX_BUFFER_SIZE) rx_rd_index=0;
#endif
#asm("cli")
--rx_counter;
#asm("sei")
return data;
}
#pragma used-
#endif

// USART Transmitter buffer
#define TX_BUFFER_SIZE 8
char tx_buffer[TX_BUFFER_SIZE];

#if TX_BUFFER_SIZE <= 256
unsigned char tx_wr_index=0,tx_rd_index=0;
#else
unsigned int tx_wr_index=0,tx_rd_index=0;
#endif

#if TX_BUFFER_SIZE < 256
unsigned char tx_counter=0;
#else
unsigned int tx_counter=0;
#endif

// USART Transmitter interrupt service routine
interrupt [USART_TXC] void usart_tx_isr(void)
{
    if (tx_counter)
    {
        --tx_counter;
        UDR=tx_buffer[tx_rd_index++];
        #if TX_BUFFER_SIZE != 256
        if (tx_rd_index == TX_BUFFER_SIZE) tx_rd_index = 0;
        #endif
    }
}

#ifndef _DEBUG_TERMINAL_IO_
// Write a character to the USART Transmitter buffer
#define _ALTERNATE_PUTCHAR_
#pragma used+
void putchar(char c)
{
    while (tx_counter == TX_BUFFER_SIZE);
    #asm("cli")
    if (tx_counter || ((UCSRA & DATA_REGISTER_EMPTY) == 0))
    {
        tx_buffer[tx_wr_index++] = c;
        #if TX_BUFFER_SIZE != 256
        if (tx_wr_index == TX_BUFFER_SIZE) tx_wr_index = 0;
        #endif
        ++tx_counter;
    }
    else
    UDR = c;
    #asm("sei")
}
#pragma used-
#endif

int baud_list[] = {110, 300, 600, 1200, 2400, 4800, 9600, 14400, 19200, 38400, 56000, 57600, 115200};
char lcd[17];
int buff_idx = 0;
void set_baudrate(int br)
{
   int i;
   int ubr;
   for(i = 0; i < sizeof(baud_list) / sizeof(int); i++)
   {
      if(br == baud_list[i]) break;
   }
   if(i == sizeof(baud_list) / sizeof(int))
   {
      //Wrong Input
      //Setting BR to 9600
      UBRRH=0x00;
      UBRRL=0x33;
      return;
   }
   ubr = (8000000 / (16 * (long)br)) - 1;
   UBRRH = ubr & 0xff00;
   UBRRL = ubr & 0x00ff;
}


void question3()
{
   char c;
   c = getchar();
   if(c >= '0' && c <= '9')
   {
      printf("\r\n%d\r\n", (c - '0') * 10);
   }
   else if(c == 'd' || c == 'D')
   {
      lcd_clear();
      lcd_puts("LCD Deleted!");
      printf("\r\n");
   }
   else if(c == 'h' || c == 'H')
   {
      lcd_clear();
      lcd_puts("Microprocessor\nlab");
   } 
   else if(c == 'e' || c == 'E')
   {
      lcd_clear();
      lcd_puts("END of this part");
      printf("Part 3 is ending!\r\n");
   }
   else
   {   
      lcd_clear();
      lcd_puts("input letter is \'");
      lcd_putchar(c);
      lcd_puts("\'");
      
      printf("Part 4 is running!\r\n");
      part = 4;
   }
}

int numbers[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
void question4()
{
   char c;
   int i, j;
   c = getchar();
   buff[buff_idx] = c;
   buff_idx++;
   if(c == ')')
   {
      buff[buff_idx] = '\0';
      if(strlen(buff) != 5)
      {
         lcd_clear();
         lcd_puts("Incorrect frame size!\nThe frame must be 5 integers");
         printf("Incorrect frame size!\r\nThe frame must be 5 integers\r\n");
      }
      else
      { 
         lcd_clear();
         lcd_puts("The frame is correct");
         printf("The frame is correct\r\n");
      }
      //TODO


   }
}