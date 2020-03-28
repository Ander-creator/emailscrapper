
%{
	/*
	Densevolvedor: Anderson Santos Silva
	RA: 166191
	Objetivo: Programa que recebe uma mensagem e identifica emails válidos no interior da mensagem.	
	*/
		#include <stdio.h>
		#include <string.h>	
		int i, j = 0;	
%}

ALFANUM	[a-zA-Z0-9]
TRACO		[-]
PONTO		[.]
UNDER		[_]
ARROBA	[@]

CHAR		{TRACO}|{PONTO}|{UNDER}
NOME		{ALFANUM}+({CHAR}*{ALFANUM}+)*

EMAIL		{NOME}{ARROBA}{NOME}
VALIDO	{EMAIL}(\.\ )?

%%
{EMAIL}						{printf("%s\n", yytext);}
{VALIDO}					{	i = strlen(yytext);
										while(i-2>j){
											printf("%c", yytext[j]);
											j++;
										}
										j = 0;
										printf("\n");
									}



[[:space:]]+ ;
[[:^space:]]+ ;
[.\n]* ;


%%

	int main() {
		yylex();
		return 0;
	}
