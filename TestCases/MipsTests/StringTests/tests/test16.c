#include <stdio.h>
#include <stdlib.h>

char a[] = "hello";
char b[] = {'a', 'b'};
char c = 'g';
int main() {

    a[1] = 'v';

    printf("%s", a);
    printf("%c", a[4]);

    return 0;
}