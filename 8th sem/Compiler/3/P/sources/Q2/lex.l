%option noyywrap

%{
    #include "parser.tab.h"
    #include <stdio.h>
    #include <string>

    using namespace std;
%}

%option yylineno

%%

"int"                      { yylval.var = new string("INT"); return INT; }
"bool"                     { yylval.var = new string("BOOL"); return BOOL; }
"if"                       { yylval.var = new string("IF"); return IF; }
"else"                     { yylval.var = new string("ELSE"); return ELSE; }
"while"                    { yylval.var = new string("WHILE"); return WHILE; }
"true"                     { yylval.var = new string("TRUE"); return TRUE; }
"false"                    { yylval.var = new string("FALSE"); return FALSE; }
"||"                       { yylval.var = new string("OR"); return OR; }
"&&"                       { yylval.var = new string("AND"); return AND; }
"="                        { yylval.var = new string("ASSIGN"); return ASSIGN; }
"=="                       { yylval.var = new string("EQ"); return EQ; }
"!="                       { yylval.var = new string("NEQ"); return NEQ; }
"<="                       { yylval.var = new string("LTE"); return LTE; }
">="                       { yylval.var = new string("GTE"); return GTE; }
"<"                        { yylval.var = new string("LT"); return LT; }
">"                        { yylval.var = new string("GT"); return GT; }
"+"                        { yylval.var = new string("PLUS"); return PLUS; }
"-"                        { yylval.var = new string("MINUS"); return MINUS; }
"*"                        { yylval.var = new string("TIMES"); return TIMES; }
"/"                        { yylval.var = new string("DIVIDE"); return DIVIDE; }
"!"                        { yylval.var = new string("NOT"); return NOT; }
"("                        { yylval.var = new string("LPAREN"); return LPAREN; }
")"                        { yylval.var = new string("RPAREN"); return RPAREN; }
"{"                        { yylval.var = new string("LBRACE"); return LBRACE; }
"}"                        { yylval.var = new string("RBRACE"); return RBRACE; }
";"                        { yylval.var = new string("SEMICOLON"); return SEMICOLON; }
","                        { yylval.var = new string("COMMA"); return COMMA; }
[0-9]+                     { yylval.ival = atoi (yytext); return INTEGER_LITERAL; }
[a-zA-Z]([a-zA-Z]|[0-9])*  { yylval.var = new string(yytext); return IDENTIFIER; }
(.|\n)                     {}
" "                        { yylval.var = new string("BLANK"); return BLANK; }

%%