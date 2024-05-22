# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: djacobs <djacobs@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/30 22:35:21 by djacobs           #+#    #+#              #
#    Updated: 2024/05/02 19:23:33 by djacobs          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	sudo hostsed add 127.0.0.1 djacobs.42.fr
	sudo docker compose -f srcs/docker-compose.yml up --build -d

re: clean all

clean:
	sudo docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	sudo hostsed rm 127.0.0.1 djacobs.42.fr
	sudo docker system prune -af --volumes
	sudo rm -fr /home/root/data/wp/*
	sudo rm -fr /home/root/data/db/*

.PHONY:	all clean fclean
