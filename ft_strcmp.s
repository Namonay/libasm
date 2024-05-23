global ft_strcmp

ft_strcmp:
	xor r8, r8 ; r8 = 0
	xor rax, rax ; rax = 0

.count:
	mov al, BYTE [rdi + r8] ; al = s1[r8]
	mov dl, BYTE [rsi + r8]; dl = s2[r8]
	test al, al ; if (al == 0)
	jz .end     ; goto end
	test dl, dl ; if (dl == 0)
	jz .end ; goto end
	cmp al, dl ; compare al and dl
	jne .end ; if not equal, goto end
	inc r8 ; r8++
	jmp .count ; repeat

.end: 
	sub al, dl ; take diff between al and dl
	js .neg
	ret ; return it

.neg:
	neg al ; al = -al;
	neg rax ; al is the first 8 bit of rax, so reverse it
	ret ; return it