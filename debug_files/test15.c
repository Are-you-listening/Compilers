int func(int a, int b);





int main() {
    int y = 10;
    int u = 10;
    float* ptr = &u;
    int c;
    c = func(y, u);
    return y;
}





int func(int a, int b) {
    return a + b;
}