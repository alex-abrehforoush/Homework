%{
#include <stdio.h>
//Definitions

%}

%%

\.-      {printf("a");}
-\.\.\.  {printf("b");}
-\.-\.   {printf("c");}
-\.\.    {printf("d");}
\.       {printf("e");}
\.\.-\.  {printf("f");}
--\.     {printf("g");}
\.\.\.\. {printf("h");}
\.\.     {printf("i");}
\.---    {printf("j");}
-\.-     {printf("k");}
\.-\.\.  {printf("l");}
--       {printf("m");}
-\.      {printf("n");}
---      {printf("o");}
\.--\.   {printf("p");}
--\.-    {printf("q");}
\.-\.    {printf("r");}
\.\.\.   {printf("s");}
-        {printf("t");}
\.\.-    {printf("u");}
\.\.\.-  {printf("v");}
\.--     {printf("w");}
-\.\.-   {printf("x");}
-\.--    {printf("y");}
--\.\.   {printf("z");}
\/       {printf(" ");}
" "      {}


(\.|-)*  {}


%%

int yywrap(){}

int main()
{
    yylex();
}
