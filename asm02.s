; Affiche 1337 et retourne 0 si il reçoit 42 en entrée sinon 1

rubrique .bss
    entrée RESB 3 ; réserve 3 octets
    len EQU $-entrée ; longueur d'entrée
section .données
    base de messages '1337', 10 ; initialisation
    chiffre db '42', 10

section .texte
    global_start
    _commencer:

        mov eax, 3 ; lecture de l'appel système
        mov ebx, 0 ; descripteur de fichier 0 = stdin
        mov ecx, entrée ; destination
        mov edx, len ; longueur
        entier 0x80


        mov esi, chiffre
        mov edi, entrée
        xor edx, edx
        BOUCLE:
            mobile, [esi + edx]
            mov bl, [edi + edx]
            inc edx
            cmp al, bl ; comparaison de char
            jne not_equal
            cmpbl, 10; Fin de la chaine ?
            je suis égal42
            BOUCLE jmp

        égal42 :
            mov ebx, 1 ; 1 = sortie standard (stdout)
            mov ecx, message ; message à afficher
            déplacer eax, 4 ; 4 = fonction écrire
            mouv edx, 4 + 1 ; longueur du message 4 caractères de '1337'
            entier 0x80
            déplacer eax, 1
            mov ebx, 0
            entier 0x80

        inégal:
            déplacer eax, 1
            mov ebx, 1
            entier 0x80