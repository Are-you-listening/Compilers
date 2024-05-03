#include <stdio.h>



int main(){
int a[2] = {0,1};
*(a+1) = 5;
printf("%d", *(a+1));

return 0;
}