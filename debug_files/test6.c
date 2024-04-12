int main(){

    int a = 0;
    int b = 0;
    a = 1;
    switch(a){
        case 1:
            b = 1;
        case 6:
            b = 6;
        case 2:
            b = 2;
            break;
        default:
            b = 3;
            break;

    }

    return 0;
}