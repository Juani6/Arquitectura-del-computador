#include <stdio.h>

float det(float a, float b, float c, float d);

int main() {
	float a = 1.0;
	float b = 2.0;
	float c = 1.9;
	float d = 2.2;

	printf("Res : %.10f\n", det(a,b,c,d));
	return 0;
}