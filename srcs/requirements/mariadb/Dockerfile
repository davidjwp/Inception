FROM		debian:buster


RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y \
		mariadb-server

COPY		./conf/50-server.cnf /etc/mysql/maraidb.conf.d/50-server.cnf

COPY		./init.sh /

RUN		["sh", "init.sh"]


