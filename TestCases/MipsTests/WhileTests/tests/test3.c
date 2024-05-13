#include <stdio.h>

int main(){

    int a = 0;

    while (a < 30){
        if ((a % 2) == 0){
            printf("%d", 1);
        }else{
            printf("%d", 2);
        }
        a++;
    }

	return 0;
}
