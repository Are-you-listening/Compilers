int add(int const a, int const b);

int main() {
    int x = 5;
    int y = 10;
    int result = add(x, y);
    return 0;
}

int add(int const a, int const b) {
    return a + b;
}
