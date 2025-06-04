# container's operating system
FROM debian:bullseye

# containers packages
RUN apt update -y
RUN apt upgrade -y
RUN apt install php7.4-fpm -y
RUN apt install php7.4-mysql -y
RUN apt install mariadb-client -y
RUN apt install php-cli -y
RUN apt install curl -y

# container's config script
COPY ./config/script.sh /
RUN chmod +x /script.sh

# port expose
EXPOSE 9000

# running the config script
CMD [ "/script.sh" ]
