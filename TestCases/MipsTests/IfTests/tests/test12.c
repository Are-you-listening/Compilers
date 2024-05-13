#include <stdio.h>


int main(){
	int x = 5;
	if (x < 5){
		printf("%d", 1);
	}
	if (x >= 5){
		printf("%d", 2);
	}
	if (x == 5 && 1){
		if (x != 4){
			printf("%d", 3);
		}
	}
	return 0;
}
