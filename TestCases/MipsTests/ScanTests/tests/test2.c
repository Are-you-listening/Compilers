#include <stdio.h>

int main()
{

    const int p = 3.14;
    int* q = &p;
    const int* s = q;

    scanf("%d", s);
    printf("%d", *s);
    printf("%d", p);


    return 0;
}



