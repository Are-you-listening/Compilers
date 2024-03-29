grammar grammarC;
start_ : (include)? code EOF;
code: (function | line  | comment)* (';')*;
include: '#include <stdio.h>';
comment : MULTILINE | SINGLECOMMENT;
function : type IDENTIFIER '(' ')' '{' block_code (return)? '}'(';')*;
line: (declaration | expr| assignment| typedef)(';')+;
block_line: (declaration | expr| assignment| typedef | printf )(';')+;
block_code: (block_line | comment)* (';')*;
typedef: 'typedef' type IDENTIFIER;
if_statement: 'if' '(' expr ')' '{' code '}' ('else if' '(' expr ')' '{' code '}')* ('else' '{' code '}')?;
printf: 'printf' '(' '"' (.)*? ('%s' | '%d' | '%x' | '%f' | '%c') (.)*? '"' ',' (expr) ')';
type: ('const')? ('int' | 'char' | 'float' | IDENTIFIER) ('*' ('const')?)*;
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
FLOAT:  INT | (INT*'.' (INT|'0')* );
CHAR: '\''  ('\\')??.    '\'';
WS : [ \t\n\r]+ -> skip ;