global ft_strdup

extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
    call ft_strlen
    inc rax
    push rdi
    mov rdi, rax  ; move the result of strlen in rdi
    call malloc wrt ..plt
    test rax, rax
    je .end
    pop r8
    mov rdi, rax   ; move the result of malloc into rdi (override strlen result)
    mov rsi, r8    ; move the argument of strdup in rsi
    call ft_strcpy
    ret

.end:
    pop r8
    ret