#include <stdio.h>

int a[2][3];


int main(){
	int x = 3;
	a[0][0] = 1;
	a[1][0] = 2;
	printf("%d; %d; %d;", a[0][0], a[1][0], x);
	return 0;
}
