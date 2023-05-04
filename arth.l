%{
   #include "y.tab.h"
   #include <stdlib.h>
   extern yyval;
   void yyerror(char *);
%}

%%
[0-9]+ { yylval = atoi(yytext); return NUMBER; }

[+\-*/()] { return *yytext; }

[ \t\n] { /* ignore whitespace */ }

. { printf("Unknown character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}