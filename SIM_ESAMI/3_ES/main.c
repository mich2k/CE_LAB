#include <stdio.h>
int somma_modulo(int* src, int lunghezza, int* dst, int divisore, int ret);
int main()
{
	int src[10] = { 1,2,3,4,57,-1,-2,-3,-46,-55 };
	int dst[10];
	int ret = 0;
	/*
		= 0 inalterato
		= -1 tutti div
		= -2 nessuno div
	*/
	printf("Somma = % d\n", somma_modulo(src, 10, dst, -5, &ret));
	printf("Ret. value = %d", ret);
	puts("");
	for (size_t i = 0; i < 10; ++i)
		printf("%d ", dst[i]);
}