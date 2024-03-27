#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvaas <vvaas@student.42angouleme.fr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/15 14:16:21 by vvaas             #+#    #+#              #
#    Updated: 2024/03/27 17:45:37 by vvaas            ###   ########.fr        #
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

ARFLAG = rc

.s.o :
	${CC} $< -o ${<:.s=.o} ${FLAGS}

all: ${NAME}

${NAME}: ${OBJS}
	${AR} ${ARFLAGS} ${NAME} ${OBJS}

clean:
	rm -f ${OBJS}

fclean: clean
	rm -f ${NAME}

re:	fclean all
