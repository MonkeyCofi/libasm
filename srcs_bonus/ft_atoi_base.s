; int ft_atoi_base(char *str, char *base)
; str -> $rdi
; base -> $rsi

; variables
; rcx 		=> current exponent
; rax 		=> operand for multiplier
; rdx		=> indexer of str
; r11		=> end of actual digits in str
; rbp - 8 	=> base length
; rbp - 16 	=> result of power function
; rbp - 24 	=> integer flag for negative
; rbp - 32 	=> counter to loop up until exponent
; rbp - 40 	=> overall result of atoi_base
section .text
	global ft_atoi_base	
	extern ft_strlen

ft_atoi_base:
	xor rax, rax
	; setting up the stack frame
	call .skip_leading_whitespace	; skip leading whitespaces
	cmp BYTE [rdi], 0x0		; if the nul terminator is reached while skipping whitespaces,
	je .base_error			; return 0
	jmp .check_sign

.validate:
	; 						; length will be saved in the rax register
	call .get_length
	cmp rax, 0				; if the length of the string is 0, return 0
	jle .base_error
	mov r10, rax			; move the length of the string into the r10 register
	dec r10					; decrement it to get to character before nul terminator
	call .skip_trailing_whitespace
	mov rax, r10			; move the length of the actual string back into rax
	inc rax					; increment rax to get one character back
	mov rdx, rax			; move the end of the string into rdx to temporarily store
	mov rcx, rax			; store the moving exponent in the rcx register
	sub rcx, 1				; length - 1
	push rdi				; store the string in the stack
	mov rdi, rsi 			; mov base into rdi
	call ft_strlen
	cmp rax, 1
	jle .base_error
	cmp rax, 16
	jg .base_error
	call .check_string
	cmp rax, 0
	je .base_error
								; if the base is valid, set up the stack frame
	pop rdi						; pop the string back into rdi
	push rbp
	mov rbp, rsp
	sub rsp, 40 				; allocating 40 bytes for 5 integer variables
	mov [rbp - 8], rax			; move the base length into var
	mov QWORD [rbp - 40], 0		; zero out initial result
	mov [rbp - 24], QWORD r11	; move the negative flag
	mov r11, rdx				; move the actual strlen into r11
	xor rdx, rdx
	jmp .atoi

.get_length:
	cmp BYTE [rdi + rax], 0x0
	je .end				; reached the nul terminator
	cmp BYTE [rdi + rax], 0x20	; check if space
	je .end					; return if true
	cmp BYTE [rdi + rax], 0x07
	jl .increment_length
	cmp BYTE [rdi + rax], 0x0D
	jg .increment_length
	jmp .end

.increment_length:
	inc rax
	jmp .get_length

.skip_trailing_whitespace:
	cmp BYTE [rdi + r10], 0x20
	je .skip_trailing_space
	cmp BYTE [rdi + r10], 0x07
	jl .end
	cmp BYTE [rdi + r10], 0x0D
	jg .end
	jmp .skip_trailing_space

.skip_trailing_space:
	dec r10
	jmp .skip_trailing_whitespace

.skip_leading_whitespace:
	cmp BYTE [rdi], 0x0
	je .end
	cmp BYTE [rdi], 0x20
	je .skip_leading_space
	cmp BYTE [rdi], 0x07
	jl .end
	cmp BYTE [rdi], 0x0D
	jg .end
	jmp .skip_leading_space

.skip_leading_space:
	inc rdi
	jmp .skip_leading_whitespace

.check_sign:
	mov r11, QWORD 1
	cmp BYTE [rdi], 0x2D		; check if first character is a - sign
	je .set_negative_flag		; set negative
	cmp BYTE [rdi], 0x2B
	je .skip_sign
	jmp .validate

.skip_sign:
	inc rdi
	jmp .validate

.set_negative_flag:
	mov r11, QWORD -1
	inc rdi
	jmp .validate
	
.check_string:
	xor r8, r8					; zero the r8 register
	xor r9, r9					; first loop indexer: i
	xor r10, r10				; second loop indexer: j
	jmp .check_string_loop

.check_string_loop:
	cmp BYTE [rdi + r9], 0x0
	je .end
	cmp BYTE [rdi + r9], 0x2D
	je .base_error
	cmp BYTE [rdi + r9], 0x2B
	je .base_error
	mov r8b, [rdi + r9]			; move character into r8b (8 bit register)
	mov r10, r9
	inc r10
	call .dup_check
	inc r9
	jmp .check_string_loop

.dup_check:
	cmp BYTE [rdi + r10], 0x0	; if str[index] == 0
	je .end						; reached nul terminator so return
	cmp BYTE [rdi + r10], r8b
	je .base_error
	inc r10
	jmp .dup_check

.base_error:
	mov rax, 0
	ret

.pow:
								; [rbp - 16] to get the result of power
	mov QWORD [rbp - 16], 1		; set pow result to 1
	mov QWORD [rbp - 32], 0 	; set counter to 0
	mov rax, QWORD 0
	call .pow_loop
	ret							; will return back to .atoi label

.pow_loop:

	cmp [rbp - 32], rcx			; check if counter reached exponent
	je .end						; this will return back to pow label
	mov rax, QWORD [rbp - 16]	; move pow result into rax for imul instruction
	imul rax, QWORD [rbp - 8]	; multiply pow result with base
								; move multiplication result from eax to [rbp - 16]
	mov [rbp - 16], rax
	inc [rbp - 32]
	jmp .pow_loop

.end:
	ret

; stores the position of character in str into r9 register
.get_base_pos:
	xor r8, r8
	jmp .get_base_pos_loop

.not_found:
	mov rax, -1					; return -1 to indicate to .atoi that char is not found in base string
	ret

.get_base_pos_loop:
	cmp BYTE [rsi + r8], 0		; if current base character is nul terminator, char not found in base
	je .not_found
	cmp al, BYTE [rsi + r8]		; compare current char in str to every base characters
	je .end
	inc r8
	jmp .get_base_pos_loop

.atoi:
	cmp rdx, r11
	je .atoi_end
	cmp BYTE [rdi], 0			; if the nul terminator is reached, jump to end
	je .atoi_end
	mov al, BYTE [rdi]			; temporarily move the current str char into the al register
	call .get_base_pos			; get current character's position in the base string into r8 register
	cmp rax, -1
	je .atoi_error				; if character in string is not found in base, return 0
	call .pow	;
	mov rax, [rbp - 16]
	imul rax, r8 
	add [rbp - 40], rax			; add into the result
	inc rdi						; go to the next number in the string
	dec rcx
	inc rdx
	jmp .atoi

.atoi_error:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret

.atoi_end:
	mov rax, [rbp - 40]			; move result from stack into rax register
	imul rax, [rbp - 24]
	mov rsp, rbp
	pop rbp
	ret
