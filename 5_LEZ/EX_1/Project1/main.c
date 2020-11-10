#include <stdlib.h>
#include <stdio.h>

// vettori di interi, calcolarne la media intera
// si usa la IDIV essendo con segno, si utilizza quindi CDQ
__declspec(naked) int media(int* v, int lunghezza) {

__asm {
		// inizio prima config
		push ebp
		mov ebp, esp
		push edi
		push esi
		push ebx
		// fine prima config


		mov ebx, dword ptr [ebp+8]	// 8 = primo parametro, array
		mov ecx, dword ptr [ebp+12]	// 12 = primo parametro, lunghezza
		mov esi, 0d
		mov edx, 0d

		ciclo:
		// edx registro somma
		cmp esi, lunghezza
		je fine

		add edx, dword ptr [ebx + esi*4]
		inc esi

		jmp ciclo

		fine :

		// inizio processo divisione

		mov eax, edx
		cdq
		idiv lunghezza

		// fine divisione

		// IN EAX DOVRò METTERE IL RISULTATO, SICCOME RET RITORNA	//	!
		// AUTOMATICAMENTE EAX										//	!


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

	int v[10] = { 1,2,3,4,5,6,7,8,9,10 };
	printf("\nLa media e\' %d\n", media(v,10));
	return EXIT_SUCCESS;
}
