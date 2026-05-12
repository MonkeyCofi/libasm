extern __errno_location

section .text
	global ft_write

ft_write:
	mov rax, 1		; move the write syscall into the rax register
	syscall			; call the function
	cmp rax, -4095	; compare the rax register to any negative number from -4095
	jae _error		; jump above equal to to .error
	ret

_error:
	mov rbx, rax	; move the error number to rbx
	neg rbx			; negate the error number
	call __errno_location WRT ..plt
	mov [rax], rbx	; move the error number to *rax address
	mov rax, -1
	ret
