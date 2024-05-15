#!/bin/bash
#set -eux

service mariadb start;
mariadb  -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
echo "Database ${DB_NAME} created";
mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
echo "User ${DB_USER} with pass word created";
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
echo "Privileges to root granted";
mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
echo "User root identified by password";
mariadb -u root -p${DB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
echo "Privileges flushed";
mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown
echo "Mysql shotdown...";
exec mysqld_safe
echo "And restarted;"
echo "${DB_NAME} database and user ${DB_USER} were created successfully!"
