/*
 * File: bacon.c
 * Author: Andy Siegel
 * Purpose: This program calculates the "Bacon score" for actors based on a
 * given movie data file. It builds a graph where actors are vertices and
 * movies represent edges connecting actors who appeared in them together.
 * The program then uses a Breadth-First Search (BFS) to find the shortest
 * path from a given actor to "Kevin Bacon". It supports an optional '-l'
 * flag to print the path of actors and movies.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Forward declarations for structs
struct Actor;
struct Movie;

/*
 * MovieActorLink is a node in a linked list connecting an actor to a movie
 * they were in.
 */
struct MovieActorLink {
    struct Movie *movie;
    struct MovieActorLink *next;
};

/*
 * Actor is a vertex in the graph, representing a person.
 */
struct Actor {
    char *name;
    struct MovieActorLink *movies; // List of movies this actor was in
    struct Actor *next;           // For the global list of all actors

    // BFS-related fields
    int visited;
    int level;
    struct Actor *prev_actor_in_path;
    struct Movie *prev_movie_in_path;
};

/*
 * ActorMovieLink is a node in a linked list connecting a movie to an actor
 * who appeared in it.
 */
struct ActorMovieLink {
    struct Actor *actor;
    struct ActorMovieLink *next;
};

/*
 * Movie is an edge in the graph, representing a film.
 */
struct Movie {
    char *name;
    struct ActorMovieLink *actors; // List of actors in this movie
    struct Movie *next;          // For the global list of all movies
};

/*
 * QueueNode is a node for the queue used in BFS.
 */
struct QueueNode {
    struct Actor *actor;
    struct QueueNode *next;
};

/*
 * Queue represents a simple FIFO queue for the BFS algorithm.
 */
struct Queue {
    struct QueueNode *front;
    struct QueueNode *rear;
};

/*
 * find_actor(head, name) -- Searches for an actor by name in a linked list.
 */
struct Actor* find_actor(struct Actor *head, const char *name) {
    struct Actor *current = head;
    while (current != NULL) {
        if (strcmp(current->name, name) == 0) {
            return current;
        }
        current = current->next;
    }
    return NULL;
}

/*
 * add_actor(head_ptr, name) -- Creates and adds a new actor to a list if
 * they don't already exist.
 * @param head_ptr A pointer to the head of the actor list.
 * @param name The name of the actor to add.
 * @return A pointer to the new or existing Actor struct. Exits on memory failure.
 */
struct Actor* add_actor(struct Actor **head_ptr, const char *name) {
    struct Actor *actor = find_actor(*head_ptr, name);
    if (actor == NULL) {
        actor = malloc(sizeof(struct Actor));
        if (!actor) {
            fprintf(stderr, "Memory allocation failed for actor.\n");
            exit(1);
        }
        actor->name = strdup(name);
        if (!actor->name) {
            fprintf(stderr, "Memory allocation failed for actor name.\n");
            exit(1);
        }
        actor->movies = NULL;
        actor->next = *head_ptr;
        *head_ptr = actor;
    }
    return actor;
}

/*
 * add_movie(head_ptr, name) -- Creates and adds a new movie to a list.
 * @param head_ptr A pointer to the head of the movie list.
 * @param name The name of the movie to add.
 * @return A pointer to the new Movie struct. Exits on memory failure.
 */
struct Movie* add_movie(struct Movie **head_ptr, const char *name) {
    struct Movie *movie = malloc(sizeof(struct Movie));
    if (!movie) {
        fprintf(stderr, "Memory allocation failed for movie.\n");
        exit(1);
    }
    movie->name = strdup(name);
    if (!movie->name) {
        fprintf(stderr, "Memory allocation failed for movie name.\n");
        exit(1);
    }
    movie->actors = NULL;
    movie->next = *head_ptr;
    *head_ptr = movie;
    return movie;
}

/*
 * link_actor_and_movie(actor, movie) -- Creates a bidirectional link
 * between an actor and a movie.
 */
