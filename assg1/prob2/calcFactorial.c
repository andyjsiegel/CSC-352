#include <stdio.h>

int factorial(int n) {
    if (n < 0) {
        return 0;
    }
    if (n == 0) {
        return 1;
    }
    return n * factorial(n - 1);
}

int main() {
    int value, factorialValue;
    // Read values until scanf fails
    while (1) {
        int returnCode = scanf("%d", &value);
        if(returnCode > 0) {
            if(value < 0 || value > 12) {
                fprintf(stderr, "Value must be between 0 and 12\n");
                continue;
            }
            factorialValue = factorial(value);
            printf("%d! = %d\n", value, factorialValue);
        }
        else if(returnCode == EOF) {
            return 0;
        }
        else {
            fprintf(stderr, "Error reading value\n");
            return 1;
        }
    }

    return 0;
}
