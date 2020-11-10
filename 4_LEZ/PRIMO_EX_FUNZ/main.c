#include <stdlib.h>


/*int somma(int a, int b) {
	return (a + b);
}*/

__declspec(naked) int somma(int a, int b) {
	__asm {
		// inizio prima config
		push ebp
		mov ebp,esp
		push edi
		push esi
		push ebx
		// fine prima config

		mov eax, dword ptr [ebp+8]
		mov ebx, dword ptr[ebp+12]
		add eax, ebx


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
	int a=5, b=7, c=0;
	c = somma(a, b);
	printf("\n%d", c);
	return EXIT_SUCCESS;
}