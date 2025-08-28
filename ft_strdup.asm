; ft_strdup.asm — x86-64 NASM
; char *ft_strdup(const char *s);

global  ft_strdup
extern  malloc
extern  ft_strcpy
extern  ft_strlen
extern  __errno_location

section .text
ft_strdup:
    ; Argument: RDI = s (source string pointer)
    test    rdi, rdi            ; check if s == NULL
    jnz     .do_strdup

    ; if (s == NULL): set errno = EINVAL and return NULL
    call    __errno_location wrt ..plt
    mov     dword [rax], 22     ; errno = EINVAL (22)
    xor     rax, rax            ; return NULL
    ret

.do_strdup:
    push    rdi                 ; save s on the stack

    ; call ft_strlen(s)
    call    ft_strlen           ; RAX = strlen(s)
    add     rax, 1              ; +1 for the null terminator '\0'

    ; call malloc(len+1)
    mov     rdi, rax            ; first argument = size
    call    malloc wrt ..plt
    test    rax, rax            ; check if malloc returned NULL
    jz      .malloc_fail

    ; call ft_strcpy(new, s)
    mov     rdi, rax            ; dest = malloc buffer
    pop     rsi                 ; restore s into RSI (2nd arg)
    call    ft_strcpy           ; copy s into allocated buffer

    ret                         ; return pointer in RAX

.malloc_fail:
    xor     rax, rax            ; return NULL
    pop     rcx                 ; fix stack (remove saved s)
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
