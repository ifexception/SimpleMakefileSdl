CC=gcc
CFLAGS=-Wall -Wextra -Wshadow -g -O0 $(shell sdl2-config --cflags)
LFLAGS=$(shell sdl2-config --libs)

ODIR = obj
SDIR = src
BDIR = bin
TDIR = test

# define the target profile
MAIN = $(BDIR)/makefile_sdl2

# define the C object files
OBJ = main.o
_OBJS = $(OBJ)
OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))

# display a message when compilation is complete
all: $(MAIN)	
	@echo makefile_sdl2 - Simple Makefile for SDL2 demo

# define rule to compile all object files to an executable
$(MAIN): $(OBJS)
	$(CC) $(CFLAGS) -o $(MAIN) $(OBJS) $(LFLAGS)

# define rule to compile the object files for each source file
$(ODIR)/%.o: $(SDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean

# define rule to delete object files when 'make clean' is run
clean:
	rm -vf $(ODIR)/*.o
	rm -vf $(MAIN)