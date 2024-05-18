#include <stdio.h>


int main(){
    char a[2][2] = {{'a', 'b'}, {'c', 'd'}};
    printf("%c", a[0][0]);
    printf("%c", a[0][1]);
    printf("%c", a[1][0]);
    printf("%c", a[1][1]);
    return 0;
}
