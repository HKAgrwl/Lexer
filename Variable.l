%{
/*
* We expand upon the first example ir/ adding recognition of some other
* parts of speech.
*/
%}

%%

[\n\t]+		/* ignore whitespaces */;

[a-zA-Z][a-zA-Z0-9]* {
	printf("%s: a variable\n", yytext);
	}

[1-9][0-9]* {
	printf("%s: a numeral\n", yytext);
	}

.	{ printf("Neither a numeral nor a variable\n");} 


%%

int main()
{
	yylex();

	return 0;
}
