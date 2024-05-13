#include <stdio.h>


int main() {

int x = 4;
int b = 9632;

const int* x_ptr = &x;
printf("%d", *x_ptr);
x_ptr = &b;
printf("%d", *x_ptr);
return 0;

}
