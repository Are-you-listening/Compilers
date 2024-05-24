#include <stdio.h>



int main() {
    int i = 1;
   while (i <= 3) {
        int j = 1;
      while (j < i) {
         printf("%c", '*');
         j++;
      }
        printf("%c\n", '*');
      i++;
   }
   return 0;
}