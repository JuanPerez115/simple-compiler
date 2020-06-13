
all: .c .o lm

.c: simple.y simple.lex
	bison -d simple.y
	flex simple.lex

.o: simple.tab.c lex.yy.c
	gcc -c simple.tab.c
	gcc -c lex.yy.c

lm: simple simple.tab.o lex.yy.o
	gcc -o simple simple.tab.o lex.yy.o -lm

clean:
	rm simple
	rm *.tab.c
	rm *.tab.h
	rm *.yy.c
	rm *.o

try: simple test_simple
	./simple test_simple

