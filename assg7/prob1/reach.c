#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Forward declaration for EdgeNode
struct EdgeNode;

// Node for a vertex in the graph's vertex list
typedef struct VertexNode {
    char *name;
    struct EdgeNode *edges;   // Adjacency list: head of the linked list of edges
    int visited;              // Flag for DFS traversal
    struct VertexNode *next;  // Pointer to the next vertex in the main list
} VertexNode;

// Node for an edge in an adjacency list
typedef struct EdgeNode {
    VertexNode *vertex;       // Pointer to the destination vertex node
    struct EdgeNode *next;    // Pointer to the next edge in the adjacency list
} EdgeNode;

// Global head of the vertex list, representing the graph
VertexNode *vertexList = NULL;
// Global flag to track if any non-fatal errors occurred
int error_occurred = 0;

// function prototypes to avoid compiler warnings
VertexNode* findVertex(const char *vName);
void addVertex(const char *vName);
void addEdge(const char *vName1, const char *vName2);
void queryPath(const char *vName1, const char *vName2);
void resetVisited();
int dfs(VertexNode *fromNode, VertexNode *toNode);
void freeGraph();

int main(int argc, char *argv[]) {
    FILE *inputFile = stdin;

    // 1. Handle command-line arguments
    if (argc > 2) {
        fprintf(stderr, "Warning: More than one command-line argument specified. Using the first, ignoring others.\n");
        error_occurred = 1;
    }

    if (argc > 1) {
        inputFile = fopen(argv[1], "r");
        if (inputFile == NULL) {
            fprintf(stderr, "Error: Cannot open input file '%s'.\n", argv[1]);
            return 1; // Fatal error
        }
    }

    char *line = NULL;
    size_t len = 0;

    while (getline(&line, &len, inputFile) != EOF) {
        char op_char;
        char arg1[65], arg2[65];

        // The leading space in the format string consumes any whitespace.
        // this block accepts @e or @q with two args.
        if (sscanf(line, " @%c %64s %64s", &op_char, arg1, arg2) == 3) {
            if (op_char == 'e') {
                addEdge(arg1, arg2);
            } else if (op_char == 'q') {
                queryPath(arg1, arg2);
            } else {
                fprintf(stderr, "Warning: Malformed input line. Ignoring.\n");
                error_occurred = 1;
            }
        // this block accepts @n with one arg.
        } else if (sscanf(line, " @%c %64s", &op_char, arg1) == 2) {
            if (op_char == 'n') {
                addVertex(arg1);
            } else {
                fprintf(stderr, "Warning: Malformed input line. Ignoring.\n");
                error_occurred = 1;
            }
        // this block accepts empty or whitespace-only lines.
        } else {
            // sscanf failed to match. This is only acceptable for a truly empty line.
            // A line read by getline is "empty" if it only contains the newline character.
            if (strcmp(line, "\n") != 0 && line[0] != '\0') {
                fprintf(stderr, "Warning: Malformed input line. Ignoring.\n");
                error_occurred = 1;
            }
        }
    }

    free(line);
    if (inputFile != stdin) {
        fclose(inputFile);
    }

    freeGraph();

    return error_occurred;
}

/*
 * findVertex(const char *vName) - Finds a vertex in the global vertex list by its name.
 * Returns a pointer to the VertexNode if found, otherwise NULL.
 */
VertexNode* findVertex(const char *vName) {
    VertexNode *curr = vertexList;
    while (curr != NULL) {
        if (strcmp(curr->name, vName) == 0) {
            return curr;
        }
        curr = curr->next;
    }
    return NULL;
}

/*
 * addVertex(const char *vName) - Adds a new vertex to the graph.
 * Ignores the directive if the vertex already exists.
 */
void addVertex(const char *vName) {
    if (findVertex(vName) != NULL) {
        fprintf(stderr, "Warning: Vertex '%s' declared more than once. Ignoring.\n", vName);
        error_occurred = 1;
        return;
    }

    VertexNode *newNode = (VertexNode*) malloc(sizeof(VertexNode));
    if (newNode == NULL) {
        fprintf(stderr, "Fatal: Memory allocation failed for new vertex.\n");
        exit(1);
    }

    // strdup allocates memory and copies the string.
    newNode->name = strdup(vName);
    if (newNode->name == NULL) {
        fprintf(stderr, "Fatal: Memory allocation failed for vertex name.\n");
        free(newNode);
        exit(1);
    }
    
    newNode->edges = NULL;
    newNode->visited = 0;
    newNode->next = vertexList; // Add to the front of the global vertex list
    vertexList = newNode;
}

