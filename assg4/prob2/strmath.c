#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Function prototypes
char* strip_newline(char* str);
int is_valid_number(const char* str);
int compare_strings(const char* str1, const char* str2);
char* remove_leading_zeros(char* str);
char* add_strings(const char* str1, const char* str2);
char* subtract_strings(const char* str1, const char* str2);

int main() {
    char *op = NULL, *str1 = NULL, *str2 = NULL;
    size_t len = 0;
    int read;
    
    // Read first line (operation)
    read = getline(&op, &len, stdin);
    if (read == -1) {
        fprintf(stderr, "Error: Not enough input strings.\n");
        return 1;
    }
    op = strip_newline(op);
    
    if (strcmp(op, "add") != 0 && strcmp(op, "sub") != 0) {
        fprintf(stderr, "Error: 1st line not equal to 'add' or 'sub'.\n");
        free(op);
        return 1;
    }
    
    // Read second line (first number)
    len = 0;
    read = getline(&str1, &len, stdin);
    if (read == -1) {
        fprintf(stderr, "Error: Not enough input strings.\n");
        free(op);
        return 1;
    }
    str1 = strip_newline(str1);
    
    if (!is_valid_number(str1)) {
        fprintf(stderr, "Error: Second string contains non-numeric characters.\n");
        free(op);
        free(str1);
        return 1;
    }
    
    // Read third line (second number)
    len = 0;
    read = getline(&str2, &len, stdin);
    if (read == -1) {
        fprintf(stderr, "Error: Not enough input strings.\n");
        free(op);
        free(str1);
        return 1;
    }
    str2 = strip_newline(str2);
    
    if (!is_valid_number(str2)) {
        fprintf(stderr, "Error: Third string contains non-numeric characters.\n");
        free(op);
        free(str1);
        free(str2);
        return 1;
    }
    
    // Perform the operation
    char* result;
    if (strcmp(op, "add") == 0) {
        result = add_strings(str1, str2);
    } else {
        result = subtract_strings(str1, str2);
    }
    
    // Print result and cleanup
    printf("%s\n", result);
    
    free(op);
    free(str1);
    free(str2);
    free(result);
    
    return 0;
}

/* 
 * strip_newline(str) -- removes the trailing newline character from a string. 
 * It takes a pointer to the string as a parameter and modifies the string 
 * in place by removing the newline character if present. 
 */
char* strip_newline(char* str) {
    if (str && strlen(str) > 0 && str[strlen(str) - 1] == '\n') {
        str[strlen(str) - 1] = '\0';
    }
    return str;
}

/* 
 * is_valid_number(str) -- checks if a string contains only numeric digits. 
 * It takes a constant pointer to the string as a parameter and returns 
 * an integer indicating whether the string is a valid number. 
 */
int is_valid_number(const char* str) {
    if (!str || strlen(str) == 0) return 0;
    
    for (int i = 0; str[i] != '\0'; i++) {
        if (!isdigit(str[i])) {
            return 0;
        }
    }
    return 1;
}

/* 
 * compare_strings(str1, str2) -- compares two numeric strings by removing 
 * leading zeros. It takes two constant pointers to strings as parameters 
 * and returns an integer representing their relative magnitude. 
 */

int compare_strings(const char* str1, const char* str2) {
    // Remove leading zeros for comparison by advancing the pointer (not actually modifying the strings)
    while (*str1 == '0' && strlen(str1) > 1) str1++;
    while (*str2 == '0' && strlen(str2) > 1) str2++;
    
    int len1 = strlen(str1);
    int len2 = strlen(str2);
    
    if (len1 < len2) return -1;
    if (len1 > len2) return 1;
    
    return strcmp(str1, str2);
}

/* 
 * remove_leading_zeros(str) -- removes leading zero characters from a string. 
 * It takes a pointer to the string as a parameter and modifies the string 
 * in place by eliminating unnecessary leading zeros. 
 */
char* remove_leading_zeros(char* str) {
    if (!str) return str;
    
    int start = 0;
    while (str[start] == '0' && str[start + 1] != '\0') {
        start++;
    }
    
    if (start > 0) {
        int i = 0;
        while (str[start + i] != '\0') {
            str[i] = str[start + i];
            i++;
        }
        str[i] = '\0';
    }
    
    return str;
}

