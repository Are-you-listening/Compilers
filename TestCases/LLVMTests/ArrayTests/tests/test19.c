#include <stdio.h>

int main() {

    char x[2] = {'a', 'b'};

    char* z = x;
    char** c = &z;

    **c = 'c';
    printf("%c", **c);
    printf("%c", x[0]);
    return 0;
}