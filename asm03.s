section .données
    chaîne de données '1337', 0
    chaîne_len équi $-chaîne
rubrique .bss
    entrée resb 4

global_start

section .texte
_commencer:

    ecx pop             
    ajouter esp, 4          
    mov ecx, [esp]      
    
    cmp octet[ecx], 0x34
    sortie jne
    cmp octet[ecx+1], 0x32
    sortie jne
    
    déplacer eax, 4
    mov ebx, 1
    mov ecx, chaîne
    mov edx, string_len
    entier 0x80
    
    déplacer eax, 1
    mov ebx, 0
    entier 0x80
    
   
sortie:
    
    déplacer eax, 1
    mov ebx, 1
    entier 0x80
