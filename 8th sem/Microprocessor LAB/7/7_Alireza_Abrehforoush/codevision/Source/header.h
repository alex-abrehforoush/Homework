#ifndef _header_INCLUDED_
#define _header_INCLUDED_

#include <mega16.h>
#include <alcd.h>
#include <stdio.h>
#include <delay.h>
#include <string.h>
#include "functions.h"











extern char empty_line[];
extern char buff[];
extern int part;

void initialize();
void USART_Enable_Intrupt();

#endif

