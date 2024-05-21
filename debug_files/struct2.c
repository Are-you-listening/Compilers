#include <stdio.h>

int main(){
    int k = 0;
    printf("%d %x \n", k , &k);
    scanf("%x" , &k );

    printf("%d %x", k , &k);
    return 0;
}