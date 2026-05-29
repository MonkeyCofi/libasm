; t_List (void *data, t_list *next)
; therefore, each node is 16 bytes
; size_t    ft_lstsize(t_list *head)
; head -> rdi

section .text
    global ft_lstsize

ft_lstsize:
    xor rax, rax
    jmp _loop

_loop:
    cmp rdi, 0          ; check if the current node is NULL
    je _null_node       ; if true, return
    mov rdi, [rdi + 8]  ; go to next node?
    jmp _loop

_null_node:
    ret