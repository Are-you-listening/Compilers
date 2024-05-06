int main(){
    const int x = 1;

    int y = x;
    while(x){
        y++;
        if (y>3){
            break;
        }
    }
    return 0;
}