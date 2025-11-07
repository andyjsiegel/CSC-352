/*
 * File: minDistance.c
 * Author: Andy Siegel
 * Purpose: To create a weighted graph of cities, then calculate the minimum distance between two cities from a query.
 *          Cities and weights (distances) are inputted via a file, then queries are read in through stdin.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

// Structure for an edge in the graph
typedef struct Edge {
    int dist;
    struct Node* dest;
    struct Edge* next;
} Edge;

// Structure for a node in the graph
typedef struct Node {
    char* name;
    int minDist;
    int marked;
    Edge* edge_head;
    struct Node* next;
} Node;

// Structure for the graph
typedef struct Graph {
    Node* node_head;
} Graph;

// Function prototypes
Graph* create_graph();
Node* find_or_create_node(Graph* graph, const char* name);
void add_edge(Node* src, Node* dest, int dist);
void free_graph(Graph* graph);
void dijkstra(Graph* graph, Node* start_node);
Node* get_node(Graph* graph, const char* name);


int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* file = fopen(argv[1], "r");
    if (file == NULL) {
        fprintf(stderr, "Error: Cannot open file '%s' for reading.\n", argv[1]);
        return 1;
    }

    Graph* graph = create_graph();

    // Read the graph from the file
    char* line = NULL;
    size_t len = 0;
    while (getline(&line, &len, file) != -1) {
        char name1[65], name2[65];
        int dist;
        if (sscanf(line, "%64s %64s %d", name1, name2, &dist) == 3) {
            Node* node1 = find_or_create_node(graph, name1);
            Node* node2 = find_or_create_node(graph, name2);
            add_edge(node1, node2, dist);
            add_edge(node2, node1, dist);
        }
    }
    fclose(file);

    // Process queries from stdin
    while (getline(&line, &len, stdin) != EOF) {
        char name1[65], name2[65];
        if (sscanf(line, "%64s %64s", name1, name2) == 2) {
            Node* start_node = get_node(graph, name1);
            Node* end_node = get_node(graph, name2);

            if (start_node == NULL || end_node == NULL) {
                continue;
            }

            dijkstra(graph, start_node);

            if (end_node->minDist == INT_MAX) {
                // no path found, or overflow idk
            } else {
                printf("%d\n", end_node->minDist);
            }
        }
    }

    free(line);
    free_graph(graph);

    return 0;
}

/* create_graph() - initializes and returns an empty graph. */
Graph* create_graph() {
    Graph* graph = (Graph*)malloc(sizeof(Graph));
    if (graph == NULL) {
        fprintf(stderr, "Error: Memory allocation failed for graph.\n");
        exit(1);
    }
    graph->node_head = NULL;
    return graph;
}

/* find_or_create_node(Graph* graph, const char* name) - finds a node by name or creates it if it doesn't exist. */
Node* find_or_create_node(Graph* graph, const char* name) {
    Node* current = graph->node_head;
    while (current != NULL) {
        if (strcmp(current->name, name) == 0) {
            return current;
        }
        current = current->next;
    }

    // Node not found, create a new one
    Node* new_node = (Node*)malloc(sizeof(Node));
    if (new_node == NULL) {
        fprintf(stderr, "Error: Memory allocation failed for new node.\n");
        exit(1);
    }
    new_node->name = strdup(name);
    if (new_node->name == NULL) {
        fprintf(stderr, "Error: Memory allocation failed for node name.\n");
        exit(1);
    }
    new_node->minDist = INT_MAX;
    new_node->marked = 0;
    new_node->edge_head = NULL;
    new_node->next = graph->node_head;
    graph->node_head = new_node;

    return new_node;
}

/* add_edge(Node* src, Node* dest, int dist) - add an edge to a node's adjacency list */
void add_edge(Node* src, Node* dest, int dist) {
    // Check if an edge already exists
    Edge* current_edge = src->edge_head;
    while (current_edge != NULL) {
        if (current_edge->dest == dest) {
            // Edge already exists, do nothing
            return;
        }
        current_edge = current_edge->next;
    }

    Edge* new_edge = (Edge*)malloc(sizeof(Edge));
    if (new_edge == NULL) {
        fprintf(stderr, "Error: Memory allocation failed for new edge.\n");
        exit(1);
    }
    new_edge->dist = dist;
    new_edge->dest = dest;
    new_edge->next = src->edge_head;
    src->edge_head = new_edge;
}

/* get_node(Graph* graph, const char* name) - Function to get a node by name */
Node* get_node(Graph* graph, const char* name) {
    Node* current = graph->node_head;
    while (current != NULL) {
        if (strcmp(current->name, name) == 0) {
            return current;
        }
        current = current->next;
    }
    return NULL;
}


/* djikstra(Graph* graph, Node* start_node) - Implements Dijkstra's algorithm to find the minimum distance from start_node to all other nodes. */
void dijkstra(Graph* graph, Node* start_node) {
    // Initialization
    for (Node* n = graph->node_head; n != NULL; n = n->next) {
        n->minDist = INT_MAX;
        n->marked = 0;
    }
    start_node->minDist = 0;

    while (1) {
        // Find the unmarked node with the smallest minDist
        Node* u = NULL;
        int min_dist = INT_MAX;
        for (Node* n = graph->node_head; n != NULL; n = n->next) {
            if (!n->marked && n->minDist < min_dist) {
                min_dist = n->minDist;
                u = n;
            }
        }

        if (u == NULL) {
            // No more reachable nodes
            break;
        }

        u->marked = 1;

        // For each neighbor v of u
        for (Edge* e = u->edge_head; e != NULL; e = e->next) {
            Node* v = e->dest;
            if (!v->marked) {
                int new_dist = u->minDist + e->dist;
                if (new_dist < v->minDist) {
                    v->minDist = new_dist;
                }
            }
        }
    }
}


/* free_graph(Graph* graph) - Frees all memory allocated for the graph. */
void free_graph(Graph* graph) {
    if (graph == NULL) {
        return;
    }

    Node* current_node = graph->node_head;
    while (current_node != NULL) {
        Node* temp_node = current_node;
        current_node = current_node->next;

        // Free the node's name
        free(temp_node->name);

        // Free the edges
        Edge* current_edge = temp_node->edge_head;
        while (current_edge != NULL) {
            Edge* temp_edge = current_edge;
            current_edge = current_edge->next;
            free(temp_edge);
        }

        free(temp_node);
    }

    free(graph);
}
