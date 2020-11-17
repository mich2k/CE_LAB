#include <stdio.h>
#include <stdlib.h>

int sommavett(int* a, int* b, int lunghezza); // solo definizione

int main() {
	int a[10] = { 1,2,3,4,5,6,7,8,9,10 };
	int b[10] = { 1,2,3,4,5,6,7,8,9,10 };
	printf("%d", sommavett(a, b, 10));
	return EXIT_SUCCESS;
}