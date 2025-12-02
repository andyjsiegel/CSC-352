all: mymake2

mymake2: mymake.o graph.o
	gcc -Wall mymake.o graph.o -o mymake2

mymake.o: mymake.c graph.h
	gcc -Wall -c mymake.c

graph.o: graph.c graph.h
	gcc -Wall -c graph.c

clean:
	rm -f mymake.o graph.o mymake2 mymake
