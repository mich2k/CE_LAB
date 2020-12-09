#include <stdio.h>
#include <stdlib.h>

int main()
{
	unsigned char src[6] = { 2, 3, 4, 4, 5, 8 };
	unsigned char dst[6] = { 0,0,0,0,0,0 };
	int ret = togli_dispari(src, 6, dst);
	for (int i = 0; i < 6; i++)
		printf("%d ", dst[i]);
}
/*
.586
.model flat
.code

_togli_dispari proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8]	; src
; dword ptr[ebp+12]			; lunghezza

mov esi, 0
mov edi, dword ptr[ebp+12]
mov ecx, 2	; divisore
mov edx, 0
; primo e ultimo, 0 e lungh-1 sempre pari
; 2, 3, 4, 4, 5, 8
primo_ciclo:
	cmp esi , edi
	je fine
	mov eax, dword ptr [ebx+esi*4]
	mov edx, 0
	div ecx
	mov dword ptr[ebx+esi*4], edx
	;cmp edx, 0
	;jne dispari
	inc esi
	jmp primo_ciclo


fine:
	mov esi, 0
	mov edi, 0

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_togli_dispari endp

end
*/