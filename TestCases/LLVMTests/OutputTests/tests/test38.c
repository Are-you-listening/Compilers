#include <stdio.h>

int main(){

    int array[2][2] = {{0,1}, {2,3}};
    int* ptr = &array;
    printf("%d", *(ptr+2));
    return 0;
}