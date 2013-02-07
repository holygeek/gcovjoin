#include <stdio.h>
void foo(int v) {
	if (v)
		printf("V\n");
	else
		printf("No V\n");
}

int main(int c, char *argv[]) {
	foo(c > 1);
	return 0;
}
