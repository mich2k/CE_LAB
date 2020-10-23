
#include <stdlib.h>
#include <stdio.h>
int main(void) {
	int a = 5, b = 6;
	__asm {
		// copio i valori delle var C nei registri
		mov eax,a
		mov ebx,b
		add eax, ebx
		// copio i registri nuovamente nelle variabili
		mov b, eax // sposto il risultato da eax a b

	}
	printf("%d", b);
	return EXIT_SUCCESS;
}