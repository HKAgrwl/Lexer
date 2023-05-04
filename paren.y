%{
#include <stdio.h>
void yyerror(char *);
%}

%token OPEN_PAREN CLOSE_PAREN

%%

line: '\n'
    | exp '\n'  { printf("Valid\n"); }
    ;

exp: OPEN_PAREN exp CLOSE_PAREN
   | /* empty */
   ;
%%

void yyerror(char *s) {
    printf("Invalid\n");
}

int main(void) {
    yyparse();
    return 0;
}