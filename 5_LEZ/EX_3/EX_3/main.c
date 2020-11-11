#include <stdlib.h>
#include <stdio.h>

// dato un valore n
// calcolarne il suo fattoriale


__declspec(naked) int fattoriale(int n) {

	__asm {
		// inizio prima config
		push ebp
		mov ebp, esp
		push edi
		push esi
		push ebx
		// fine prima config


		mov ebx, dword ptr[ebp + 8]	// 8 = primo parametro, array
		mov esi, 0d // contatore globale
		mov eax, 0d // contatore pari
		mov edi, 2d // check parità
		mov ecx, 0d


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

	int n = 5;
	printf("\nIl fattoriale e\' %d\n", fattoriale(n));
	return EXIT_SUCCESS;
}
