#!/bin/bash

sudo wp core config --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

#setup wp admin
sudo wp core install --allow-root \
	--url=djacobs.42.fr \
	--title=Inception \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_ADMIN_PASSWORD

#setup wp user
sudo wp user create $WP_USER $WP_USER_EMAIL \
	--user_pass=$WP_USER_PASSWORD \
	--porcelain \
	--role=author \
	--allow-root

if [ ! -e /run/php ]; then 
	mkdir -p /run/php
fi

php-fpm7.3 -F
