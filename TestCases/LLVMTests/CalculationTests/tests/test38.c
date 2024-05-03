#include <stdio.h>

int main(){
    int a[4] = {1,2,3,4};
    int* sa = a;

    ~a;
    //~sa;
    return 0;
}