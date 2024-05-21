#include <stdio.h>

void reverseCount(int skip);


int main()
{
    int toSkip = 8;
    reverseCount(toSkip);
    toSkip = 3;
    reverseCount(toSkip);
    return 0;
}


void reverseCount(int toSkip)

{
    int i = 10;
    while (i >= 1)
    {
        if (i != toSkip)
        {
            printf("%d\n", i);
        }
        i--;
    }
}