CFLAGS=-std=c11 -g -static

init:
				@docker-compose up -d

9cc: src/9cc.c init
				@docker-compose exec c gcc -o 9cc 9cc.c

test: 9cc
				@docker-compose exec c sh test.sh

clean:
				rm -f src/9cc src/*.o src/*~ src/tmp*

.PHONY: init test clean
