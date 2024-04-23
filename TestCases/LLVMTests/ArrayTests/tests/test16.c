#include <stdio.h>

int main() {

    int i = 1;
    i = 1;
    int j = i+6;
    int x[j];


    x[i+2] = 1;
    printf("%d", x[3]);
    return 0;
}
