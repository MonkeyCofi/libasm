; int ft_atoi_base(char *str, char *base)
; returns an integer which is the decimal representation of str
; str is in the base that base is given
; str -> $rdi
; base -> $rsi


; variables
; rcx => current exponent
; rbp - 8 => base length
; rbp - 16 => result of power function
; rbp - 24 => integer flag for negative
; rbp - 32 => counter to loop up until exponent
; rbp - 40 => overall result of atoi_base
section .text
	global ft_atoi_base	

ft_atoi_base:
	xor rax, rax
	; setting up the stack frame
	push rbp
	mov rbp, rsp
	sub rsp, 40 ; allocating 40 bytes for 5 integer variables
	jmp _validate

 
; check if the base length <= 1	
; check for duplicate characters
; check for -, +, and whitespace characters
_validate:
	extern ft_strlen	; get the length of the base 0 < b < 10
						; length will be saved in the rax register
	call ft_strlen
	cmp rax, 0
	jle _base_length_error
	cmp rax, 15
	jg _base_length_error
	mov rcx, rax - 1	; store the moving exponent in the rcx register
	mov [rbp - 8], rax
	mov QWORD [rbp - 40], 0
	jmp _atoi

_pow:
						; [rbp - 16] to get the result of power
	mov QWORD [rbp - 16], 1	; set pow result to 1
	mov QWORD [rbp - 32], 0 ; set counter to 0
	call _pow_loop
	ret					; will return back to _atoi label

_pow_loop:
	cmp [rbp - 32], rcx			; check if counter reached exponent
	je _end						; this will return back to pow label
	mov rax, QWORD [rbp - 16]	; move pow result into rax for imul instruction
	imul rax, QWORD [rbp - 8]	; multiply pow result with base
									; move multiplication result from eax to [rbp - 16]
	mov [rbp - 16], rax
	inc [rbp - 32]
	jmp _pow_loop


_atoi:
	; result will be stored in the rax register
	; the length of base is the base
	; store the length of the str - 1 in rcx
	; startimg from the leftmost digit, multiply the digit by (base ^ rcx)
	; repeat this process up until the end of the string
	cmp BYTE [rdi], 0	; if the nul terminator is reached, jump to end
	je _atoi_end
	; get the power of base using rcx as the exponent
	; store the character converted into a number into the rsi register
	mov al, BYTE [rdi]	; temporarily move the digit into the al register
	sub al, 0x30		; subtract '0' from the character to get int representation
	movzx rsi, al		; move it into rsi register. zero out rest of bits
	call _pow	;
	; [rbp - 40] should be rsi * [rbp - 16]
	mov rax, [rbp - 16]
	imul rax, rsi
	; imul ax, rsi, [rbp - 16]
	add [rbp - 40], ax	; add into the result
	inc rdi	; go to the next number in the string
	jmp _atoi

_base_length_error:
	ret

_end:
	ret

_atoi_end:
	; move the result into rax register
	mov rax, [rbp - 40]	; move 8 bytes from rsp - 40 into the rax register
	mov rsp, rbp
	; add rsp, 40						; remove the 40 allocated bytes
	pop rbp
	ret