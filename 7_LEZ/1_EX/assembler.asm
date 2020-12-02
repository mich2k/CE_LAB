.586
.model flat
.code

_palindromo proc

push ebp
mov ebp,esp
push ebx
push esi
push edi

mov esi, 0d ; ciclo 
mov edi, 0d ; lunghezza stringa
mov ebx, dword ptr [ebp+8] ; puntatore primo carattere
; edi free

; conto la lunghezza

lunghezza:
	cmp dword ptr [ebx + edi*1], 0d
	je fine_lunghezza
	inc edi
	jmp lunghezza
fine_lunghezza:
	sub edi,1d
	; edi 9 ed esi 0
check:
	cmp edi, 0d
	je palin_true
	mov al, byte ptr [ebx + esi]
	mov bl, byte ptr [ebx + edi]
	cmp al, bl
	jne palin_false
	inc esi
	sub edi, 1d
	jmp check

palin_true:
	mov eax, 1
	jmp fine

palin_false:
	mov eax, 0
	jmp fine

fine:
pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret

_palindromo endp
end