%{
#include <iostream>
#include <string>
using namespace std;
extern int yylex();
extern int yylineno;
int mode;
extern FILE* yyin;
void yyerror(const char*);
%}

%define parse.error verbose
%language "C++"

%union {
    int ival;
    string* var;
}

%token <ival> INT_LITERAL
%token <var> IDENTIFIER
%token BOOL INT IF ELSE WHILE TRUE FALSE OR AND ASSIGN EQ NEQ LTE GTE LT GT PLUS MINUS TIMES DIVIDE NOT LPAREN RPAREN LBRACE RBRACE SEMICOLON COMMA

%left OR
%left AND
%left EQ NEQ
%left LT GT LTE GTE
%left PLUS MINUS
%left TIMES DIVIDE
%nonassoc NOT
%left UNARY_MINUS
%left LPAREN RPAREN

%start program

%type <var> program statements statement declaration assignment conditional loop type list expression literal

%%

program : statements {
    if (mode) {
        cout << "Program: " << *$1 << endl;
    }
    else {
        cout << "[Program] " << *$1 << endl;
    }
}

statements: statement {
    if (mode) {
        cout << "Statements: " << *$1 << endl;
    }
    else {
        cout << "[Statements] " << *$1 << endl;
    }
}
| statements statement {
    if (mode) {
        cout << "Statements: " << *$1 << ", " << *$2 << endl;
    }
    else {
        cout << "[Statements] " << *$1 << ", " << *$2 << endl;
    }
}

statement: declaration {
    if (mode) {
        cout << "Statement: " << *$1 << endl;
    }
    else {
        cout << "[Statement] " << *$1 << endl;
    }
}
| assignment {
    if (mode) {
        cout << "Statement: " << *$1 << endl;
    }
    else {
        cout << "[Statement] " << *$1 << endl;
    }
}
| conditional {
    if (mode) {
        cout << "Statement: " << *$1 << endl;
    }
    else {
        cout << "[Statement] " << *$1 << endl;
    }
}
| loop {
    if (mode) {
        cout << "Statement: " << *$1 << endl;
    }
    else {
        cout << "[Statement] " << *$1 << endl;
    }
}

type : INT {
    if (mode) {
        cout << "Type: INT" << endl;
    }
    else {
        cout << "[Type] int" << endl;
    }
}
| BOOL {
    if (mode) {
        cout << "Type: BOOL" << endl;
    }
    else {
        cout << "[Type] bool" << endl;
    }
}

list: IDENTIFIER {
    if (mode) {
        cout << "List: IDENTIFIER" << endl;
    }
    else {
        cout << "[List] " << *$1 << endl;
    }
}
| IDENTIFIER COMMA list {
    if (mode) {
        cout << "List: IDENTIFIER, " << *$3 << endl;
    }
    else {
        cout << "[List] " << *$1 << ", " << *$3 << endl;
    }
}

declaration : type list SEMICOLON {
    if (mode) {
        cout << "Declaration: " << *$1 << *$2 << "SEMICOLON" << endl;
    }
    else {
        cout << "[Declaration] " << *$1 << *$2 << ";" << endl;
    }
}

assignment : IDENTIFIER ASSIGN expression SEMICOLON {
    if (mode) {
        cout << "Assignment: IDENTIFIER ASSIGN " << *$3 << "SEMICOLON" << endl;
    }
    else {
        cout << "[Assignment] " << *$1 << " = " << *$3 << ";" << endl;
    }
}
| type IDENTIFIER ASSIGN expression SEMICOLON {
    if (mode) {
        cout << "Assignment: " << *$1 << "IDENTIFIER ASSIGN " << *$4 << "SEMICOLON" << endl;
    }
    else {
        cout << "[Assignment] " << *$1 << *$2 << " = " << *$4 << ";" << endl;
    }
}

