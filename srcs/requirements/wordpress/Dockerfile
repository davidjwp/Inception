FROM		debian:buster

RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y \
		wget php7.3 php-fpm php-mysql mariadb-client

#download tar into /var/www and unpack it
RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
		cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

#give root permission to wordpress file
RUN		chown -R root:root /var/www/wordpress

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
