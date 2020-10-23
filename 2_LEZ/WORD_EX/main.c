#include <stdio.h>
#include <stdlib.h>

int main() {
	char vet[11] = "margherita";
	int* p = vet;
	__asm {
		mov ebx, p
		mov esi, 0
		sub byte ptr[ebx+esi*1], 32d
		mov esi, 9
		sub byte ptr[ebx+esi*1], 32d

	}
	return EXIT_SUCCESS;
}