/*
 * addEdge(const char *vName1, const char *vName2) - Adds a directed edge from vName1 to vName2.
 * Ignores the directive if either vertex doesn't exist or if the edge already exists.
 */
void addEdge(const char *vName1, const char *vName2) {
    VertexNode *fromNode = findVertex(vName1);
    VertexNode *toNode = findVertex(vName2);

    if (fromNode == NULL || toNode == NULL) {
        fprintf(stderr, "Warning: Edge declaration contains an undeclared vertex. Ignoring.\n");
        error_occurred = 1;
        return;
    }

    // Check if the edge already exists to avoid duplicates
    EdgeNode *currEdge = fromNode->edges;
    while (currEdge != NULL) {
        if (currEdge->vertex == toNode) {
            return; // Edge already exists, do nothing.
        }
        currEdge = currEdge->next;
    }

    // Add the new edge to the front of the adjacency list
    EdgeNode *newEdge = (EdgeNode*) malloc(sizeof(EdgeNode));
    if (newEdge == NULL) {
        fprintf(stderr, "Fatal: Memory allocation failed for new edge.\n");
        exit(1);
    }
    newEdge->vertex = toNode;
    newEdge->next = fromNode->edges;
    fromNode->edges = newEdge;
}

/*
 * queryPath(const char *vName1, const char *vName2) - Queries if a path exists from vName1 to vName2 using DFS.
 * Prints 1 if a path exists, 0 otherwise.
 */
void queryPath(const char *vName1, const char *vName2) {
    VertexNode *fromNode = findVertex(vName1);
    VertexNode *toNode = findVertex(vName2);

    if (fromNode == NULL || toNode == NULL) {
        fprintf(stderr, "Warning: Query contains an undeclared vertex. Path does not exist.\n");
        error_occurred = 1;
        return;
    }

    resetVisited(); // Reset visited flags for all nodes before traversal
    int pathExists = dfs(fromNode, toNode);
    printf("%d\n", pathExists);
}

// --- DFS Algorithm and Helpers ---

/*
 * resetVisited() - Resets the 'visited' flag for all vertices in the graph.
 * This must be called before each new DFS traversal (i.e., each @q query).
 */
void resetVisited() {
    VertexNode *curr = vertexList;
    while (curr != NULL) {
        curr->visited = 0;
        curr = curr->next;
    }
}

/*
 * dfs(VertexNode *fromNode, VertexNode *toNode) - Performs a depth-first search to find a path from fromNode to toNode.
 * Returns 1 if a path is found, 0 otherwise.
 */
int dfs(VertexNode *fromNode, VertexNode *toNode) {
    if (fromNode == toNode) return 1;
    if (fromNode->visited) return 0;

    fromNode->visited = 1;

    EdgeNode *successorEdge = fromNode->edges;
    while (successorEdge != NULL) {
        if (dfs(successorEdge->vertex, toNode)) {
            return 1; // Path found through this successor
        }
        successorEdge = successorEdge->next;
    }

    return 0; // No path found from this node
}

/*
 * freeGraph() - Frees all dynamically allocated memory for the graph.
 * Iterates through vertices, frees their edge lists, names, and the vertices themselves.
 */
void freeGraph() {
    VertexNode *currVertex = vertexList;
    while (currVertex != NULL) {
        // Free the adjacency list for the current vertex
        EdgeNode *currEdge = currVertex->edges;
        while (currEdge != NULL) {
            EdgeNode *tempEdge = currEdge;
            currEdge = currEdge->next;
            free(tempEdge);
        }

        // Free the vertex itself
        VertexNode *tempVertex = currVertex;
        currVertex = currVertex->next;
        free(tempVertex->name); // Free the duplicated string
        free(tempVertex);
    }
    vertexList = NULL; // Avoid dangling pointer
}
