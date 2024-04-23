#include <stdio.h>


int main() {

int x = 478;
int b = -251454;

int* b_ptr = &b;


printf("%d", b);
printf("%d", *b_ptr);


int** x_ptr = &b_ptr;
printf("%d", *b_ptr);
printf("%d", **x_ptr);

x_ptr = &b;

return 0;

}
