#include <stdio.h>

int main()
{
    const int p = 8;
    float* q = &p;



    printf("%% %d %x %f  kappa kappa",p, p,q);

    const float* z = q;

    printf("%% %f %f %f  kappa kappa",z, z,q);



    return 0;
}



