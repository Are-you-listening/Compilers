#include <stdio.h>

int v(int b[2][2]){
    printf("%c", b[0][0]);
    printf("%c", b[0][1]);
    printf("%c", b[1][0]);
    printf("%c", b[1][1]);
    return 0;
}

int main(){
    char a[2][2] = {{'a', 'b'}, {'c', 'd'}};

    v(a);

    return 0;
}
