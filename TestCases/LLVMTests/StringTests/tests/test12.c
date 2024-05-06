#include <stdio.h>



int main(){
    char z[2];
    z[0] = 'O';
    z[1] = "Y"; // Invalid llvm bitcase because the RHS is translated as an array (notice the doubel quotes "!), we can't bitcased array types to i8*
    printf("%c", z[1]);
    return 0;
}