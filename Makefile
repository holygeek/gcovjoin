noise = *.out *.gcov *.gcda *.gcno

CFLAGS = --coverage
all: clean a.c.gcov

a.c.gcov: one.c.gcov two.c.gcov
	./gcovjoin -o a.c.gcov one.c.gcov two.c.gcov
	vimdiff one.c.gcov two.c.gcov

one.c.gcov: a.c.out
	./$< FOO
	md5sum *.gcda *.gcno
	gcov a.c
	rm -f a.gcda
	mv a.c.gcov one.c.gcov
two.c.gcov: a.c.out
	./$<
	md5sum *.gcda *.gcno
	gcov a.c
	rm -f a.gcda
	mv a.c.gcov two.c.gcov

a.c.out: a.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	$(RM) $(noise)
