
all: simple simple.tab.o lex.yy.o
	gcc -o simple simple.tab.o lex.yy.o -lm

simple.tab.o: simple.tab.c
	gcc -c simple.tab.c

simple.tab.c: simple.y
	bison -d simple.y

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

lex.yy.c: simple.lex
	flex simple.lex

clean:
	rm *.tab.c
	rm *.tab.h
	rm *.yy.c
	rm *.o

try: simple test_simple
	./simple test_simple