#include <stdio.h>
#include <stdlib.h>

int main(void) {
	char* arr = "bella bella";
	printf("ci sono %d spazi ", spazi(&arr[0]));
	puts("");
	for (size_t i = 0; arr[i] != 0; ++i)
		printf("%c", arr[i]);
	return EXIT_SUCCESS;
}