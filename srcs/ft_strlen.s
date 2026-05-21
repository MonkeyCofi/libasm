; size_t ft_strlen(const char* s)
; $rdi => s

section .text
	global ft_strlen

ft_strlen:
	xor rax, rax	; set the rax register to 0
	jmp _loop

_loop:
	cmp byte [rdi + rax], 0	; compare the current byte in rax to nul
	je _return				; if equal, return
	inc rax					; increment rax
	jmp _loop				; jump bac to the loop

_return:
	ret
