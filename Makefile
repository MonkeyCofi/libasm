NAME := libasm

CC := gcc

SRC_DIR := srcs

OBJ_DIR := objs

CFLAGS := -Wall -Wextra -Werror

# convert the .s files into object files
SRCS := $(addprefix $(SRC_DIR)/, ft_strlen.s ft_strcmp.s ft_write.s ft_open.s ft_strcpy.s) 

OBJS := $(SRCS:$(SRC_DIR)/%.s=$(OBJ_DIR)/%.o)

all: $(NAME)

# recipe for every .s file
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	nasm -f elf64 $^ -o $@

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) main.c -o test

clean:
	rm -rf $(OBJS)
