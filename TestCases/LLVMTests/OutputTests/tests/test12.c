#include <stdio.h>


int main() {

char x = 'a';

char* chr_ptr = &x;

printf("%c", *chr_ptr);

*chr_ptr = 'b';
printf("%c", *chr_ptr);
char another_char = *chr_ptr;
printf("%c", *chr_ptr);
printf("%c", another_char);
    return 0;

}
