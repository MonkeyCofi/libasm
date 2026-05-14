; int ft_strcmp(const char *s1, const char *s2) -> function signature
; s1 is in rsi
; s2 is in rdi

section .text
	global ft_strcmp
	xor rax, rax		; set rax to 0
	xor rcx, rcx		; set rcx to 0

ft_strcmp:
	mov al, byte [rsi]	; move the current byte in rsi into al {rax} register
	mov dl, byte [rdi]	; move the current byte in rdi into dl {rdx} register
	cmp al, 0		; compare *s1 to /0
	je _return		; jump if equal to return
	cmp dl, 0		; compare *s2 to /0
	je _return 		; jump if equal to return
	cmp byte al, dl		; compare *s1 to *s2
	jne _return		; jump if not equal to return
	inc rsi			; increment s1 ptr
	inc rdi			; increment s2 ptr
	jmp ft_strcmp		; jump back to ft_strcmp

_return:
	mov rcx, rax		; move value in rax to rcx
	sub rcx, rdx		; subtract the value at rcx and rdx
	mov rax, rcx		; move the result of the subtraction to rax register
	ret