; Affiche 1337 et retourne 0 si il reçoit 42 en entrée sinon 1

rubrique .bss
    entrée RESB 3 ; réserve 3 octets
    len EQU $-entrée ; longueur d'entrée
section .data
    base de messages '1337', 10 ; initialisation
    chiffre db '42', 10

section .texte
    global_start
    _start:

        mov eax, 3 ; lecture de l'appel système
        mov ebx, 0 ; descripteur de fichier 0 = stdin
        mov ecx, entrée ; destination
        mov edx, len ; longueur
        int 0x80


        mov esi, chiffre
        mov edi, entrée
        xor edx, edx
        LOOP:
            mov al, [esi + edx]
            mov bl, [edi + edx]
            inc edx
            cmp al, bl ; comparaison de char
            jne not_equal
            cmp bl, 10; Fin de la chaine ?
            je equal42
            jmp LOOP

        égal42 :
            mov ebx, 1 ; 1 = sortie standard (stdout)
            mov ecx, message ; message à afficher
            mov eax, 4 ; 4 = fonction write
            mouv edx, 4 + 1 ; longueur du message 4 caractères de '1337'
            int 0x80
            déplacer eax, 1
            mov ebx, 0
            int 0x80

        inégal:
            mov eax, 1
            mov ebx, 1
            int 0x80
