.586
.model flat
.code

_spazi proc
push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8] ; arr
mov edi, 0
mov esi, 0

ciclo:
	mov al, byte ptr [ebx+esi]
	cmp al, 0
	je fine
	cmp al, 32
	je found
	inc esi
	jmp ciclo

found:
	mov bl, 44
	mov byte ptr [ebx+esi], bl
	inc edi
	inc esi
	jmp ciclo

fine:
mov eax, edi

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_spazi endp
end