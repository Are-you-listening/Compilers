#include <stdio.h>

int main()
{
    const int p = 8;
    float* q = &p;



    printf("%% %d %x %d  kappa kappa",p,(int) p,(int)*q);

    const float* z = q;

    printf("%% %d %d %d  kappa kappa",(int) *z, (int) *z, (int) *q);



    return 0;
}



