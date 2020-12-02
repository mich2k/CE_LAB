.586
.model flat
.code

_sommav proc
push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8] ; arr
mov edx, dword ptr[ebp+12] ; length
mov esi, 0
mov eax, 0


ciclo:
	cmp esi, edx 
	je fine
	mov ecx, dword ptr [ebx + esi*4]
	add eax, ecx
	inc esi
	jmp ciclo

fine:
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_sommav endp
end