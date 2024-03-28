#include <stdio.h>

/*
* My program
*/
typedef float speed;
int main() {
    int x = 5*(3/10 + 9/10);
    speed y = x*2/( 2+1 * 2/3 +x) +8 * (8/4);
    float result = x + y; //calculate the result
    printf("%f", result); //show the result

    return 0;
}