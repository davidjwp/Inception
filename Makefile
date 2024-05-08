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
	sudo docker-compose -f srcs/docker-compose.yml up -d --build

clean:
	sudo docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	sudo docker system prune -af

.PHONY:	all clean fclean
