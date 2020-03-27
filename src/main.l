
%{
	/*
		Seção de definição de variáveis
		Trabalho de identificação dos emails.
		
		CHAR		[(.)(_)(-)]
	*/
		#include <stdio.h>		
%}

ALFANUM	[a-zA-Z0-9]
TRACO		[-]
PONTO		[.]
UNDER		[_]
ARROBA	[@]

CHAR		{TRACO}|{PONTO}|{UNDER}
NOME		{ALFANUM}+({CHAR}*{ALFANUM}+)*

EMAIL		{NOME}{ARROBA}{NOME}

%%

{EMAIL}	{printf("%s \n", yytext);}


[[:space:]]+ ;
[[:^space:]]+ ;
[.\n]* ;


%%

	int main() {
		yylex();
		return 0;
	}
