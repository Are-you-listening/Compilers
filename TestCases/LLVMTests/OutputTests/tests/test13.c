#include <stdio.h>


int main() {

int x = -60;
printf("%d", x);

int* some_pointer = &x;
printf("%d", x);
printf("%d", *some_pointer);

*some_pointer = 53;
printf("%d", x);
printf("%d", *some_pointer);

int** another_pointer = &some_pointer;
int*** triple_pointer = &another_pointer;
int y = ***triple_pointer;

printf("%d", **another_pointer);
printf("%d", ***triple_pointer);
printf("%d", y);

    return 0;

}
