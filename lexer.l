%{
	// Nothing here
%}

%option noyywrap
%option yylineno

NEWLINE     \n

%%

"#".+       { /* Woa! all is commented */ }
{NEWLINE}   { /* Nothing to do yet */ }
.           { printf("Lexical error: Unexpected symbol '%s'.", yytext); }

%%

main(int argc, char **argv)
{
    ++argv, --argc;     // Se salta el nombre del programa
    if (argc > 0)
        yyin = fopen(argv[0], "r");
    else
        yyin = stdin;

    yylex();
}

