#include <stdio.h>
#include <stdlib.h>

int palindromo(char*);

int main(void) {
	char str[255] = "ammagamma";
		// 1 palindroma
		// 0 non palindroma
		printf("la stringa e\' %d", palindromo(&str[0]));
		return EXIT_SUCCESS;
}                             