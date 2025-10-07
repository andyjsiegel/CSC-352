/*
 * File: lineSum.c
 * Author: Andy Siegel
 * Purpose: To read in lines of stdin, sum the integers on each line,
 *   and print the sum to stdout. If a line contains invalid input,
 *   an error message is printed to stderr and the program continues
 *   processing subsequent lines. The program exits with a non-zero
 *   status if any line contains invalid input.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char *line = NULL;
    size_t len = 0;
    int exitValue = 0;

    while((getline(&line, &len, stdin)) != EOF) {
        int sum = 0;
        int temp = 0;
        int offset = 0;
        char *current_pos = line;
        int retVal;
        if(*line == '\n') {
            exitValue = 1;
            continue;
        }
        while((retVal = sscanf(current_pos, "%d%n", &temp, &offset)) == 1) {
            if(current_pos[0] == '-') {
                fprintf(stderr, "Invalid input. Please enter non-negative integers only.\n");
                sum = -99999; // Indicate error in sum
                break;
            }
            if(temp < 0) {
                fprintf(stderr, "Invalid input. Please enter non-negative integers only.\n");
                sum = -99999; // Indicate error in sum
                break;
            }
            if(retVal != 1) {
                fprintf(stderr, "Non integer input detected.\n");
                sum = -99999; // Indicate error in sum
                break;
            }
            sum += temp;
            current_pos += offset;
        }
        if(sum == -99999 || (retVal != EOF && retVal != 1)) {
            exitValue = 1;
            continue; // Skip printing sum if there was an error
        }
        printf("%d\n", sum);
    }
    return exitValue;
}