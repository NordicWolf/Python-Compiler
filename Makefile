# Makefile -- scanner only
#

CC      = gcc
CFLAGS  = -Wall -g
LEX     = flex
OBJS    = lexer.o


lexer.bin: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ -lfl

lexer.o: lexer.c
	$(CC) $(CFLAGS) -c $^ -o $@

lexer.c: lexer.l
	$(LEX) -o $@ $^

clean:
	$(RM) -fv *.o *.bin lexer.c
