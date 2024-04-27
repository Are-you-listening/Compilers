#include <stdio.h>

int main(){
    char a = 'a';
    char* c[1] = {&a};
    char** t = c;
    printf("%c", **t);
    return 0;
}