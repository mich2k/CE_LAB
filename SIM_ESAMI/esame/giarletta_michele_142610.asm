.586
.model flat
.code

_elimina_doppie proc
push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8] ; src
mov edx, dword ptr[ebp+12]
mov esi, 0
mov edi,0
mov eax, 0
mov ecx, 0

primo_ciclo:
	cmp edi, 2
	je found
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
	inc ecx	; contatore coppie
	sub esi, 2
	mov byte ptr[ebx+esi], ' '
	dec esi
	mov byte ptr[ebx+esi], ' '
	add esi,3
	jmp keep

fine:
	cmp edi, 2
	jne _end
	inc ecx
	sub esi, 2
	mov byte ptr[ebx+esi], ' '
	dec esi
	mov byte ptr[ebx+esi], ' '
	add esi,3

_end:
mov eax, ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_elimina_doppie endp
end