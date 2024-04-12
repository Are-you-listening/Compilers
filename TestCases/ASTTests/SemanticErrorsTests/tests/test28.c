int main() {
    int x = 1;
    {
        int x = 2; // should be fine, shadows previous declaration
    }
}