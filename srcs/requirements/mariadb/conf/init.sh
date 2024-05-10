#!/bin/bash
service mysql start
echo LINE 1
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
echo LINE 2
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
echo LINE 3
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"
echo LINE 4
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
echo LINE 5
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
echo LINE 6
exec mysqld_safe
