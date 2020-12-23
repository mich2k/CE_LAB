.586
.model flat
.code

_cerca_combinazioni_lettera proc
push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8] ; src
mov ecx, dword ptr[ebp+16]	; dst
mov edx, dword ptr[ebp+12]
mov esi, 0
mov edi,0
mov eax, 0

mov dword ptr[ecx], 0
mov dword ptr[ecx+4], 0
mov dword ptr[ecx+8], 0

primo_ciclo:
	cmp edi, 0
	jg found
	keep:
	mov edi, 0
	_loop:
		mov al, byte ptr[ebx+esi]
		inc esi
		cmp al, 0
		je fine
		cmp al, dl
		jne primo_ciclo
		inc edi
		jmp _loop
	jmp primo_ciclo

found:
	sub edi, 1
	inc dword ptr[ecx+edi*4]
	jmp keep

fine:
	cmp edi, 0
	je _end
	sub edi, 1
	inc dword ptr[ecx+edi*4]

_end:
mov eax, 0d
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_cerca_combinazioni_lettera endp
end