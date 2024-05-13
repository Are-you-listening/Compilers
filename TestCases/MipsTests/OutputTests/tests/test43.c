#include <stdio.h>

int main(){
    int x = 3;
    int* ptr1 = &x;
    int* ptr2 = &x;
    printf("%d\n", ptr1 < ptr2);
    printf("%d\n", ptr1 > ptr2);
    printf("%d\n", ptr1 != ptr2);
    printf("%d\n", ptr1 == ptr2);
    return 0;
}