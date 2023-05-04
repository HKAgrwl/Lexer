%{
    #include <stdio.h>
    void yyerror(char *);
    int yylex(void);

    char op, cl;
%}

%token INTEGER OPENBRACKET CLOSEBRACKET
%left '+' '-'
%left '*' '/'

%%

program:
        program statement '\n'
        | /* NULL */
        ;

statement:
        expression  '\n'                   { printf("%d\n", $$); }
        ;

expression:
        INTEGER
        | expression '+' expression     {;}
        | expression '*' expression     {;}
        | expression '/' expression     {;}
        | expression '-' expression     {;}
        | OPENBRACKET expression CLOSEBRACKET        {printf("%c%c", op, cl);}
        ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
}
