service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS \'${SQL_DATABASE}\';"
mysql -e "CREATE USER IF NOT EXISTS \'${SQL_USER}\'@'localhost' IDENTIFIED BY \'${SQL_PASSWORD}\';"
mysql -e "GRANT ALL PRIVILEGES ON \'${SQL_DATABASE}\'.* TO"
