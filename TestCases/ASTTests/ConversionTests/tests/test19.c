#include <stdio.h>


int main(){

char s = 's';
int k = s;
float l = k;
k = l;
s = k;

k = (int) l;
s = (char) k;

return 0;

}