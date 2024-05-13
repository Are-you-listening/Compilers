#include <stdio.h>

int main(){
    int a = 0;
    int i;
    for (i=0; i < 5 ; i++){
        int b = i;
        printf("%d", b);
    }

    while(a<2){
        a++;
        printf("a %d a\t", a);
        continue;
    }
    while(1){
        break;
    }
    printf("b %d b", 5);
	return 0;
}
