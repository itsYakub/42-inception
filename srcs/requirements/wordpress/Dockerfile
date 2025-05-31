FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install php7.4-fpm -y
RUN apt install php7.4-mysql -y
RUN apt install mariadb-client -y
RUN apt install php-cli -y
RUN apt install curl -y

COPY ./config/script.sh /
RUN chmod +x /script.sh

EXPOSE 9000

RUN service php7.4-fpm start

CMD [ "/script.sh" ]