conditional : IF LPAREN expression RPAREN LBRACE statements RBRACE {
    if (mode) {
        cout << "Conditional: IF LPAREN " << *$3 << "RPAREN LBRACE " << *$6 << "RBRACE" << endl;
    }
    else {
        cout << "[Conditional] if (" << *$3 << ") { " << *$6 << " }" << endl;
    }
}
| IF LPAREN expression RPAREN LBRACE statements RBRACE ELSE LBRACE statements RBRACE {
    if (mode) {
        cout << "Conditional: IF LPAREN " << *$3 << "RPAREN LBRACE " << *$6 << "RBRACE ELSE LBRACE " << *$10 << "RBRACE" << endl;
    }
    else {
        cout << "[Conditional] if (" << *$3 << ") { " << *$6 << " } else { " << *$10 << " }" << endl;
    }
}

loop : WHILE LPAREN expression RPAREN LBRACE statements RBRACE {
    if (mode) {
        cout << "Loop: WHILE LPAREN " << *$3 << "RPAREN LBRACE " << *$6 << "RBRACE" << endl;
    }
    else {
        cout << "[Loop] while (" << *$3 << ") { " << *$6 << " }" << endl;
    }
}

expression : IDENTIFIER {
    if (mode) {
        cout << "Expression: IDENTIFIER" << endl;
    }
    else {
        cout << "[Expression] " << *$1 << endl;
    }
}
| literal {
    if (mode) {
        cout << "Expression: " << *$1 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << endl;
    }
}
| expression PLUS expression {
    if (mode) {
        cout << "Expression: " << *$1 << "PLUS " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " + " << *$3 << endl;
    }
}
| expression MINUS expression {
    if (mode) {
        cout << "Expression: " << *$1 << "MINUS " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " - " << *$3 << endl;
    }
}
| expression TIMES expression {
    if (mode) {
        cout << "Expression: " << *$1 << "TIMES " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " * " << *$3 << endl;
    }
}
| expression DIVIDE expression {
    if (mode) {
        cout << "Expression: " << *$1 << "DIVIDE " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " / " << *$3 << endl;
    }
}
| expression EQ expression {
    if (mode) {
        cout << "Expression: " << *$1 << "EQ " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " == " << *$3 << endl;
    }
}
| expression NEQ expression {
    if (mode) {
        cout << "Expression: " << *$1 << "NEQ " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " != " << *$3 << endl;
    }
}
| expression LT expression {
    if (mode) {
        cout << "Expression: " << *$1 << "LT " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " < " << *$3 << endl;
    }
}
| expression GT expression {
    if (mode) {
        cout << "Expression: " << *$1 << "GT " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " > " << *$3 << endl;
    }
}
| expression LTE expression {
    if (mode) {
        cout << "Expression: " << *$1 << "LTE " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " <= " << *$3 << endl;
    }
}
| expression GTE expression {
    if (mode) {
        cout << "Expression: " << *$1 << "GTE " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " >= " << *$3 << endl;
    }
}
| expression OR expression {
    if (mode) {
        cout << "Expression: " << *$1 << "OR " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " || " << *$3 << endl;
    }
}
| expression AND expression {
    if (mode) {
        cout << "Expression: " << *$1 << "AND " << *$3 << endl;
    }
    else {
        cout << "[Expression] " << *$1 << " && " << *$3 << endl;
    }
}
| NOT expression %prec UNARY_MINUS {
    if (mode) {
        cout << "Expression: NOT " << *$2 << endl;
    }
    else {
        cout << "[Expression] ! " << *$2 << endl;
    }
}
| LPAREN expression RPAREN {
    if (mode) {
        cout << "Expression: LPAREN " << *$2 << "RPAREN" << endl;
    }
    else {
        cout << "[Expression] (" << *$2 << ")" << endl;
    }
}
;

literal : INT_LITERAL {
    if (mode) {
        cout << "Literal: INT_LITERAL" << endl;
    }
    else {
        cout << "[Literal] " << *$1 << endl;
    }
}
| TRUE {
    if (mode) {
        cout << "Literal: TRUE" << endl;
    }
    else {
        cout << "[Literal] true" << endl;
    }
}
| FALSE {
    if (mode) {
        cout << "Literal: FALSE" << endl;
    }
    else {
        cout << "[Literal] false" << endl;
    }
}
;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s at line %d\n", s, yylineno);
}

int main(int argc, char* argv[]) {
    if (argc > 1 && strcmp(argv[1], "-t") == 0) {
        mode = 1;
    }
    else {
        mode = 0;
    }

    yyin = stdin;
    yyparse();

    return 0;
}
