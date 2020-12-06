#include <stdio.h>
#include <stdlib.h>

int divisione_array(int* src, int divisore, int lunghezza, int* resto);

int main(void) {

	int v[3] = { -3,-3,3 };	
	int resto[3];
	printf("%d %d %d", v[0], v[1], v[2]);
	printf("\n %d \n", divisione_array(v, 3, 3, resto));
	puts("");
	printf("%d %d %d\n", v[0], v[1], v[2]);
	puts("resto: ");
	printf("%d %d %d", resto[0], resto[1], resto[2]);
	return EXIT_SUCCESS;
}