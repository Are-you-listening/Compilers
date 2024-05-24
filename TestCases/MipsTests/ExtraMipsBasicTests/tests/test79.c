#include <stdio.h>
#include <stdlib.h>


int main() {
   int* a = calloc(5, sizeof(int));
   *a = 5;
   printf("%d", *a);
   printf("%d", *(a+4));
   *(a+4) = 6;
   printf("%d", *(a+4));
   return 0;
}