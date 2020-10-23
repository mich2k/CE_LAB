#include <stdio.h>
#include <stdlib.h>

int main(void) {
	unsigned int a = -5, b = 7, c;
	__asm {
		mov eax,a
		mov ebx,b
		inizio:
		cmp eax, 0d
		JE fineciclo
		add ecx, ebx
		sub eax, 1d
		JMP inizio
		fineciclo:
		mov c, ecx
	}
	printf("Il prodotto tra %d e %d e\' %d", a, b, c);
	return EXIT_SUCCESS;
}