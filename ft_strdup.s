global ft_strdup

extern ft_strlen
extern ft_strcpy
extern malloc
extern __errno_location

ft_strdup:
    cmp rdi, 0
    je .end
    mov r12, rdi
    call ft_strlen
    inc rax
    mov rdi, rax
    call malloc wrt ..plt
    test rax, rax
    je .end
    mov rdi, rax
    mov rsi, r12
    call ft_strcpy
    ret

.end:
    xor rax, rax
    ret