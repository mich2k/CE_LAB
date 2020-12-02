 .586
.model flat
.code

_conta_occorrenze proc
push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8] ; stringa
mov ecx, dword ptr[ebp+12] ; parola da trovare
mov esi, 0
mov edi,0
mov eax, 0


stringa:
	cmp byte ptr[ebx+esi], 0
	je fine
	mov dl, byte ptr[ebx+esi]	; sentence
	cmp dl, byte ptr[ecx]		; parola da trovare
	je parola
	inc esi
	jmp stringa

 

parola:
	inc edi
	inc esi
	cmp byte ptr[ecx+edi], 0
	je inc_found
	mov dl, byte ptr[ebx+esi]
	cmp dl, byte ptr[ecx+edi]
	je parola
	jmp fail


inc_found:
	inc eax
	mov edi, 0
	jmp stringa

fail:
	sub esi, edi
	inc esi
	mov edi, 0
	jmp stringa

 
fine:
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_conta_occorrenze endp
end