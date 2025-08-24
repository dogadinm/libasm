; ft_write.s — x86-64, NASM
; ssize_t ft_write(int fd, const void *buf, size_t count);

global  ft_write
extern  __errno_location

section .text
ft_write:
    ; RDI = fd
    ; RSI = buf
    ; RDX = count

    mov     rax, 1              ; number for sys_write = 1
    syscall                     ; call write(fd, buf, count)

    test	rax, rax
    js      .error                 ; if  negtive error
    ret

.error:
    neg     rax                             ; RAX = -RAX (get errno)
    mov     rdi, rax                        ; rdi get error number
    call    __errno_location wrt ..plt      ; RAX = &errno
    mov     [rax], edi                      ; errno = save value
    mov     rax, -1                         ; return -1
    ret

section .note.GNU-stack noalloc noexec nowrite progbits