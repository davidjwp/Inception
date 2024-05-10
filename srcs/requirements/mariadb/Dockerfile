FROM		debian:buster


RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y \
		mariadb-server sudo

COPY		./conf/50-server.cnf /etc/mysql/maraidb.conf.d/50-server.cnf

COPY		./conf/init.sh /

RUN		chmod -x /init.sh

CMD		["bash", "/init.sh"]


