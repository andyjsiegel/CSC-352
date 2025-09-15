/*
 * File: anagrams.c
 * Author: Andy Siegel
 * Purpose: To read in a series of strings and print out all the anagrams of the first string
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* isAnagram(const char *string1, const char *string2) -- converts each character to its lowercase 
 * ASCII value and compares the sum and length in order to check if they are anagrams. returns 0 or 1
 */
int isAnagram(const char *string1, const char *string2) {
    int length1 = strlen(string1);
    int length2 = strlen(string2);
    int asciiSum1 = 0;
    int asciiSum2 = 0;

    for (int i = 0; i < length1; i++) {
        char currentChar = string1[i];
        int ASCIInumber = (int) tolower(currentChar);
        asciiSum1 += ASCIInumber;
    }

    for (int i = 0; i < length2; i++) {
        char currentChar = string2[i];
        int ASCIInumber = (int) tolower(currentChar);
        asciiSum2 += ASCIInumber;
    }

    return (length1 == length2) && (asciiSum1 == asciiSum2);
}

int main() {
    // declare the two strings as length 64 for the 64 character limit + null terminator
    char firstString[65];
    char inputString[65];

    // ensure there is a string passed in
    if (scanf("%64s", firstString) != 1) {
        return 0;
    }

    // loop through each character of the first string to ensure they are all alphabetical characters
    for (int i = 0; firstString[i]; i++) {
        if (!isalpha(firstString[i])) {
            fprintf(stderr, "Error: First string contains non-alphabetical characters.\n");
            return 1;
        }
    }

    // print the first string as it is always an anagram of itself
    printf("%s\n", firstString);

    // read in each subsequent string and check if it is an anagram of the first string
    while (scanf("%64s", inputString) == 1) {
        int isValid = 1;
        for (int i = 0; inputString[i]; i++) {
            if (!isalpha(inputString[i])) {
                fprintf(stderr, "Error: String contains non-alphabetical characters.\n");
                isValid = 0;
                break; // escape the for loop (but not the while loop)
            }
        }

        if (isValid && isAnagram(firstString, inputString)) {
            printf("%s\n", inputString);
        }
    }

    return 0;
}
