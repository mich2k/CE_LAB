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
mov edi, dword ptr[ebp+12]			; lunghezza

sub edi, 1d

; ATTENZIONE:
;			-	unsigned char: sizeof(char) = 1, NON 4

;			-	SI DEVONO USARE REGISTRI A 8bit NON 32bit

mov esi, 1

mov cl, 2	; div

; 2, 3, 4, 4, 5, 8 

mov al, byte ptr [ebx]	; save first
movzx eax, al
push ebx
	mov ebx, dword ptr [ebp+16]	; arr dst
	mov dword ptr[ebx], eax	
pop ebx

primo_ciclo:
	cmp esi , edi
	je fine
	mov ax, word ptr [ebx+esi]	; AX 16 bit WORD
	mov ah, 0					; resto per 8 bit, AH PADDATO 8bit
	div cl						; DIVISORE 8 BIT 
	;mov byte ptr[ebx+esi], ah
	cmp ah, 0
	jne dispari_found
	je pari_found
	keep:
	push ebx
		mov ebx, dword ptr [ebp+16]	; arr dst
		mov dword ptr[ebx+esi], eax	
	pop ebx
	inc esi
	jmp primo_ciclo
	pari_found:
		imul cl
		push ebx
		mov ebx, dword ptr [ebp+16]	; arr dst
		mov dword ptr[ebx+esi], eax	
	pop ebx
	inc esi
	jmp primo_ciclo

	
dispari_found:
	mov ax, word ptr [ebx+esi-1]
	mov ah, 0
	div cl
	cmp ah, 0
	jne keep
	mov ax, word ptr[ebx+esi+1]
	mov ah, 0
	div cl
	cmp ah, 0
	jne keep
	mov dl, 0
	add dl, byte ptr [ebx+esi-1]
	add dl, byte ptr [ebx+esi+1]
	mov ax, 0
	mov al, dl	; dl salvato il valore
	div cl
	mov dl, al
	div cl
	cmp ah, 0
	mov al, dl
	je even_avg
	jne not_even_avg
	subkeep:
	jmp keep

even_avg:
	movzx eax, al	; movsx signed
	jmp subkeep

not_even_avg:
	add al, 1
	movzx eax, al
	jmp subkeep


fine:
	mov al, byte ptr[ebx+edi]	; save last
	movzx eax, al
	push ebx
		mov ebx, dword ptr [ebp+16]	; arr dst
		mov dword ptr[ebx+edi], eax	
	pop ebx
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