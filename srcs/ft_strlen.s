global _ft_strlen

section .text

_ft_strlen:
    xor     al, al; al = 0
    xor     rcx, rcx; counter = 0

    not     rcx;   !0 is max. set counter to max value 

    cld
    repne   scasb; while [rdi] != al, rcx--

    not     rcx; positive counter number   
    dec     rcx; counter--

    mov     rax, rcx 

    ret
