#include <stdio.h>

char d(){
    return 98;
}

int main() {
    char a = 'q';
    a = d();
    printf("%c", a);
    return 0;
}