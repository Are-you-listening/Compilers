#include <stdio.h>
#include <stdlib.h>
int main(){
char* c = malloc(5);
*c = 'a';
*(c+1) = 'b';
printf("%c", *c);
printf("%c", *(c+1));
free(c);
return 0;

}