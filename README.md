# libasm
A small library built in x86_64 assembly using Intel syntax.<br>
The functions are created in assembly while the main file for testing is created in C <br>

## Background
This small project has given me better insight on how much more tedious and repetitve lower level programming is<br>
## Features
The library features a few wrapper functions for syscalls that properly manages errors and sets the appropriate error numbers. Below are the wrapper functions:
- ft_open
- ft_read
- ft_write

All of these functions use the glibc function __errno_location to set the error number according to whatever error was encountered during a syscall

I also reimplemented a few glibc functions, which are prefixed with <b>ft_</b>. These functions are:
- ft_strlen
- ft_strdup
- ft_strcpy
- ft_strcmp

Additionally, it features a few bonus functions:
- ft_atoi_base: just like atoi, but with a base in mind
- ft_list_push_front: a function that adds a new node to the beginning of a linked list
- ft_list_size: the name is self-explanatory

## Usage
Run any of these in your terminal
```
make
```
or
```
make all
```
to generate the .a file without the bonus functions. If you want to create the .a file with the bonus functions, type
```
make bonus
```


