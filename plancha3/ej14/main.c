#include <stdio.h>
#include <stdlib.h>

unsigned long f(unsigned long, char* argv[]);

int main(int arg, char* argv[]) {
	unsigned long res = f(arg, argv);
	printf("%d\n", res);
	return 0;
}