#include <stdio.h>
#include <stdlib.h>

int primo(int* a, int* b, int lunghezza);

// si realizzi una funzione che pone in b[i] 1 se a[i] è primo, 0 altrimenti
// poi ritorna quanti n. primi ci sono nel vettore

int main() {
	int len = 10;
	int a[10] = { 3,4,5,6,7,8,9,10,11,12 };
	int b[10] = { 0,0,0,0,0,0,0,0,0,0 };
	printf("ci sono -> %d numeri primi \n", primo(a, b, 10));
	for (int i = 0; i < len; i += 1)
		printf("%d\t", *(b + i));
	puts("");
	return EXIT_SUCCESS;
}