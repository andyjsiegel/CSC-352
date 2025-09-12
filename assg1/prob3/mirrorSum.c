#include <stdio.h>

int reverse_number(int n) {
    int reversed_number = 0;
    while (n > 0) {
        reversed_number = reversed_number * 10 + n % 10;
        n /= 10;
    }
    return reversed_number;
}

int main() {
    int value;

    // Read values until scanf fails
    while (1) {
        int returnCode = scanf("%d", &value);
        if(returnCode > 0) {
            // non-positive integers are invalid.
            if(value < 1) {
                fprintf(stderr, "Value must be greater than 0\n");
                continue;
            }
            int reversed_number = reverse_number(value);
            printf("%d\n", reversed_number+value);
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
