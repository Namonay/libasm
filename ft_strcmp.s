global ft_strcmp

ft_strcmp:
	xor r8, r8
	xor rax, rax

.count:
	mov al, BYTE [rdi + r8]
	mov dl, BYTE [rsi + r8]
	test al, al
	jz .end
	test dl, dl
	jz .end
	cmp al, dl
	jne .end
	inc r8
	jmp .count

.end: 
	sub al, dl
	js .neg
	ret

.neg:
	neg al
	neg rax
	ret