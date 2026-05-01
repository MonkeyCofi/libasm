section .data
  msg db "hello, world", 10
  len $ - msg

section .text
  global _start
_start:
  mov rax, 1  ; syscall for write 
  mov rdx, 1  ; stdout fd to write
  mov rdi, msg
  syscall
