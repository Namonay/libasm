global ft_strlen

ft_strlen:
	xor rax, rax ; rax = 0;

.cmp_char:
	cmp byte [rdi + rax], 0 ; if (str[rax] == 0)
	je .end ;                 goto end
	inc rax ;                 rax++;
	jmp .cmp_char ;           repeat
.end:
	ret ; return it