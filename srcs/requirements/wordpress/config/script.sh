#!/bin/bash

set -x

usermod -aG www-data root

sed -i -e 's/listen = .*/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

if ! wp-cli.phar core is-installed 2>/dev/null; then

	wp-cli.phar core download --allow-root --force

	wp-cli.phar config create \
		--dbname=$MARIADB_DBNAME \
		--dbuser=$MARIADB_ADMIN_USER \
		--dbpass=$MARIADB_ROOT_PSWD \
		--dbhost=mariadb:3306 \
		--allow-root \
		--skip-check

	wp-cli.phar core install \
		--url=$DOMAIN_NAME/ \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PSWD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email \
		--allow-root

	wp-cli.phar user create $WP_USER $WP_EMAIL \
		--user_pass=$WP_PSWD \
		--allow-root

fi

wp-cli.phar theme install astra --activate --allow-root
wp-cli.phar plugin update --all --allow-root

chown www-data:www-data -R .
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;

/usr/sbin/php-fpm7.4 --nodaemonize
