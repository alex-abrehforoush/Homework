%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

extern FILE * yyin;
%}

%token NUMBER
%token IDENTIFIER
%token PRINT
%token SINE
%token COSINE
%token TANGENT
%token COTANGENT
%token LOGARITHM
%token EXPONENT

%%
input:
        |'\n' {}
        |input  IDENTIFIER '=' expr '\n'  {assignVal($2,$4);}
        |input  PRINT '(' expr ')' '\n'{printf("%d\n",$4);}
    ;

expr:   NUMBER          { $$ = $1; }
		| IDENTIFIER {$$ = readVal($1);}
        | expr '+' expr  { $$ = $1 + $3; }
        | expr '-' expr  { $$ = $1 - $3; }
        | expr '*' expr  { $$ = $1 * $3; }
        | expr '/' expr  { $$ = $1 / $3; }
        | expr '^' expr  { $$ = pow($1, $3); }
        | SINE '(' expr ')'  { $$ = sin($3); }
        | COSINE '(' expr ')'  { $$ = cos($3); }
        | TANGENT '(' expr ')'  { $$ = sin($3) / cos($3); }
        | COTANGENT '(' expr ')'  { $$ = cos($3) / sin($3); }
        | LOGARITHM '(' expr ')'  { $$ = log($3); }
        | EXPONENT '(' expr ')'  { $$ = exp($3); }
    ;

%%

int sval [100] = {0};

void assignVal(int id, int val)  
{
sval[id] = val;
}

int readVal(int id)
{
return sval[id]; 
}

int main(int argc, char * argv []) {
    if (argc < 2){
        puts("input.txt");
        puts("reverting...");
        return 0;
    }
    else{
        FILE * file = fopen(argv[1], "r");
        if(!file){
            printf("can not open '%s'", argv[1]);
            return 1;
        }
        yyin = file;
    }
    while(yyparse());
    return 0;
}

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

