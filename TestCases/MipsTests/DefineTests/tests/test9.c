#include <stdio.h>

int peer = 8;
#define BUFFER_SIZE peer
int x = 1;

#include "includes/define1.c"

#ifndef
#include "includes/define2.c"

int main()
{
    printf("%d",y);
    printf("%d",BUFFER_SIZE);
    printf("%f", PI);
    return 0;
}
