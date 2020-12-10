.586
.model flat
.code

_conta_vocali_consonanti proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8]	;arr
; unsigned char !

mov al, byte ptr [ebx]
cmp al, 0
je fine

mov esi, 0d
mov edi, 0d	; vow
mov ecx, 0d	; cons
mov edx, 0d	; symbols
mov eax, 0d ; min counter

; ABOVE & BELOW UNSIGNED
; GREATER & LESS

is_alpha:
push eax
	mov al, byte ptr[ebx+esi]
	cmp al, 0
	je primo
	; alpha check
	cmp al, 41h
	jl not_alpha
	cmp al, 5Ah
	jle found_letter
	cmp al, 61h
	jl not_alpha
	cmp al, 7Ah
	jg not_alpha
	found_letter:


secondo_ciclo:
	cmp al, 65
	je vowel_f
	cmp al, 69
	je vowel_f
	cmp al,	73
	je vowel_f
	cmp al, 79
	je vowel_f
	cmp al, 85
	je vowel_f
	;min
	cmp al, 97
	je min_vowel_f
	cmp al, 101
	je min_vowel_f
	cmp al, 105
	je min_vowel_f
	cmp al, 111
	je min_vowel_f
	cmp al, 117
	je min_vowel_f
	add ecx, 1d
	jmp keep
	not_alpha:
	add edx, 1d
	keep:
	inc esi
	jmp is_alpha

min_vowel_f:
	pop eax
	inc eax
	inc edi
	jmp keep
vowel_f:
	pop eax
	inc edi
	jmp keep

primo:
	pop eax	; min val
	mov ebx, dword ptr[ebp+12]
	mov [ebx], edi
	mov ebx, dword ptr[ebp+16]
	mov [ebx], ecx
	mov ebx, eax ; min val
	cmp edi, 0
	je first_p
	jmp secondo
	first_p:
		cmp ecx, 0
		je first_p_
		jmp secondo
		first_p_:
		mov eax, -1

secondo:
	cmp edx, 0
	je sec_f
	jmp fine
	sec_f:
		mov eax, -2

terzo:
	cmp ebx, 0	; all capital
	je terzo_f
	jmp fine
	terzo_f:
		mov eax, -3
fine:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_conta_vocali_consonanti endp


end