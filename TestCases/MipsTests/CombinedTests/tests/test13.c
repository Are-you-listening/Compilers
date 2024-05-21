#include <stdio.h>

void count(int skip);


int main()
{
    int toSkip = 8;
    count(toSkip);
    toSkip = 3;
    count(toSkip);
    return 0;
}


void count(int toSkip)

{
    int i = 1;
    while (i <= 10)
    {
        if (i != toSkip)
        {
            printf("%d\n", i);
        }
        i++;
    }
}