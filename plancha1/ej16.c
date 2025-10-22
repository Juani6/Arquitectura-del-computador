#include <stdio.h>

int is_one(long n, int b) {
	n >>= b;
	return n & 1;
}

void printbin(long  n) {	
	for (int i = sizeof(long) * 8; i > 0; i--) {
		printf("%lld", is_one(n,i));
	}
	printf("\n");

}


int main() {
	long test = 64;
	printbin(test);
}