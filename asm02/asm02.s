section .bss
    input resb 3
    len equ $-input

section .data
    message db '1337', 10
    chiffre db '42', 10

section .text
    global _start

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, len
    int 0x80

    mov esi, chiffre
    mov edi, input
    xor ecx, ecx
loop_chars:
    mov al, [esi + ecx]
    mov bl, [edi + ecx]
    cmp al, bl
    jne not_equal
    inc ecx
    cmp al, 0
    jne loop_chars

    ; vérifier si la longueur est exactement égale à la longueur de "42"
    cmp ecx, len
    jne not_equal

equal_42:
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 5
    int 0x80

    xor eax, eax
    mov ebx, 0
    int 0x80

not_equal:
    mov eax, 1
    mov ebx, 1
    int 0x80
