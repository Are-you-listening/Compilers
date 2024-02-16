grammar expression;
start_ : expr (';' expr)* EOF;
expr : literal | LEFTPAREN expr RIGHTPAREN |  UNARYOP expr | expr BASEOP expr ;
boolexpr : LEFTPAREN boolexpr RIGHTPAREN | expr BOOLOP expr | UNARYLOIGICALOP boolexpr | boolexpr LOGICALOP boolexpr;
literal : INT ;



INT : [0-9]+ ;
WS : [ \t\n\r]+ -> skip ;
BASEOP : '+' | '-' | '*'| '/' | '%' | '>>' | '<<' | '&'| '|' | '~'| '^' ;
BOOLOP : '==' | '<' | '>'| '>=' | '<='| '!=';
LOGICALOP: '&&' | '||' ;
UNARYLOIGICALOP : '!';
UNARYOP : '+' | '-' ;
LEFTPAREN : '(';
RIGHTPAREN : ')';