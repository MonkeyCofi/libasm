; char *ft_strdup(const char *str)
; str -> $rdi

section .text
	global ft_strdup

ft_strdup:
	extern ft_strlen
	call ft_strlen
	mov r8, rdi		; save the string into the r8 register
	mov edi, eax	; edi will have the length
	inc edi
	extern malloc
	call malloc WRT ..plt
					; rax will now have the malloc'd address
	mov rdi, rax	; store the malloc'd address into rdi as strcpy dest
	mov rsi, r8		; move the str from rcx into rsi as strcpy src
	extern ft_strcpy
	call ft_strcpy
	jmp _return

_return:
	; mov rax, 0
	ret