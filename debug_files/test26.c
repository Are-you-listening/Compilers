#include <stdio.h>

int main(){
    char array[12] = {'h','e','l','l','o',' ','w','o','r','l','d','!'};
    char* ptr = &array;

    int length = 12;
    for (int i=0; i<length; i++){
        printf("%c", *(ptr++));
    }

    return 0;
}