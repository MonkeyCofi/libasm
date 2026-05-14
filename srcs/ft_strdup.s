; char *ft_strdup(const char *str)
; str -> $rdi

section .text
	global ft_strdup

ft_strdup:
	sub rsp, 8	; move the stack pointer up by 8 bytes
	mov [rsp], rdi	; move the address of str into rsp
	extern ft_strlen
	call ft_strlen
	mov edi, eax	; edi will have the length
	inc edi
	extern malloc
	call malloc WRT ..plt	; call malloc with reference to procedure linkage table
					; rax will now have the malloc'd address
	mov rdi, rax	; store the malloc'd address into rdi as strcpy dest
	mov rsi, [rsp]		; move the str from rcx into rsi as strcpy src
	extern ft_strcpy
	call ft_strcpy
	add rsp, 8	; delete the bytes used for the str pointer in the stack
	jmp _return

_return:
	ret
