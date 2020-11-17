.586
.model flat
.code


_sommavett proc

; inizio config

push ebp
mov ebp, esp

; registri obbligatori da ripristinare secondo lo standard:

push ebx
push esi
push edi

; fine config

; inizio codice

mov esi, 0
mov ecx, dword ptr [ebp+8]
mov edx, dword ptr[ebp+12]
mov eax,0

ciclo:
cmp esi, dword ptr[ebp+16]
je fine_ciclo
mov ebx, dword ptr [ecx+esi*4]
mov ebx, dword ptr [edx+esi*4]
add eax, ebx

inc esi
jmp ciclo

fine_ciclo:

; fine codice

; inizio config
pop edi
pop esi
pop ebx
mov esp, ebp
pop ebp
ret

; fine config

_sommavett endp

end