#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvaas <vvaas@student.42angouleme.fr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/15 14:16:21 by vvaas             #+#    #+#              #
#    Updated: 2024/06/23 19:55:39 by vvaas            ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = libasm.a

SRCS = ft_strlen.s \
		ft_write.s  \
		ft_read.s    \
		ft_strcpy.s   \
		ft_strcmp.s    \
		ft_strdup.s     \

OBJS = ${SRCS:.s=.o}

CC = nasm

FLAGS = -f elf64

AR = ar

ARFLAG = rcs

.s.o :
	@printf "\e[1;32m[compiling {"$(CC)"}...]\e[1;00m "$<"\n"
	@${CC} $< -o ${<:.s=.o} ${FLAGS}

all: ${NAME}

${NAME}: ${OBJS}
	@printf "\e[1;32m[linking {"$(CC)"}...]\e[1;00m "$@"\n"
	@${AR} ${ARFLAGS} ${NAME} ${OBJS}
	@printf "\e[1;32m[build finished]\e[1;00m\n"

clean:
	rm -f ${OBJS}

fclean: clean
	rm -f ${NAME}

re:	fclean all
