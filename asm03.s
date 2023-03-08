section .data
    string db '1337', 0
    string_len equ $-string

section .bss
    input resb 4

global _start

section .text
_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 4
    int 0x80

    cmp word [input], 0x3234
    jne exit

    mov eax, 4
    mov ebx, 1
    mov ecx, string
    mov edx, string_len
    int 0x80

    mov eax, 0
    jmp exit

exit:
    mov ebx, eax
    mov eax, 1
    int 0x80
