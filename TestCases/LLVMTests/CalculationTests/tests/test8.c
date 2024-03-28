#include <stdio.h>


int main() {
int number = -55;
int a = 1;
a = number++;
printf("%d", a);
printf("%d", number);
number = number++;
printf("%d", number);

int n = number++;
printf("%d", number);
printf("%d", n);


a = ++n;
printf("%d", a);
printf("%d", n);
    return 0;

}
