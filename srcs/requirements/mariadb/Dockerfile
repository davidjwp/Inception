FROM		debian:buster

ARG		SQL_DATABASE=${SQL_DATABASE}	
ARG		SQL_USER=${SQL_USER}
ARG		SQL_PASSWORD=${SQL_PASSWORD}
ARG		SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD}

RUN		apt-get update -y && \
		apt-get install -y mariadb-server vim && \
		rm -fr /var/lib/apt/lists/*

EXPOSE		3306

COPY		conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY		conf/init.sh /
RUN		bash /init.sh

RUN		rm -fr /init.sh

CMD		["mysqld_safe"]
