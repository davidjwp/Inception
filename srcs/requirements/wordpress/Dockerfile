FROM		debian:buster

RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y \
		wget php7.3 php-fpm php-mysql mariadb-client

#download tar into /var/www and unpack it
RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
		cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

#give root permission to wordpress file
RUN		chown -R root:root /var/www/wordpress

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

#get a wordpress cli to configure manually with script
RUN		RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#give ex permission and move to bin 
RUN 		chmod +x wp-cli.phar
RUN		 mv wp-cli.phar /usr/local/bin/wp

COPY	./conf/auto_config.sh /

CMD	["sh", "/auto_config.sh"]