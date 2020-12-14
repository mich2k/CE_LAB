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

;	bh 4 bit	mov bh, 1
;	bl 8 bit	mov bl, 44
;	bx 16 bit
;	ebx 32 bit	cambiato

found:
	mov byte ptr [ebx+esi], ','
	;pop eax
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