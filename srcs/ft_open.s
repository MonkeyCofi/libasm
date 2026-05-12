extern __errno_location

section .text
	global ft_open

ft_open:
	mov rax, 2	; syscall number for open
	syscall
	cmp rax, -4095
	jae _error
	ret

_error:
	_error:
	mov rbx, rax	; move the error number to rbx
	neg rbx			; negate the error number
	call __errno_location WRT ..plt
	mov [rax], rbx	; move the error number to *rax address
	mov rax, -1
	ret