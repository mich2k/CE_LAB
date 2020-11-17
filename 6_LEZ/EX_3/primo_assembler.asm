.586
.model flat
.code

_primo proc

push ebp
mov ebp,esp
push ebx
push esi
push edi

mov esi, 0d ; ciclo array
mov edi, 0d ; subciclo
mov ebx, 0d ; contatore n. primi
mov ecx, dword ptr [ebp+8] ; array a di valori
mov edx, dword ptr [ebp+12] ; array b bool
; dword ptr [ebp+16] ; valore int di lunghezza
; edi free

ciclo:
	cmp esi, dword ptr[ebp+16]
	je fine_ciclo
	mov edi, 2d
	subciclo:
		mov eax, dword ptr [ecx+esi*4]
		cmp edi, eax
		je primo
		cdq
		idiv edi
		cmp edx, 0d
		je non_primo
		inc edi
		jmp subciclo
	primo:
		mov edx, dword ptr [ebp+12] 
		add ebx, 1d
		mov dword ptr [edx+ esi*4], 1d
		inc esi
		jmp ciclo
	non_primo:
		inc esi
		jmp ciclo
fine_ciclo:
		mov eax, ebx

pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret

_primo endp
end