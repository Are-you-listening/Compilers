int main(){
    const char a = 'a';
    const int b = a;
    const float c = b;
    const int d = c+b+a;
    const char e = d+c+b+a;
    const float f = e+d+c+b+a;
    return 0;
}