#include <stdio.h>

int True = 1;

int main()
{
    int k = 0;
    for (;;){
        printf("%d", k);
        k++;
        if (k > 10){
            break;
        }
    }

    return 0;
}