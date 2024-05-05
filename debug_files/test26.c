#include <stdio.h>

int main(){
    int a[4] = {1,2,3,4};
    int* sa = a;
    int ia = 3;

    int* z;

    ia + ia;
    ia + sa;
    sa + ia;

    ia - ia;
    sa - ia; // Not allowed OK

    ia * ia;

    ia / ia;

    ia % ia;

    return 0;
}