/*
 * File: graph.c
 * Author: Andy Siegel
 * Purpose: To build a graph of dependencies to simulate how Make works. 
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include "graph.h"

/* find_node(NodeList *head, const char *name) - finds a node in the linked list by name */
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

/* create_node(const char *name) - creates a new node with the given name */
Node* create_node(const char *name) {
    Node *newNode = (Node*)malloc(sizeof(Node));
    if (newNode == NULL) {
        perror("malloc for node");
        exit(1);
    }
    newNode->name = strdup(name);
    if (newNode->name == NULL) {
        perror("strdup for node name");
        exit(1);
    }
    newNode->dependencies = NULL;
    newNode->num_dependencies = 0;
    newNode->commands = NULL;
    newNode->num_commands = 0;
    newNode->visited = 0;
    newNode->is_target = 0;
    newNode->completed = 0;
    newNode->mod_time = 0;
    newNode->exists = 0;
    newNode->must_build = 0;
    return newNode;
}

/* add_node_to_list(NodeList **head, Node *newNode) - adds a node to the front of the linked list */
void add_node_to_list(NodeList **head, Node *newNode) {
    NodeList *newElem = (NodeList*)malloc(sizeof(NodeList));
    if (newElem == NULL) {
        perror("malloc for node list element");
        exit(1);
    }
    newElem->node = newNode;
    newElem->next = *head;
    *head = newElem;
}

/* add_dependency(Node *target, Node *dependency) - adds a dependency to the target node */
void add_dependency(Node *target, Node *dependency) {
    DepList *new_dep = (DepList*)malloc(sizeof(DepList));
    if (new_dep == NULL) {
        perror("malloc for dependency list element");
        exit(1);
    }
    new_dep->dependency = dependency;
    new_dep->next = NULL;

    if (target->dependencies == NULL) {
        target->dependencies = new_dep;
    } else {
        DepList *current = target->dependencies;
        while (current->next != NULL) {
            current = current->next;
        }
        current->next = new_dep;
    }
    target->num_dependencies++;
}

/* add_command(Node *target, const char *command) - adds a command to the target node */
void add_command(Node *target, const char *command) {
    CmdList *new_cmd = (CmdList*)malloc(sizeof(CmdList));
    if (new_cmd == NULL) {
        perror("malloc for command list element");
        exit(1);
    }
    new_cmd->command = strdup(command);
    if (new_cmd->command == NULL) {
        perror("strdup for command");
        exit(1);
    }
    new_cmd->next = NULL;

    if (target->commands == NULL) {
        target->commands = new_cmd;
    } else {
        CmdList *current = target->commands;
        while (current->next != NULL) {
            current = current->next;
        }
        current->next = new_cmd;
    }
    target->num_commands++;
}

/* process_node(Node *node, int *commands_executed, NodeList *all_nodes) - processes a node and its dependencies */
void process_node(Node *node, int *commands_executed, NodeList *all_nodes) {
    if (node->visited) {
        return;
    }
    node->visited = 1;

    struct stat st;
    if (stat(node->name, &st) == 0) {
        node->exists = 1;
        node->mod_time = st.st_mtime;
    } else {
        node->exists = 0;
    }

    if (!node->exists) {
        if (node->is_target) {
            node->must_build = 1;
        } else {
            fprintf(stderr, "mymake: *** No rule to make target '%s'. Stop.\n", node->name);
            free_graph(all_nodes);
            exit(1);
        }
    }

    DepList *dep_current = node->dependencies;
    while (dep_current != NULL) {
        Node *dep = dep_current->dependency;
        process_node(dep, commands_executed, all_nodes);

        if (!dep->completed) {
            fprintf(stderr, "Circular dependency detected involving target '%s'.\n", dep->name);
        } else {
            if (!node->must_build) {
                if (!dep->exists || (dep->exists && node->exists && dep->mod_time > node->mod_time)) {
                    node->must_build = 1;
                }
            }
        }
        dep_current = dep_current->next;
    }

    if (node->must_build) {
        CmdList *cmd_current = node->commands;
        while (cmd_current != NULL) {
            printf("%s\n", cmd_current->command);
            fflush(stdout);
            int status = system(cmd_current->command);
            if (status != 0) {
                if (WIFEXITED(status)) {
                    fprintf(stderr, "mymake: *** [%s] Error %d\n", node->name, WEXITSTATUS(status));
                }
                free_graph(all_nodes);
                exit(1);
            }
            if(commands_executed != NULL) *commands_executed = 1;
            cmd_current = cmd_current->next;
        }

        if (stat(node->name, &st) == 0) {
            node->exists = 1;
            node->mod_time = st.st_mtime;
        } else {
            node->exists = 0;
        }
    }

    node->completed = 1;
}

/* free_graph(NodeList *head) - frees all allocated memory for the graph */
void free_graph(NodeList *head) {
    NodeList *current_node_item = head;
    while (current_node_item != NULL) {
        Node *node = current_node_item->node;

        // Free dependency list
        DepList *current_dep = node->dependencies;
        while (current_dep != NULL) {
            DepList *temp_dep = current_dep;
            current_dep = current_dep->next;
            free(temp_dep);
        }

        // Free command list
        CmdList *current_cmd = node->commands;
        while (current_cmd != NULL) {
            free(current_cmd->command);
            CmdList *temp_cmd = current_cmd;
            current_cmd = current_cmd->next;
            free(temp_cmd);
        }

        free(node->name);
        free(node);
        
        NodeList *temp_node_item = current_node_item;
        current_node_item = current_node_item->next;
        free(temp_node_item);
    }
}
