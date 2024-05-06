int foo() {
    return 4;
}

int main(){
    const int x = foo();

    int y = x;

    int z = x;
    return 0;
}