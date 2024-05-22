#include <stdio.h>

int main()
{
    float p = 3.14;
    float* q = &p;

    printf("%d %d %d ",(int)  3.14,(int)  p,7);

    printf("%% %c %d %x %d  kappa kappa",'a', (int)  p,12, (int)  p);

    printf("%x,d",5);
    printf("%d ",(int) p);
    printf("%d ", (int) p);
    printf("a%da ", (int) p);

    printf("%d", (int) p);

    printf("%s", "This is a beautifull string");


    return 0;
}



