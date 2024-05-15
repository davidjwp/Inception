FROM		debian:buster

RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y \
		wget php7.3-fpm php7.3-mysql mariadb-client sudo

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

ADD		https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN		cd /var/www && tar -xvf latest.tar.gz && \
		rm -fr latest.tar.gz

RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
		cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
 		chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY		./conf/config.sh /var/www/wordpress/config.sh
RUN		wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /usr/local/bin/wait-for-it.sh && \
		chmod +x /usr/local/bin/wait-for-it.sh

RUN		chmod +x /var/www/wordpress/config.sh && \
		mkdir -p /run/php && chown -R www-data:www-data /run/php && \
		chmod +x /usr/local/bin/wait-for-it.sh

RUN		ls -l /var/www/wordpress

CMD		["bash", "/usr/local/bin/wait-for-it.sh", "mariadb:3306", "--timeout=60", "--", "bash", "/var/www/wordpress/config.sh"]
