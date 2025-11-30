#include <stdlib.h> 

#define MAX_SIZE 100000000

int a[MAX_SIZE], b[MAX_SIZE], c[MAX_SIZE];

int xorshift32(int *state) {
    int x = *state;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    return *state = x;
}

int main() {
    int seed = 973;

    for (int i = 0; MAX_SIZE > i; i++) {
        a[i] = xorshift32(&seed);
        b[i] = xorshift32(&seed);
        c[i] = xorshift32(&seed);
    }
    for (int i = 0; MAX_SIZE > i; i++) {
        if (a[i] & 1) {
            a[i] = 0;
        }
        if (b[i] & 1) {
            b[i] = 0;
        }
        if (c[i] & 1) {
            c[i] = 0;
        }
    }
}