/*
* My program
*/
enum SYS_IO_ReceiverStatusBit {
READY,
BUSY,
OFFLINE
};
int main() {
enum SYS_IO_ReceiverStatusBit status = BUSY;
{ /* unnamed scope */
int x = 1 + status + OFFLINE; /* Note: unscoped access of enum constants! */
while (x < 10) {
int result = x * 2;
if ( x > 5) {
result = result * x;
}
printf("%d", result); /* show the result */
x = x + 1;
}
}
}