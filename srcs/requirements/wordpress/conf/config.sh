#!/bin/bash

cd /var/www/wordpress

sleep 5

wp core config --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=$SQL_HOST

#setup wp admin
wp core install --allow-root \
	--url=$WP_URL \
	--title=Inception \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL

if ! wp user get $WP_USER_EMAIL --allow-root > /dev/null 2>&1; then
wp user create $WP_USER $WP_USER_EMAIL --allow-root --role=author --user_pass=$WP_USER_PASSWORD
else
        echo "User with email $WP_USER_MAIL already exists."
fi
cd -
php-fpm7.3 -F
