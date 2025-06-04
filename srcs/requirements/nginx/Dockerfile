# container's operating system
FROM debian:bullseye

# containers packages
RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y
RUN apt install hostsed -y

# container's config files
COPY ./config/default /etc/nginx/conf.d

# container's config script
COPY ./config/script.sh /
RUN chmod +x /script.sh

# port expose
EXPOSE 443

# running the config script
CMD [ "/script.sh" ]
