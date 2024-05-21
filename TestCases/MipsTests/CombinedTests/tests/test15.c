#include <stdio.h>

void reverseCountWithConst(const int skip);


int main()
{
    int toSkip = 8;
    reverseCountWithConst(toSkip);
    toSkip = 3;
    reverseCountWithConst(toSkip);
    return 0;
}


void reverseCountWithConst(const int toSkip)

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