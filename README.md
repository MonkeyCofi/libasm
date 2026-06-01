# libasm
A small library built in x86_64 assembly using Intel syntax.<br>
The functions are created in assembly while the main files for testing is created in C<br>

## Table of Contents
[Background](#background)<br>
[Features](#features)<br>
[Usage](#usage)<br>
[Resources](#resources)<br>

## Background
libasm is a Mastery/Advanced Core project in th 42 curriculum that aims to introduce you to x86_64 assembly by having you create a small library consisting of syscall wrapper functions, glibc functions, and linked list functions (bonus part). 
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
This will generate a static library that you can then compile your C program with

Additionally, I have provided two .c files that have ready tests for the functions. To run the tests for the non-bonus part of the library, use 
```
make test
```
This will generate a binary file called <b>libasm_test</b> which can then be executed by running
```
./libasm_test
```
in your terminal.

There is also a main file for testing the bonus functions which can be compiled with
```
make bonus_test
```
which will generate a binary file called <b>libasm_bonus</b> which, just as the mandatory part, can be executed by running
```
./libasm_bonus
```
in your terminal.

## Resources
