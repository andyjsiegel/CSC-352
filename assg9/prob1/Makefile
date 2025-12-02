mymake: mymake.o graph.o
	gcc mymake.o graph.o -o mymake

mymake.o: mymake.c graph.h
	gcc -Wall -c mymake.c

graph.o: graph.c graph.h
	gcc -Wall -c graph.c

clean:
	rm -f *.o mymake
