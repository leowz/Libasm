# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zweng <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/09 18:11:43 by zweng             #+#    #+#              #
#    Updated: 2021/06/24 22:06:12 by zweng            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = nasm

# ----- part to change -----

NAME 			= libasm.a

HEADER_PATH 	= includes
H_STD 			= $(HEADER_PATH)/libft.h

SRC_PATH 		= srcs
STD_PATH 		= $(SRC_PATH)

SRC_NAME_STD =\
			ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_strdup.s \
			ft_read.s \

OBJ_PATH =  obj
OBJ_NAME =  $(SRC_NAME_STD:.s=.o)\

ASMFLAGS = -fmacho64
CFLAGS = -Wall -Wextra -Werror

# ----- part automatic -----
SRCS := $(addprefix $(STD_PATH)/,$(SRC_NAME_STD))
OBJS := $(addprefix $(OBJ_PATH)/,$(OBJ_NAME))

# ----- Colors -----
BLACK:="\033[1;30m"
RED:="\033[1;31m"
GREEN:="\033[1;32m"
CYAN:="\033[1;35m"
PURPLE:="\033[1;36m"
WHITE:="\033[1;37m"
EOC:="\033[0;0m"
#  # ==================

# ----- part rules -----

all: $(NAME)

$(NAME): $(OBJS) 
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)
	@printf $(GREEN)"\r\E[K$(NAME) finish\n"$(EOC)

$(OBJ_PATH)/%.o: $(STD_PATH)/%.s | $(OBJ_PATH)
	$(CC) $(ASMFLAGS) -o $@ $<
	@printf $(GREEN)"\r\E[Kcompiling %s"$(EOC) $<

$(OBJ_PATH):
	@mkdir $(OBJ_PATH) 2> /dev/null

clean:
	@rm -f $(OBJS)
	@rmdir $(OBJ_PATH) 2> /dev/null || true
	@printf $(GREEN)"$(NAME) clean\n"$(EOC)

fclean: clean
	@/bin/rm -f $(NAME)
	@printf $(GREEN)"$(NAME) fclean\n"$(EOC)

re: fclean all

test: re
	@clang $(NAME) main.c
	@./a.out
	@/bin/rm -f a.out

.PHONY: clean fclean all re norme
