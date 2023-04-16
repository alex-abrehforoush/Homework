%{
#include<stdio.h>
#include<string.h>
int purify(char* str)
{
	int count = 0;
	for (int i = 0; str[i]; i++)
		if (str[i] != ' ')
			str[count++] = str[i];
	str[count] = '\0';
	return count;
}

%}

%%
int[" "]main\(\) {}
\/\/.* {}
int[a-zA-Z0-9=,*\[ \]]+; {
	int length = purify(yytext);
	int id_begin = 0;
	int id_end = 0;
	if (yytext[3] == '*')
	{
		id_begin = 4;
	}
	else
	{
		id_begin = 3;
	}
	id_end = id_begin;
	for (int i = id_begin; i < length; i++)
	{
		if (yytext[i] != '=' && yytext[i] != ';' && yytext[i] != '[' && yytext[i] != ',')//id characters
		{
			id_end++;
		}
		else if (yytext[i] == ',')
		{
			for (int j = id_begin; j < id_end; j++)
			{
				printf("%c", yytext[j]);
			}
			if (yytext[3] == '*')
			{
				printf(" int *\n");
			}
			else
			{
				printf(" int\n");
			}
			id_begin = i + 1;
			id_end = id_begin;
			printf("\n");
			continue;
		}
		else//end of id
		{
			for (int j = id_begin; j < id_end; j++)
			{
				printf("%c", yytext[j]);
			}
			if (yytext[3] == '*')
			{
				printf(" int *\n");
			}
			else
			{
				printf(" int\n");
			}
			break;
		}
	}
}
char[a-zA-Z0-9=,*\[ \]]+; {
	int length = purify(yytext);
	int id_begin = 0;
	int id_end = 0;
	if (yytext[4] == '*')
	{
		id_begin = 5;
	}
	else
	{
		id_begin = 4;
	}
	id_end = id_begin;
	for (int i = id_begin; i < length; i++)
	{
		if (yytext[i] != '=' && yytext[i] != ';' && yytext[i] != '[' && yytext[i] != ',')//id characters
		{
			id_end++;
		}
		else if (yytext[i] == ',')
		{
			for (int j = id_begin; j < id_end; j++)
			{
				printf("%c", yytext[j]);
			}
			if (yytext[4] == '*')
			{
				printf(" char *\n");
			}
			else
			{
				printf(" char\n");
			}
			id_begin = i + 1;
			id_end = id_begin;
			printf("\n");
			continue;
		}
		else//end of id
		{
			for (int j = id_begin; j < id_end; j++)
			{
				printf("%c", yytext[j]);
			}
			if (yytext[4] == '*')
			{
				printf(" char *\n");
			}
			else
			{
				printf(" char\n");
			}
			break;
		}
	}
}
double[a-zA-Z0-9=,*\[ \]]+; {
	int length = purify(yytext);
	int id_begin = 0;
	int id_end = 0;
	if (yytext[6] == '*')
	{
		id_begin = 7;
	}
	else
	{
		id_begin = 6;
	}
	id_end = id_begin;
	for (int i = id_begin; i < length; i++)
	{
		if (yytext[i] != '=' && yytext[i] != ';' && yytext[i] != '[' && yytext[i] != ',')//id characters
		{
			id_end++;
		}
		else if (yytext[i] == ',')
		{
			for (int j = id_begin; j < id_end; j++)
			{
				printf("%c", yytext[j]);
			}
			if (yytext[6] == '*')
			{
				printf(" double *\n");
			}
			else
			{
				printf(" double\n");
			}
			id_begin = i + 1;
			id_end = id_begin;
			printf("\n");
			continue;
		}
		else//end of id
		{
			for (int j = id_begin; j < id_end; j++)
			{
				printf("%c", yytext[j]);
			}
			if (yytext[6] == '*')
			{
				printf(" double *\n");
			}
			else
			{
				printf(" double\n");
			}
			break;
		}
	}
}


. {}

%%

int yywrap(){}

int main(){
    FILE * f = fopen("main.cpp", "r");
    yyin = f;
    yylex();
}
