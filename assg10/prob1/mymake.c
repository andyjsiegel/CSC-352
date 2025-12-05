#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "graph.h"

/* trim_whitespace(char *str) - helper to clean out whitespace from str */
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
    char *makefile_name = "myMakefile";
    char *target_name = NULL;
    int f_flag_found = 0;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-f") == 0) {
            if (f_flag_found) {
                fprintf(stderr, "Error: -f appears more than once.\n");
                exit(1);
            }
            i++;
            if (i >= argc) {
                fprintf(stderr, "Error: A file name does not follow a -f argument.\n");
                exit(1);
            }
            makefile_name = argv[i];
            f_flag_found = 1;
        } else {
            if (target_name != NULL) {
                fprintf(stderr, "Error: More than one target is specified.\n");
                exit(1);
            }
            target_name = argv[i];
        }
    }

    FILE *file = fopen(makefile_name, "r");
    if (file == NULL) {
        perror(makefile_name);
        exit(1);
    }

    NodeList *all_nodes = NULL;
    Node *last_target = NULL;
    Node *first_target = NULL;

    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    while ((read = getline(&line, &len, file)) != -1) {
        if (read > 0 && line[read - 1] == '\n') {
            line[read - 1] = '\0';
        }

        if (strlen(line) == 0 || line[0] == '#') continue;

        if (line[0] == '\t') {
            if (last_target == NULL) {
                fprintf(stderr, "%s: illegal format: command without target on line\n", makefile_name);
                free(line);
                fclose(file);
                free_graph(all_nodes);
                exit(1);
            }
            add_command(last_target, line + 1);
        } else {
            char *colon = strchr(line, ':');
            if (colon == NULL) continue; 

            *colon = '\0';
            char *target_str = trim_whitespace(line);
            char *deps_str = colon + 1;

            if (strlen(target_str) == 0) continue;
            
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
            
            if (first_target == NULL) {
                first_target = target_node;
            }
            target_node->is_target = 1;
            last_target = target_node;

            char *dep_token = deps_str;
            int offset = 0;
            char token[256];

            while (sscanf(dep_token + offset, "%255s%n", token, &offset) == 1) {
                Node *dep_node = find_node(all_nodes, token);
                if (dep_node == NULL) {
                    dep_node = create_node(token);
                    add_node_to_list(&all_nodes, dep_node);
                }
                add_dependency(target_node, dep_node);
                
                // Skip whitespace
                while (*(dep_token + offset) && isspace((unsigned char)*(dep_token + offset))) {
                    offset++;
                }
            }

        }
    }
    free(line);
    fclose(file);

    Node *final_target = NULL;
    if (target_name != NULL) {
        final_target = find_node(all_nodes, target_name);
        if (final_target == NULL) {
            fprintf(stderr, "Target '%s' not found in makefile.\n", target_name);
            free_graph(all_nodes);
            exit(1);
        }
    } else {
        final_target = first_target;
    }

    int commands_executed = 0;
    if (final_target != NULL) {
        process_node(final_target, &commands_executed, all_nodes);
        if (!commands_executed) {
            printf("mymake: '%s' is up to date.\n", final_target->name);
        }
    }

    free_graph(all_nodes);
    return 0;
}
