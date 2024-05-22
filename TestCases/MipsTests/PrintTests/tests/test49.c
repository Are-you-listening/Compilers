#include <stdio.h>


int main(){
    printf("%d; ", 5+5);
    float c = 4.5 + 5.5;
    printf("%d; ", (int) c);
    printf("%d; ", 15-5);
    c = 10.5 + 0.5;
    printf("%d; ", (int) c);
    printf("%d; ", 2*5);
    c = 20.5 * 5.5;
    printf("%d; ", (int) c);
    printf("%d; ", (int) 20/2);
    c = 5.0 / 0.5;
    printf("%d; ", (int) c);
    return 0;
}