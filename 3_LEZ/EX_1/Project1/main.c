#include <stdlib.h>
#include <stdio.h>

int main(void) {

	char str[255] = "Ingegneria informatica fa schifo ma si diventa ricchi";
	int num = 0;
	char* p;
	p = &str[0];	// meglio scrivere così che p=str
					// siccome potremmo avere un comportamento
					// inaspettato del compilatore
					// evitabile se alloc dinamicamente con malloc
					// invece che staticamente (su stack) come in questo caso
	__asm {
		mov eax, p
		mov esi, 0
		ciclo:
		mov bl, byte ptr [eax+esi*1]	
			/*
				byte per l array che leggiamo source
				bl registro adatto di dest
				*1 siccome sizeof(char)=1
			*/
		cmp bl,0 // vedo se trovo il terminatoreoncl
			// cmp bl , 'a' per trovare un elemento, verrà sostituita con l ascii corrisp.
		je fine

		inc esi // esi++ oppure add esi, 1
		jmp ciclo

		fine:
		mv num, esi
	}

	printf("\n La lunghezza e\' %d", num);
	return EXIT_SUCCESS;
}