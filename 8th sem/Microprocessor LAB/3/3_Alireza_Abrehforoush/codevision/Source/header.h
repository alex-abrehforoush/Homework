#ifndef _header_INCLUDED_
#define _header_INCLUDED_

extern unsigned char data_key[] = 
{
    '0','1','2','3',
    '4','5','6','7',
    '8','9','A','B',
    'C','D','E','F'
};

char dataKeys[4][4] = {
                    {'0','1','2','3'},
                    {'4','5','6','7'},
                    {'8','9','A','B'},
                    {'C','D','E','F'}
                    };
int readRow[4] = {0x10, 0x20, 0x40, 0x80};

int lcdPos = 0;

char keypad2();

extern char row[4] = {0x10, 0x20, 0x40, 0x80};

#endif