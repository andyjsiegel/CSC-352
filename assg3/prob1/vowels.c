/*
 * File: vowels.c
 * Author: Andy Siegel
 * Purpose: To read strings and determine if the vowels in each string appear in alphabetical order.
 *          Outputs 1 if vowels are in order, 0 otherwise. Non-alphabetic characters in the input throw an error.
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main() {
    char str[65];
    while(scanf("%64s", str) != EOF) {
        int asciiValues[65] = {0}; // initialize all elements to 0
        // convert str to lowercase then to array of chars
        for (int i = 0; str[i] != '\0'; i++) {
            str[i] = tolower(str[i]);
            if (str[i] < 'a' || str[i] > 'z') {
                fprintf(stderr, "Error: Invalid character in input string.\n");
                return 1; 
            }
            if(str[i] == 'a' || str[i] == 'e' || str[i] == 'i' || str[i] == 'o' || str[i] == 'u') {
                asciiValues[i] = (int) str[i];
            } else {
                asciiValues[i] = 0;
            }
        }
        int vowelsInOrder = 1;
        for (int i = 0; i < 65; i++) {
            if(asciiValues[i] > asciiValues[i+1] && asciiValues[i+1] != 0) {
                vowelsInOrder = 0;
            }
        }
        printf("%d\n", vowelsInOrder);

    }
    return 0;
}