%define M_SYSCALL_WRITE 0x2000004

extern ___error

global _ft_write

section .text ; int write(int rid, const void *rsi, size_t rdx)

_ft_write:
    mov     rax, M_SYSCALL_WRITE ; do system call on write
    syscall

    jc      write_error ;carry flag(CF) set at 1 if last operation failed if carry then jump to error
    ret

write_error:
    push    rax;    error messsage returned in rax
    call    ___error; call ___error, pointer to the errno is return as a pointer
    pop     qword [rax]; pop pushed error msg into errno address
    mov     rax, -1     ; return -1 signal of error
    ret 
