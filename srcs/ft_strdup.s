; char *ft_strdup(const char *str)
; str -> $rdi

section .text
	global ft_strdup

ft_strdup:
	sub rsp, 8
	mov [rsp], rdi
	extern ft_strlen
	call ft_strlen
	mov edi, eax	; edi will have the length
	inc edi
	extern malloc
	call malloc WRT ..plt
					; rax will now have the malloc'd address
	mov rdi, rax	; store the malloc'd address into rdi as strcpy dest
	mov rsi, [rsp]		; move the str from rcx into rsi as strcpy src
	extern ft_strcpy
	call ft_strcpy
	add rsp, 8
	jmp _return

_return:
	; mov rax, 0
	ret