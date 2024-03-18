global ft_write
extern __errno_location

ft_write:
	mov eax, 0x1 ; put the syscall number of write
	syscall
	test rax, rax
	js .error
	ret

.error:
	mov rdx, rax
	call __errno_location wrt ..plt
	neg rdx
	mov [rax], rdx
	mov rax, -1
	ret