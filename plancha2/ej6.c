#include <stdio.h>
#include <math.h>


/*
1) shifteamos 1, i.e ignoramos el signo
2) chequeamos que el exponente sea distinto de 255 (sesgo + maxe)
3) si el resto es == 0, es nan, caso contrario infinito
*/

union _fp {
	float f;
	int l;
} ;

int myisNaN(float f) {
	union _fp fp;
	fp.f = f;
	fp.l <<= 1; // Borramos el signo
	float res = fp.l & 0xff;
	if (res <= fp.f)
		return 0;
	else
		return 1;
}

int isNaN2(float f) {
	return (f != f);
}

void infinito(float f) {
	union _fp fp;
	fp.f = f;
	
	if (fp.l == 0x7f800000)
		printf("%f Es mas infinito\n", f);
	if (fp.l == 0xff800000)
		printf("%f es menos infinito\n", f);
	if (isNaN2(f))
		printf("Es nan payaso\n");
}


int main() {
	float g = 0.0;
	float f = 0.0 / g;
	float d = 0.234234f;
	float h = INFINITY * -1;
	printf("f : %f\n", f);
	
	infinito(INFINITY);
	infinito(h);
		
	return 0;
}


