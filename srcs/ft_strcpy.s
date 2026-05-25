; char *strcpy(char *dest, char *src)
; dest -> $rdi
; src -> $rsi

section .text
	global ft_strcpy

ft_strcpy:
	xor rcx, rcx
	jmp _loop

_loop:
	cmp BYTE [rsi + rcx], 0
	je _return
	mov al, BYTE [rsi + rcx]
	mov BYTE [rdi + rcx], al
	inc rcx
	jmp _loop

_return:
	mov BYTE [rdi + rcx], 0
	lea rax, [rdi]
	ret
