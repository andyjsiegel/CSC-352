/*
 * File: anagrams2.c
 * Author: Andy Siegel
 * Purpose: To read a list of words from standard input and group them into anagrams.
 *          Each group of anagrams is printed on a separate line.
 *          The program checks for invalid words (non-alphabetic characters) and
 *          prints an error message for each invalid word, continuing to process
 *          the rest of the input. 
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_WORD_LENGTH 64

typedef struct WordNode {
    char *word;
    struct WordNode *next;
} WordNode;

typedef struct AnagramGroup {
    WordNode *words;
    struct AnagramGroup *next;
} AnagramGroup;

/* toLowerCase(char *str) -- takes a pointer to a string
 * and converts all the characters to lowercase. 
 */
void toLowerCase(char *str) {
    for (int i = 0; str[i]; i++) {
        str[i] = tolower(str[i]);
    }
}
/* isAnagram(const char *word1, const char *word2) -- takes pointers to two strings and 
 * checks if they are anagrams of each other. First, it checks if their lengths are equal. 
 * Then, it converts both strings to lower case, and gets the frequency of all the letters 
 * of the first string, then subtracts the frequency of each letter in the second string. 
 * If the array is still all 0s, then the words are anagrams. Otherwise, they're not. 
 */
int isAnagram(const char *word1, const char *word2) {
    if (strlen(word1) != strlen(word2)) {
        return 0;
    }

    char lowerWord1[MAX_WORD_LENGTH + 1];
    char lowerWord2[MAX_WORD_LENGTH + 1];

    strcpy(lowerWord1, word1);
    strcpy(lowerWord2, word2);

    toLowerCase(lowerWord1);
    toLowerCase(lowerWord2);

    int count[26] = {0}; // initialize count of each letter to 0

    // count frequency of each letter
    for (int i = 0; lowerWord1[i]; i++) {
        count[lowerWord1[i] - 'a']++;
    }

    // subtract frequency from second word
    for (int i = 0; lowerWord2[i]; i++) {
        count[lowerWord2[i] - 'a']--;
    }

    // assert all counts are zero, if they are -> words are anagrams & return 1
    for (int i = 0; i < 26; i++) {
        if (count[i] != 0) {
            return 0;
        }
    }

    return 1;
}
/* addWordToGroup(AnagramGroup *group, const char *word) -- takes a pointer to 
 * an AnagramGroup and a word, creates a new WordNode for the word, and adds it to the
 * given AnagramGroup's linked list of words.
 */
void addWordToGroup(AnagramGroup *group, const char *word) {
    WordNode *newWordNode = (WordNode *)malloc(sizeof(WordNode));
    newWordNode->word = strdup(word);
    newWordNode->next = NULL;

    if (group->words == NULL) {
        group->words = newWordNode;
    } else {
        WordNode *current = group->words;
        while (current->next != NULL) {
            current = current->next;
        }
        current->next = newWordNode;
    }
}

/* AnagramGroup *findOrCreateGroup(AnagramGroup **groups, const char *word) -- passes the head 
 * of the AnagramsGroup linked list by reference and a word, searches for an existing group of anagrams
 * that the word belongs to. If found, it returns a pointer to that group. If not found, it creates a new 
 * AnagramGroup, adds it to the linked list, and returns a pointer to the new group.
 */
AnagramGroup *findOrCreateGroup(AnagramGroup **groups, const char *word) {
    AnagramGroup *currentGroup = *groups;

    while (currentGroup != NULL) {
        WordNode *currentWord = currentGroup->words;
        if (isAnagram(currentWord->word, word)) {
            return currentGroup;
        }
        currentGroup = currentGroup->next;
    }

    AnagramGroup *newGroup = (AnagramGroup *) malloc(sizeof(AnagramGroup));
    newGroup->words = NULL;
    newGroup->next = NULL;

    if (*groups == NULL) {
        *groups = newGroup;
    } else {
        currentGroup = *groups;
        while (currentGroup->next != NULL) {
            currentGroup = currentGroup->next;
        }
        currentGroup->next = newGroup;
    }

    return newGroup;
}

/* isValidWord(const char *word) -- takes a pointer to a word and
 * iterates through each character to determine if it's a valid word.*/
int isValidWord(const char *word) {
    for (int i = 0; word[i]; i++) {
        if (!isalpha(word[i])) {
            return 0;
        }
    }
    return 1;
}

int main() {
    AnagramGroup *groups = NULL;
    char word[MAX_WORD_LENGTH + 1];
    int error = 0;

    while (scanf("%64s", word) == 1) {
        if (!isValidWord(word)) {
            fprintf(stderr, "Error: Invalid word '%s'\n", word);
            error = 1;
            continue;
        }

        AnagramGroup *group = findOrCreateGroup(&groups, word);
        addWordToGroup(group, word);
    }

    AnagramGroup *currentGroup = groups;
    while (currentGroup != NULL) {
        WordNode *currentWord = currentGroup->words;
        while (currentWord != NULL) {
            printf("%s ", currentWord->word);
            currentWord = currentWord->next;
        }
        printf("\n");
        currentGroup = currentGroup->next;
    }

    return error;
}
