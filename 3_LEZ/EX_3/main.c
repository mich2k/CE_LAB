#include <stdlib.h>
#include <stdio.h>

int main(void) {

	char str[255] = "bccca";
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

			cmp bl, 'b'
			je incr
			cmp bl, 'c'
			je incr


			cmp bl, 'd'
			je incr


			cmp bl, 'f'
			je incr


			cmp bl, 'g'
			je incr


			cmp bl, 'h'
			je incr


			cmp bl, 'j'
			je incr


			cmp bl, 'k'
			je incr


			cmp bl, 'l'
			je incr


			cmp bl, 'm'
			je incr



			cmp bl, 'n'
			je incr


			cmp bl, 'p'
			je incr


			cmp bl, 'q'
			je incr


			cmp bl, 'r'
			je incr


			cmp bl, 's'
			je incr


			cmp bl, 't'
			je incr


			cmp bl, 'v'
			je incr


			cmp bl, 'w'
			je incr


			cmp bl, 'x'
			je incr

			cmp bl, 'y'
			je incr

			cmp bl, 'z'
			je incr



			cmp bl, 'B'
			je incr


			cmp bl, 'C'
			je incr


			cmp bl, 'D'
			je incr


			cmp bl, 'F'
			je incr


			cmp bl, 'G'
				je incr


			cmp bl, 'H'
				je incr


			cmp bl, 'J'
				je incr


			cmp bl, 'K'
				je incr


			cmp bl, 'L'
				je incr


			cmp bl, 'M'
				je incr



			cmp bl, 'N'
				je incr


			cmp bl, 'P'
				je incr


			cmp bl, 'Q'
				je incr


			cmp bl, 'R'
				je incr


			cmp bl, 'S'
				je incr


			cmp bl, 'T'
				je incr


			cmp bl, 'V'
				je incr


			cmp bl, 'W'
				je incr


			cmp bl, 'X'
				je incr

			cmp bl, 'Y'
				je incr


			cmp bl, 'Z'
				je incr


			cmp bl, 'a'
			jg fine
			cmp bl, 'z'
			jl fine

			sub bl, 32
			sub byte ptr[eax + esi * 1], bl

			cmp bl, 0
			je fine

			inc esi
			jmp ciclo

			incr :
		inc edi
			inc esi
			jmp ciclo
			fine :
		mov voc, edi
			mov num, esi;

	}

	/*
	if (!voc)
		printf("\tNon ci sono consonanti");
	else {
		if (voc != 1)
			printf("\n \tCi sono %d consonanti", voc);
		else
			printf("\n\tC\'e\' %d consonante", voc);
	}*/

	for (int i = 0; i < num; ++i)
		printf("%c", str[i]);
	puts("");
	return EXIT_SUCCESS;
}