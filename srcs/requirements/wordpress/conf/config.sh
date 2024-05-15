#!/bin/bash

cd /var/www/wordpress

echo "Database: $SQL_DATABASE"
echo "User: $SQL_USER"
echo "Password: $SQL_PASSWORD"
echo "WP admin: $WP_ADMIN"
echo "WP admin password: $WP_ADMIN_PASSWORD"
echo "WP email: $WP_ADMIN_EMAIL"
echo "WP user: $WP_USER"
echo "WP user email: $WP_USER_EMAIL"
echo "WP user password: $WP_USER_PASSWORD"


wp core config --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306

#setup wp admin
wp core install --allow-root \
	--url=djacobs.42.fr \
	--title=Inception \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL

#setup wp user
sudo wp user create $WP_USER $WP_USER_EMAIL \
	--user_pass=$WP_USER_PASSWORD \
	--role=author \
	--allow-root
cd -

php-fpm7.3 -F
