#include <stdio.h>



int main(){
   char c[] = "hello world";

   printf("%s", c);

   char d[] = {'a', 'b', '\0'};

   printf("%s", d);

    return 0;
}