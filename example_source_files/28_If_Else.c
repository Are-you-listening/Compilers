#include <stdio.h>

int main(){

    int a = 1;
    int b = 1;

    a = 1;
    b = 0;

    if (b){
        int x = 0;
    } else {
        int x = 1;
    }

    if (0){
        int y = 0;
    } else if (!b){
        int y = 1;
    }

    return 0;

}