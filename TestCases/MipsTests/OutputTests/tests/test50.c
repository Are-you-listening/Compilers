#include <stdio.h>

int main() {
    const int num = 10;
    const int *ptr = &num;
    int *nonConstPtr = (int *)ptr;
    *nonConstPtr = 20;
    printf("%d\n", num);
    return 0;
}
