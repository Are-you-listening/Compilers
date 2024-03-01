grammar expression;
start_ : (function | line | comment)* EOF;

comment : '/*'(.)*?'*/' | SINGLECOMMENT;

function : type IDENTIFIER '(' ')' '{' lines '}';
lines : (line)*  ;
line: (declaration | expr| assignment| typedef | printf )(';')+;
typedef: 'typedef' type IDENTIFIER;
printf: 'printf' '(' '%s' ',' (IDENTIFIER | literal) ')'
        | 'printf' '(' '%d' ',' (IDENTIFIER | literal) ')'
        | 'printf' '(' '%x' ',' (IDENTIFIER | literal) ')'
        | 'printf' '(' '%f' ',' (IDENTIFIER | literal) ')'
        | 'printf' '(' '%c' ',' (IDENTIFIER | literal) ')' ;

type: ('const')? ('int' | 'char' | 'float') ('*')*;
declaration: type IDENTIFIER ('=' expr)?;
assignment: IDENTIFIER ('=' expr);
conversion: '(' type ')' literal;
expr : literal
     | '(' type ')' expr //explicit conversion
     | '(' expr ')'
     | ('++' | '--' | '&' | '*') IDENTIFIER
     | IDENTIFIER ('++' | '--')
     | ('+'|'-' | '~' | '!' ) expr
     | expr ('*' | '/' | '%') expr
     | expr ('+'|'-') expr
     | expr ('>>' | '<<') expr
     | expr ('<' | '>'| '>=' | '<=') expr
     | expr ('==' | '!=') expr
     | expr '&' expr
     | expr '^' expr
     | expr '|' expr
     | expr '&&' expr
     | expr '||' expr;
literal : (INT | FLOAT | CHAR | IDENTIFIER | conversion) ;


SINGLECOMMENT: '//' (~[\n])*;
IDENTIFIER: ([a-z]|[A-Z]|'_')([a-z]|[A-Z]|'_'|[0-9])*;
INT : ([1-9][0-9]*) | [0-9] ;
FLOAT: ([0-9]*'.')?([0-9]+) | ([0-9]+)('.'[0-9]*)?;
CHAR: '\''.'\'';
WS : [ \t\n\r]+ -> skip ;