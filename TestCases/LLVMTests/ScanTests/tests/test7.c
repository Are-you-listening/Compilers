#include <stdio.h>

int main(){
    int s = 0;
    int* k = &s;
    printf("%d", s);
    scanf("%d", k);
    printf("%d", s);
    return 0;
}