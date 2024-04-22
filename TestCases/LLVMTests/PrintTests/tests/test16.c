#include <stdio.h>

int main()
{
    const int p = 8;
    float* q = &p;

    //const float p = 3.14


    printf("%% %d %x %f  kappa kappa",p, p,q);

    const float* z = q;

    printf("%% %d %x %f  kappa kappa",z, z,q);



    return 0;
}



