global  _ft_strcpy
extern  _ft_strlen

section .text
_ft_strcpy: ;void   *ft_strcpy(void *restrict dst, const void *restrict src); rdi, rsi
    push    rdi     ; save di si to stack;
    push    rsi  
    mov     rdi, rsi;   ft_strlen take rdi as str source;
    call    _ft_strlen;     source len in rax;

    mov     rcx, rax;   store source len in couter
    pop     rsi;
    pop     rdi;
    mov     rax, rdi;   store rdi start address as return

    cld         ; string goes increment
    rep movsb   ; moves 1 Byte

    ret 

