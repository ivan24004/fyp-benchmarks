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
    }

    for (int i = 0; MAX_SIZE > i; i++) {
        if (a[i] & 1) {
            a[i] = 0;
        }
    }
}