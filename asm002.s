global_start

section .données
	msg : bd "1337", 10

rubrique .bss
	buf : resb 4

section .texte
_commencer :
	;lire stdin
	déplacer eax, 3
	mov ebx, 0
	mov ecx, buf
	mov edx, 3
	entier 0x80

	;écrire stdin
	déplacer eax, 4
	mov ebx, 1
	mov ecx, buf
	mov edx, 3
	entier 0x80

_boucle :
	

_egal :



_notegal :



_fin :
	déplacer eax, 1
	mov ebx, 0
	entier 0x80
