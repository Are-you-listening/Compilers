grammar grammarC;
start_ : code EOF;
code: (function | line ';'+ | comment | include | define | include_guard)* ';'*;
include_guard: '#ifndef' IDENTIFIER code '#endif';
include: '#include' ('<stdio.h>' | STRING );
comment : MULTILINE | SINGLECOMMENT;
function : (type | 'void') IDENTIFIER '(' ((parameter',')* parameter)? ')' ('{' block_code '}')? ';'*;
line: (declaration | expr | assignment | typedef | enum | structunion | function_ptr);
parameter: type IDENTIFIER;
function_call: ( '(' '*' (function_call | IDENTIFIER) ')' | IDENTIFIER) ('(' ((expr',')* expr)? ')')+;
block_line: (line | printscanf | 'break' | 'continue' | return);
block_code: (block_line ';'+ | comment | if | for | while | anonymous_scope | switch | include | define)* ';'*;
typedef: 'typedef' type IDENTIFIER;
define: '#define' IDENTIFIER ('(' ((parameter',')* parameter)? ')')? expr;
if: 'if' '(' expr ')' '{' block_code'}' ('else' ('{' block_code '}' | if))?;
for: 'for' '(' block_line? ';' block_line? ';' block_line? ')' '{' block_code '}' ;
while: 'while' '(' block_line ')' '{' block_code '}';
anonymous_scope: '{' block_code '}';
switch: 'switch' '(' IDENTIFIER ')' '{' ('case' (literal | IDENTIFIER) ':' block_code )* '}';
enum: 'enum' IDENTIFIER '{' (IDENTIFIER',')* IDENTIFIER? '}';
printf: 'printf' '(' '"' (.)*? ('%s' | '%d' | '%x' | '%f' | '%c') (.)*? '"' ',' (expr) ')';
type: ('const')? ('int' | 'char' | 'float' | IDENTIFIER) ('*' ('const')?)*;
return: 'return' expr?;
structunion: ('struct' | 'union') IDENTIFIER '{' declaration* ';'+ '}';
function_ptr: (type | 'void') function_ptr_2 ;
function_ptr_2: '(' '*' (function_ptr_2 | IDENTIFIER) ')' '(' ((parameter',')* parameter)? ')';
declaration: type IDENTIFIER ARRAY? ('=' expr)?;
assignment: ('*')* IDENTIFIER ARRAY? ('=' expr);
conversion: '(' type ')' (literal | expr);
expr : literal
     | conversion
     | function_call
     | '{' ((expr',')* expr)? '}'
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
literal : (INT | FLOAT | CHAR | STRING | (IDENTIFIER ARRAY?)) ;

MULTILINE: '/*' (.)*?  '*/' ;
SINGLECOMMENT: '//' (~[\n])*;
IDENTIFIER: ([a-z]|[A-Z]|'_')([a-z]|[A-Z]|'_'|[0-9])*;
INT : ([1-9][0-9]*) | [0-9] ;
FLOAT:  INT | (INT*'.' (INT|'0')* );
CHAR: '\''  ('\\')??.    '\'';
ARRAY: ('[' INT ']')+ ;
STRING: '"' (~[\n])* '"';
WS : [ \t\n\r]+ -> skip ;
