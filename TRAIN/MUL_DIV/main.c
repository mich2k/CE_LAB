#include <stdio.h>
#include <stdlib.h>

int main(void) {
	int* divisione = malloc(4);
	int* moltip = malloc(4);
	muldiv((int)6,(int) 6, divisione, moltip);
	printf("\n div: %d moltip: %d", *divisione, *moltip);
}