#include <stdio.h>
#include <stdlib.h>

int main() {
	int somma = 0;
	int a = 5, b = 6;
	int vet[5] = { 1,2,3,4,5 };
	int* p = vet;
	__asm {
		mov ebx,p

		mov esi,0
		mov ecx, dword ptr [ebx+esi*4] // [base + indice * scala]
		mov esi,3
		mov edx,dword ptr [ebx+esi*4]

		add ecx,edx
		mov eax,ecx

		mov somma, eax
	}
	printf("%d", somma);
	return EXIT_SUCCESS;				
}