/*
 * File: count2.c
 * Author: Andy Siegel
 * Purpose: To count an indeterminate number of integers, 
 *   allocating memory dynamically. The program loads each number into 
 *   a linked list, then sorts them and counts the occurrences of each number.
 */

#include <stdio.h>
#include <stdlib.h>

struct node {
    int value;
    struct node *next;
};

/* 
 * bubbleSort(*head) -- sorts a linked list of integers in ascending 
 * order using the Bubble Sort algorithm. It takes a pointer to the 
 * head of the linked list as a parameter. The sorting is done in 
 * place, and the function does not return a value. 
 */
void bubbleSort(struct node *head) {
    struct node *ptr1, *ptr2;
    for(ptr1 = head; ptr1 != NULL; ptr1 = ptr1->next) {
        for(ptr2 = head; ptr2->next; ptr2 = ptr2->next) {
            if(ptr2->value > ptr2->next->value) {
                int temp = ptr2->value;
                ptr2->value = ptr2->next->value;
                ptr2->next->value = temp;
            }
        }
    }
}

/* 
 * countOccurrences(*head) -- counts and prints the occurrences of each 
 * unique integer in a sorted linked list. It takes a pointer to the 
 * head of the linked list as a parameter. The function prints each 
 * unique integer along with its count in the format "value count".
 */
void countOccurrences(struct node *head) {
    struct node *current = head;
    while (current != NULL) {
        int count = 1;
        struct node *runner = current->next;
        while (runner != NULL && runner->value == current->value) {
            count++;
            runner = runner->next;
        }
        printf("%d %d\n", current->value, count);
        current = runner;
    }
}

/* readValue() - Reads an integer from stdin and returns a pointer to a new node. 
Throws an error and exits if the input is invalid or memory allocation fails. */
struct node *readValue() {
    int value;
    int retVal;
    retVal = scanf("%d", &value);
    if(retVal == 0) {
        fprintf(stderr, "Invalid input. Please enter integers only.\n");
        exit(1);
    }
    if(retVal == EOF) {
        return NULL;
    }
    struct node *newNode = (struct node *) malloc(sizeof(struct node));
    if (newNode == NULL) {
        fprintf(stderr, "Memory allocation failed.\n");
        exit(1);
    }
    newNode->value = value;
    newNode->next = NULL;
    return newNode;
}

int main() {
    struct node *head = NULL;
    struct node *tail = NULL;
    struct node *newNode;
    while((newNode = readValue()) != NULL) {
        if(head == NULL) {
            head = newNode;
            tail = newNode;
        } else {
            tail->next = newNode;
            tail = newNode;
        }
    }

    struct node* current = head;

    bubbleSort(head);


    countOccurrences(head);

    current = head;
    while (current != NULL) {
        struct node *temp = current;
        current = current->next;
        free(temp);
    }

    return 0;
}