global_start

section .texte
_start:
	mov eax, 1
	mov ebx, 0
	int 0x80
