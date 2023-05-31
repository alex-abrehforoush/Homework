#ifndef _headers_INCLUDED_
#define _headers_INCLUDED_

#include <mega16.h>
#include <stdio.h>
#include <delay.h>
#include <math.h>

// Alphanumeric LCD functions
#include <alcd.h>

#include "initboard.h"
#include "funcs.h"


#define FIRST_ADC_INPUT 0
#define LAST_ADC_INPUT 7

#define ADC_VREF_TYPE ((0<<REFS1) | (0<<REFS0) | (0<<ADLAR))

#define MIN_ADC_IN 0
#define MAX_ADC_IN 1023
#define ADC_FIVE_PERCENT 51

extern unsigned int adc_data[LAST_ADC_INPUT-FIRST_ADC_INPUT+1];
extern unsigned int previous_data[LAST_ADC_INPUT-FIRST_ADC_INPUT+1];
extern char firstUpdateDone[LAST_ADC_INPUT-FIRST_ADC_INPUT+1];
extern char buff1[16], buff2[16];



#endif
