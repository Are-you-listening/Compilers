#include <stdio.h>
#include <stdlib.h>

int equal(char* a, char* b){
    int index = 0;
    while (1){
        char a_char = *(a+index);
        char b_char = *(b+index);

        if (a_char == '\0' && b_char == '\0'){
            return 1;
        }

        if (a_char == '\0' || b_char == '\0'){
            return 0;
        }

        if (a_char != b_char){
            return 0;
        }

        index++;

    }
}


int main() {

    printf("%d", equal("aaa", "aa"));
    printf("%d", equal("aaa", "abb"));
    printf("%d", equal("aaa", "aaa"));
    printf("%d", equal("aaa", ""));


    return 0;
}