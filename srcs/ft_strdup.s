extern ___error
extern _ft_strlen
extern _ft_strcpy
extern _malloc

global _ft_strdup

section .text ; char *ft_strdup(const char *rdi)

_ft_strdup:
    push    rdi;    save rdi because it will be used by malloc

    call    _ft_strlen;
    inc     rax;    len++ for '\0'

    mov     rdi, rax; size to malloc
    call    _malloc;

    cmp     rax, 0  ; compare if the malloc success
    je      ft_strdup_error;

    pop     rsi;    set rsi to source string to copy
    mov     rdi, rax;   set malloc string to dst
    call    _ft_strcpy;
    ret

ft_strdup_error:
    pop     rdi;    
    ret 
