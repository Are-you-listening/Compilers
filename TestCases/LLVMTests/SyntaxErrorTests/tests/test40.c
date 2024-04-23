#include <stdio.h>


int peer = 8;

#define BUFFER_SIZE = peer

int x = 1;

#include "../includes/define2.c"

int main()
{
    printf("%d",y);
    printf("%d",BUFFER_SIZE);
    return 0;
}
