; char *strcpy(char *dest, char *src)
; dest -> $rdi
; src -> $rsi

section .text
	global ft_strcpy
	xor rax, rax
	mov rax, [rdi]

ft_strcpy:
	cmp [rsi], BYTE 0	; compare the current $rsi character to nul
	je _return			; if it is equal, jump to return
	mov cl, BYTE [rsi]	; move the character to the cl register 
	mov BYTE [rax], cl	; move the character from cl into the rax register (which is equal to the destination)
	inc rsi				; increment the src ptr
	inc rax				; increment the dst ptr
	jmp ft_strcpy		; loop again

_return:
	; return the destination address
	; add the nul terminator to the end of the rdi register
	; mov rdi, 0
	mov BYTE [rax], 0
	mov rax, rdi
	ret
