FROM		debian:buster

RUN		apt-get update -y && \
		apt-get install -y mariadb-server procps && \
		rm -fr /var/lib/apt/lists/*

#RUN		sudo chown -R mysql:mysql var/lib/mysql && \
#		sudo chmod -R 755 var/lib/mysql && \
#		sudo chown -R mysql:mysql /etc/mysql && \
#		sudo chmod -R 755 /etc/mysql
EXPOSE		3306
COPY		conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY		conf/init.sh /init.sh

RUN		chmod +x /init.sh
#RUN		rm /init.sh

CMD		["/init.sh"]
