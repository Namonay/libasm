global _read
extern __errno_location

_read:
	mov eax, 0x11
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