int main(){
    float a = 5.0;
    const int b = 5;
    char c = 'e';
    float* d = &a;
    int* e = &b;
    const char* f = &c;
    f++;
    return 0;
}