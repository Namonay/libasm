global ft_read
extern __errno_location

ft_read:
	mov eax, 0 ; move the syscall code of write (0) into eax (syscall register)
	syscall
	test rax, rax ; check if the syscall failed
	js .error ; if the syscall failed, jump at .error
	ret ; else return

.error:
	mov rdx, rax ; save rax (return value) into rdx as a temp value
	call __errno_location wrt ..plt ; call errno_location (put errno pointer into rax) | wrt ..plt means the address of the function will be defined at runtime (needed for libc)
	neg rdx ; invert the return value
	mov [rax], rdx ; *errno_value = rdx
	mov rax, -1 ; set the return value to -1
	ret ; return