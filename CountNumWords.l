/* lex program to count number of words */
/* Compilation & Run as follows */
/* flex CountNumWords.l */
/* gcc -o CountNumWords.out lex.yy.c -lfl */
/* ./CountNumWords.out */

%{
#include<stdio.h>
#include<string.h>
int i = 0;
%}
  
/* Rules Section*/
%%
([a-zA-Z0-9])*    {i++;} /* Rule for counting 
                          number of words*/
  
"\n" {printf("%d\n", i); i = 0;}
%%
  
int yywrap(void){}
  
int main()
{   
    // The function that starts the analysis
    yylex();
  
    return 0;
}
