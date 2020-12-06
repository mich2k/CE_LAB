.586
.model flat
.code

_togli_dispari proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8]	; src
mov edi, [[dword ptr[ebp+12]] - 1]			; lunghezza


; ATTENZIONE:
;			-	unsigned char: sizeof(char) = 1, NON 4

;			-	SI DEVONO USARE REGISTRI A 8bit NON 32bit

mov esi, 1

mov cl, 2	; divisore

; primo e ultimo, 0 e lungh-1 sempre pari
; 2, 3, 4, 4, 5, 8 

primo_ciclo:
	cmp esi , edi
	je fine
	mov ax, word ptr [ebx+esi]	; AX 16 bit WORD
	mov ah, 0					; resto per 8 bit, AH PADDATO 8bit
	div cl						; DIVISORE 8 BIT 
	;mov byte ptr[ebx+esi], ah
	cmp edx, 0
	jne dispari_found
	keep:
	inc esi
	jmp primo_ciclo

	
dispari_found:
	

	jmp keep


fine:
	mov esi, 0
	mov edi, 0

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_togli_dispari endp

end