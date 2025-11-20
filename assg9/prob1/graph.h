#ifndef GRAPH_H
#define GRAPH_H

// Node to represent a target in the dependency graph
typedef struct Node {
    char *name;
    struct Node **dependencies;
    int num_dependencies;
    char **commands;
    int num_commands;
    int visited; // Flag for post-order traversal
    int is_target; // Flag to check for duplicate targets
} Node;

// A list to keep track of all nodes created
typedef struct NodeList {
    Node *node;
    struct NodeList *next;
} NodeList;

// Function prototypes
Node* find_node(NodeList *head, const char *name);
Node* create_node(const char *name);
void add_node_to_list(NodeList **head, Node *newNode);
void add_dependency(Node *target, Node *dependency);
void add_command(Node *target, const char *command);
void post_order_traverse(Node *target);
void free_graph(NodeList *head);

#endif
