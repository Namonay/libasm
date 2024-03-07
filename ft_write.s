global _write

_write:
	mov eax, 0x1
	syscall
	jc .error
	ret
.error:
	mov rax, -1
	ret