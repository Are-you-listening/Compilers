#include <stdio.h>

int main(){

    int a = 0;
    int b = 0;
    a = 1;
    switch(a){
        case 1:
            b = 1;

            switch(b){
                case 1:
                    printf("%d", 11);
                    break;
                case 6:
                    printf("%d", 66);
                case 2:
                    printf("%d", 22);
                    break;
                default:
                    printf("%d", 33);
                    break;

            }

            printf("%d", 1);
        case 6:
            b = 6;

            switch(b){
                case 1:
                    printf("%d", 11);
                    break;
                case 6:
                    printf("%d", 66);
                case 2:
                    printf("%d", 22);
                    break;
                default:
                    printf("%d", 33);
                    break;

            }

            printf("%d", 6);
        case 2:
            b = 2;

            switch(b){
                case 1:
                    printf("%d", 11);
                    break;
                case 6:
                    printf("%d", 66);
                case 2:
                    printf("%d", 22);
                    break;
                default:
                    printf("%d", 33);
                    break;

            }

            printf("%d", 2);
            break;
        default:
            b = 3;

            switch(b){
                case 1:
                    printf("%d", 11);
                    break;
                case 6:
                    printf("%d", 66);
                case 2:
                    printf("%d", 22);
                    break;
                default:
                    printf("%d", 33);
                    break;

            }

            printf("%d", 3);
            break;

    }

    printf("%d", 4);

    return 0;
}