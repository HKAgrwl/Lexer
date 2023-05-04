/* lex program to count number of words */
/* Compilation & Run as follows */
/* flex CountNumWords.l */
/* gcc -o CountNumWords.out lex.yy.c -lfl */
/* ./CountNumWords.out */

%{
#include<stdio.h>
#include<string.h>
int i = 0, j = 0;
%}
 
/* Rules Section*/
%%
(0|1)*11 {j++;}
(0|1)*1 {i++;}
(0|1)*0+ {;}
([a-z])* {;}

"\n" {printf("%d %d\n", i, j); i = 0; j = 0;}

%%
 
int yywrap(void){}
 
int main()
{  
    // The function that starts the analysis
    yylex();
 
    return 0;
    // lex CountingWords.l
    /*
    ([a-zA-Z0-9])*[Ss] {i++;} /* Rule for counting
                          number of words*/
}
