#include <stdio.h>

void printPyramid(int rows, char toPrint)
{

   int i = 1;
   while (i <= rows) {
        int j = 1;
      while (j < i) {
         printf("%c", toPrint);
         j++;
      }
        printf("%c\n", toPrint);
      i++;
   }
}

int main() {
    char toPrint = '*';
    //printf("%c", toPrint);
    int rows = 5;
    printPyramid(rows, toPrint);
   return 0;
}