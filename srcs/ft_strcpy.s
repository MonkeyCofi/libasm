; char *strcpy(char *dest, char *src)
; dest -> $rdi
; src -> $rsi

section .text
	global ft_strcpy
	xor rdx, rdx

ft_strcpy:
	; move every byte from rsi to rdi
	mov [rdi], [rsi]
	ret