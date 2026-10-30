CC = gcc
CFLAGS ?= -Wall -Wextra -O2
LDFLAGS ?=
LDLIBS ?=

TARGET ?= app
SOURCES := $(wildcard *.c)
OBJECTS := $(SOURCES:.c=.o)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o $(TARGET)
