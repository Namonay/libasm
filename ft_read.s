global ft_read
extern __errno_location

ft_read:
	mov eax, 0
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