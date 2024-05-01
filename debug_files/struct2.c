#include <stdio.h>


int main(){
    char k[2] = {'a', 'b'};
    printf("%c", k);
    scanf("%c%c", k,k);
    printf("%c", k);
    return 0;
}
