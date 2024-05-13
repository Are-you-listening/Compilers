#include <stdio.h>


int main() {
int number = -55;

    printf("%d", number);


number++;
    printf("%d", number);

number = number++;
    printf("%d", number);


int n = number++;

    printf("%d", number);
    printf("%d", n);


n = n - n++;
++n;
    return 0;

}
