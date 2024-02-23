grammar expression;
start_ : lines function lines EOF;
function : type IDENTIFIER '()' '{' lines '}';
lines : (line)*  ;
line: (declaration | expr| assignment)(';')+;
type: ('const')? ('int' | 'char' | 'float') ('*')*;
declaration: type IDENTIFIER ('=' expr)?;
assignment: IDENTIFIER ('=' expr);
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
literal : (INT | FLOAT | CHAR | IDENTIFIER) ;


IDENTIFIER: ([a-z]|[A-Z]|'_')([a-z]|[A-Z]|'_'|[0-9])*;
INT : ([1-9][0-9]*) | [0-9] ;
FLOAT: ([0-9]+)('.'[0-9]*)?;
CHAR: '\''.'\'';
WS : [ \t\n\r]+ -> skip ;