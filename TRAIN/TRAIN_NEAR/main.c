#include <stdio.h>
#include <stdlib.h>

int main(void) {
	/*
		calcolo eseguito dal codice, ove a epb+8 e b epb+12
			
			b + (b - a)

			naturalmente questo codice non ha senso
	*/
	printf("il risultato e\' %d", addizione(2,3));

	//	3 + ( 3 - 2 ) = 4

	return EXIT_SUCCESS;
}