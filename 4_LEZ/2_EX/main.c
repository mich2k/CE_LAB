#include <stdlib.h>
#include <stdio.h>

__declspec(naked) int somma(int* p, int lung) {
	__asm {
		// inizio prima config
		push ebp
		mov ebp, esp
		push edi
		push esi
		push ebx
		// fine prima config

		mov esi, 0
		mov ebx, p
		mov edx, lung
		mov eax, 0
		ciclo:
		cmp esi, edx
		je fine
		add eax, dword ptr[ebx + esi*4]
		inc esi
		jmp ciclo
		fine:

		// inizio seconda config
		pop ebx
		pop esi
		pop edi
		mov esp, ebp
		pop ebp
		ret
		// fine seconda config
	}
}

int main(void) {
	int vet[10] = { 1,2,3,4,5,6,7,8,9,10 };
	int som = somma(&vet[0], 10);
	printf("\n\n-> %d", som);
	return EXIT_SUCCESS;
}