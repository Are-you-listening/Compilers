#include <stdio.h>

int main(){
    int x = 1;
    int y = x;
    int* ptr1 = &x;
    int* ptr2 = &y;
    printf("%d\n", ptr1 != ptr2);
    printf("%d\n", ptr1 == ptr2);
    return 0;
}