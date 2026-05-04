NAME := libasm

CC := gcc

CFLAGS := -Wall -Wextra -Werror

# convert the .s files into object files
SRCS := ft_strlen.s ft_strcmp.s

OBJS := $(SRCS:.s=.o)

all: $(NAME)

# recipe for every .s file
%.o: %.s
	nasm -f elf64 $^

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) main.c -o test

clean:
	rm -rf $(OBJS)
