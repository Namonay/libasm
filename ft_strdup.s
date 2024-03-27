global ft_strdup

extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
    call ft_strlen 
    inc rax       ; we add one to the result of strlen for the \0
    push rdi	  ; we put rdi in r10 for later use
    mov rdi, rax  ; move the result of strlen in rdi
    call malloc wrt ..plt ; 
    test rax, rax		; test if malloc failled
    je .end
    pop rsi        ; we take the value we saved earlier
    mov rdi, rax   ; move the result of malloc into rdi (override strlen result)
    call ft_strcpy
    ret 

.end:
	pop rsi
    ret