#include <stdio.h>

int main(){

    int a = 0;
    int b = 0;

    while (a < 30){
        if ((a % 2) == 0){
            printf("%d", 1);
        }else{
            printf("%d", 2);
            while (b < 5){
            printf("%d", b);
            b++;
            }
        }

        a++;
    }

	return 0;
}
