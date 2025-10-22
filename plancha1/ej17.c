#include <stdio.h>


void swap(int* a, int* b, int* c) {
	// cambio a y c
	*a ^= *c;
	*c ^= *a;
	*a ^= *c;
	// cambia b y c
	*b ^= *c;
	*c ^= *b;
	*b ^= *c;
}

int main() {
 int a = 1, b = 2, c = 3;
	printf("a = %d, b = %d, c = %d\n", a,b,c);
	swap(&a,&b,&c);
	printf("a = %d, b = %d, c = %d\n", a,b,c);
	return 0;
}