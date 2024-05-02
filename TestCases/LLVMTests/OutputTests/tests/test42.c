#include <stdio.h>

int main(){
    int array[3] = {1,2,3};
    int* ptr1 = &array[0];
    ptr1++;
    int* ptr2 = &array[1];
    printf("%d\n", ptr1 < ptr2);
    printf("%d\n", ptr1 > ptr2);
    printf("%d\n", ptr1 != ptr2);
    printf("%d\n", ptr1 == ptr2);
    return 0;
}