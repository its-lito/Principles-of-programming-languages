/* A Bison parser, made by GNU Bison 3.7.6.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_MYLANGS_TAB_H_INCLUDED
# define YY_YY_MYLANGS_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PROGRAM = 258,                 /* PROGRAM  */
    STARTMAIN = 259,               /* STARTMAIN  */
    ENDMAIN = 260,                 /* ENDMAIN  */
    FUNCTION = 261,                /* FUNCTION  */
    END_FUNCTION = 262,            /* END_FUNCTION  */
    VARS = 263,                    /* VARS  */
    PRINT = 264,                   /* PRINT  */
    WHILE = 265,                   /* WHILE  */
    ENDWHILE = 266,                /* ENDWHILE  */
    FOR = 267,                     /* FOR  */
    TO = 268,                      /* TO  */
    STEP = 269,                    /* STEP  */
    ENDFOR = 270,                  /* ENDFOR  */
    IF = 271,                      /* IF  */
    THEN = 272,                    /* THEN  */
    ENDIF = 273,                   /* ENDIF  */
    SWITCH = 274,                  /* SWITCH  */
    CASE = 275,                    /* CASE  */
    ENDSWITCH = 276,               /* ENDSWITCH  */
    BREAK = 277,                   /* BREAK  */
    CHAR = 278,                    /* CHAR  */
    INTEGER = 279,                 /* INTEGER  */
    NEWLINE = 280,                 /* NEWLINE  */
    SPACE = 281,                   /* SPACE  */
    DEFAULT = 282,                 /* DEFAULT  */
    ELSE = 283,                    /* ELSE  */
    RETURN = 284,                  /* RETURN  */
    ELSEIF = 285,                  /* ELSEIF  */
    AND = 286,                     /* AND  */
    OR = 287,                      /* OR  */
    LESS_THAN = 288,               /* LESS_THAN  */
    GREATER_THAN = 289,            /* GREATER_THAN  */
    EQUAL = 290,                   /* EQUAL  */
    NOT_EQUAL = 291,               /* NOT_EQUAL  */
    LETTER = 292,                  /* LETTER  */
    ONOMA = 293,                   /* ONOMA  */
    SYMBOLS = 294,                 /* SYMBOLS  */
    POSITIVE = 295                 /* POSITIVE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_MYLANGS_TAB_H_INCLUDED  */
