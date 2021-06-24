global  _ft_strcmp

section .text

_ft_strcmp:     ; int   ft_strcmp(char *, char *); rdi, rsi
    xor     rax, rax;   clear rax;
    jmp     compare;      goto cmp

compare:
    mov     al, BYTE [rdi]  ; load a byte from rdi adress to al(byte)
    mov     bl, BYTE [rsi]  ; load a byte from rsi adress
    cmp     al, 0           ; compares al with 0
    je      end             ; jump to end if at end of rdi
    cmp     bl, 0           ;
    je      end             ; jemp to end if at end of rsi
    cmp     al, bl          ; not at the end compare the two bytes
    jne     end             ; if not equal then have result exit
    inc     rdi     
    inc     rsi
    jmp     compare         ; if equal then compare next bytes

end:
    movzx   rax, al
    movzx   rbx, bl         ; move and fill lower bits and set higher to 0
    sub     rax, rbx
    ret
    
