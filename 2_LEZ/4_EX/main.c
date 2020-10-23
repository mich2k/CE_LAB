#include <stdlib.h>
#include <stdio.h>

// se a[i] >= b[i] --> c[i] = 1

int main(void) {
	int a[5] = { 1,2,3,4,5 };
	int b[5] = { 1,-10,128,-5,4 };
	int c[5] = { 0,0,0,0,0 };
	int* p1, p2, p3;
	p1 = a;
	p2 = b;
	p3 = c;
	__asm {
		mov eax,p1
		mov ebx,p2
		mov ecx,p3
		mov esi, 0d
		inizio:
		cmp esi, 5d
		JE fine
		mov edx, dword ptr [ebx + esi * 4]
		cmp dword ptr [eax + esi * 4], edx

		JGE found
			add esi, 1d
			JMP inizio

			found:
		mov dword ptr [ecx + esi * 4], 1d
			add esi, 1d
			JMP inizio

			fine:

	}
	for (int i = 0; i < 5; i++) {
		printf("a = %d, b = %d, c = %d\n", a[i], b[i], c[i]);
	}
	return EXIT_SUCCESS;
}