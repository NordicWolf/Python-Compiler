%{
	// Nothing here
%}

%option noyywrap
%option yylineno
%option nounput
%option noinput

newline             \n

digit               [0-9]
uppercase           [A-Z]
lowercase           [a-z]
letter              ({uppercase}|{lowercase})

nonzerodigit        [1-9]
octdigit            [0-7]
hexdigit            [0-9]|[a-f]|[a-f]

decimalinteger      {nonzerodigit}{digit}*|"0"
octinteger          "0"{octdigit}+
hexinteger          "0"("x"|"X")hexdigit+
integer             {decimalinteger}|{octinteger}|{hexinteger}

whitespace          [ \t]

%%
"#".+               { /* Comments are ignored */ }
{whitespace}+	    { /* Whitespaces are ignored */}
{decimalinteger} {
    /* Decimalinteger */
    // return decimalinteger;
};

{octinteger} {
    /* Octinteger */
    // return octinteger;
};

{hexinteger} {
    /* Hexinteger */
    // return hexinteger;
};

{integer}("l"|"L") {
    /* Longinteger */
    // return longinteger;
};

%%

int main(int argc, char **argv)
{
    ++argv, --argc;     // Se salta el nombre del programa
    if (argc > 0)
        yyin = fopen(argv[0], "r");
    else
        yyin = stdin;

    yylex();

    return 0;
}
