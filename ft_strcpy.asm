; ft_strcpy.s — x86-64, NASM
; char *ft_strcpy(char *dst, const char *src);

global  ft_strcpy
extern  __errno_location

%define EINVAL 22

section .text
ft_strcpy:
    ; Arguments:
    ; RDI = dst
    ; RSI = src

    ; Check for NULL
    test    rdi, rdi
    jz      .error
    test    rsi, rsi
    jz      .error

    mov     rax, rdi          ; RAX = dst

.copy_loop:
    mov     dl, byte [rsi]    ; *src in some argument
    mov     byte [rdi], dl    ; from argument to *dst
    inc     rsi
    inc     rdi
    test    dl, dl            ; check if end (\0)
    jne     .copy_loop

    ret

.error:
    call    __errno_location
    mov     dword [rax], EINVAL
    xor     rax, rax
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
