#include <stdio.h>

int a = 0x7fffffff, b = 1;

int foo1() {
	printf("Ejecutando foo1...\n");
	a = a + (b<<31); // a + b = 0x80000 + 0x80000000 OF = 1
	printf("Dentro de foo1 : 0x%x\n",a);
	return a;
}

int foo2() {
	printf("Ejecutando foo2...\n");
	a = a + b; // a + b = 0x7fffffff + 0x1 = 0x8 CF = 1
	printf("Dentro de foo 2 : 0x%x\n",a);
	return a;
}

int main() {
	printf("foo1: 0x%x\nfoo2: 0x%x\n", foo1(), foo2());
	return 0;
}
