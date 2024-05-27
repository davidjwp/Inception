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

USER	= djacobs

all: 
	sudo mkdir -p /home/$(USER)/data/wp
	sudo mkdir -p /home/$(USER)/data/db	
	docker compose -f srcs/docker-compose.yml up --build -d

re: clean all

clean:
	sudo docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af --volumes
	sudo rm -fr /home/$(USER)/data/wp/*
	sudo rm -fr /home/$(USER)/data/db/*

.PHONY:	all clean fclean
