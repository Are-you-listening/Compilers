#include <stdio.h>

void upAndDown(const int upTo);


int main()
{
    int upTo = 16;
    upAndDown(upTo);
    return 0;

}


void upAndDown(const int upTo)
{
    int to = upTo;
    for (int i=0; i <= upTo; i++)
    {
     printf("%d\n", i);

    }
    for (int i = to - 1; i >= 0; i--)
    {
     printf("%d\n", i);
    }
}