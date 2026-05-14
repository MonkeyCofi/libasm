; size_t ft_strlen(const char* s)

section .text
	global ft_strlen

ft_strlen:
	xor rax, rax
	jmp _loop

_loop:
	cmp byte [rdi + rax], 0
	je _return
	inc rax
	jmp _loop

_return:
	ret
