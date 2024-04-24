grammar grammarC;
start_ : code EOF;
code: (function | line ';'+ | comment | include | define | include_guard)* ';'*;
include_guard: '#ifndef' IDENTIFIER code '#endif';
include: '#include' ('<stdio.h>' | STRING );
comment : MULTILINE | SINGLECOMMENT;
function : (type) IDENTIFIER '(' parameters ')' ('{' block_code '}')? ';'*;
line: (declaration | expr | assignment | typedef | enum | structunion | function_ptr);
parameters: ((parameter',')* parameter)?;
parameter: type IDENTIFIER;
function_call: ( '(' '*' (function_call | IDENTIFIER) ')' | IDENTIFIER) ('(' ((parameter_call',')* parameter_call)? ')')+;
parameter_call: expr;
block_line: (line | printscanf | 'break' | 'continue' | return);
block_code: (block_line ';'+ | comment | if | for | while | anonymous_scope | switch | include | define)* ';'*;
typedef: 'typedef' type IDENTIFIER;
define: '#define' IDENTIFIER ( ('-'? literal) | type );  // Remember, we can't allow Expressions here! (See project5.pdf)
if: 'if' '(' expr ')' '{' block_code'}' ('else' ('{' block_code '}' | if))?;
for: 'for' '(' block_line? ';' block_line? ';' block_line? ')' '{' block_code '}' ;
while: 'while' '(' block_line ')' '{' block_code '}';
anonymous_scope: '{' block_code '}';
switch: 'switch' '(' IDENTIFIER ')' '{' (case | default)* '}';
case: 'case' (literal | IDENTIFIER) ':' block_code;
default: 'default' ':' block_code;

enum: 'enum' IDENTIFIER '{' (IDENTIFIER',')* IDENTIFIER? '}';
printscanf: ('printf' | 'scanf') '(' STRING (',' expr)* ')';
type: ('const')? ('int' | 'char' | 'float' | 'void' | (('struct' | 'enum' |'union') IDENTIFIER) | IDENTIFIER) ('*' | 'const')*;
return: 'return' expr?;
structunion: ('struct' | 'union') IDENTIFIER '{' (declaration* ';'+)+ '}';
function_ptr: (type) function_ptr_2 ;
function_ptr_2: '(' '*' (function_ptr_2 | IDENTIFIER) ')' '(' parameters ')';
declaration: type IDENTIFIER array? ('=' expr)?;
assignment: ('*')* expr ('=' expr);
conversion: '(' type ')' (literal | expr);
initialize_list: ((expr ',')* expr)?;
expr : literal
     | conversion
     | (function_call | printscanf)
     | '{' initialize_list '}'
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
array: ('[' expr ']')+ ;
literal : (INT | FLOAT | CHAR | STRING | (IDENTIFIER array?)) ;

MULTILINE: '/*' (.)*?  '*/' ;
SINGLECOMMENT: '//' (~[\n])*;
IDENTIFIER: ([a-z]|[A-Z]|'_')([a-z]|[A-Z]|'_'|[0-9])*;
INT : ([1-9][0-9]*) | [0-9] ;
FLOAT:  INT | (INT*'.' (INT|'0')* );
CHAR: '\''  ('\\')??.    '\'';
STRING: '"' (~('"' | '\n') | '\\"')* '"';
WS : [ \t\n\r]+ -> skip ;
