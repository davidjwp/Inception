#!/bin/bash

mysqld --initialize-insecure --user=mysql > /dev/null 2>&1

mysqld_safe &
mysql_pid=$!

sleep 10

if mysqladmin ping -u root --silent; then
    echo "MySQL is running, proceeding with initialization."
    
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
    mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
else
    echo "MySQL failed to start, exiting."
    exit 1
fi

wait $mysql_pid


#!/bin/bash
#service mysql start

#mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
#mysql -u root -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
#mysql -u root -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#mysql -u root -e "FLUSH PRIVILEGES;"
#mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
