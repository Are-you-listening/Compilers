#include <stdio.h>


int peer = 8;

#define BUFFER_SIZE = peer // syntax error; BUFFER_SIZE will be replaced with '=peer'

int x = 1;

#include "define2.c" // Test usual include

int main()
{
    printf("%d",y);
    printf("%d",BUFFER_SIZE);
    return 0;
}
