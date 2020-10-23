#include <stdio.h>
#include <stdlib.h>

int main() {
	char vet[11] = "margherita";
	int* p = vet;
	__asm {
		mov ebx, p
		mov esi, 0
		sub dword ptr[ebx+esi*1], 32
		mov esi, 9
		sub dword ptr[ebx+esi*1], 32
		/*mov ecx, dword ptr[ebx + esi * 4] // [base + indice * scala]
		mov esi, 3
		mov edx, dword ptr[ebx + esi * 4]
		add ecx, edx
		mov eax, ecx*/

	}
	return EXIT_SUCCESS;
}