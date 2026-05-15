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
					; check if malloc failed
	test rax, rax	; performs bitwise operation on register while setting flags
	jz _error		; jump to _error instruction if the zero flag is set
	mov rdi, rax	; store the malloc'd address into rdi as strcpy dest
	mov rsi, [rsp]		; move the str from rcx into rsi as strcpy src
	extern ft_strcpy
	call ft_strcpy
	add rsp, 8	; delete the bytes used for the str pointer in the stack
	ret



_error:
	; set the errno to 12, which is nomem
	ret
