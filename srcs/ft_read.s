; ssize_t ft_read(int fd, void *buf, size_t count)
; fd -> $rdi
; buf -> $rsi
; count -> $rdx

section .text
  global ft_read

ft_read:
  mov rax, 0
  syscall
  cmp rax, -4095
  jae _error
  ret

_error:
	mov rbx, rax	; move the error number to rbx
	neg rbx			; negate the error number
  extern __errno_location
	call __errno_location WRT ..plt
	mov [rax], rbx	; move the error number to *rax address
	mov rax, -1
	ret
