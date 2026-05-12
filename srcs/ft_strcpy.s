; char *strcpy(char *dest, char *src)
; dest -> $rdi
; src -> $rsi

section .text
	global ft_strcpy
	mov rcx, [rdi]	; dest
	mov rdx, [rsi]	; src

ft_strcpy:
	cmp rcx, 0
	je _return
	cmp rdx, 0
	je _return
	mov rcx, rdx
	inc rcx
	inc rdx
	jmp ft_strcpy

_return:
	ret