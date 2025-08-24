; ft_read.s — x86-64, NASM
; ssize_t ft_read(int fd, void *buf, size_t count);

global  ft_read
extern  __errno_location

section .text
ft_read:
    ; RDI = fd
    ; RSI = buf
    ; RDX = count

    mov     rax, 0
    syscall                     
    
    test    rax, rax 
    js      .error           
    ret

.error:
    neg     rax                 
    mov     rdi, rax           
    call    __errno_location wrt ..plt
    mov     [rax], edi
    mov     rax, -1        
    ret

section .note.GNU-stack noalloc noexec nowrite progbits