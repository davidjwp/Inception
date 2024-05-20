FROM		debian:buster

EXPOSE		3306

ARG		SQL_DATABASE=${SQL_DATABASE}	
ARG		SQL_USER=${SQL_USER}
ARG		SQL_PASSWORD=${SQL_PASSWORD}
ARG		SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD}

RUN		apt-get update -y && \
		apt-get install -y mariadb-server vim && \
		rm -fr /var/lib/apt/lists/*

RUN		rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY		conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY		tools/create_user.sh /
RUN		bash ./create_user.sh

RUN		rm -fr create_user.sh

CMD		["mysqld_safe"]
