#include <stdio.h>

unsigned mult(unsigned a, unsigned b) {
	if (b == 0) 
		return 0;
	if (b == 1)
		return a;
	if (b % 2 == 0)
		return  mult(a << 1, b >> 1);
	else 
		return mult(a << 1, b >> 1) + a;
}

int main() {
	unsigned a = 7, b = 10;
	printf("%u * %u = %u",a,b, mult(a,b));
	return 0;
}