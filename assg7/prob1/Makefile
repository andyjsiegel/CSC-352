CC = gcc
CFLAGS = -Wall -g

# Default target
all: reach

# Target to build the 'reach' executable
reach: reach.c
	$(CC) $(CFLAGS) -o reach reach.c

# A clean rule to remove the executable and any object files
clean:
	rm -f reach *.o
