global _write
extern __errno_location

_write:
	mov eax, 0x1
	syscall
	test rax, rax
	js .error
	ret

.error:
	mov ebx, eax
	call __errno_location wrt ..plt
	neg ebx
	mov dword [rax], ebx
	mov rax, -1
	ret