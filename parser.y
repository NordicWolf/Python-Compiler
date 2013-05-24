%{
    int yyerror (string);
    int yylex(void);

%}

%start PROGRAM

/* Integer literals */
%token  decimalinteger
        octinteger
        hexinteger

%token  newline

%%

PROGRAM:
                | PROGRAM newline
                | PROGRAM INTEGER   { cout << $2 }
;

INTEGER:          decimalinteger    { $$ = $1; }
                | octinteger        { $$ = $1; }
                | hexinteger        { $$ = $1; }
                | longinteger       { $$ = $1; }
;

%%

int yyerror(string str)
{
    extern int yylineno;
    extern char *yytext;

    cerr    << "Parse error.\n";
    exit(1);
}
