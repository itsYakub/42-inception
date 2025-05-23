#!/bin/bash

service mysql start

mariadb -v -u root << EOF
"CREATE DATABASE IF NOT EXISTS $MARIADB_NAME ;"
"CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PSWD' ;"
"GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%' ;"
"ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;"
"FLUSH PRIVILEGES;"
EOF

sleep 5

service mariadb stop

exec mysqld_safe
