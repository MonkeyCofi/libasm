NAME := libasm.a

TESTNAME := libasm_test

BONUS_TESTNAME := libasm_bonus

TEST_FILE := main.c

BONUS_TEST_FILE := bonus_main.c

CC := gcc

SRC_DIR := srcs

OBJ_DIR := objs

BONUS_SRC_DIR:= srcs_bonus

BONUS_OBJ_DIR := objs_bonus

CFLAGS := -Wall -Wextra -Werror

# convert the .s files into object files
SRCS := $(addprefix $(SRC_DIR)/, ft_strlen.s ft_strcmp.s ft_write.s ft_open.s ft_strcpy.s \
				ft_strdup.s ft_read.s)

BONUS_SRCS := $(addprefix $(BONUS_SRC_DIR)/, ft_atoi_base.s ft_list_size.s ft_list_push_front.s)

BONUS_OBJS := $(BONUS_SRCS:$(BONUS_SRC_DIR)/%.s=$(BONUS_OBJ_DIR)/%.o)

OBJS := $(SRCS:$(SRC_DIR)/%.s=$(OBJ_DIR)/%.o)

all: $(OBJ_DIR) $(NAME)

$(OBJ_DIR):
	mkdir -p $@

$(BONUS_OBJ_DIR):
	mkdir -p $@

# recipe for every .s file
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	nasm -w+error -f elf64 $^ -o $@

$(BONUS_OBJ_DIR)/%.o: $(BONUS_SRC_DIR)/%.s
	nasm -w+error -f elf64 $^ -o $@

test: $(NAME)
	$(CC) $(CFLAGS) $(TEST_FILE) -L./ $(NAME) -o $(TESTNAME)

bonus_test: $(NAME) bonus
	$(CC) $(CFLAGS) $(BONUS_TEST_FILE) -L./ $(NAME) -o $(BONUS_TESTNAME) -lm

bonus: $(BONUS_OBJ_DIR) $(NAME) $(BONUS_OBJS)
	ar -rcs $(NAME) $(BONUS_OBJS)

$(NAME): $(OBJS)
	ar -rcs $@ $^

re: fclean all

fclean: clean
	rm -f $(TESTNAME)
	rm -f $(BONUS_TESTNAME)
	rm -f $(NAME)

clean:
	rm -rf $(OBJS)
	rm -rf $(BONUS_OBJS)
