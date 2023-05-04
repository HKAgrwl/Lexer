%{
#include "y.tab.h"
%}

%%
"(" { return OPEN_PAREN; }
")" { return CLOSE_PAREN; }
.    { return yytext; } 
\n   { return *yytext; }
%%

int yywrap(void) {
    return 1;
}