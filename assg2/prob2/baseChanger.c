/*
 * File: baseChanger.c
 * Author: Andy Siegel
 * Purpose: To read in a base and a series of strings representing numbers in that base,
 *          and convert each string to its base 10 integer equivalent.
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* getNumericalValue(char input) converts a character to its numerical value, 
so integers remain as their value and 'a' is 10 while 'z' is 35 */
int getNumericalValue(char input) {
    char lowerInput = tolower(input);
    if (lowerInput >= '0' && lowerInput <= '9') {
        return lowerInput - '0'; // Convert character '0'-'9' to integer 0-9
    } else if (lowerInput >= 'a' && lowerInput <= 'z') {
        return lowerInput - 'a' + 10; // Convert character 'a'-'z' to integer 10-35
    } else {
        return -1; // Return -1 for invalid lowerInput
    }
}

int main() {
    int base;
    scanf("%d", &base);
    if (base < 2 || base > 36) {
        fprintf(stderr, "Error: Base must be in the range 2-35.\n");
        return 1;
    }
    // max input is 6 characters long + null terminator
    char numToChange[7];
    
    // loop through each string until EOF
    while(scanf("%s", numToChange) != EOF) {
        int result = 0;
        // loop through each character of the input string
        for (int i = 0; numToChange[i] != '\0'; i++) {
            int value = getNumericalValue(numToChange[i]);
            if (value == -1 || value >= base) {
                fprintf(stderr, "Error: Invalid character or value out of range for the given base.\n");
                return 1;
            }

            // apply horner's rule
            result = result * base + value;
        }
        printf("%d\n", result);
    }

    return 0;
}