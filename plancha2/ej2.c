#include <stdio.h>
#include <ieee754.h>
#include <math.h>

union Floatlong {
	float f;
	long l;
};

long potencia_long (long a , int b ){
    long retorno= 1;
    for(int i= 0;i<b;i++) retorno *= a;
    return retorno;
}

 long is_one_long(long n, int b)
 {
    long bit_potencia = potencia_long(2,b);
    long bit = n & bit_potencia;

    return bit;
 }

void printsign(long n){

    for(int i= 22; i>=0 ;i--){
        long bit= is_one_long(n,i);
        if(bit>0)printf("1");
        else printf("0");
    }
    puts("");
}

void printexp(long n){

    for(int i = 30;i >= 23; i--){
        long bit = is_one_long(n,i);
        if(bit>0) printf("1");
        else printf("0");
    }
    puts("");
}


float fraccion(float f) {
	union Floatlong fl;
	fl.f = f;
	if (fl.f < 0) {
		fl.l &= 0x007fffff;
		return fl.l;
	}
	else {
		fl.l &= 0x00fffffe;
		return fl.l;
	}
}

float exponente(float f) {
	union Floatlong fl;
	fl.f = f;
	if (fl.f < 0) {
		fl.l &= 0x7f800000;
		return fl.l;
	}
	else {
		fl.l &= 0xff000000;
		return fl.l;
	}
}


int main() {

	float f = -138;
	float f2 = 138;
	long test = fraccion(f);
	long test1 = exponente(f);	
	printsign(test);
	printexp(test1);
	long test2 = fraccion(f2);
	long test3 = exponente(f2);
	printsign(test2);
	printexp(test3);
	return 0;
}