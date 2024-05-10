FROM		debian:buster

RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y \
		wget php7.3 php-fpm php-mysql mariadb-client sudo

#download tar into /var/www and unpack it
RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
		cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

#give root permission to wordpress file
RUN		chown -R root:root /var/www/wordpress

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

#get a wordpress cli to configure manually with script
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
 		chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY		./conf/confi.sh /var/www/wordpress/confi.sh

RUN		chmod +x /var/www/wordpress/confi.sh

CMD		["bash", "/var/www/wordpress/confi.sh"]
