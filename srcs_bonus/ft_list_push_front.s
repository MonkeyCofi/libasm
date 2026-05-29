default rel

; void ft_list_push_front(t_list **head, void *data)
; rdi => pointer to the head node
; rsi => pointer to the data

section .text
	global ft_list_push_front
	extern malloc

ft_list_push_front:
	push rdi		; push rdi into the stack
	mov edi, 16		; set edi to 16 for 16 byte allocation
	call malloc wrt ..plt	; call malloc
	pop rdi
	cmp rax, 0x0	; if malloc returned NULL, an error occurred
	je _malloc_error
	mov [rax], rsi	; point node->data to data
	mov rdx, [rdi]	; keep the head node in the rdx register
	; set the node's next to be the head
	mov [rax + 8], rdx
	; set the node to be the head
	mov [rdi], rax
	ret

_malloc_error:
	ret
