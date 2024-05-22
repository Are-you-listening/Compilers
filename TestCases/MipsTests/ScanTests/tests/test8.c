#include <stdio.h>

int main(){
    char k = 'a';
    int s = 1;
    float l = 2;
    printf("%c %d %x %d ", k, s,s, (int) l);
    scanf("%f", &l);
    printf("%c %d %x %d ", k, s,s, (int) l);
    return 0;
}
