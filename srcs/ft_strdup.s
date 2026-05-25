default rel	; change the addressing mode from absolute addressing to relative addressing
			; this makes the code position independent by using the instruction pointer
			; as a base address that will be offset by the address

; char *ft_strdup(const char *str)
; str -> $rdi

section .text
	global ft_strdup

ft_strdup:
	extern ft_strlen
	call ft_strlen
    push rdi        ; push string into stack for safekeeping
	mov edi, eax	; edi will have the length
	inc edi         ; increment the length by 1 for nul terminator
	extern malloc
	call malloc WRT ..plt	; call malloc with reference to procedure linkage table
					; rax will now have the malloc'd address
	cmp rax, 0x0	; performs bitwise operation on register while setting flags
	je _error		; jump to _error instruction if the zero flag is set
	; mov rdi, rax	; store the malloc'd address into rdi as strcpy dest
    lea rdi, [rax]
    pop rsi
	extern ft_strcpy
	call ft_strcpy
	ret

_error:
	; set the errno to 12, which is nomem
    pop rsi
	xor rax, rax
	ret
