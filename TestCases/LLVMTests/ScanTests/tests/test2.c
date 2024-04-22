#include <stdio.h>

int main()
{

    const float p = 3.14;
    float* q = &p;
    const float* s = q;

    scanf("%f", s);
    printf("%f", &s);
    printf("%f", p);


    scanf("%f", q);
    printf("%f", &q);
    printf("%f", p);

    scanf("%f", &p);
    printf("%f", p);

    return 0;
}



