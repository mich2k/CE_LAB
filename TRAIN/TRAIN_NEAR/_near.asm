.586
.model flat
.code

_addizione proc

push ebp
mov ebp,esp
push ebx
push esi
push edi


call sottrazione	; call funzione near

add eax, dword ptr[ebp+12]

;mov eax, ebx

pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret

_addizione endp



; seconda funzione <<near>>

sottrazione proc	; funzione near, questa non ha bisogno del '_'

					; registri pushati sullo stack

					; ATTENZIONE: SE SI VOGLIONO UTILIZZARE I PARAMETRI DAL MAIN
					; NON SI DEVE PUSHARE & PULLARE EBP + MOV EBP, ESP!


;push ebp			; NO
;mov ebp,esp		; NO
push ebx
push esi
push edi

					; codice near
mov ebx, dword ptr[ebp+8]
mov ecx, dword ptr[ebp+12]
sub ecx, ebx
mov eax, ecx
					; fine codice near

pop edi				; pop registri dallo stack
pop esi
pop ebx
;mov esp,ebp		; NO
;pop ebp			; NO
ret					; ritorno sottrazione

sottrazione endp	; end funzione near, senza '_'

end					; end asm
