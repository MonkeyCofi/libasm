; size_t strlen(const char *str) -> function signature

section .text:
  global ft_strlen
; rax register will be used to store the value
ft_strlen:
  xor rax, rax  ; stores 0 into the rax register

loop:
  ; compare the current byte with 0
  ; the string parameter is stored in the rdi register
  ; the length of the string is stored in the rax register
  ; therefore [rdi + rax] will be the currnet character of the string
  cmp [rdi + rax], 0  ; cmp [rdi + rax] means 
  ; if the characters are equal, jump to return
  ; else if the characters are not equal, continue the loop
  je .return
  inc rax
  jmp loop

return:
  ret

