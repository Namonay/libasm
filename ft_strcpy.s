global ft_strcpy

ft_strcpy:
	xor rdx, rdx

.cpy:
	cmp byte [rsi + rdx], 0
	je .end
	mov rax, [rsi + rdx]
	mov [rdi + rdx], rax
	inc rdx
	jmp .cpy

.end:
	mov byte [rdi + rdx], 0
	mov rax, rdi
	ret
