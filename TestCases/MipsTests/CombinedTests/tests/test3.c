#include <stdio.h>

#define NULL 0.0

void printPositive(float a)
{
    if (a > NULL)
    {
        printf("%d", (int) a);
    }
}

int main ()
{
    float arr[5] = {-10.20, -20.125, 31.26, 0.00, 15.2};
    int i = 0;
    while ( i < 5)
    {
        printPositive(arr[i]);
        i++;
    }
    return 0;
}