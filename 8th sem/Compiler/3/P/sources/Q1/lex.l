%{
#include "parser.tab.h"
#include <stdio.h>
%}

%%
print {return PRINT;}
sin {return SINE;}
cos {return COSINE;}
tan {return TANGENT;}
cot {return COTANGENT;}
log {return LOGARITHM;}
exp {return EXPONENT;}

[0-9]+(\.[0-9])*  			{ yylval = atoi(yytext); return NUMBER; }
[-+=()*/^\n]  				{ return yytext[0]; }
[a-zA-Z_][a-zA-Z_0-9]* 		{ yylval = getIndex(yytext); return IDENTIFIER;}
.           				{}

%%
typedef struct Unit  {
char text [20];
double value;
} Unit;

int latest = 0;
Unit handler [100];

int idLookup(char x [])
{
int index = -1;
int i = 0;

for (; i < latest; i++)
{
if (strcmp(handler[i].text, x) == 0)
{
index = i;
break;
}
}

return index;
}

void addId(char x [])
{

strcpy(handler[latest].text,x);  

latest ++;

}
int getIndex(char x [])
{
int index = idLookup(x);
if (index != -1)
{
return index;
}
else 
{
	addId(x);
	return latest - 1;
}
}

int yywrap() {
    return 1;
}

