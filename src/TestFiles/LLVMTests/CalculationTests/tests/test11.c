#include <stdio.h>

int main() {

    char x = 'a';
    printf("%d", x);

    char* chr_ptr = &x;

    *chr_ptr = 'b';

    char another_char = *chr_ptr;
    printf("%d", another_char);
    return 0;

}
