#!/bin/bash

service php7.4-fpm start

sed -i -e 's/listen = .*/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -f /var/www/html/wp-config.pxp ]; then

	mkdir /var/www/
	mkdir /var/www/html/
	cd /var/www/html
	rm -rf *

	wp core download --allow-root

	wp config create \
		--dbname=$MARIADB_DBNAME \
		--dbuser=$MARIADB_ADMIN_USER \
		--dbpass=$MARIADB_ROOT_PSWD \
		--dbhost=mariadb:3306 \
		--allow-root \
		--skip-check

	wp core install \
		--url=$DOMAIN_NAME/ \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USR \
		--admin_password=$MARIADB_ROOT_PSWD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email \
		--allow-root

	wp user create $WP_USER $WP_EMAIL \
		--role=author \
		--user_pass=$WP_PSWD \
		--allow-root

	wp theme install astra --activate --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root

	chmod +x /var/www/html/wp-content
fi

/usr/sbin/php-fpm7.4 --nodaemonize
