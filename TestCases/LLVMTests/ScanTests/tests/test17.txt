#include <stdio.h>

int main(){

    char z[5];

    scanf("%s", *z); /* Should this thrown an error since its invalid? */
   scanf("%s", z);
   printf("%s", z);

    return 0;
}