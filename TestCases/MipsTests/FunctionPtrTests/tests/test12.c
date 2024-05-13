int increment(int x, float f) {
return x + 1;
}
int main() {
int (*incrementPtr)(int, float);
incrementPtr = &increment;
int z = 5;
z = (*incrementPtr)(z, 0.689);
return 0;
};
