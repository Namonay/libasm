global ft_strlen

ft_strlen:
	xor rax, rax

.cmp_char:
	cmp byte [rdi + rax], 0
	je .end
	inc rax
	jmp .cmp_char

.end:
	ret