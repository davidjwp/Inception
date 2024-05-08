#!/bin/bash

sleep 10
wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

#setup wp admin
wp core install --skip-email \
	--url=djacobs.42.fr \
	--title=Inception \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_ADMIN_PASSWORD

#setup wp user
wp user create $WP_USER $WP_USER_EMAIL \
	--user_pass=$WP_USER_PASSWORD \
	--porcelain \
	--role=contributor

if [ ! -e /run/php]; then 
	mkdir /run/php
fi

/usr/sbin/php-fpm.7.3 -F