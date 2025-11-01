#include <stdio.h>

unsigned long f(unsigned long, char* argv[]);

int main(int arg, char* argv[]) {
	f(arg, argv);
	return 0;
}