#include <stdio.h>


int main(){
    char c[3] = {'a', 'b', 'c'};
    char* d = c;

    printf("%c", *d);
    printf("%c", *(d+1));
    return 0;
}
