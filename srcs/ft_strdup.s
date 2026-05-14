; char *ft_strdup(const char *str)
; str -> $rdi

section .text
	global ft_strdup

ft_strdup:
	; get the length of the string using ft_strlen
	; the length will be stored in the rax register
	extern ft_strlen
	call ft_strlen	; value saved in rax
	; mov rcx, rdi	; save rdi in another register
	; mov rsi, rcx	; move the string into rsi (strcpy src)
	; mov edi, eax	; move the length into the edi register for malloc
	; extern malloc
	; call malloc WRT ..plt	; saves the malloc'd address in rax
	; mov rdi, rax	; move the malloced address into rdi (strcpy dest)
	; extern ft_strcpy
	; call ft_strcpy
	; jmp _return

_return:
	mov rax, 0
	ret