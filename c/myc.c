#include "k.h"

K ctil(K x) {

    long n = x->j; 
    K result = ktn(KJ, n);
    J* data = kJ(result);
    long i;
    for (i = 0; i < n; i++) {
        data[i] = i;  // <-- This is the assignment
    }

    return result;
}