%{
    #include <stdio.h>
    void yyerror(char *);
    int yylex(void);
    char s[987]  = "";
    int i=0;
%}

%token INTEGER
%left '+' '-'
%left '*' '/'

%%

program:
        program statement '\n'
        | /* NULL */
        ;

statement:
        expression                  {   
                                            for(int j=0; j<i; j++)
                                            {
                                                printf("%c",s[j]);
                                            }
                                            printf("\n"); 
                                            for(int j=i-1; j>=0; j--)
                                            {
                                                printf("%c",s[j]);
                                            }
                                            printf("\n"); 

                                            i=0;
                                        }
        ;

expression:
        INTEGER
        | expression '+' expression     
        | expression '-' expression     
        | expression '*' expression     
        | expression '/' expression    
        | open expression close           
        ;
open:
        '('         {   
                        s[i]='(';
                        i++;
                    };
close:
        ')'        {
                        {   
                        s[i]=')';
                        i++;
                        };
                    };

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
}