const int constFunction(int a, int b);

int main() {
    int x = 5;
    int y = 10;
    int result = constFunction(x, y);
    return 0;
}

const int constFunction(int a, int b) {
    return a + b;
}
