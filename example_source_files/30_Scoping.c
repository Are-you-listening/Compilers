int main(){
    int x = 0;
    {
        int x = 1;
        if (x){
            int x = 2;
        }
    }
    while (x){
        continue;
    }
    return 0;
}