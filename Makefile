CC=gcc
CFLAGS=-std=c11 -g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

9cc: $(OBJS)
				$(CC) -o 9cc $(OBJS) $(LDFLAGS)

$(OBJS): 9cc.h

init:
				@docker-compose up -d

test: 9cc
				@docker-compose exec c sh test.sh

clean:
				rm -f 9cc *.o *~ tmp*

.PHONY: init test clean
