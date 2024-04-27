#include <stdio.h>

int d(int w[2]){
    printf("%d", w[0]);
    printf("%d", w[1]);
    w[1] = 5;
    return w[1];
}


int main() {
    int c[2] = {1, 2};
    int u = d(c);
    printf("%d", u);
    return 0;
}