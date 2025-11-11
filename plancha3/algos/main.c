#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

/*
Use este archivo para comparar la velocidad de ASM y C para el aplicamiento del mismo algoritmo. En este caso
Insertion sort.

Compilado como 
	gcc -O0 insertion.s main.c
tenemos:
Insertion sort programado en C tardo: 2.075551 segundos
Insertion sort programado en ASM tardo: 1.027931 segundos

Compilado como 
	gcc -O3 insertion.s main.c
tenemos
Insertion sort programado en C tardo: 0.498214 segundos
Insertion sort programado en ASM tardo: 1.039941 segundos


*/

extern void insertion_sort(int arr[], int len);

void insertion_sort2(int a[], int len) {
  for (int i = 1; i < len; i++) {
    int aux = a[i];
    int j = i - 1;

    while (j >= 0 && a[j] > aux) {
      a[j + 1] = a[j];
      j--;
    }
    a[j + 1] = aux;
  }
}

void copy_array(int N, int arrayFuente[], int arrayDestino[]) {
	for (int i = 0; i < N; i++){
		arrayDestino[i] = arrayFuente[i];
	}
}


void generar_array_desordenado(int N, int array[]) {
    // Crear un arreglo temporal de 1 a N
    int *temp = malloc(N * sizeof(int));
    for (int i = 0; i < N; i++) {
        temp[i] = i + 1;
    }

    // Elegir un índice aleatorio para eliminar
    srand(time(NULL));
    int indice_eliminar = rand() % N;

    // Copiar todos los elementos excepto el elegido al array de salida
    int index = 0;
    for (int i = 0; i < N; i++) {
        if (i != indice_eliminar) {
            array[index++] = temp[i];
        }
    }
    // Mezclar el array desordenado
    for (int i = N - 2; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp_val = array[i];
        array[i] = array[j];
        array[j] = temp_val;
    }

    free(temp);
}




int main() {

	int N = 100000;
	int a1[N];
	int a2[N];
	generar_array_desordenado(N, a1);
	copy_array(N,a1,a2);

	clock_t t1 = clock();
	insertion_sort2(a1,N);
	t1 = clock() - t1;
	double tiempo1 = ((double) t1) / CLOCKS_PER_SEC;
  printf("Insertion sort programado en C tardo: %f segundos\n", tiempo1);

	clock_t t2 = clock();
	insertion_sort(a2,N);
	t2 = clock() - t2;
	double tiempo2 = ((double) t2) / CLOCKS_PER_SEC;
  printf("Insertion sort programado en ASM tardo: %f segundos\n", tiempo2);


}