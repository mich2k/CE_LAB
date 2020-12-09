.586
.model flat
.code

_muldiv proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov eax, dword ptr[ebp+8]	; primo val
mov ebx, dword ptr[ebp+12]	; secondo val
mov esi, 0d
mov edi, 0d

cdq
idiv ebx

mov dword ptr[ebp + 20], eax	; salvo eax

mov eax, dword ptr[ebp+8]
imul ebx

mov dword ptr[ebp+16], eax		; salvo eax

fine:
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_muldiv endp

end