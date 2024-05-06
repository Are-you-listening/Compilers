#include <stdio.h>

int main(){
    int a = 0;
    int i;
    for (i=0; i < 5 ; i++){
        int b = i;
    }

    while(a<2){
        a++;
        continue;
    }
    while(1){
        break;
    }
	return 0;
}
