#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "graph.h"

/* find_node(NodeList *head, const char *name) - finds a node in the list by name, returns null if not found */
Node* find_node(NodeList *head, const char *name) {
    NodeList *current = head;
    while (current != NULL) {
        if (strcmp(current->node->name, name) == 0) {
            return current->node;
        }
        current = current->next;
    }
    return NULL;
}

/* create_node(const char *name) - creates a node */
Node* create_node(const char *name) {
    Node *newNode = (Node*)malloc(sizeof(Node));
    if (newNode == NULL) {
        perror("malloc");
        exit(1);
    }
    newNode->name = strdup(name);
    if (newNode->name == NULL) {
        perror("strdup");
        exit(1);
    }
    newNode->dependencies = NULL;
    newNode->num_dependencies = 0;
    newNode->commands = NULL;
    newNode->num_commands = 0;
    newNode->visited = 0;
    newNode->is_target = 0;
    return newNode;
}

/* add_node_to_list(NodeList **head, Node *newNode) - adds a node to the linked list. */
void add_node_to_list(NodeList **head, Node *newNode) {
    NodeList *newElem = (NodeList*)malloc(sizeof(NodeList));
    if (newElem == NULL) {
        perror("malloc");
        exit(1);
    }
    newElem->node = newNode;
    newElem->next = *head;
    *head = newElem;
}

/* add_dependency(Node *target, Node *dependency) - adds a dependency to a node */
void add_dependency(Node *target, Node *dependency) {
    // Allocate new, larger array
    Node **new_deps = malloc(sizeof(Node*) * (target->num_dependencies + 1));
    if (new_deps == NULL) {
        perror("malloc");
        exit(1);
    }
    // Copy old dependencies
    for (int i = 0; i < target->num_dependencies; i++) {
        new_deps[i] = target->dependencies[i];
    }
    // Add the new one
    new_deps[target->num_dependencies] = dependency;
    
    // Free old array and update target
    free(target->dependencies);
    target->dependencies = new_deps;
    target->num_dependencies++;
}

/* add_command(Node *target, const char *command) - adds a command to a target node */
void add_command(Node *target, const char *command) {
    // Allocate new, larger array for command pointers
    char **new_cmds = malloc(sizeof(char*) * (target->num_commands + 1));
    if (new_cmds == NULL) {
        perror("malloc");
        exit(1);
    }
    // Copy old command pointers
    for (int i = 0; i < target->num_commands; i++) {
        new_cmds[i] = target->commands[i];
    }
    // Add the new command
    new_cmds[target->num_commands] = strdup(command);
    if (new_cmds[target->num_commands] == NULL) {
        perror("strdup");
        exit(1);
    }

    // Free old array and update target
    free(target->commands);
    target->commands = new_cmds;
    target->num_commands++;
}

/* post_order_traverse(Node *node) - Perform post-order traversal (DFS) */
void post_order_traverse(Node *node) {
    if (node == NULL || node->visited) {
        return;
    }

    // Mark as visited to handle cycles and avoid re-processing
    node->visited = 1;

    // Recurse on dependencies
    for (int i = 0; i < node->num_dependencies; i++) {
        post_order_traverse(node->dependencies[i]);
    }

    // Process the node itself
    printf("%s\n", node->name);
    for (int i = 0; i < node->num_commands; i++) {
        printf("  %s\n", node->commands[i]);
    }
}

/* free_graph(NodeList *head) - Free all allocated memory */
void free_graph(NodeList *head) {
    NodeList *current = head;
    while (current != NULL) {
        Node *node = current->node;
        free(node->name);
        free(node->dependencies);
        for (int i = 0; i < node->num_commands; i++) {
            free(node->commands[i]);
        }
        free(node->commands);
        free(node);
        
        NodeList *temp = current;
        current = current->next;
        free(temp);
    }
}
