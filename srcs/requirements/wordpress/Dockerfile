FROM debian:bookworm

EXPOSE 9000

RUN apt-get update && apt-get install -y \
        php8.2-fpm \
        php8.2-mysql \
        mariadb-client \
        curl \
        vim && \
        rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN cd /var/www && tar -xvf latest.tar.gz && \
        rm -rf latest.tar.gz

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent

RUN chmod +x ./usr/bin/wp

# RUN mkdir /run/php

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh
CMD ["bash", "/var/www/wordpress/config.sh"]
