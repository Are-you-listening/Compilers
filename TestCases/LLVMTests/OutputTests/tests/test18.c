#include <stdio.h>


int main() {
const char c = 'a';

printf("%c", c);

const char* chr_ptr = &c;
printf("%c", *chr_ptr);

char* non_const_ptr = chr_ptr;
printf("%c", *non_const_ptr);

*non_const_ptr = 'c';

printf("%c", c);
printf("%c", *non_const_ptr);

    return 0;

}
