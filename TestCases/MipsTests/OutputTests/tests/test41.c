#include <stdio.h>


int main(){

char s = 's';
int k = s;
float l = k;
k = l;
s = k;

k = (int) l;
s = (char) k;

int* kptr = &k;
char* sptr = &s;

kptr = sptr;
kptr = (int*) sptr;

int** kptrptr = kptr;

char*** sptrptrptr = kptr;

float p = 3.14;

float* pptr = &p;
float** ptrptr = pptr;
float** pieter = &pptr;

printf("%d", (int) **pieter);

return 0;
}