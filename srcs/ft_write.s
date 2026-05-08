extern __errno_location

section .text
	global ft_write

ft_write:
	mov rax, 1		; move the write syscall into the rax register
	syscall			; call the function
	cmp rax, -4095	; compare the rax register to any negative number from -4095 to -1
	jae _error		; jump above equal to to .error
	ret

_error:
					; set up the stack frame
	push rbp		; push the base pointer into the stack
	mov rbp, rsp	; set the stack pointer as the new base pointer
					; set rax to -1
	neg eax			; negate the current number stored in the rax register
	push rax
	call __errno_location WRT ..plt
	pop rdx
	mov dword [rax], edx
	mov rax, -1
	leave
	ret	
