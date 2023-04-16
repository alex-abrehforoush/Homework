%{
#include <stdio.h>
//Definitions

%}

%%

[0-9]+ {printf("Token_Integer ");}
\"[^\"]*\" {printf("Token_String ");}
[0-9]+\.[0-9]+ {printf("Token_Float ");}
[b|g|m|p|v]et {printf("Token_xet ");}
[a-z]+([0-9]|[a-z])* {printf("ID_Token ");}
\/\/.+\n {printf("Token_Comment ");}
" " {printf("Token_Space ");}
\n {printf("Token_Newline ");}


%%

int yywrap(){}

int main()
{
    yylex();
}
