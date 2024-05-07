#include<stdio.h>

/*
* use param --unused_var True
* To get the expected results
*/

int main() {
    int a = 3;
    int b = a;
    int q = 5;

    int c = 5;
    c = 5;
    printf("%d", c);
    return 0;
}
