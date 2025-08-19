; ft_strlen.asm — NASM, 64-bit ELF
; size_t ft_strlen(const char *s);
; if s == NULL → return -1 and errno = EINVAL

global  ft_strlen
extern  __errno_location

%define EINVAL 22            ; Invalid argument (POSIX)

section .text
ft_strlen:
    ; Check NULL
    test    rdi, rdi              ; rdi == NULL ?
    jnz     .loop_start           ; if no → go loop

    ; ---- Error: s == NULL ----
    call    __errno_location      ; rax = &errno
    mov     dword [rax], EINVAL   ; errno = EINVAL
    mov     rax, -1               ; return -1
    ret

.loop_start:
    xor     rax, rax              ; len = 0

.loop:
    cmp     byte [rdi + rax], 0   ; compare s[len] с '\0'
    je      .done                 ; if 0 → end
    inc     rax                   ; len++
    jmp     .loop

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits

