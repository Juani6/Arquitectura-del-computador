#include <stdio.h>

unsigned int potDos(int i);

int main(){
	unsigned int i = 0;
	for(; i < 32; i++)
		printf("Res: %u\n",potDos(i));
	return 0;
}