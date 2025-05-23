FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./config/script.sh /

CMD [ "/script.sh" ]
