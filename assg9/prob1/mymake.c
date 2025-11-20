#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "graph.h"

// Helper to trim leading/trailing whitespace from a string
char *trim_whitespace(char *str) {
    char *end;
    while (isspace((unsigned char)*str)) str++;
    if (*str == 0) return str;
    end = str + strlen(str) - 1;
    while (end > str && isspace((unsigned char)*end)) end--;
    end[1] = '\0';
    return str;
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: mymake <makefile> <target>\n");
        exit(1);
    }

    char *makefile_name = argv[1];
    char *target_name = argv[2];

    FILE *file = fopen(makefile_name, "r");
    if (file == NULL) {
        perror(makefile_name);
        exit(1);
    }

    NodeList *all_nodes = NULL;
    Node *last_target = NULL;

    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    while ((read = getline(&line, &len, file)) != -1) {
        // Strip newline character
        if (read > 0 && line[read - 1] == '\n') {
            line[read - 1] = '\0';
        }

        if (strlen(line) == 0) continue; // Skip empty lines

        if (line[0] == '\t') {
            // This is a command line
            if (last_target == NULL) {
                fprintf(stderr, "%s: illegal format: command without target on line\n", makefile_name);
                free(line);
                fclose(file);
                free_graph(all_nodes);
                exit(1);
            }
            add_command(last_target, line + 1);
        } else {
            // This is a target-dependency line
            char *colon = strchr(line, ':');
            if (colon == NULL) {
                fprintf(stderr, "%s: illegal format: missing colon in target line\n", makefile_name);
                free(line);
                fclose(file);
                free_graph(all_nodes);
                exit(1);
            }

            *colon = '\0'; // Split line into target and dependencies
            char *target_str = trim_whitespace(line);
            char *deps_str = colon + 1;

            if (strlen(target_str) == 0) {
                 fprintf(stderr, "%s: illegal format: missing target name\n", makefile_name);
                free(line);
                fclose(file);
                free_graph(all_nodes);
                exit(1);
            }
            
            Node *target_node = find_node(all_nodes, target_str);
            if (target_node == NULL) {
                target_node = create_node(target_str);
                add_node_to_list(&all_nodes, target_node);
            } else {
                if (target_node->is_target) {
                    fprintf(stderr, "%s: illegal format: duplicate target '%s'\n", makefile_name, target_str);
                    free(line);
                    fclose(file);
                    free_graph(all_nodes);
                    exit(1);
                }
            }
            target_node->is_target = 1;
            last_target = target_node;

            // Process dependencies
            char *dep_token = strtok(deps_str, " \t");
            while (dep_token != NULL) {
                Node *dep_node = find_node(all_nodes, dep_token);
                if (dep_node == NULL) {
                    dep_node = create_node(dep_token);
                    add_node_to_list(&all_nodes, dep_node);
                }
                add_dependency(target_node, dep_node);
                dep_token = strtok(NULL, " \t");
            }
        }
    }
    free(line);
    fclose(file);

    // Find the final target to start traversal
    Node *final_target = find_node(all_nodes, target_name);
    if (final_target == NULL) {
        fprintf(stderr, "Target '%s' not found in makefile.\n", target_name);
        free_graph(all_nodes);
        exit(1);
    }

    // Perform traversal and print
    post_order_traverse(final_target);

    // Cleanup
    free_graph(all_nodes);

    return 0;
}
