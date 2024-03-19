global ft_write
extern __errno_location

ft_write:
	cmp rdi, 0
	jl .err_fd
	test rsi, rsi
	je .err_buffer
	mov eax, 0x1 ; put the syscall number of write
	syscall
	test rax, rax
	js .error
	ret

.err_fd:
	call __errno_location wrt ..plt
	mov byte [rax], 22
	mov rax, -1
	ret

.err_buffer:
	call __errno_location wrt ..plt
	mov byte [rax], 22
	mov rax, -1
	ret

.error:
	mov rdx, rax
	call __errno_location wrt ..plt
	neg rdx
	mov [rax], rdx
	mov rax, -1
	ret