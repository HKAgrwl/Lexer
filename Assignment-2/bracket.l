%{
    #include "y.tab.h"
    #include <stdlib.h>
    void yyerror(char *);
    extern char op, cl;
%}

%%

[0-9]+      {
                yylval = atoi(yytext);
                return INTEGER;
            }

[(]	    {   op = '(';
		return OPENBRACKET;
		}
		
[)]	    {	cl = ')';
		return CLOSEBRACKET;
		}

[-+()=/*\n]     { return *yytext; }

[ \t]   ;       /* skip whitespace */

.               yyerror("Unknown character");

%%

int yywrap(void) {
    return 1;
}
