#include <stdlib.h>
#include <stdio.h>
#include <string.h>


int fuerza_bruta(const char *S, const char *s, unsigned lS, unsigned ls);

int fuerza_bruta2(const char *S, const char *s, unsigned lS, unsigned ls);


int main(int argc, char* argv[]) {
	char *S = argv[1];
	char *s = argv[2];
	unsigned lS = (unsigned) strlen(S);
	unsigned ls = (unsigned) strlen(s);
	int a = fuerza_bruta2(S,s,lS,ls);
	int b = fuerza_bruta(S,s,lS,ls);
	printf("%d\n%d\n", a,b);
	return 0;

}