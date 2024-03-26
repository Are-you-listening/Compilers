grammar expression;
start_ : (include)? code EOF;
code: (function | line  | comment)*;
include: '#include <stdio.h>';
comment : MULTILINE | SINGLECOMMENT;
function : type IDENTIFIER '(' ')' '{' code (return)? '}';
line: (declaration | expr| assignment| typedef | printf )(';')+;
typedef: 'typedef' type IDENTIFIER;
printf: 'printf' '(' '"' (.)*? ('%s' | '%d' | '%x' | '%f' | '%c') (.)*? '"' ',' (expr) ')';
type: ('const')? ('int' | 'char' | 'float' | IDENTIFIER) ('*')*;
declaration: type IDENTIFIER ('=' expr)?;
assignment: ('*')* IDENTIFIER ('=' expr);
conversion: '(' type ')' (literal | expr);
expr : literal
     | '(' type ')' expr //explicit conversion
     | '(' expr ')'
     | ('++' | '--' | '&' | '*') expr
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
return: 'return 0'(';')?;

MULTILINE: '/*' (.)*?  '*/' ;
SINGLECOMMENT: '//' (~[\n])*;
IDENTIFIER: ([a-z]|[A-Z]|'_')([a-z]|[A-Z]|'_'|[0-9])*;
INT : ([1-9][0-9]*) | [0-9] ;
FLOAT: ([0-9]*'.')?([0-9]+) | ([0-9]+)('.'[0-9]*)?;
CHAR: '\''  ('\\')??.    '\'';
WS : [ \t\n\r]+ -> skip ;