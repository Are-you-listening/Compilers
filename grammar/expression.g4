grammar expression;
start_ : lines function lines EOF;
function : type IDENTIFIER '()' '{' lines '}';
lines : (line)*  ;
line: (declaration | expr)(';')+;
literal : (INT | FLOAT | CHAR | IDENTIFIER) ;
type: ('const')? ('int' | 'char' | 'float');
declaration: type IDENTIFIER ('=' expr)?;
expr : literal
     | '(' expr ')'
     | ('+'|'-' | '~' | '!') expr
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

IDENTIFIER: ([a-z]|[A-Z]|'_')([a-z]|[A-Z]|'_'|[0-9])*;
INT : ([1-9][0-9]*) | [0-9] ;
FLOAT: (([1-9][0-9]*) | [0-9])('.'[0-9]*)?;
CHAR: '\''.'\'';
WS : [ \t\n\r]+ -> skip ;