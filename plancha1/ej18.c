#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
	char *palabra= argv[2];
	int mask = atoi(argv[1]);
	char *c = palabra;
	while(*c != '\0') {
		*c ^= mask;
		c++;
		//printf(("%d\n", c));
	}
	printf("Cadena codificada : %s\n", palabra);
	return 0;

}