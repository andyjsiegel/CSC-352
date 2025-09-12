/*
 * File: countPrimes.c
 * Author: Andy Siegel
 * Purpose: Count the number of primes between two numbers. 
 * Reads the lower and upper bounds from stdin.
 */

#include <stdio.h>
#include <math.h>

// int isPrime(int n) -- returns a 0 or 1 depending on whether n is prime
int isPrime(int n) {
    // if n is 2, it's prime
    if (n == 2) {
        return 1;
    }
    
    // if n is even, it's not prime. smallest prime is 2
    if (n < 2 || n % 2 == 0) {
        return 0;
    }
    
    // Check odd numbers up to the square root of n
    int limit = (int) sqrt((double) n);
    for (int i = 3; i <= limit; i += 2) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

int main() {
    int lowerBound, upperBound;
    scanf("%d %d", &lowerBound, &upperBound);

    if(lowerBound >= upperBound) {
        printf("0\n");
        return 0;
    }
    if(lowerBound <= 0 || upperBound <= 0) {
        fprintf(stderr, "Bounds must be positive\n");
        return 1;
    }

    int numPrimes = 0;
    for(int i = lowerBound + 1; i < upperBound; i++) {
        if(isPrime(i)) {
            numPrimes++;
        }
    }
    printf("%d\n", numPrimes);
    return 0;
}
