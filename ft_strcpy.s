global ft_strcpy

ft_strcpy:
	xor rdx, rdx

.cpy:
	cmp byte [rsi + rdx], 0 ; if src is empty
	je .end
	mov rax, [rsi + rdx] ; move src[rdx] to rax
	mov word [rdi + rdx], ax ; dest[rdx] = src[rdx]
	inc rdx				 ; rdx++
	jmp .cpy

.end:
	mov byte [rdi + rdx], 0 ; dest[rdx] = '\0'
	mov rax, rdi ; set dest as the return value
	ret ; return
