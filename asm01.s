section .data
    base de données de messages '1337', 10

global_start
 
section .texte
_start:
    déplacer eax, 4 ; code pour l'appel système écrire
    mov ebx, 1 ; descripteur de fichier stdout
    mov ecx, message ; pointeur vers le message
    mouv edx, 4+1 ; longueur du message
    entier 0x80 ; appel système écrire


    déplacer eax, 1 ; rencontré eax à 1
    mov ebx, 0
    entier 0x80   
