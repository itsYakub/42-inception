# container's operating system
FROM debian:bullseye

# containers packages
RUN apt update -y
RUN apt upgrade -y
RUN apt install php -y
RUN apt install php7.4-fpm -y
RUN apt install php7.4-mysql -y
RUN apt install mariadb-client -y
RUN apt install curl -y

# container's config
WORKDIR /var/www/html
RUN chmod 777 /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar

COPY ./config/script.sh /
RUN chmod 777 /script.sh

RUN usermod -aG www-data root

# port expose
EXPOSE 9000

# running the config script
CMD [ "/script.sh" ]
