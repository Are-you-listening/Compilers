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
    ia - sa; // Not allowed OK
    //sa - ia; // Not allowed OK

    //ia * sa; // Not allowed OK

    ia * ia;
    //int b = sa * ia; // Not allowed OK

    ia / ia;
    //ia / sa; // Not allowed OK
    //sa / ia; // Not allowed OK

    ia % ia;
    //ia % sa; // Not allowed OK
    //sa % ia; // Not allowed OK

    return 0;
}