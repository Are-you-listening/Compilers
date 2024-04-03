grammar grammarC;
start_ : code EOF;,
code: (function | line(';')+ | comment | include | define | include_guard)* (';')*;
include_guard: '#ifndef' IDENTIFIER code '#endif';
include: '#include' ('<stdio.h>' | STRING );
comment : MULTILINE | SINGLECOMMENT;
function : (type | 'void') IDENTIFIER '(' parameter* ')' ('{' block_code '}')? (';')*;
line: (declaration | expr | assignment | typedef | enum);
parameter: type IDENTIFIER;
function_call: IDENTIFIER '(' ((expr',')* expr)? ')';

block_line: (line | printf | 'break' | 'continue' | return);
block_code: (block_line(';')+ | comment | if | for | while | anonymous_scope | switch | include | define)* (';')*;
typedef: 'typedef' type IDENTIFIER;
define: '#define' IDENTIFIER ('(' parameter* ')')? expr;
if: 'if' '(' expr ')' '{' block_code'}' ('else' ('{' block_code '}' | if))?;
for: 'for' '(' block_line? ';' block_line? ';' block_line? ')' '{' block_code '}' ;
while: 'while' '(' block_line ')' '{' block_code '}';
anonymous_scope: '{' block_code '}';
switch: 'switch' '(' IDENTIFIER ')' '{' ('case' (literal | IDENTIFIER) ':' block_code )* '}';
enum: 'enum' IDENTIFIER '{' (IDENTIFIER',')* IDENTIFIER? '}';
printf: 'printf' '(' '"' (.)*? ('%s' | '%d' | '%x' | '%f' | '%c') (.)*? '"' ',' (expr) ')';
type: ('const')? ('int' | 'char' | 'float' | IDENTIFIER) ('*' ('const')?)*;
return: 'return' expr?;

declaration: type IDENTIFIER ('=' expr)?;
assignment: ('*')* IDENTIFIER ('=' expr);
conversion: '(' type ')' (literal | expr);
expr : literal
     | conversion
     | function_call
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
literal : (INT | FLOAT | CHAR | IDENTIFIER) ;

MULTILINE: '/*' (.)*?  '*/' ;
SINGLECOMMENT: '//' (~[\n])*;
IDENTIFIER: ([a-z]|[A-Z]|'_')([a-z]|[A-Z]|'_'|[0-9])*;
INT : ([1-9][0-9]*) | [0-9] ;
FLOAT:  INT | (INT*'.' (INT|'0')* );
CHAR: '\''  ('\\')??.    '\'';
STRING: '"' (~[\n])* '"';
WS : [ \t\n\r]+ -> skip ;
