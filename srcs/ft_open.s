default rel

section .text
	global ft_open

ft_open:
	mov rax, 2	; syscall number for open
	syscall
	cmp rax, -4095
	jae _error
	ret

_error:
	mov rbx, rax	; move the error number to rbx
	neg rbx			; negate the error number
	extern __errno_location	; extern for __errno_location
	call __errno_location WRT ..plt	; call errno with reference to the linkage table
	mov [rax], rbx	; move the error number to *rax address
	mov rax, -1
	ret