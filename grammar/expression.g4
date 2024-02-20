grammar expression;
start_ : (expr (';')+)*  EOF;
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

literal : INT ;

INT : ([1-9][0-9]*) | [0-9] ;
WS : [ \t\n\r]+ -> skip ;