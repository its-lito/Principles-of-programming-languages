%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;
extern int yylineno;
extern void yyerror();

void yyerrors(char *s);

%}

%token PROGRAM
%token STARTMAIN
%token ENDMAIN
%token FUNCTION
%token END_FUNCTION
%token VARS
%token PRINT
%token WHILE
%token ENDWHILE
%token FOR
%token TO
%token STEP
%token ENDFOR
%token IF
%token THEN
%token ENDIF
%token SWITCH
%token CASE
%token ENDSWITCH
%token BREAK
%token CHAR
%token INTEGER
%token NEWLINE
%token SPACE
%token DEFAULT
%token ELSE
%token RETURN
%token ELSEIF
%token AND
%token OR
%token LESS_THAN
%token GREATER_THAN
%token EQUAL
%token NOT_EQUAL

%token LETTER
%token ONOMA
%token SYMBOLS
%token POSITIVE

%left '+' '-'
%left '*' '/'
%left '^'

%nonassoc LESS_THAN GREATER_THAN EQUAL NOT_EQUAL

%define parse.error verbose

%%

start : program;

numbers : POSITIVE
	| '-' POSITIVE
	| '0'
;

program : PROGRAM ONOMA NEWLINE code
	| PROGRAM ONOMA NEWLINE functions code
;

code : STARTMAIN variables commands ENDMAIN
	| STARTMAIN commands ENDMAIN
;

functions : FUNCTION ONOMA '(' parameters ')' NEWLINE function END_FUNCTION ;

variables : VARS variable ;

commands : anathesi
	| while
	| for
	| if_statement
	| switch
	| print
	| end_loop
	| comments
;

parameters : type ONOMA
	| type ONOMA ',' parameters
	| numbers
	| numbers ',' parameters
;

function : variables arrays commands RETURN value
	| arrays commands RETURN value
	| variables commands RETURN value
	| commands RETURN value 
	| RETURN value
	| arrays RETURN value
;

variable : type ONOMA ';'
	| type ONOMA ',' variable
;

type : INTEGER
	| CHAR
;

arrays : VARS pinakas ;

pinakas : type ONOMA '[' POSITIVE ']' ';'
	| type ONOMA '[' POSITIVE ']' ',' pinakas
;

value : ONOMA
	| numbers
	| LETTER
;

anathesi : ONOMA '=' ekfrasi ';' ;

ekfrasi : LETTER
	| numbers
	| call_function
	| comb
;

call_function : ONOMA '(' params ')' ';' ;

params : ONOMA
	| ONOMA ',' parameters
	| numbers
	| numbers ',' parameters
;

comb : ONOMA
	| comb express comb
	| '(' comb ')'
	| literal express literal
	| '(' comb ')' express comb
	| '(' comb ')' express literal
;

express : '+'
	| '*'
	| '-'
	| '^'
	| '/'
;

literal : numbers
	| LETTER
;

while : WHILE condition commands ENDWHILE ;

condition : value operators value
	| value logic_operators value
	| numbers express numbers operators numbers
;

operators : '<' 
	| '>' 
	| EQUAL 
	| NOT_EQUAL
;

logic_operators : AND
	| OR
;

for : FOR ONOMA ':' '=' numbers TO numbers STEP numbers commands ENDFOR ;

if_statement : IF condition THEN commands ENDIF
	| IF condition THEN commands ELSE commands ENDIF
	| IF condition THEN commands elseifstates ELSE commands ENDIF
;

elseifstates : ELSEIF commands
	| ELSEIF commands elseifstates
;

switch : SWITCH '(' ONOMA ')' cases ENDSWITCH
	| SWITCH '(' ONOMA ')' cases DEFAULT commands ENDSWITCH
;

cases : CASE '(' value ')' ':' commands
	| CASE '(' value ')' ':' commands cases
;

print : PRINT '(' '"' content '"' ')' ';'
	| PRINT '(' '"' content '"' ')' ',' printname ';'
;

printname : '[' ONOMA ']'
	| '[' ONOMA ']' ',' printname
;

content : LETTER content
	| numbers content
	| SYMBOLS content
	| NEWLINE
;

end_loop : BREAK ';' ;

comments : '%' content NEWLINE ;

%%  

void yyerrors(char *s) 
{ 
     fprintf(stderr, "%s in line %d\n", s, yylineno); 
}