/* 
 * add_strings(str1, str2) -- adds two numeric strings representing large 
 * numbers. It takes two constant pointers to strings as parameters and 
 * returns a dynamically allocated string containing their sum. 
 */
char* add_strings(const char* str1, const char* str2) {
    int len1 = strlen(str1);
    int len2 = strlen(str2);
    int max_len = (len1 > len2 ? len1 : len2) + 2; // +1 for potential carry, +1 for null terminator
    
    char* result = calloc(max_len, sizeof(char)); // initialize result to array of all 0s
    if (!result) {
        fprintf(stderr, "Error: Memory allocation failed.\n");
        exit(1);
    }
    
    int carry = 0;
    int i = len1 - 1; // index pointer to the rightmost digit of str1
    int j = len2 - 1; // index pointer to the rightmost digit of str2
    int k = max_len - 2; // Start from second to last position
    
    while (i >= 0 || j >= 0 || carry) {
        int digit1 = (i >= 0) ? str1[i] - '0' : 0; // if i <= 0, then use 0. else use value at str[i] (same for next line)
        int digit2 = (j >= 0) ? str2[j] - '0' : 0;
        
        int sum = digit1 + digit2 + carry; 
        result[k] = (sum % 10) + '0'; // store the last digit of sum in result, then convert back to character
        carry = sum / 10; // update carry for next iteration
        
        i--;
        j--;
        k--;
    }
    
    // clean up the result by moving it, ensuring theres no funny business
    int source = k + 1;
    int destination = 0;
    while (source < max_len && result[source] != '\0') {
        result[destination] = result[source];
        destination++;
        source++;
    }
    result[destination] = '\0';
    remove_leading_zeros(result);
    
    return result;
}

/* 
 * subtract_strings(str1, str2) -- subtracts two numeric strings representing 
 * large numbers. It takes two constant pointers to strings as parameters 
 * and returns a dynamically allocated string containing their difference. 
 */
char* subtract_strings(const char* str1, const char* str2) {
    int len1 = strlen(str1);
    int len2 = strlen(str2);
    int max_len = (len1 > len2 ? len1 : len2) + 2; // +1 for potential negative sign, +1 for null terminator
    
    char* result = calloc(max_len, sizeof(char));
    if (!result) {
        fprintf(stderr, "Error: Memory allocation failed.\n");
        exit(1);
    }
    
    int comparison = compare_strings(str1, str2);
    int negative = 0;
    
    // If str1 < str2, result will be negative
    if (comparison < 0) {
        negative = 1;
        // Swap str1 and str2
        const char* temp = str1;
        str1 = str2;
        str2 = temp;
        len1 = strlen(str1);
        len2 = strlen(str2);
    } else if (comparison == 0) {
        // Numbers are equal, result is 0
        strcpy(result, "0");
        return result;
    }
    
    int borrow = 0; // carry, but for subtraction
    int i = len1 - 1; // index pointer to the rightmost digit of str1
    int j = len2 - 1; // index pointer to the rightmost digit of str2
    int k = max_len - 2; // start from second to last position
    
    while (i >= 0) {
        int digit1 = str1[i] - '0' - borrow; // extract digit1 and subtract the borrow.
        int digit2 = (j >= 0) ? str2[j] - '0' : 0; // if j < 0, use 0 for digit2 otherwise extract the digit at str2[j]
        
        if (digit1 < digit2) { // need to borrow, so add 10 and set borrow flag
            digit1 += 10;
            borrow = 1;
        } else {
            borrow = 0;
        }
        
        result[k] = (digit1 - digit2) + '0'; // complete the subtraction and convert to character
        
        i--;
        j--;
        k--;
    }
    
    // Move result to beginning, same reason as in add.
    int source = k + 1;
    int destination = 0;
    while (source < max_len && result[source] != '\0') {
        result[destination] = result[source];
        destination++;
        source++;
    }
    result[destination] = '\0';
    remove_leading_zeros(result);
    
    // Add negative sign if needed for formatting. 
    if (negative) {
        int len = strlen(result);
        // Shift characters manually for negative sign
        for (int i = len; i >= 0; i--) {
            result[i + 1] = result[i];
        }
        result[0] = '-';
    }
    
    return result;
}
