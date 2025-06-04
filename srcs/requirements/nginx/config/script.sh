#!/bin/bash

mkdir /etc/nginx/ssl
openssl req \
	-newkey rsa:4096 \
	-x509 \
	-sha256 \
	-days 365 \
	-nodes \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out $NGINX_CERTS \
	-subj "/C=PL/ST=Masovia/L=Warsaw/O=42 Warsaw/OU=joleksia/CN=joleksia.42.fr/"

echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name www.$WP_DOMAIN $WP_DOMAIN;

    ssl_certificate $NGINX_CERTS;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/sites-available/default


echo '
    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

	location ~ [^/]\.php(/|$) {
		try_files $uri =404;
		fastcgi_pass wordpress:9000;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	}
} ' >>  /etc/nginx/sites-available/default

hostsed add 127.0.0.1 joleksia42.42.fr

nginx -g "daemon off;"
