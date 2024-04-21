float func( float* x, int y);




int main() {
    int y = 10;
    float u = 0;
    float* ptr = &u;
    int c;
    c = func (  ptr , y);
    return y;
}


float func( float* x, int y) {
    *x = 10;
    return y;
}


