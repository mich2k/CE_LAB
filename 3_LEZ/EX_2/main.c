#include <stdlib.h>
#include <stdio.h>

int main(void) {

	char str[255] = "b";
	int num = 0;
	int voc = 0;
	char* p;
	p = &str[0];
	__asm {
		mov eax, p
		mov esi, 0
		mov edi, 0
		ciclo:
		mov bl, byte ptr[eax + esi * 1]

			cmp bl, 'a'
			je incr

			cmp bl, 'e'
			je incr

			cmp bl, 'i'
			je incr

			cmp bl, 'o'
			je incr

			cmp bl, 'u'
			je incr

			cmp bl, 'A'
			je incr

			cmp bl, 'E'
			je incr

			cmp bl, 'I'
			je incr

			cmp bl, 'O'
			je incr

			cmp bl, 'U'
			je incr

			cmp bl, 0
			je fine

			inc esi

			jmp ciclo

			incr:
				inc edi
				inc esi
				jmp ciclo
			fine:
				mov voc, edi
				mov num, esi;

	}
	if (!voc)
		printf("\tNon ci sono vocali");
	else {
		if (voc != 1)
			printf("\n \tCi sono %d vocali", voc);
		else
			printf("\n\tC\'e\' %d vocale", voc);
	}
	puts("");
	return EXIT_SUCCESS;
}