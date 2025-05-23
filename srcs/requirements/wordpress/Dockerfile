FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-client -y
RUN apt install php7.4-fpm -y
RUN apt install php7.4-mysql -y
RUN apt install php-cli -y
RUN apt install curl -y

COPY ./config/wp-config.php /
COPY ./config/script.sh /

CMD [ "/script.sh" ]
