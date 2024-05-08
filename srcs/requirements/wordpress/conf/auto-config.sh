#!/bin/bash

sleep 10
wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--sbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --skip-email \
	--url=djacobs.42.fr \
	--title=Inception \
	--admin_user=$WP_ADMIN \
	--admin_passowrd=$WP_ADMIN_PASSWORD

wp user create $WP_USER $WP_USER_EMAIL \
	--user_pass=$WP_USER_PASSWORD \
	--porcelain \
	--role=contributor