void link_actor_and_movie(struct Actor *actor, struct Movie *movie) {
    // Add movie to actor's list
    struct MovieActorLink *new_movie_link = malloc(sizeof(struct MovieActorLink));
    if (!new_movie_link) exit(1);
    new_movie_link->movie = movie;
    new_movie_link->next = actor->movies;
    actor->movies = new_movie_link;

    // Add actor to movie's list
    struct ActorMovieLink *new_actor_link = malloc(sizeof(struct ActorMovieLink));
    if (!new_actor_link) exit(1);
    new_actor_link->actor = actor;
    new_actor_link->next = movie->actors;
    movie->actors = new_actor_link;
}

/*
 * create_queue() -- Creates and initializes an empty queue.
 */
struct Queue* create_queue() {
    struct Queue *q = malloc(sizeof(struct Queue));
    if (!q) exit(1);
    q->front = q->rear = NULL;
    return q;
}

/*
 * enqueue(q, actor) -- Adds an actor to the rear of the queue.
 */
void enqueue(struct Queue *q, struct Actor *actor) {
    struct QueueNode *newNode = malloc(sizeof(struct QueueNode));
    if (!newNode) exit(1);
    newNode->actor = actor;
    newNode->next = NULL;
    if (q->rear == NULL) {
        q->front = q->rear = newNode;
        return;
    }
    q->rear->next = newNode;
    q->rear = newNode;
}

/*
 * dequeue(q) -- Removes an actor from the front of the queue.
 */
struct Actor* dequeue(struct Queue *q) {
    if (q->front == NULL) return NULL;
    struct QueueNode *temp = q->front;
    struct Actor *actor = temp->actor;
    q->front = q->front->next;
    if (q->front == NULL) {
        q->rear = NULL;
    }
    free(temp);
    return actor;
}

/*
 * free_queue(q) -- Frees all memory associated with a queue.
 */
void free_queue(struct Queue* q) {
    while(dequeue(q) != NULL);
    free(q);
}

/*
 * bfs(start_actor, end_actor_name) -- Performs a Breadth-First Search to find the
 * shortest path from a starting actor to a target actor.
 */
int bfs(struct Actor *all_actors, struct Actor *start_actor, struct Actor *end_actor) {
    if (start_actor == end_actor) return 0;

    // Reset BFS state for all actors
    for (struct Actor *a = all_actors; a != NULL; a = a->next) {
        a->visited = 0;
        a->level = -1;
        a->prev_actor_in_path = NULL;
        a->prev_movie_in_path = NULL;
    }

    struct Queue *q = create_queue();
    start_actor->visited = 1;
    start_actor->level = 0;
    enqueue(q, start_actor);

    while (q->front != NULL) {
        struct Actor *current_actor = dequeue(q);
        if (current_actor == end_actor) {
            int level = current_actor->level;
            free_queue(q);
            return level;
        }

        // Iterate through movies of the current actor
        for (struct MovieActorLink *ml = current_actor->movies; ml != NULL; ml = ml->next) {
            struct Movie *current_movie = ml->movie;
            // Iterate through co-stars in that movie
            for (struct ActorMovieLink *al = current_movie->actors; al != NULL; al = al->next) {
                struct Actor *costar = al->actor;
                if (!costar->visited) {
                    costar->visited = 1;
                    costar->level = current_actor->level + 1;
                    costar->prev_actor_in_path = current_actor;
                    costar->prev_movie_in_path = current_movie;
                    enqueue(q, costar);
                }
            }
        }
    }
    free_queue(q);
    return -1; // No path found
}

/*
 * print_path(actor) -- Prints the path from Kevin Bacon to the queried actor.
 */
void print_path(struct Actor *actor) {
    if (actor->prev_actor_in_path == NULL) {
        printf("%s\n", actor->name);
    } else {
        print_path(actor->prev_actor_in_path);
        printf("was in %s with\n%s\n", actor->prev_movie_in_path->name, actor->name);
    }
}

