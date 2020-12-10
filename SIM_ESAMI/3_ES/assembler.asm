.586
.model flat
.code

_somma_modulo proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

;	dword ptr[ebp+12]	; len
mov ebx, dword ptr[ebp+8]	;src arr	PP dest arr
mov esi, 0d
mov ecx, 0d
mov edi, 0d	; counter 3 & 4

primo_ciclo:
	cmp esi, dword ptr[ebp+12]
	je fine_primo
	mov eax, dword ptr [ebx+esi*4]
	cdq
	idiv dword ptr[ebp+20]
	push ebx
	push edx
		mov ebx, dword ptr[ebp+16]
		mov dword ptr[ebx+esi*4], edx
		cmp edx, 0
		je is_div
		keep:
	pop edx
	pop ebx
	add ecx, edx
	inc esi
	jmp primo_ciclo
	
is_div:
	inc edi
	jmp keep

fine_primo:
	push edi
		cmp edi, 0
		je no_div
	pop edi
	push edi
		cmp edi, dword ptr[ebp+12]
		je all_div
	pop edi
	jmp fine
	all_div:
		push ecx
			mov ecx, dword ptr[ebp+24]		; !!!!!!
			mov dword ptr [ecx], -1
		pop ecx	
		jmp fine
	no_div:
		push ecx
			mov ecx, dword ptr[ebp+24]		; !!!!!!
			mov dword ptr [ecx], -2
		pop ecx
		jmp fine

fine:
	mov eax, ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_somma_modulo endp


end