#include <stdio.h>



#define appel peer
#define BUFFER_SIZE 1024

int x = 1;

#include "define2.c" // Test usual include

int main()
{
    printf("%d",y);
    printf("%d",BUFFER_SIZE);
    return 0;
}