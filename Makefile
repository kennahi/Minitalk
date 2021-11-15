# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kennahi <kennahi@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/27 10:06:40 by kennahi           #+#    #+#              #
#    Updated: 2021/10/12 16:10:00 by kennahi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT = client
SERVER = server
CC = gcc
FLAGS = -Wall -Wextra


SRC_C =	client.c

SRC_S =	server.c

OBJ_C = $(SRC_C:.c=.o)
OBJ_S = $(SRC_S:.c=.o)

HEADERS = -I libft

all: libft $(CLIENT) $(SERVER)

$(CLIENT): $(OBJ_C)
	cd libft && make
	$(CC) $(FLAGS) $(HEADERS) $(OBJ_C) libft/libft.a -o $(CLIENT)

$(SERVER): $(OBJ_S)
	cd libft && make
	$(CC) $(FLAGS) $(HEADERS) $(OBJ_S) libft/libft.a -o $(SERVER)

clean:
	cd libft && make clean
	rm -rf $(OBJ_C)
	rm -rf $(OBJ_S)

fclean: clean
	cd libft && make fclean
	rm -f $(CLIENT)
	rm -f $(SERVER)

re: fclean all

%.o: %.c libft/libft.h
	$(CC) $(FLAGS) $(HEADERS) -c $< -o $@
