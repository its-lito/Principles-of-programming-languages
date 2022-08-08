%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>


#include "mylangs.tab.h"

extern int yylval;
extern void yyerrors(char *s);

void yyerror();
int error_count=0;

%}

%option noyywrap

LETTER	[a-zA-Z]
ONOMA	[_a-zA-Z][_a-zA-Z0-9]*
POSITIVE	[1-9][0-9]*
SYMBOLS		[\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\>\=\?\@\[\]\{\}\\\\\^\_\`\~\?][\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\>\=\?\@\[\]\{\}\\\\\^\_\`\~\?]*
WHITESPACE          [ \t]

%%

"PROGRAM"	{token_print(PROGRAM); return PROGRAM; }
"STARTMAIN"	{token_print(STARTMAIN); return STARTMAIN; }
"ENDMAIN"	{token_print(ENDMAIN); return ENDMAIN; }
"FUNCTION"	{token_print(FUNCTION); return FUNCTION; }
"END_FUNCTION"	{token_print(END_FUNCTION); return END_FUNCTION; }
"VARS"	{token_print(VARS); return VARS; }
"PRINT"	{token_print(PRINT); return PRINT; }
"WHILE"	{token_print(WHILE); return WHILE; }
"ENDWHILE"	{token_print(ENDWHILE); return ENDWHILE; }
"FOR"	{token_print(FOR); return FOR; }
"TO"	{token_print(TO); return TO; }
"STEP"	{token_print(STEP); return STEP; }
"ENDFOR"	{token_print(ENDFOR); return ENDFOR; }
"IF"	{token_print(IF); return IF; }
"THEN"	{token_print(THEN); return THEN; }
"ENDIF"	{token_print(ENDIF); return ENDIF; }
"SWITCH"	{token_print(SWITCH); return SWITCH; }
"CASE"	{token_print(CASE); return CASE; }
"ENDSWITCH"	{token_print(ENDSWITCH); return ENDSWITCH; }
"BREAK"	{token_print(BREAK); return BREAK; }
"CHAR"	{token_print(CHAR); return CHAR; }
"INTEGER"	{token_print(INTEGER); return INTEGER; }

"DEFAULT"	{token_print(DEFAULT); return DEFAULT; }
"ELSE"	{token_print(ELSE); return ELSE; }
"RETURN"	{token_print(RETURN); return RETURN; }
"ELSEIF"	{token_print(ELSEIF); return ELSEIF; }

"AND"	{token_print(AND); return AND; }
"OR"	{token_print(OR); return OR; }
"LESS_THAN"	{token_print(LESS_THAN); return LESS_THAN; }
"GREATER_THAN"	{token_print(GREATER_THAN); return GREATER_THAN; }
"EQUAL"	{token_print(EQUAL); return EQUAL; }
"NOT_EQUAL"	{token_print(NOT_EQUAL); return NOT_EQUAL; }

[ ]	{ }
[\t]	{	}
[\n]	{yylineno++;}

{LETTER}	{token_print(LETTER); return LETTER; }
{ONOMA}	{token_print(ONOMA); return ONOMA; }
{SYMBOLS}	{token_print(SYMBOLS); return SYMBOLS; }
{POSITIVE}	{token_print(POSITIVE); return POSITIVE; }




%%
void yyerror()
{
    
	yyparse();


	if (error_count>0)
	{
	printf("Syntax analysis not complete due to errors");
	fprintf(stderr,"%s\n");
	}
	else
	{
	printf("Syntax analysis completed successfully");
	}


}

int main (int argc, char *argv[]){
 if(argc > 1){
        yyin = fopen(argv[1], "r");
        if (yyin == NULL){
            perror ("Error opening file"); return -1;
        }
	
    }
    
    yyparse();
      
    fclose(yyin);
    
    return 0;
}

int token_print(int token_id) {
    printf("Found token %s (%d) at line %d\n", yytext, token_id, yylineno);
}
