#include <stdio.h>

int max(int a, int b) {
       if (a > b)
       {
            return a;
       }
       else
       {
             return b;
       }
}

int main () {
    printf("%d\n", max(10,11));
    return 0;
}