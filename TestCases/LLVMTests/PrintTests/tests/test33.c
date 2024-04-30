#include <stdio.h>

int main(){
    int x = 10;
    int* xp = &x;
    printf("%d", *xp);
    return 0;
}
