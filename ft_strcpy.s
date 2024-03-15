extern _strcpy

_strcpy:
	xor rbx, rbx

.cpy:
	cmp dword [rsi + rbx], 0
	je .end
	mov rax, [rsi + rbx]
	mov [rdi + rbx], rax
	inc rbx
	jmp .cpy

.end:
	mov rax, rdi
	ret
