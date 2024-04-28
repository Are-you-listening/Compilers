 #include <stdio.h>

int main(){

    int i = 0;
    while (10 != 10){
        printf("%d", i);
        i++;
        break;
    }

    int j;
    for (j =0; j< 10; j++){
        printf("%d", j);
    }

    return 0;

}