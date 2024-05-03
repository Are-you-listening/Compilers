#include <stdio.h>
int main()
{
    int d = 10;
    const int * a = &d;
    int* b = (int*) a;
    const int * c = (const int*) b;
    *c = 15;



    return 0;
}