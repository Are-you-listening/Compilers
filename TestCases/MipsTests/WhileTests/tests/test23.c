#include <stdio.h>

int main()
{
   int n;
   int i = 3;
   int count;
   int c;

   printf("Enter the number of prime numbers required\n");
   n = 5;

   if ( n >= 1 )
   {
      printf("First %d prime numbers are :\n",n);
      printf("2\n");
   }

   count = 2;
   while(count <= n){
      c = 2;
      while(c <= i - 1) {
         if ( i%c == 0 ){
            break;
         }
	c++;
      }
      if(c == i){
         printf("%d\n",i);
         count++;
      }
      i++;
   }

   return 0;
}