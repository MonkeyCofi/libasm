; int ft_atoi_base(char *str, char *base)
; str -> $rdi
; base -> $rsi

; variables
; rcx 		=> current exponent
; rax 		=> operand for multiplier
; rbp - 8 	=> base length
; rbp - 16 	=> result of power function
; rbp - 24 	=> integer flag for negative
; rbp - 32 	=> counter to loop up until exponent
; rbp - 40 	=> overall result of atoi_base
section .text
	global ft_atoi_base	

ft_atoi_base:
	xor rax, rax
	; setting up the stack frame
	jmp _validate

_validate:
	extern ft_strlen		; get the length of str
							; length will be saved in the rax register
	call ft_strlen
	cmp rax, 0
	jle _base_error
	mov rcx, rax			; store the moving exponent in the rcx register
	sub rcx, 1
	; now get the length of the base string
	mov rdx, rdi			; temporarily store str at rdi into rdx
	mov rdi, rsi 			; mov base into rdi
	call ft_strlen
	cmp rax, 1
	jle _base_error
	cmp rax, 16
	jg _base_error
	call _check_string
	cmp rax, 0
	je _base_error
	; if the base is valid, set up the stack frame
	push rbp
	mov rbp, rsp
	sub rsp, 40 ; allocating 40 bytes for 5 integer variables
	mov [rbp - 8], rax		; move the base length into var
	mov rdi, rdx			; move str back into rdi
	mov QWORD [rbp - 40], 0	; zero out initial result
	jmp _atoi

_check_string:
	xor r8, r8		; zero the r8 register
	xor r9, r9		; first loop indexer: i
	xor r10, r10	; second loop indexer: j
	jmp _check_string_loop

_check_string_loop:
	cmp BYTE [rdi + r9], 0
	je _end
	cmp BYTE [rdi + r9], 45
	je _base_error
	cmp BYTE [rdi + r9], 43
	je _base_error
	mov r8b, [rdi + r9]	; move character into r8b (8 bit register)
	mov r10, r9
	inc r10
	call _dup_check
	inc r9
	jmp _check_string_loop

_dup_check:
	cmp BYTE [rdi + r10], 0	; if str[index] == 0
	je _end		; reached nul terminator so return
	cmp BYTE [rdi + r10], r8b
	je _base_error
	inc r10
	jmp _dup_check

_base_error:
	mov rax, 0
	ret

_pow:
							; [rbp - 16] to get the result of power
	mov QWORD [rbp - 16], 1	; set pow result to 1
	mov QWORD [rbp - 32], 0 ; set counter to 0
	mov rax, QWORD 0
	call _pow_loop
	ret						; will return back to _atoi label

_pow_loop:

	cmp [rbp - 32], rcx			; check if counter reached exponent
	je _end						; this will return back to pow label
	mov rax, QWORD [rbp - 16]	; move pow result into rax for imul instruction
	imul rax, QWORD [rbp - 8]	; multiply pow result with base
									; move multiplication result from eax to [rbp - 16]
	mov [rbp - 16], rax
	inc [rbp - 32]
	jmp _pow_loop

_end:
	ret

; stores the position of character in str into r9 register
_get_base_pos:
	xor r8, r8
	jmp _get_base_pos_loop

_not_found:
	mov rax, -1	; return -1 to indicate to _atoi that char is not found in base string
	ret

_get_base_pos_loop:
	cmp BYTE [rsi + r8], 0	; if current base character is nul terminator, char not found in base
	je _not_found
	cmp al, BYTE [rsi + r8]	; compare current char in str to every base characters
	je _end
	inc r8
	jmp _get_base_pos_loop

_atoi:
	cmp BYTE [rdi], 0	; if the nul terminator is reached, jump to end
	je _atoi_end
	mov al, BYTE [rdi]	; temporarily move the current str char into the al register
	call _get_base_pos	; get current character's position in the base string into r8 register
	cmp rax, -1
	je _atoi_error		; if character in string is not found in base, return 0
	call _pow	;
	mov rax, [rbp - 16]
	imul rax, r8 
	add [rbp - 40], rax	; add into the result
	inc rdi				; go to the next number in the string
	dec rcx
	jmp _atoi

_atoi_error:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret


_atoi_end:
	mov rax, [rbp - 40]	; move result from stack into rax register
	mov rsp, rbp
	pop rbp
	ret
