#include <stdio.h>

int main(){

    while(1){
        int a = 0;
        if (a % 2 == 1){
            continue;
        }

        printf("%d", a);
        if (a > 10){
            break;
        }

        a++;

    }
    printf("%d", 1);

	return 0;
}
