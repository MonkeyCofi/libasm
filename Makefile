NAME := libasm.a

TESTNAME := libasm_test

CC := gcc

SRC_DIR := srcs

OBJ_DIR := objs

BONUS_SRC_DIR:= srcs_bonus

BONUS_OBJ_DIR := objs_bonus

CFLAGS := -Wall -Wextra -Werror

# convert the .s files into object files
SRCS := $(addprefix $(SRC_DIR)/, ft_strlen.s ft_strcmp.s ft_write.s ft_open.s ft_strcpy.s \
				ft_strdup.s ft_read.s)

BONUS_SRCS := $(addprefix $(BONUS_SRC_DIR)/, ft_atoi_base.s)

BONUS_OBJS := $(BONUS_SRCS:$(BONUS_SRC_DIR)/%.s=$(BONUS_OBJ_DIR)/%.o)

OBJS := $(SRCS:$(SRC_DIR)/%.s=$(OBJ_DIR)/%.o)

all: $(OBJ_DIR) $(NAME)

$(OBJ_DIR):
	mkdir -p $@

# recipe for every .s file
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	nasm -w+error -f elf64 $^ -o $@

$(BONUS_OBJ_DIR)/%.o: $(BONUS_SRC_DIR)/%.s
	nasm -w+error -f elf64 $^ -o $@

test: $(NAME)	
	$(CC) $(CFLAGS) main.c -L./ $(NAME) -o $(TESTNAME)

bonus: $(NAME) $(BONUS_OBJS)
	ar -rcs $(NAME) $(BONUS_OBJS)

$(NAME): $(OBJS)
	ar -rcs $@ $^

re: fclean all

fclean: clean
	rm -f $(TESTNAME)
	rm -f $(NAME)

clean:
	rm -rf $(OBJS)
	rm -rf $(BONUS_OBJS)
