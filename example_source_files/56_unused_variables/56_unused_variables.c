#include<stdio.h>

/*
* use param --unused_var True
* To get the expected results
*/

int main() {
    int a = 3;
    int b = 4;

    int c = 5;
    c = 5;
    printf("%d", c);
    return 0;
}
