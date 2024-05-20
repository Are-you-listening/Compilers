#include <stdio.h>

int main() {

    char x[2][2];
    
    **x = 110;
    printf("%c", x[0][0]);
    return 0;
}
