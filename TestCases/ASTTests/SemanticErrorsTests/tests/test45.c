#include <stdio.h>


int main(){

int k[2] = {1,2};
int s[2] = {3,4};

int a = s[2] + k[2];
int* b = s + k;

return 0;
}