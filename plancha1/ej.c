#include <stdio.h>

int main() {
	signed char aux = -1;
	signed char a = 1<<7;
	signed char b = 0xf0;
	signed char c = aux ^ 0xf0;
	signed char res = a + b + c;
	return 0;
}