#include <stdio.h>
#include <stdlib.h>

/* 
 * bubbleSort(numbers, n) -- sorts an array of integers in ascending 
 * order using the Bubble Sort algorithm. It takes a pointer to the 
 * array of integers and the number of elements in the array as 
 * parameters. The sorting is done in place, and the function does 
 * not return a value. 
 */
void bubbleSort(int *numbers, int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (numbers[j] > numbers[j + 1]) {
                // Swap numbers[j] and numbers[j + 1]
                int temp = numbers[j];
                numbers[j] = numbers[j + 1];
                numbers[j + 1] = temp;
            }
        }
    }
}

void countOccurrences(int *arr, int size) {
    for(int i = 0; i < size; ) {
        int count = 1;
        int current = arr[i];
        while (i + count < size && arr[i + count] == current) {
            count++;
        }
        printf("%d %d\n", current, count);
        i += count;
    }
}

int main() {
    int n; // number of integers to be read.
    int retVal = scanf("%d", &n); // read in the number of integers
    if(retVal != 1 || n <= 0) {
        fprintf(stderr, "Value must be a valid integer\n");
        return 1;
    }

    int *numbers = (int *) malloc(n * sizeof(int));

    if (numbers == NULL) {
        fprintf(stderr, "Memory allocation failed.\n");
        return 1;
    }
    
    for (int i = 0; i < n; i++) {
        if(scanf("%d", &numbers[i]) == EOF && i < n) {
            fprintf(stderr, "Not enough integers provided.\n");
            free(numbers);
            return 1;
        }
    }

    bubbleSort(numbers, n);

    countOccurrences(numbers, n);

    free(numbers);
    return 0;

}