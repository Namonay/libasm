global ft_write
extern __errno_location

ft_write:
	cmp rsi, 0
	je .bad_buff
	mov eax, 0x1 ; put the syscall number of write
	syscall
	test rax, rax ; test if the syscall failed
	js .error
	ret

.bad_buff:
	mov rdx, 22
	call __errno_location wrt ..plt
	mov [rax], rdx
	mov rax, -1
	ret

.error:
	mov rdx, rax  ; move the syscall return value
	call __errno_location wrt ..plt
	neg rdx       ; we neg the syscall return value to put it in errno
	mov [rax], rdx ; *errno_location = value
	mov rax, -1    ; we return -1
	ret