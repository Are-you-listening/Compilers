#include <stdio.h>

int main(){
    int a;
    int* sa = &a;
    int* sb = &a;

    sa-sb;

    return 0;
}