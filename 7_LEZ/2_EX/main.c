#include <stdio.h>
#include <stdlib.h>

int conta_occorrenze(char* str, char* parola);

int main(void) {
	char str[255] = "io sono ciao sono hey";
	char parola[255] = "sono";
	// separatore sempre spazio
	// non è mai la prima o ultima parola
	printf("la stringa ha %d occorrenze", conta_occorrenze(&str[0], parola));
	return EXIT_SUCCESS;
}

