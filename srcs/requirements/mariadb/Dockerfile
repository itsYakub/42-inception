# container's operating system
FROM debian:bullseye

# containers packages
RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

# container's config files
COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/

# container's config script
COPY ./config/script.sh /
RUN chmod +x /script.sh

# port expose
EXPOSE	3306

# running the config script
CMD [ "/script.sh" ]
