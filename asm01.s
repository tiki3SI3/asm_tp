section .data
    message db '1337', 10
 
global _start
 
section .text
_start:
    mov eax, 4 ; code pour l'appel système write
    mov ebx, 1 ; file descriptor stdout
    mov ecx, message ; pointeur vers le message
    mov edx, 4 ; longueur du message

    int 0x80 ; appel système write
    mov eax, 1 ; code pour l'appel système exit
    xor ebx, ebx ; code de retour 0
    int 0x80 ; appel système exit



