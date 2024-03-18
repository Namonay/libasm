global ft_strcpy

ft_strcpy:
	xor rbx, rbx

.cpy:
	cmp byte [rsi + rbx], 0
	je .end
	mov rax, [rsi + rbx]
	mov [rdi + rbx], rax
	inc rbx
	jmp .cpy

.end:
	mov byte [rdi + rbx], 0
	mov rax, rdi
	ret
