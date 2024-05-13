#include <stdio.h>

const int getValue() {
    return 42;
}

int main() {
    const int num = getValue();
    int *nonConstPtr = (int *)&num;
    *nonConstPtr = 50;
    printf("%d\n", num);
    return 0;
}
