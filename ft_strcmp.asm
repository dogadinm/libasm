; ft_strcmp.s — x86-64, NASM
; int ft_strcmp(const char *s1, const char *s2);

global  ft_strcmp
extern  __errno_location

%define EINVAL 22

section .text
ft_strcmp:
    ; Arguments:
    ; RDI = s1
    ; RSI = s2

    ; Check for NULL
    test    rdi, rdi
    jz      .error
    test    rsi, rsi
    jz      .error

.loop:
    mov     al, byte [rdi]      ; al = *s1
    mov     dl, byte [rsi]      ; dl = *s2
    cmp     al, dl              ; compare
    jne     .diff               ; jump if not equal
    test    al, al              ; if al == 0 (edn)
    je      .equal              ; if equal
    inc     rdi
    inc     rsi
    jmp     .loop

.diff:
    movzx   eax, al             ; expand *s1 to int
    movzx   edx, dl             ; expand *s2 to int
    sub     eax, edx            ; diff
    ret

.equal:
    xor     eax, eax            ; return 0
    ret

.error:
    call    __errno_location wrt ..plt
    mov     dword [rax], EINVAL
    mov     eax, -1
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
