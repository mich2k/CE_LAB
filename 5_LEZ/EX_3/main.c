#include <stdlib.h>
#include <stdio.h>

// dato un val
// calcolarne il risultato

__declspec(naked) int fattoriale(int val) {

	__asm {
		// inizio prima config
		push ebp
		mov ebp, esp
		push edi
		push esi
		push ebx
		// fine prima config


		mov ebx, dword ptr[ebp + 8]	// 8 = primo parametro, val

		// eax return value
		mov eax, ebx
		mov ecx, eax
		ciclo:
			sub ecx, 1d
			cmp ecx, 0d
			je fine
			imul ecx
			jmp ciclo

		fine :
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
	int val = 5;
	printf("\nIl fattoriale e\' %d\n", fattoriale(val));
	return EXIT_SUCCESS;
}
