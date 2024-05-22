#include <stdio.h>

int peer = 8;
#define BUFFER_SIZE peer
int x = 1;

#include "includes/define1.c"

#ifndef A
#define BUFFER_SIZE -100
#endif

int main()
{
    int y = PI * 100000;
    printf("%d",z);
    printf("%d",BUFFER_SIZE);
    printf("%d", y);
    return 0;
}
