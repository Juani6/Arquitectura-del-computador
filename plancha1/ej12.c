#include <stdio.h>

int main() {
	char a = 0xc4;
	char b = 0x4e;
	char c = a + b;

	printf("Signed char A :%hhd, signed char B :%hhd, unsigned char C:%hhd\n",a,b,c);
	printf("Unsigned char A :%hhu, unsigned char B :%hhu, unsigned char C:%hhu\n",a,b);
	return 0;
}