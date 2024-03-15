extern _strcmp


_strcmp:
	xor rax, rax
	xor rbx, rbx
.count:
	mov rax, [rdi + rbx]
	sub rax, [rsi + rbx]
	cmp rax, 0
	jne .end
	inc rbx
	jmp .count

.end: 
	ret
