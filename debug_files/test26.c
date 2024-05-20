#include <stdio.h>

int main() {

    char x[2] = {'a', 'b'};

    char* c = &x;
    *c = 'c';
    printf("%c", *c);
    printf("%c", x[0]);
    return 0;
}
