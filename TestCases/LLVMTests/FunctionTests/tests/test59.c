const int constFunction(int a, int b);

int main() {
    int x = 5;
    int y = 10;
    int result1 = constFunction(x, y);
    int result2 = constFunction(result1, 15);
    return 0;
}

const int constFunction(int a, int b) {
    return a + b;
}
