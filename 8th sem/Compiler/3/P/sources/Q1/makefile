all:	
	bison -d parser.y
	flex lex.l
	gcc parser.tab.c lex.yy.c -lm -o parser.out

clean:
	rm -r *.o *.c  *.tab.*