.586
.model flat
.code

_assitoa proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr [ebp+16]	; dest, conversione in stringa
mov eax, dword ptr [ebp+8]	; source, val
mov esi, 1d	; neg alert
mov ecx, 10d 
mov edi, 0d		; len

neg_check:
	cmp eax, 0
	je end_neg_check
	jl neg_f
	jmp end_neg_check
	neg_f:
		neg eax
		mov esi, -1d
end_neg_check:
push eax
len:
	mov ecx, 10d
	cdq
	idiv ecx
	cmp eax, 0d
	je end_
	inc edi
	jmp len
	end_:
		cmp edx, 0d
		inc edi
		je primo_ciclo
pop eax

cmp esi, 1
je _pos
cmp esi, -1
je _neg

_neg:
mov byte ptr [ebx], '-'
mov byte ptr [ebx+edi+1], 0

push eax
neg_primo_ciclo:
	cmp edi, 0
	je fine
	cdq
	idiv ecx
	add dl, '0'
	mov byte ptr [ebx+edi], dl
	sub edi ,1d
	jmp neg_primo_ciclo
	

_pos:
mov byte ptr [ebx+edi], 0
sub edi, 1d

push eax
primo_ciclo:
	cmp edi, -1
	je fine
	cdq
	idiv ecx
	add dl, '0'
	mov byte ptr [ebx+edi], dl
	sub edi ,1d
	jmp primo_ciclo
	

fine:
pop eax
cmp eax, 0d
je f
jmp _fine
f:
	cmp dword ptr[ebp+12], 1
	je _f
	jmp len
	_f:
		mov eax, -2
		jmp __fine

_fine:
cmp dword ptr[ebp+12], 1
je ff
jmp _default
	ff:
		mov eax, esi
		jmp __fine

_default:
mov eax, 0d
__fine:
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_assitoa endp


end