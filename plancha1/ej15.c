#include <stdio.h>

int is_one(long n, int b) {
	n >>= b;
	return n & 1;
}

int main() {
	long t = 0b11011101;
	for (int i = 0; i < 9; i++)
	printf("el %d-esimo bit es %ld\n ",i,is_one(t,i));

	return 0;
}