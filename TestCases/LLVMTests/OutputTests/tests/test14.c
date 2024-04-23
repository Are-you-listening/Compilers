#include <stdio.h>


int main() {
const int b = -6250;
const int x = 5;



int* non_const_pointer = &x;

printf("%d", *non_const_pointer);

*non_const_pointer = 36941;

printf("%d", *non_const_pointer);

non_const_pointer = &b;

printf("%d", *non_const_pointer);


char c = 'x';
char nl = '\n';

char* char_ptr = &c;
printf("%c", *char_ptr);

*char_ptr = '\t';
printf("%c", *char_ptr);
char_ptr = &nl;
printf("%c", *char_ptr);

    return 0;

}
