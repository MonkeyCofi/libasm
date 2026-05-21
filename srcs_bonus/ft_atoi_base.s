; int ft_atoi_base(char *str, char *base)
; returns an integer which is the decimal representation of str
; str is in the base that base is given
; str -> $rdi
; base -> $rsi

section .text
	global ft_atoi_base	

ft_atoi_base:
	lea rbx, [rdi]
	push rsp	; push the stack pointer 	
	jmp _validate
 
; check if the base length <= 1	
; check for duplicate characters
; check for -, +, and whitespace characters
_validate:
	extern ft_strlen	; get the length of the base 0 < b < 10
						; length will be saved in the rax register
	cmp rax, 0
	jle _base_length_error
	cmp rax, 10
	jg _base_length_error

_base_length_error:

	ret