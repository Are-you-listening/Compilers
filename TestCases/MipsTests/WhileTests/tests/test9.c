#include <stdio.h>

int main(){
    int a = 0;
    while(1){

        if (a % 2 == 1){
            a++;
            continue;
            break;
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