/*
 * free_graph(actors, movies) -- Frees all dynamically allocated memory for
 * the entire graph.
 */
void free_graph(struct Actor *actors, struct Movie *movies) {
    struct Actor *current_actor = actors;
    while (current_actor != NULL) {
        struct Actor *next_actor = current_actor->next;
        free(current_actor->name);
        struct MovieActorLink *current_movie_link = current_actor->movies;
        while (current_movie_link != NULL) {
            struct MovieActorLink *next_link = current_movie_link->next;
            free(current_movie_link);
            current_movie_link = next_link;
        }
        free(current_actor);
        current_actor = next_actor;
    }

    struct Movie *current_movie = movies;
    while (current_movie != NULL) {
        struct Movie *next_movie = current_movie->next;
        free(current_movie->name);
        struct ActorMovieLink *current_actor_link = current_movie->actors;
        while (current_actor_link != NULL) {
            struct ActorMovieLink *next_link = current_actor_link->next;
            free(current_actor_link);
            current_actor_link = next_link;
        }
        free(current_movie);
        current_movie = next_movie;
    }
}


int main(int argc, char *argv[]) {
    char *filename = NULL;
    int l_option = 0;

    // Parse command line arguments
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-l") == 0) {
            l_option = 1;
        } else if (argv[i][0] == '-') {
            fprintf(stderr, "Usage: bacon [-l] movie_file\n");
            return 1;
        } else if (filename == NULL) {
            filename = argv[i];
        } else {
            fprintf(stderr, "Usage: bacon [-l] movie_file\n");
            return 1;
        }
    }

    if (filename == NULL) {
        fprintf(stderr, "Usage: bacon [-l] movie_file\n");
        return 1;
    }

    FILE *file = fopen(filename, "r");
    if (!file) {
        fprintf(stderr, "Error: Cannot open file %s\n", filename);
        return 1;
    }

    struct Actor *all_actors = NULL;
    struct Movie *all_movies = NULL;
    char *line = NULL;
    size_t len = 0;
    ssize_t read;
    struct Movie *current_movie = NULL;

    // Read file and build graph
    while ((read = getline(&line, &len, file)) != -1) {
        if (line[read - 1] == '\n') line[read - 1] = '\0'; // Strip newline

        if (strncmp(line, "Movie: ", 7) == 0) {
            current_movie = add_movie(&all_movies, line + 7);
        } else if (strlen(line) > 0 && current_movie != NULL) {
            struct Actor *actor = add_actor(&all_actors, line);
            link_actor_and_movie(actor, current_movie);
        }
    }
    free(line);
    fclose(file);

    struct Actor *kevin_bacon = find_actor(all_actors, "Kevin Bacon");
    if (kevin_bacon == NULL) {
        // Kevin Bacon is not in the data file, so no paths are possible.
        // We can handle this gracefully.
    }

    int non_fatal_error = 0;
    line = NULL;
    len = 0;
    // Process queries from stdin
    while ((read = getline(&line, &len, stdin)) != -1) {
        if (line[read - 1] == '\n') line[read - 1] = '\0';
        
        struct Actor *queried_actor = find_actor(all_actors, line);

        if (queried_actor == NULL) {
            fprintf(stderr, "Error: Actor '%s' not found in the graph.\n", line);
            non_fatal_error = 1;
            continue;
        }

        if (kevin_bacon == NULL) {
             printf("Score: No Bacon!\n");
             continue;
        }

        int score = bfs(all_actors, kevin_bacon, queried_actor);

        if (score != -1) {
            printf("Score: %d\n", score);
            if (l_option) {
                print_path(queried_actor);
            }
        } else {
            printf("Score: No Bacon!\n");
        }
    }

    free(line);
    free_graph(all_actors, all_movies);

    return non_fatal_error;
}
