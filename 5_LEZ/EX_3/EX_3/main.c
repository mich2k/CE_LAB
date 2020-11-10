#include <stdlib.h>
#include <stdio.h>

// funzione che accetta un vettore di unsigned char
// conti il numero degli elementi pari
__declspec(naked) int pari(unsigned char* v, int lunghezza) {

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

		ciclo :
		cmp esi, dword ptr[ebp + 12] // risparmio un registro
			je fine

			mov eax, dword ptr[ebx + 4 * esi]
			mov edx, 0d	// edx conterrà il resto
			div edi
			cmp edx, 0d
			je even_found
			inc esi
			jmp ciclo

			even_found :
		inc ecx
			inc esi
			jmp ciclo

			fine :
		mov eax, ecx

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

	unsigned char v[10] = { 1,2,3,4,5,6,7,8,9,10 };
	printf("\n Ci sono %d numeri pari\n", pari(v, 10));
	return EXIT_SUCCESS;
}
