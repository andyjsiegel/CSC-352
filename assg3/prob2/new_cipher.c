/*
 * File: cipher.c
 * Author: Andy Siegel
 * Purpose: To implement a simple Caesar cipher that shifts letters by a given factor.
 *          Non-alphabetic characters are not shifted. Takes a shift factor, then strings until EOF to shift.
 */

#include <stdio.h>
#include <ctype.h>

int main() {
    int shift;
    int scanf_result = scanf("%d", &shift);
    if(scanf_result == EOF) return 0;
    if(scanf_result != 1) {
        fprintf(stderr, "Error: first line must be an integer shift factor\n");
        return 1; // error reading shift factor
    }
    shift = shift % 26; 
    char str[65];
    int exitCode = 0;
    while(scanf("%64s", str) != EOF) {
        for(int i = 0; str[i] != '\0'; i++) {
            char c = str[i];
            if(!isalnum(str[i])) {
                fprintf(stderr, "Error: input string %s must be alphanumeric", str);
                exitCode = 1; // error reading input
                break;
            }
            if(c >= 'a' && c <= 'z') {
                // convert 'a' to 0, add in shift factor + 26 so we dont get special chars, 
                // mod 26 so it wraps around, then add 'a' back to get correct letter
                c = (c - 'a' + shift + 26) % 26 + 'a';
            } else if(c >= 'A' && c <= 'Z') {
                c = (c - 'A' + shift + 26) % 26 + 'A';
            }
            // use putchar() to print a single character
            putchar(c);
        }
        putchar('\n');
    }
    return exitCode;
}