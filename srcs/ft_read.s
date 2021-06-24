%define M_SYSCALL_READ 0x2000003

extern ___error

global _ft_read

section .text ; int read(int rdi, const void *rsi, size_t rdx)

_ft_read:
    mov     rax, M_SYSCALL_READ ; do system call on read
    syscall

    jc      read_error ;carry flag(CF) set at 1 if last operation failed if carry then jump to error
    ret

read_error:
    push    rax;    error messsage returned in rax
    call    ___error; call ___error, pointer to the errno is return as a pointer
    pop     qword [rax]; pop pushed error msg into errno address
    mov     rax, -1     ; return -1 signal of error
    ret 
