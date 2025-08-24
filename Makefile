NAME    = libasm.a
OBJ     = $(SRC:.asm=.o)
CC      = gcc
NASM    = nasm
AR      = ar rcs
CFLAGS  = -Wall -Wextra -Werror -no-pie

SRC     = 	ft_strlen.asm \
			ft_strcpy.asm \
			ft_strcmp.asm \
			ft_write.asm \
			ft_read.asm

# Тестовая программа
TEST    = main.c
TEST_BIN = asm_test

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ)

%.o: %.asm
	$(NASM) -f elf64 $< -o $@

test: $(NAME) $(TEST)
	$(CC) $(CFLAGS) $(TEST) -L. -lasm -o $(TEST_BIN)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) $(TEST_BIN)

re: fclean all

.PHONY: all clean fclean re test
