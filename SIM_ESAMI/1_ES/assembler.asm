.586
.model flat
.code

_divisione_array proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8]	; arr
;dword ptr[ebp+12]			; divisore
mov ecx, dword ptr[ebp+20]	; resto
mov esi, 0d
mov edi, 0d
mov eax, 0d

primo_ciclo:
	cmp esi, dword ptr[ebp+16]
	je fine_primo
	mov eax, dword ptr [ebx+esi*4]
	cdq
	idiv dword ptr[ebp+12]
	mov dword ptr [ecx+esi*4], edx
	mov dword ptr [ebx+esi*4], eax
	inc esi
	jmp primo_ciclo

fine_primo:
	mov esi, 0	; cont
	mov edi, 0
	mov eax, 0	; somma
	mov edx, 0	; val

subciclo:
	cmp esi, dword ptr[ebp+16]
	je fine_sub
	mov edx, dword ptr [ecx+esi*4]
	cmp edx, 0
	jl negativo
	keep:
	jne non_zero
	keep_:
	add eax, edx
	inc esi
	jmp subciclo


non_zero:
	inc edi
	jmp keep_

negativo:
	neg edx
	jmp keep


fine_sub:
	cmp edi, dword ptr[ebp+16]
	je tutte_non_zero
	cmp eax, 0
	jmp tutte_zero
	jmp fine

tutte_zero:
	mov eax, -1
	jmp fine

tutte_non_zero:
	mov eax, 1
	jmp fine


fine:
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_divisione_array endp

end