#ifndef GRAPH_H
#define GRAPH_H

#include <time.h>

// Forward declare Node to be used in DepList
struct Node;

// Linked list for dependencies
typedef struct DepList {
    struct Node *dependency;
    struct DepList *next;
} DepList;

// Linked list for commands
typedef struct CmdList {
    char *command;
    struct CmdList *next;
} CmdList;

// Node structure representing a target or dependency
typedef struct Node {
    char *name;
    DepList *dependencies;
    int num_dependencies;
    CmdList *commands;
    int num_commands;
    int visited;
    int is_target;
    int completed;
    time_t mod_time;
    int exists;
    int must_build;
} Node;

// Linked list of all nodes in the graph
typedef struct NodeList {
    Node *node;
    struct NodeList *next;
} NodeList;

// Function prototypes
Node* find_node(NodeList *head, const char *name);
Node* create_node(const char *name);
void add_node_to_list(NodeList **head, Node *newNode);
void add_dependency(Node *target, struct Node *dependency);
void add_command(Node *target, const char *command);
void process_node(Node *node, int *commands_executed, NodeList *all_nodes);
void free_graph(NodeList *head);

#endif
