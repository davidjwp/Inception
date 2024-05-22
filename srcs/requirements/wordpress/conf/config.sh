cd /var/www/wordpress

sleep 5
wp core config  --allow-root \
                --dbhost=$DB_HOST \
                --dbname=$DB_NAME \
                --dbuser=$DB_USER \
                --dbpass=$DB_PASSWORD

wp core install --allow-root \
                --title=$WP_TITLE \
                --admin_user=$WP_ADMIN_USER \
                --admin_password=$WP_ADMIN_PASSWORD \
                --admin_email=$WP_ADMIN_MAIL \
		--url=$WP_URL

wp plugin install classic-editor --activate --allow-root

# Ensure the admin user is created
if ! wp user get "$WP_ADMIN_USER" --allow-root > /dev/null 2>&1; then
    wp user create "$WP_ADMIN_USER" "$WP_ADMIN_MAIL" --allow-root --role=administrator --user_pass="$WP_ADMIN_PASSWORD"
else
    echo "Admin user $WP_ADMIN_USER already exists."
fi

if ! wp user get $WP_USER_MAIL --allow-root > /dev/null 2>&1; then
wp user create $WP_USER $WP_USER_MAIL --allow-root --role=author --user_pass=$WP_USER_PASSWORD
else
        echo "User with email $WP_USER_MAIL already exists."
fi
cd -
php-fpm7.3 -F
