service mariadb start

sleep 5

mysql -u root -p"$DB_ROOT_PASSWORD"  << EOF
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
EOF

if [ $? -eq 0 ]; then
    echo "Database operations were successful"
else
    echo "Database operations failed"
    exit 1
fi

pkill -9 mariadb

mysqld_safe 
